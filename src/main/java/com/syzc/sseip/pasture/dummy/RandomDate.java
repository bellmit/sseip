package com.syzc.sseip.pasture.dummy;

import java.security.SecureRandom;
import java.util.Calendar;
import java.util.Date;

public class RandomDate {
    public static void main(String[] args) {
        System.out.println(System.currentTimeMillis());
        for (int i = 0; i < 10000; i++) {
            gen();
//            System.out.println();
        }
        System.out.println(System.currentTimeMillis());
    }

    public static Date gen() {
        Calendar start = Calendar.getInstance();
        start.set(2010, 0, 1);
        Calendar now = Calendar.getInstance();
        Calendar randomDate;
        randomDate = Calendar.getInstance();
        SecureRandom r = new SecureRandom();
        long period = now.getTimeInMillis() - start.getTimeInMillis();
        long randomMillis;
        randomMillis = (long) (r.nextDouble() * period + start.getTimeInMillis());
        randomDate.setTimeInMillis(randomMillis);
        return randomDate.getTime();
    }
}