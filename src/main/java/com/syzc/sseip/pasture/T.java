package com.syzc.sseip.pasture;

import java.util.Calendar;

public class T {
    public static void main(String[] args) {
        Calendar now = Calendar.getInstance();
        Calendar i = (Calendar) now.clone();
        i.set(2004, Calendar.OCTOBER, 4);
        System.out.println(i.getTime());
        int age = now.get(Calendar.YEAR) - 2004;
        i.add(Calendar.YEAR, age);
        System.out.println(age);
        if (i.compareTo(now) > 0) {
            age--;
        }
        System.out.println(age);
    }
}