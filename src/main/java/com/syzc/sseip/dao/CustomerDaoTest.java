package com.syzc.sseip.dao;

import com.alibaba.fastjson.JSON;
import com.syzc.sseip.entity.Customer;
import com.syzc.sseip.entity.enumtype.Sex;
import com.syzc.sseip.util.LocalAcUtil;
import org.springframework.context.ApplicationContext;

import java.util.Calendar;

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
        c.setAge((short) 3);
        c.setEmergency(false);
        c.setSex(Sex.FEMALE);
        c.setSymptom("3");
        c.setTel("333");
        c.setGroupId(1L);

//        System.out.println(d.add(c));
//        System.out.println(JSON.toJSONString(c, true));
//        System.out.println(JSON.toJSONString(d.get(c.getId()), true));

//        System.out.println(d.remove(2L));

        c = new Customer();
        c.setId(3L);
        c.setAge((short) 33);
        c.setEmergency(true);
        c.setSex(Sex.FEMALE);
        c.setSymptom("3");
        c.setTel("333");
        c.setUserId(3L);
        c.setGroupId(1L);

        System.out.println(d.update(c));
        System.out.println(JSON.toJSONString(d.get(3L), true));

//        System.out.println(JSON.toJSONString(d.listByFilter(null, null, null, null, null, null, null, null, null, null, 1L, (byte) 100), true));
//        System.out.println(JSON.toJSONString(d.countByFilter(null, null, null, null, null, null, null, null, null, null), true));

        Calendar since = Calendar.getInstance();
        Calendar till = Calendar.getInstance();
        since.set(2015, 9, 6);
        till.set(2015, 9, 8);

//        System.out.println(JSON.toJSONString(d.listByFilter(null, null, null, null, null, null, since.getTime(), till.getTime(), null, null, 1L, (byte) 100), true));
//        System.out.println(JSON.toJSONString(d.countByFilter(null, null, null, null, null, null, since.getTime(), till.getTime(), null, null), true));
    }
}