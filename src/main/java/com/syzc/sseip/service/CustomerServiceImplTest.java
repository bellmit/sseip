package com.syzc.sseip.service;

import com.syzc.sseip.entity.Customer;
import com.syzc.sseip.entity.enumtype.HospitalizationType;
import com.syzc.sseip.entity.enumtype.Sex;
import com.syzc.sseip.util.LocalAcUtil;
import org.springframework.context.ApplicationContext;

public class CustomerServiceImplTest {
    public static void main(String[] args) {
        ApplicationContext ac = LocalAcUtil.getAc();
        System.out.println(ac);
        CustomerService s = (CustomerService) ac.getBean("customerServiceImpl");

//        System.out.println(JSON.toJSONString(s.listByFilter(null, null, null, null, null, null, null, null, null,
//                null, null, null, null, null, 1L, (byte) 100), true));
//        System.out.println(JSON.toJSONString(s.listByFilter(null, null, null, null, "左傑初", null, null, null, null,
//                null, null, null, null, null, 1L, (byte) 100), true));
//        System.out.println(JSON.toJSONString(s.listByFilter(null, null, AccessPointType.HOT_LINE, null, null, null, null, null, null, null, 1L, (byte) 100), true));

        Customer c;
        c = new Customer();
        c.setAge((short) 1);
        c.setContactRecords("123");
        c.setEmail("234");
        c.setEmergency(true);
        c.setHospitalization(HospitalizationType.DISCHARGE);
        c.setLiaisonAddress("123");
        c.setLiaisonName("123");
        c.setMemo("123");
        c.setPatientAddress("123");
        c.setPatientName("123");
        c.setRelationship("123");
        c.setSex(Sex.FEMALE);
        c.setStars((byte) 3);
        c.setSymptom("123");
        c.setTel("203987423");
        c.setValid(true);
        c.setGroupId(1L);
        c.setUserId(4L);
        c.setWebsiteId(4L);
        c.setDiseaseTypeId(3L);
        c.setLiaisonCountryId(9L);
        c.setPatientCountryId(8L);
//        System.out.println(s.add(c));
//        System.out.println(c.getId());
//        System.out.println(JSON.toJSONString(s.get(c.getId()), true));

        c = new Customer();
        c.setId(6L);
//        System.out.println(s.update(c));

//        System.out.println(JSON.toJSONString(s.get(1L), true));
//        System.out.println(JSON.toJSONString(s.addMemo("lalala", 1L)));
//        System.out.println(JSON.toJSONString(s.get(1L), true));

        System.out.println(s.get(1L).getAdded());
        System.out.println(s.get(1L).getHospitalization());
        System.out.println(s.get(1L).getWeight());
        System.out.println(s.get(1L).getUserId());
        System.out.println(s.get(1L).getCallState());
        System.out.println(s.get(2L).getCallState());
//        System.out.println(s.get(1L).getCallState2());
    }
}