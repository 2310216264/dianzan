<?php

namespace app\index\controller;

use think\Controller;
use think\Db;
use think\Request;

/**
 * 订单列表
 */
class Order extends Base
{


    public function index()
    {

        $this->cate = Db::name('xy_goods_cate')->alias('c')
            ->leftJoin('xy_level u','u.id=c.level_id')
            ->field('c.id,c.name,c.cate_info,c.cate_pic,u.name as levelname,u.pic,u.level,u.bili,u.order_num')
            ->select();

//        dump($this->cate);
        $this->status = $status= input('get.status/d',0);
        $where =[];
        if ($status) {
            $status == -1 ? $status = 0:'';
            $where['xc.status'] = $status;
        }
        $uid = session('user_id');
        $this->balance = Db::name('xy_users')->where('id',$uid)->value('balance');//获取用户今日已充值金额


        $this->_query('xy_convey')
            ->where('xc.uid',session('user_id'))
            ->alias('xc')
            ->leftJoin('xy_goods_list xg','xc.goods_id=xg.id')
            ->field('xc.*,xg.shop_name,xg.goods_price,xg.sp_lj,xg.rw_yq')
            ->order('xc.addtime desc')
            ->where($where)
            ->page();

        return $this->fetch();
    }








    /**
     * 获取订单列表
     */
    public function order_list()
    {
        $page = input('post.page/d',1);
        $num = input('post.num/d',10);
        $limit = ( (($page - 1) * $num) . ',' . $num );
        $type = input('post.type/d',1);
        switch($type){
            case 1: //获取待处理订单
                $type = 0;
                break;
            case 2: //获取冻结中订单
                $type = 5;
                break;
            case 3: //获取已完成订单
                $type = 1;
                break;
        }
        $data = db('xy_convey')
                ->where('xc.uid',session('user_id'))
                ->where('xc.status',$type)
                ->alias('xc')
                ->leftJoin('xy_goods_list xg','xc.goods_id=xg.id')
                ->field('xc.*,xg.goods_name,xg.shop_name,xg.goods_price,xg.goods_pic')
                ->order('xc.addtime desc')
                ->limit($limit)
                ->select();

        foreach ($data as &$datum) {
            $datum['endtime'] = date('Y/m/d H:i:s',$datum['endtime']);
            $datum['addtime'] = date('Y/m/d H:i:s',$datum['addtime']);
        }


        if(!$data) json(['code'=>1,'info'=>'暂无数据']);
        return json(['code'=>0,'info'=>'请求成功','data'=>$data]);
    }

    /**
     * 获取单笔订单详情
     */
    public function order_info()
    {
        if(\request()->isPost()){
            $oid = input('post.id','');
            $oinfo = db('xy_convey')
                        ->alias('xc')
//                        ->leftJoin('xy_member_address ar','ar.uid=xc.uid','ar.is_default=1')
                        ->leftJoin('xy_goods_list xg','xg.id=xc.goods_id')
                        ->leftJoin('xy_users u','u.id=xc.uid')
                        ->leftJoin('xy_goods_cate fl','xg.cid=fl.id')
                        ->field('xc.id oid,xc.commission,xc.addtime,xc.endtime,xc.status,xc.img,xg.goods_price,xg.shop_name,xg.rw_yq,u.balance,fl.cate_pic,fl.name')
                        ->where('xc.id',$oid)
                        ->where('xc.uid',session('user_id'))
                        ->find();
            if(!$oinfo) return json(['code'=>1,'暂无数据']);
            $oinfo['endtime'] = date('Y/m/d H:i:s', $oinfo['endtime']  );
            $oinfo['addtime'] = date('Y/m/d H:i:s', $oinfo['addtime']  );

            $oinfo['rw_yq']==1 ? $oinfo['rw_yq']='供应信息':$oinfo['rw_yq']='需求信息';

           if($oinfo['shop_name']==1){
               $oinfo['shop_name']='点赞';
           }else if($oinfo['shop_name']==2){
               $oinfo['shop_name']='关注';
           }else{
               $oinfo['shop_name']='点赞+关注';
           }

            $oinfo['status_class']=0;
           if($oinfo['status']==0){
               $oinfo['status']='立即提交';
               $oinfo['status_class']=1;
           }elseif($oinfo['status']==1){
               $oinfo['status']='已完成';
           }elseif($oinfo['status']==4){
               $oinfo['status']='已取消';
           }elseif($oinfo['status']==3){
               $oinfo['status']='等待审核';
           }elseif($oinfo['status']==5){
               $oinfo['status']='重新提交';
               $oinfo['status_class']=1;
           }
            return json(['code'=>0,'info'=>'请求成功','data'=>$oinfo]);
        }
    }

    /**
     * 处理订单
     */
    public function do_order()
    {

//        dump($_POST);die;
        if(request()->isPost()){
            $oid = input('post.oid/s','');
            $status = input('post.status/d',3);

            $img = isset($_POST['img'][0])?$_POST['img'][0]:'';
            if(empty($img))return json(['code'=>1,'info'=>'请上传图片']);

            if(!\in_array($status,[3,2])) json(['code'=>1,'info'=>'参数错误']);

            $res = model('admin/Convey')->do_order($oid,$status,session('user_id'),$img);
            return json($res);
        }
        return json(['code'=>1,'info'=>'错误请求']);
    }

    /**
     * 获取充值订单
     */
    public function get_recharge_order()
    {
        $uid = session('user_id');
        $page = input('post.page/d',1);
        $num = input('post.num/d',10);
        $limit = ( (($page - 1) * $num) . ',' . $num );
        $info = db('xy_recharge')->where('uid',$uid)->order('addtime desc')->limit($limit)->select();
        if(!$info) return json(['code'=>1,'info'=>'暂无数据']);
        return json(['code'=>0,'info'=>'请求成功','data'=>$info]);
    }

    /**
     * 验证提现密码
     */
    public function check_pwd2()
    {
        if(!request()->isPost()) return json(['code'=>1,'info'=>'错误请求']);
        $pwd2 = input('post.pwd2/s','');
        $info = db('xy_users')->field('pwd2,salt2')->find(session('user_id'));
        if($info['pwd2']=='') return json(['code'=>1,'info'=>'未设置交易密码']);
        if($info['pwd2']!=sha1($pwd2.$info['salt2'].config('pwd_str'))) return json(['code'=>1,'info'=>'密码错误']);
        return json(['code'=>0,'info'=>'验证通过']);
    }
}
