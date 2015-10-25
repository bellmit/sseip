package com.syzc.sseip.dao;

import com.alibaba.fastjson.JSON;
import com.syzc.sseip.entity.CustomerDto;
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

        CustomerDto c;
        c = new CustomerDto();
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

        c = new CustomerDto();
        c.setId(3L);
        c.setAge((short) 33);
        c.setEmergency(true);
        c.setSex(Sex.FEMALE);
        c.setSymptom("3");
        c.setTel("333");
        c.setUserId(3L);
        c.setGroupId(1L);

//        System.out.println(d.update(c));
//        System.out.println(JSON.toJSONString(d.get(3L), true));

        System.out.println(JSON.toJSONString(d.listByFilter(null, null, null, null, null, null, null, null, null, null, null, null, null, null, 0L, (byte) 20), true));
//        System.out.println(JSON.toJSONString(d.countByFilter(null, null, null, null, null, null, null, null, null, null, null, null), true));

        Calendar since = Calendar.getInstance();
        Calendar till = Calendar.getInstance();
        since.set(2015, 9, 6);
        till.set(2015, 9, 8);

//        System.out.println(JSON.toJSONString(d.listByFilter(null, null, null, null, null, null, since.getTime(), till.getTime(), null, null, 1L, (byte) 100), true));
//        System.out.println(JSON.toJSONString(d.countByFilter(null, null, null, null, null, null, since.getTime(), till.getTime(), null, null), true));

//        System.out.println(d.get(18L).getClass());
//        c = (CustomerDto) d.get(18L);
//        System.out.println(JSON.toJSONString(c, true));
//        System.out.println(c.getOwnerUserId());
//        System.out.println(d.updateOwnUserId(18L, 10L));

//        System.out.println(d.updateOwnUserIds(new Long[]{20L, 21L, 22L, 23L, 24L}, 16L));

//        c = d.get(18L);
//        System.out.println(JSON.toJSONString(c, true));

    }
}