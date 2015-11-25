package com.syzc.sseip.dao;

import com.syzc.sseip.util.LocalAcUtil;
import org.springframework.context.ApplicationContext;

public class CustomerDaoTestD {
    public static void main(String[] args) {
        ApplicationContext ac = LocalAcUtil.getAc();
        CustomerDao d = (CustomerDao) ac.getBean("customerDao");

        System.out.println(d.alterAutoIncr());
        System.out.println(d.maxOldsId());
    }
}