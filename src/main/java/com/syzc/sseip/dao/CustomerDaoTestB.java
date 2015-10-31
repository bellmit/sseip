package com.syzc.sseip.dao;

import com.alibaba.fastjson.JSON;
import com.syzc.sseip.entity.TelAuditDto;
import com.syzc.sseip.entity.enumtype.CallState;
import com.syzc.sseip.entity.enumtype.HospitalizationType;
import com.syzc.sseip.entity.enumtype.Weight;
import com.syzc.sseip.util.LocalAcUtil;
import org.springframework.context.ApplicationContext;

public class CustomerDaoTestB {
    public static void main(String[] args) {
        ApplicationContext ac = LocalAcUtil.getAc();
        System.out.println(ac);
        CustomerDao d = (CustomerDao) ac.getBean("customerDao");

/*
        System.out.println(JSON.toJSONString(d.get(1L), true));
        System.out.println(d.updateMemo(1L, "lalala"));
        System.out.println(JSON.toJSONString(d.get(1L), true));
*/

//        System.out.println("before");
//        System.out.println(JSON.toJSONString(d.get(1L), true));
//        System.out.println("after");

        TelAuditDto dto;
        dto = new TelAuditDto();
        dto.setCustomerId(1L);
        dto.setCallState(CallState.拒接);
        dto.setHospitalization(HospitalizationType.DISCHARGE);
        dto.setIfReport(true);
        dto.setMemoItem("abcdefg12345");
        dto.setValid(true);
        dto.setWeight(Weight.HIGH);

//        System.out.println(JSON.toJSONString(d.get(1L), true));
        System.out.println(d.updateTelAuditDto(dto));
//        System.out.println(JSON.toJSONString(d.get(1L), true));

//        System.out.println(d.get(2L).getCallState());
//        System.out.println(d.get(2L).getHospitalization());
//        System.out.println(d.getCallState(2L));

        System.exit(0);
    }
}