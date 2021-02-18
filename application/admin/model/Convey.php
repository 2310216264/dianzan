<?php

namespace app\admin\model;

use think\Model;
use think\Db;

class Convey extends Model
{

    protected $table = 'xy_convey';

    /**
     * 创建订单 (秒赞)
     *
     * @param int $uid
     * @return array
     */
    public function create_order2($uid,$cid,$goods_price='0',$goodid){



        //订单号
        $id = getSn('UB');
        Db::startTrans();
        $res = Db::name('xy_users')->where('id',$uid)->update(['deal_time'=>strtotime(date('Y-m-d')),'deal_count'=>Db::raw('deal_count+1')]);


        $res1 = Db::name($this->table)
            ->insert([
                'id'            => $id,
                'uid'           => $uid,
                'addtime'       => time(),
                'endtime'       => time()+config('deal_timeout'),
                'goods_id'      => $goodid,
                'goods_count'   => 1,
                'cid'           =>$cid,
                'commission'    => $goods_price,  //交易佣金(悬赏金额)
            ]);
        $res2=Db::name('xy_goods_list')->where('id',$goodid)->update(['sy_me'=>Db::raw('sy_me-1')]);
        if($res && $res1 && $res2){
            Db::commit();
            return ['code'=>0,'info'=>'接单成功!','oid'=>$id];
        }else{
            Db::rollback();
            return ['code'=>1,'info'=>'接单失败!请稍后再试'];
        }
    }

    /**
     * 创建订单
     *
     * @param int $uid
     * @return array
     */
    public function create_order($uid,$cid=1)
    {
        $add_id = Db::name('xy_member_address')->where('uid',$uid)->value('id');//获取收款地址信息s
        if(!$add_id) return ['code'=>1,'info'=>'还没有设置收货地址'];
        $uinfo = Db::name('xy_users')->field('deal_status,balance,level')->find($uid);
        if($uinfo['deal_status']!=2) return ['code'=>1,'info'=>'任务已终止'];
        $min = $uinfo['balance']*config('deal_min_num')/100;
        $max = $uinfo['balance']*config('deal_max_num')/100;

        $goods = $this->rand_order($min,$max,$cid);


        $level = $uinfo['level'];
        !$uinfo['level'] ? $level = 0 : '';
        $ulevel = Db::name('xy_level')->where('level',$level)->find();
        if ($uinfo['balance'] < $ulevel['num_min']) {
            return ['code'=>1,'info'=>'会员等级余额不足!'];
        }

        $id = getSn('UB');
        Db::startTrans();
        $res = Db::name('xy_users')->where('id',$uid)->update(['deal_status'=>3,'deal_time'=>strtotime(date('Y-m-d')),'deal_count'=>Db::raw('deal_count+1')]);//将账户状态改为交易中
        //通过商品id查找 佣金比例
        $cate = Db::name('xy_goods_cate')->find($goods['cid']);;
        if($goods['num'] > $uinfo['balance']) return ['code'=>1,'info'=>'可用余额不足!'];

        //var_dump($cate,123,$goods);die;

        $res1 = Db::name($this->table)
                ->insert([
                    'id'            => $id,
                    'uid'           => $uid,
                    'num'           => $goods['num'],
                    'addtime'       => time(),
                    'endtime'       => time()+config('deal_timeout'),
                    'add_id'        => $add_id,
                    'goods_id'      => $goods['id'],
                    'goods_count'   => $goods['count'],
                    //'commission'    => $goods['num']*config('vip_1_commission'),
                    //'commission'    => $goods['num']*$cate['bili'],  //交易佣金按照分类
                    'commission'    => $goods['num']*$ulevel['bili'],  //交易佣金按照会员等级
                ]);
        if($res && $res1){
            Db::commit();
            return ['code'=>0,'info'=>'任务成功!','oid'=>$id];
        }else{
            Db::rollback();
            return ['code'=>1,'info'=>'任务失败!请稍后再试'];
        }
    }

    /**
     * 随机生成订单
     */
    private function rand_order($min,$max,$cid)
    {
        $num = mt_rand($min,$max);//随机交易额
        $goods = Db::name('xy_goods_list')
                ->orderRaw('rand()')
                #->where('goods_price','between',[$num/10,$num])
                #->where('cid','=',$cid)
                ->find();

        if (!$goods) {
            echo json_encode(['code'=>1,'info'=>'任务失败, 该分类库存不足!']);die;
        }

        $count = round($num/$goods['goods_price']);//
        if($count*$goods['goods_price']<$min||$count*$goods['goods_price']>$max){
            self::rand_order($min,$max,$cid);
        }
        return ['count'=>$count,'id'=>$goods['id'],'num'=>$count*$goods['goods_price'],'cid'=>$goods['cid']];
    }

