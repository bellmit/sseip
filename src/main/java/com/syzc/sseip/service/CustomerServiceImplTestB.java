package com.syzc.sseip.service;

import com.alibaba.fastjson.JSON;
import com.syzc.sseip.util.LocalAcUtil;
import org.springframework.context.ApplicationContext;

public class CustomerServiceImplTestB {
    public static void main(String[] args) {
        ApplicationContext ac = LocalAcUtil.getAc();
        CustomerService s = (CustomerService) ac.getBean("customerServiceImpl");

        System.out.println(JSON.toJSONString(s.statAll(), true));
    }
}