package com.syzc.sseip.pasture.olddata;

import java.util.HashSet;
import java.util.Set;

public class UserExtractorPractice {
    public static void main(String[] args) {
//        System.out.println(map.get("周顺"));
        Set<String> n = new HashSet<>();
        n.add("李东欢");
        n.add("谷彩云");
        n.add("李梅");
        n.add("杨雅晴");
        n.add("英文资源");
        n.add("英文资源库");
        n.add("赵雅晴");
        n.add("周顺");

        Set<String> o = new HashSet<>();
        o.add("谷彩云");
        o.add("英文资源");
        o.add("王兴涛8");
        o.add("周顺");
        o.add("张楠");
        o.add("李梅");
        o.add("赵雅晴");
        o.add("李东欢KF");
        o.add("种忖");
        o.add("种忖kf");
        o.add("杨雅晴");
        o.add("李东欢");
        o.add("李东欢kf");
        o.add("英文资源库");
        o.add("周倩");

//        System.out.println(o.removeAll(n));
//        System.out.println(o);

        n.removeAll(o);
        System.out.println(n);
    }
}