package com.syzc.sseip.pasture;

import java.util.Calendar;

public class C {
    public static void main(String[] args) {
        Calendar c = Calendar.getInstance();
        c.set(Calendar.YEAR, 1100);
        System.out.println(c);
        System.out.println(c.getTime());
        System.out.println(c.getTime().getTime());
        System.out.println(Long.MAX_VALUE);
//        9223372036854775807
//        31104000000
    }
}