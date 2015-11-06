package com.syzc.sseip.dao;

import com.alibaba.fastjson.JSON;
import com.syzc.sseip.util.LocalAcUtil;
import org.springframework.context.ApplicationContext;

import java.net.UnknownHostException;

public class UserDaoTestC {
    public static void main(String[] args) throws UnknownHostException {
        ApplicationContext ac = LocalAcUtil.getAc();
        System.out.println(ac);
        UserDao d = (UserDao) ac.getBean("userDao");

        String ip;
        ip = "132.99.76.9";
//        ip = "132.99.75.9";
//        System.out.println(d.login2("huk", "huk", InetAddress.getByName(ip).getAddress()));
//        System.out.println(JSON.toJSONString(d.login2("huk", "huk", InetAddress.getByName(ip).getAddress()), true));
//        System.out.println(JSON.toJSONString(d.login("huk", "huk", ip), true));
        System.out.println(JSON.toJSONString(d.login("huk", "huk", ""), true));
        System.out.println(JSON.toJSONString(d.login("huk", "huk", null), true));
    }
}