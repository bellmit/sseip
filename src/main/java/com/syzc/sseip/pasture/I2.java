package com.syzc.sseip.pasture;

import com.syzc.sseip.dao.UserDao;
import com.syzc.sseip.util.LocalAcUtil;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Arrays;

public class I2 {
    public static void main(String[] args) throws UnknownHostException {
        String ip = "132.99.76.9";

        InetAddress a;
//        System.out.println(Arrays.toString(a.getAddress()));

//        System.out.println(Arrays.toString(a.getAddress()));

        UserDao d = (UserDao) LocalAcUtil.getAc().getBean("userDao");
        a = InetAddress.getByName(ip);
//        d.insertIp(a.getAddress());

//        System.out.println(d.selectIpFirstSection());
//        System.out.println(d.selectIpFirstSection().getClass());

//        System.out.println(Arrays.toString(((byte[]) d.selectIpFirstSectionB(a.getAddress()))));

//        System.out.println((Arrays.toString((int[]) d.selectIpFirstSection())));
//        System.out.println(Byte[].class);
//        System.out.println(byte[].class);

        a = InetAddress.getByName("0:0:0:0:0:0:0:1");
//        d.insertIp(a.getAddress());

        byte[] arr = null;
        System.out.println(arr);
        System.out.println(((Object) arr));

        System.out.println(d.qqq(a.getAddress()));
        System.out.println(Arrays.toString(((byte[]) d.qqq(a.getAddress()))));
        System.out.println(d.qqq2(a.getAddress()));
    }
}