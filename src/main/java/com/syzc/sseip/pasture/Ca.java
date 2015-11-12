package com.syzc.sseip.pasture;

import java.util.Calendar;

public class Ca {
    public static void main(String[] args) {
        int i = Calendar.getInstance().get(Calendar.DAY_OF_WEEK);
        i = (8 - i) % 7;
        System.out.println(i);

        i = 7;
        i = (8 - i) % 7;
        System.out.println(i);
        Calendar c;
        c = Calendar.getInstance();
        c.add(Calendar.DAY_OF_YEAR, (8 - Calendar.getInstance().get(Calendar.DAY_OF_WEEK)) % 7);
        System.out.println(c.getTime());

        c = Calendar.getInstance();
        c.set(Calendar.DAY_OF_MONTH, 15);
        System.out.println("sunday alternative");
        if (c.get(Calendar.DAY_OF_WEEK) != Calendar.SUNDAY) {
            c.add(Calendar.WEEK_OF_YEAR, 1);
            c.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
        }
        System.out.println(c.getTime());

        c = Calendar.getInstance();
        c.add(Calendar.MONTH, 1);
        c.set(Calendar.DAY_OF_MONTH, 0);
        System.out.println(c.getTime());

        c = Calendar.getInstance();
        c.setFirstDayOfWeek(Calendar.MONDAY);
        c.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
        System.out.println(c.getTime());
    }
}