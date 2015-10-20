package com.syzc.sseip.pasture;

import java.security.SecureRandom;
import java.util.Calendar;

public class Cr {
    public static void main(String[] args) {
        Calendar tm, tmx;
        tm = Calendar.getInstance();
        tmx = Calendar.getInstance();
        tm.set(2010, 0, 1);
        Calendar ta;
        ta = Calendar.getInstance();
        SecureRandom r = new SecureRandom();
        long period = tmx.getTimeInMillis() - tm.getTimeInMillis();
        long millis;
        System.out.println(tmx.getTimeInMillis());
        System.out.println(tm.getTimeInMillis());
        System.out.println(period);
        System.out.println((long) (r.nextDouble() * period) + tm.getTimeInMillis());
        millis = (long) (r.nextDouble() * period + tm.getTimeInMillis());
        ta.setTimeInMillis(millis);
        System.out.println(ta.getTime());
    }
}