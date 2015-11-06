package com.syzc.sseip.dao;

import com.syzc.sseip.util.LocalAcUtil;
import org.springframework.context.ApplicationContext;

import java.net.UnknownHostException;

public class UserDaoTestD {
    public static void main(String[] args) throws UnknownHostException {
        ApplicationContext ac = LocalAcUtil.getAc();
        System.out.println(ac);
        UserDao d = (UserDao) ac.getBean("userDao");

        String ip;
        ip = "132.99.76.9";
//        ip = "132.99.75.9";
//        System.out.println(d.updateLimitedIp(1L, null));
//        System.out.println(d.updateLimitedIp(1L, ""));
        System.out.println(d.updateLimitedIp(1L, "1.2.3.4"));
    }
}