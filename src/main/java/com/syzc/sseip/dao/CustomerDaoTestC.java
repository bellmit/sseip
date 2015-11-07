package com.syzc.sseip.dao;

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
    }
}