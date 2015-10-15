package com.syzc.sseip.dao;

import com.alibaba.fastjson.JSON;
import com.syzc.sseip.entity.DiseaseType;
import com.syzc.sseip.util.LocalAcUtil;

public class DiseaseTypeDaoTest {
    public static void main(String[] args) {
        DiseaseTypeDao d = LocalAcUtil.getAc().getBean(DiseaseTypeDao.class);
        System.out.println(JSON.toJSONString(d.get(1L), true));
        System.out.println(JSON.toJSONString(d.list(1L, (byte) 10), true));
        System.out.println(d.count());

        DiseaseType t;

        System.out.println(JSON.toJSONString(d.listAll()));

//        t = new DiseaseType();
//        t.setName("大头综合症");
//        System.out.println(d.add(t));
//        System.out.println(t.getId());
//        t = d.get(t.getId());
//        System.out.println(JSON.toJSONString(t, true));

//        t = new DiseaseType();
//        t.setId(4L);
//        t.setName("tttt");
//        System.out.println(d.update(t));

//        System.out.println(d.remove(2L));

//        System.out.println(d.exist(4L));
//        System.out.println(d.existName("tttt"));
    }
}