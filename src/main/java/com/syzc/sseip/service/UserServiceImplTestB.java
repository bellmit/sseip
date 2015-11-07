package com.syzc.sseip.service;

import com.alibaba.fastjson.JSON;
import com.syzc.sseip.entity.User;
import com.syzc.sseip.util.LocalAcUtil;
import org.springframework.context.ApplicationContext;

public class UserServiceImplTestB {
    public static void main(String[] args) {
        ApplicationContext ac = LocalAcUtil.getAc();
        UserService s = (UserService) ac.getBean("userServiceImpl");
        User user;
        user = new User();
        user.setUsername("zzz");
        user.setPassword("zzz");
        user.setRealName("zzz");
        user.setAge(5);
        user.setAddress("zzz");
        user.setPhone("555");
        user.setRole(null);
        System.out.println(JSON.toJSONString(s.add(user), true));
    }
}