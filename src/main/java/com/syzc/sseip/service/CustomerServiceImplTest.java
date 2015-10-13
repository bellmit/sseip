package com.syzc.sseip.service;

import com.alibaba.fastjson.JSON;
import com.syzc.sseip.entity.enumtype.AccessPointType;
import com.syzc.sseip.util.LocalAcUtil;
import org.springframework.context.ApplicationContext;

public class CustomerServiceImplTest {
    public static void main(String[] args) {
        ApplicationContext ac = LocalAcUtil.getAc();
        System.out.println(ac);
        CustomerService s = (CustomerService) ac.getBean("customerServiceImpl");
        System.out.println(JSON.toJSONString(s.listByFilter(null, null, null, null, null, null, null, null, null, null, 1L, (byte) 100)));
        System.out.println(JSON.toJSONString(s.listByFilter(null, null, AccessPointType.HOT_LINE, null, null, null, null, null, null, null, 1L, (byte) 100), true));
    }
}