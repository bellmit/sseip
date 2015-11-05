package com.syzc.sseip.service;

import com.alibaba.fastjson.JSON;
import com.syzc.sseip.dao.UserLogonQueryDto;
import com.syzc.sseip.entity.User;
import com.syzc.sseip.entity.UserLogon;
import com.syzc.sseip.util.LocalAcUtil;
import org.springframework.context.ApplicationContext;

public class UserServiceImplTest {
    public static void main(String[] args) {
        ApplicationContext ac = LocalAcUtil.getAc();
        UserService s = (UserService) ac.getBean("userServiceImpl");
        User user;
//        user = s.get(1L);
//        System.out.println(JSON.toJSONString(user, true));
//        s.changeGroup(1L, 1L);
//        user = s.get(1L);
//        System.out.println(JSON.toJSONString(user, true));

        UserLogon userLogon;
        userLogon = new UserLogon();
        userLogon.setIp("123123");
        userLogon.setUserId(8L);
//        System.out.println(s.saveLogonInfo(userLogon));
//        System.out.println(JSON.toJSONString(s.listAll(), true));

//        System.out.println(JSON.toJSONString(s.listUserLogonByUser(52L, 0L, (short) 50), true));

        UserLogonQueryDto query = new UserLogonQueryDto();
        query.setUserId(51L);
        System.out.println(JSON.toJSONString(s.filterUserLogon(query, 0L, (short) 50), true));
    }
}