    /**
     * 处理订单
     *
     * @param string $oid      订单号
     * @param int    $status   操作      1会员确认付款 2会员取消订单 3后台强制付款 4后台强制取消
     * （修）//订单状态 0未完成 1交易完成 2用户取消  3(等待审核)强制完成    4放弃任务 强制取消  5审核失败 交易冻结

     * @param int    $uid      用户ID    传参则进行用户判断
     * @param int    $uid      收货地址
     * @return array
     */
    public function do_order($oid,$status,$uid='',$img='')
    {

        $info = Db::name('xy_convey')->find($oid);
        if(!$info) return ['code'=>1,'info'=>'订单号不存在'];
        if($uid && $info['uid']!=$uid) return ['code'=>1,'info'=>'参数错误，请确认订单号!'];
        if(in_array($info['status'],[1,2,4])) return ['code'=>1,'info'=>'该订单已处理！请刷新页面'];
        if($info['status']==$status)return ['code'=>1,'info'=>'编辑无效'];

        //TODO 判断余额是否足够
//        $userPrice = Db::name('xy_users')->where('id',$info['uid'])->value('balance');
//        if ($userPrice < $info['num']) return ['code'=>1,'info'=>'账户可用余额不足!'];

        //$tmp = ['endtime'=>time(),'status'=>$status];
//订单状态 0未完成 1交易完成 2用户取消  3(等待审核)强制完成    4放弃任务 强制取消  5审核失败 交易冻结
        $tmp = ['endtime'=>time()+config('deal_feedze'),'status'=>$status];


        if(!empty($img)){
            $img= $this->upload_base64('vlwk',$img);
            $tmp['img']=$img;
        }


        Db::startTrans();
        $res = Db::name('xy_convey')->where('id',$oid)->update($tmp);
        if($status==1){
            //确认付款
//            try {
//                $res1 = Db::name('xy_users')
//                        ->where('id', $info['uid'])
//                        ->dec('balance',$info['num'])
//                        ->inc('freeze_balance',$info['num']+$info['commission']) //冻结商品金额 + 佣金
//                        ->update(['deal_status' => 1,'status'=>1]);
//            } catch (\Throwable $th) {
//                Db::rollback();
//                return ['code'=>1,'info'=>'请检查账户余额!'];
//            }
            //确认付款 (记录)
//            $res2 = Db::name('xy_balance_log')->insert([
//                'uid'           => $info['uid'],
//                'oid'           => $oid,
//                'num'           => 1,//$info['num'],
//                'type'          => 2,
//                'status'        => 2,
//                'addtime'       => time()
//            ]);


            if($res){
                Db::commit();
                $c_status = Db::name('xy_convey')->where('id',$oid)->value('c_status');
                //判断是否已返还佣金
                if($c_status===0) $this->deal_reward($info['uid'],$oid,$info['commission']);
                return ['code'=>0,'info'=>'操作成功!'];
            }else {
                Db::rollback();
                return ['code'=>1,'info'=>'操作失败'];
            }
            //用户取消，系统取消
        }else if (in_array($status,[2,4])) {
            $res1 = Db::name('xy_users')->where('id',$info['uid'])->update(['deal_status'=>1]);
            if($status==4) Db::name('xy_message')->insert(['uid'=>$info['uid'],'type'=>2,'title'=>'系统通知','content'=>'交易订单'.$oid.'已被系统强制取消，如有疑问请联系客服','addtime'=>time()]);

            //系统通知
            if($res && $res1!==false){
                Db::commit();
                return ['code'=>0,'info'=>'操作成功!'];
            }else {
                Db::rollback();
                return ['code'=>1,'info'=>'操作失败','data'=>$res1];
            }
        }else if(in_array($status,[3,5])) {
            $status==3 ? $msg='以提交审核信息，请等待系统审核通过' : $msg='审核失败，请重新提交审核' ;
            $res1 = Db::name('xy_users')->where('id',$info['uid'])->update(['deal_status'=>1]);
            Db::name('xy_message')->insert(['uid'=>$info['uid'],'type'=>2,'title'=>'系统通知','content'=>'交易订单'.$oid.$msg,'addtime'=>time()]);
            //系统通知
            if($res && $res1!==false){
                Db::commit();
                return ['code'=>0,'info'=>'操作成功!'];
            }else {
                Db::rollback();
                return ['code'=>1,'info'=>'操作失败','data'=>$res1];
            }
        }
    }

