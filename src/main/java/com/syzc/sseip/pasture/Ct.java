package com.syzc.sseip.pasture;

import java.security.SecureRandom;
import java.util.Calendar;

public class Ct {
    public static void main(String[] args) {
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

        System.out.println(randomDate.getTime());
        System.out.println(now.getTime());

        randomMillis = (long) (r.nextDouble() * period + start.getTimeInMillis());
        randomMillis = (long) (1.0d * period + start.getTimeInMillis());
        randomDate.setTimeInMillis(randomMillis);
        System.out.println(randomDate.getTime());
        System.out.println(r.nextDouble());
        Double m = 0d, j;
        for (int i = 0; i < 1 << 12; i++) {
            j = r.nextDouble();
            if (j > m) m = j;
        }
        System.out.println(m);
    }
}