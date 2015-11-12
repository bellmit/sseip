package com.syzc.sseip.service;

import com.alibaba.fastjson.JSON;
import com.syzc.sseip.util.LocalAcUtil;

public class CustomerServiceImplTestC {
    public static void main(String[] args) {
        CustomerService s = (CustomerService) LocalAcUtil.getAc().getBean("customerServiceImpl");
//        System.out.println(JSON.toJSONString(s.pageRevisitMonthByUser(49L, 1L, 50), true));
//        System.out.println(JSON.toJSONString(s.pageRevisitWeekByUser(49L, 1L, 50), true));
        System.out.println(JSON.toJSONString(s.pageRevisitTodayByUser(49L, 1L, 50), true));
    }
}