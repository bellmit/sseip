package com.syzc.sseip.pasture;

import java.util.Arrays;

public class X {
    public static void main(String[] args) {
        String f;
        f = "58.63.227.162";
        f = "58.63.227.162,192.168.237.178,192.168.238.218";
//        System.out.println(Arrays.toString(f.split(",")));
//        System.out.println(f.indexOf(','));
        if (f.indexOf(',') >= 0) {
            f = f.substring(0, f.indexOf(','));
        } else {
        }
        System.out.println(f);
    }
}