    /**
     * 交易返佣
     *
     * @return void
     */
    public function deal_reward($uid,$oid,$num)
    {
        //$res = Db::name('xy_users')->where('id',$uid)->where('status',1)->setInc('balance',$num+$cnum);
        $res = Db::name('xy_users')->where('id',$uid)->where('status',1)->setInc('balance',$num);
        $res2 = Db::name('xy_users')->where('id',$uid)->where('status',1)->setDec('freeze_balance',$num);

        if($res){
                $res1 = Db::name('xy_balance_log')->insert([
                    //记录返佣信息
                    'uid'       => $uid,
                    'oid'       => $oid,
                    //'num'       => $num+$cnum,
                    'num'       => $num,
                    'type'      => 3,
                    'addtime'   => time()
                ]);
                //将订单状态改为已返回佣金
                Db::name('xy_convey')->where('id',$oid)->update(['c_status'=>1,'status'=>1]);
                Db::name('xy_reward_log')->insert(['oid'=>$oid,'uid'=>$uid,'num'=>$num,'addtime'=>time(),'type'=>2]);//记录充值返佣订单
                 /************* 发放交易奖励 *********/
                    $userList = model('admin/Users')->parent_user($uid,5);
                    if($userList){
                        foreach($userList as $v){
                            if($v['status']===1){
                                Db::name('xy_reward_log')
                                ->insert([
                                    'uid'       => $v['id'],
                                    'sid'       => $uid,
                                    'oid'       => $oid,
//                                    'num'       => $cnum*config($v['lv'].'_d_reward'),
                                    'num'       => $num*config($v['lv'].'_d_reward'),
                                    'lv'        => $v['lv'],
                                    'type'      => 2,
                                    'status'    => 1,
                                    'addtime'   => time(),
                                ]);
                                $res1 = Db::name('xy_balance_log')->insert([
                                    //记录返佣信息
                                    'uid'       => $v['id'],
                                    'oid'       => $oid,
                                    'sid'       => $uid,
//                                    'num'       => $cnum*config($v['lv'].'_d_reward'),
                                    'num'       => $num*config($v['lv'].'_d_reward'),
                                    'type'      => 6,
                                    'status'    => 1,
                                    'f_lv'        => $v['lv'],
                                    'addtime'   => time()
                                ]);

//                                $num3 = $cnum*config($v['lv'].'_d_reward'); //佣金
                                $num3 = $num*config($v['lv'].'_d_reward');
                                $res = Db::name('xy_users')->where('id',$v['id'])->where('status',1)->setInc('balance',$num3);
                            }
                        }
                    }
                 /************* 发放交易奖励 *********/
        }else{
            $res1 = Db::name('xy_convey')->where('id',$oid)->update(['c_status'=>2]);//记录账号异常
        }
    }


//图片上传为base64为的图片
    public function upload_base64($type,$img){
        if (preg_match('/^(data:\s*image\/(\w+);base64,)/', $img, $result)){
            $type_img = $result[2];  //得到图片的后缀
            //上传 的文件目录

            $App = new \think\App();
            $new_files = $App->getRootPath() . 'upload'. DIRECTORY_SEPARATOR . $type. DIRECTORY_SEPARATOR . date('Y') . DIRECTORY_SEPARATOR . date('m-d') . DIRECTORY_SEPARATOR ;

            if(!file_exists($new_files)) {
                //检查是否有该文件夹，如果没有就创建，并给予最高权限
                //服务器给文件夹权限
                mkdir($new_files, 0777,true);
            }
            //$new_files = $new_files.date("YmdHis"). '-' . rand(0,99999999999) . ".{$type_img}";
            $new_files = check_pic($new_files,".{$type_img}");
            if (file_put_contents($new_files, base64_decode(str_replace($result[1], '', $img)))){
                //上传成功后  得到信息
                $filenames=str_replace('\\', '/', $new_files);
                $file_name=substr($filenames,strripos($filenames,"/upload"));
                return $file_name;
            }else{
                return false;
            }
        }else{
            return false;
        }
    }


}
