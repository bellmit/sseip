package com.syzc.sseip.pasture.dummy;

import java.security.SecureRandom;
import java.util.*;

public class RandomDate {
    public static Map<Integer, Date[]> map = new HashMap<>();

    public static void main(String[] args) {
        System.out.println(System.currentTimeMillis());
        System.out.println(Runtime.getRuntime().freeMemory());
        Date[] dates = genSortedDates(600000);
        System.out.println(dates.length);
        System.out.println(System.currentTimeMillis());
        System.out.println(Runtime.getRuntime().freeMemory());
        System.out.println(dates[1]);
        System.out.println(dates[2]);
        System.out.println(dates[3]);
        System.out.println(dates[500000]);
        System.out.println(dates[500001]);
        System.out.println(dates[500002]);
        System.out.println(dates[599997]);
        System.out.println(dates[599998]);
        System.out.println(dates[599999]);
    }

    public static Date[] genSortedDates(int size) {
        Date[] arr = new Date[size];
        for (int i = 0; i < size; i++) {
            arr[i] = gen();
//            System.out.println();
        }
        Arrays.sort(arr, 0, size);
        return arr;
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