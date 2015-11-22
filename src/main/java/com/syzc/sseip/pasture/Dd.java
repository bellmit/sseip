package com.syzc.sseip.pasture;

import com.alibaba.fastjson.JSON;
import com.syzc.sseip.util.LocalAcUtil;

public class Dd {
    public static void main(String[] args) {
        //遍历 map, ftl
//        System.out.println(JSON.toJSONString(System.getProperties(), true));
        System.out.println(JSON.toJSONString(System.getenv(), true));
        System.out.println(Runtime.getRuntime().freeMemory());
        System.out.println(Runtime.getRuntime().totalMemory());
        System.out.println(Runtime.getRuntime().maxMemory());

        System.out.println("freeMemory=" + Runtime.getRuntime().freeMemory());
        System.out.println("totalMemory=" + Runtime.getRuntime().totalMemory());
        System.out.println("maxMemory=" + Runtime.getRuntime().maxMemory());

        System.out.println(System.getProperty("java.io.tmpdir"));

//        LocalAcUtil.getAc()
    }
}