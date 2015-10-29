package com.syzc.sseip.dao;

import com.alibaba.fastjson.JSON;
import com.syzc.sseip.util.LocalAcUtil;
import org.springframework.context.ApplicationContext;

public class CustomerDaoTestB {
    public static void main(String[] args) {
        ApplicationContext ac = LocalAcUtil.getAc();
        System.out.println(ac);
        CustomerDao d = (CustomerDao) ac.getBean("customerDao");

        System.out.println(d.updateMemo(1L, "lalala"));
        System.out.println(JSON.toJSONString(d.get(1L), true));
    }
}