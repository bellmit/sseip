package com.syzc.sseip.service;

import com.alibaba.fastjson.JSON;
import com.syzc.sseip.entity.User;
import com.syzc.sseip.util.LocalAcUtil;
import org.springframework.context.ApplicationContext;

public class UserServiceTest {
    public static void main(String[] args) {
        ApplicationContext ac = LocalAcUtil.getAc();
        UserService s = (UserService) ac.getBean("userServiceImpl");
        User user;
        user = s.get(1L);
        System.out.println(JSON.toJSONString(user, true));
        s.changeGroup(1L, 1L);
        user = s.get(1L);
        System.out.println(JSON.toJSONString(user, true));
    }
}