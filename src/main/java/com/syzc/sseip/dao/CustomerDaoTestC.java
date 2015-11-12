package com.syzc.sseip.dao;

import com.alibaba.fastjson.JSON;
import com.syzc.sseip.util.LocalAcUtil;
import org.springframework.context.ApplicationContext;

public class CustomerDaoTestC {
    public static void main(String[] args) {
        ApplicationContext ac = LocalAcUtil.getAc();
        CustomerDao d = (CustomerDao) ac.getBean("customerDao");

        System.out.println("statAllInHospitalCount");
        System.out.println(d.statAllInHospitalCount());
        System.out.println("statAllReportedCount");
        System.out.println(d.statAllReportedCount());

        System.out.println(JSON.toJSONString(d.listRevisitTodayByUser(49L, 0L, 100), true));
        System.out.println(d.countRevisitTodayByUser(49L));

//        System.out.println(JSON.toJSONString(d.listRevisitByUserDate(null, null, null, 0L, 100), true));
//        System.out.println(d.countRevisitByUserDate(null, null, null));
    }
}