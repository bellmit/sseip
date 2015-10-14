package com.syzc.sseip.dao;

import com.alibaba.fastjson.JSON;
import com.syzc.sseip.entity.pasture.AccessPointType;
import com.syzc.sseip.util.LocalAcUtil;

public class AccessPointTypeDaoTest {
    public static void main(String[] args) {
        AccessPointTypeDao d = LocalAcUtil.getAc().getBean(AccessPointTypeDao.class);
        System.out.println(JSON.toJSONString(d.get(1L), true));
        System.out.println(JSON.toJSONString(d.list(1L, (byte) 10), true));
        System.out.println(d.count());

        AccessPointType e;
//        e = new AccessPointType();
//        e.setName("空军一号");
//        System.out.println(d.add(e));
//        System.out.println(e.getId());
//        System.out.println(JSON.toJSONString(d.get(e.getId()), true));

//        e = new AccessPointType();
//        e.setId(1L);
//        e.setName("天宫一号");
//        System.out.println(d.update(e));
//        System.out.println(JSON.toJSONString(d.get(1L), true));

//        System.out.println(d.count());
//        System.out.println(d.remove(3L));
//        System.out.println(d.count());

        System.out.println(d.exist(2L));
        System.out.println(d.existName("空军一号"));
    }
}