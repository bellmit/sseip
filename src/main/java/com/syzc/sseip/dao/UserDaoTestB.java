package com.syzc.sseip.dao;

import com.alibaba.fastjson.JSON;
import com.syzc.sseip.util.LocalAcUtil;
import org.springframework.context.ApplicationContext;

public class UserDaoTestB {
    public static void main(String[] args) {
        ApplicationContext ac = LocalAcUtil.getAc();
        System.out.println(ac);
        UserDao d = (UserDao) ac.getBean("userDao");

        UserLogonQueryDto dto;
        dto = new UserLogonQueryDto();
        System.out.println(JSON.toJSONString(d.filterUserLogon(dto, 0L, (short) 50), true));
        System.out.println(JSON.toJSONString(d.countFilterUserLogon(dto), true));
        dto = new UserLogonQueryDto();
        dto.setIp("127.0.0.1");
        System.out.println(JSON.toJSONString(d.filterUserLogon(dto, 0L, (short) 50), true));
        System.out.println(JSON.toJSONString(d.countFilterUserLogon(dto), true));
    }
}