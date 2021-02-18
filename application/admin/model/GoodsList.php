<?php

namespace app\admin\model;

use think\Model;
use think\Db;

class GoodsList extends Model
{

    protected $tabel = 'xy_goods_list';

    /**
     * 添加商品
     *
     * @param string $shop_name
     * @param string $goods_name
     * @param string $goods_price
     * @param string $goods_pic
     * @param string $goods_info
     * @param string $id 传参则更新数据,不传则写入数据
     * @return array
     */
        // $goods_price    = input('post.goods_price/f',0);//悬赏金额
        // $shop_name      = input('post.shop_name/s','');//任务类型
        // $cid           = input('post.rw_jb/s','');//任务级别
        // $rw_yq     = input('post.rw_yq/s','');//任务要求
        // $sp_lj     = input('post.sp_lj/s','');//视频链接
        //  $lq_me     = input('post.lq_me/s','');//领取名额
        //  sy_me     = input('post.lq_me/s','');//剩余名额
        // $end_time     = input('post.end_time/s','');//截止日期
//$cid 上级分类id

    public function submit_goods($goods_price,$shop_name,$cid,$rw_yq,$sp_lj,$lq_me,$end_time,$id='')
    {
        if(!$goods_price) return ['code'=>1,'info'=>('请输入悬赏金额')];
        if(!$sp_lj) return ['code'=>1,'info'=>('请输入视频链接')];
        if(!$lq_me) return ['code'=>1,'info'=>('请输入领取名额')];
        if(!$end_time) return ['code'=>1,'info'=>('请输入截止日期')];
        $data = [
            'goods_price'     => $goods_price,
            'shop_name'    => $shop_name,
            'cid'   => $cid,
            'rw_yq'     => $rw_yq,
            'sp_lj'    => $sp_lj,
            'lq_me'    => $lq_me,
            'sy_me'    => $lq_me,
            'end_time'    => $end_time,
            'addtime'       => time()
        ];
        if(!$id){
            $res = Db::table('xy_goods_list')->insert($data);
        }else{
            $res = Db::table('xy_goods_list')->where('id',$id)->update($data);
        }
        if($res)
            return ['code'=>0,'info'=>'操作成功!'];
        else
            return ['code'=>1,'info'=>'操作失败!'];
    }
}
