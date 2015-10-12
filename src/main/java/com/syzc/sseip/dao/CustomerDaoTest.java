package com.syzc.sseip.dao;

import com.alibaba.fastjson.JSON;
import com.syzc.sseip.entity.Customer;
import com.syzc.sseip.entity.enumtype.Sex;
import com.syzc.sseip.util.LocalAcUtil;
import com.syzc.sseip.entity.enumtype.AccessPointType;
import com.syzc.sseip.entity.enumtype.pasture.DiseaseType;
import com.syzc.sseip.entity.enumtype.Website;
import org.springframework.context.ApplicationContext;

public class CustomerDaoTest {
    public static void main(String[] args) {
        ApplicationContext ac = LocalAcUtil.getAc();
        System.out.println(ac);
        CustomerDao d = (CustomerDao) ac.getBean("customerDao");
        System.out.println(d);

//        System.out.println(JSON.toJSONString(d.list(0L, (byte) 10), true));
//        System.out.println(d.count());

//        System.out.println(JSON.toJSONString(d.get(1L), true));

//        System.out.println(JSON.toJSONString(d.listByUser(1L, 0L, (byte) 10), true));
//        System.out.println(JSON.toJSONString(d.listByUser(3L, 0L, (byte) 10), true));
//        System.out.println(d.countByUser(1L));
//        System.out.println(d.countByUser(3L));

//        System.out.println(JSON.toJSONString(d.listByGroup(1L, 0L, (byte) 10), true));
//        System.out.println(d.countByGroup(1L));

        Customer c;
        c = new Customer();
        c.setAddress("3");
        c.setAccessPointType(AccessPointType.CUSTOMER_SERVICE);
        c.setAge((short) 3);
        c.setDiseaseType(DiseaseType.CHRONIC_KIDNEY_DISEASE);
        c.setEmergency(false);
        c.setFaraway(false);
        c.setName("3");
        c.setSex(Sex.FEMALE);
        c.setSymptom("3");
        c.setTel("333");
        c.setWebsite(Website.KIDNEY_K2);
        c.setUserId(1L);
        c.setGroupId(1L);

//        System.out.println(d.add(c));
//        System.out.println(JSON.toJSONString(c, true));
//        System.out.println(JSON.toJSONString(d.get(c.getId()), true));

//        System.out.println(d.remove(2L));

/*        c = new Customer();
        c.setId(3L);
        c.setAddress("55555555");
        c.setAccessPointType(AccessPointType.CUSTOMER_SERVICE);
        c.setAge((short) 33);
        c.setDiseaseType(DiseaseType.CHRONIC_KIDNEY_DISEASE);
        c.setEmergency(true);
        c.setFirstContact(null);
        c.setFaraway(false);
        c.setName("3");
        c.setSex(Sex.FEMALE);
        c.setSymptom("3");
        c.setTel("333");
        c.setWebsite(Website.KIDNEY_K2);
        c.setUserId(3L);
        c.setGroupId(1L);

        System.out.println(d.update(c));
        System.out.println(JSON.toJSONString(d.get(3L), true));*/

        System.out.println(JSON.toJSONString(d.listByFilter(null, null, null, null, null, null, null, null, 1L, (byte) 100), true));
        System.out.println(JSON.toJSONString(d.countByFilter(null, null, null, null, null, null, null, null), true));
    }
}