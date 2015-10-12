package com.syzc.sseip.util;

import java.util.Calendar;

public class AgeUtil {
    public static Integer calc(int year, int month, int day) {
        month--;
        Calendar now = Calendar.getInstance();
        Calendar i = (Calendar) now.clone();
        i.set(year, month, day);
        int age = now.get(Calendar.YEAR) - year;
        i.add(Calendar.YEAR, age);
        if (i.compareTo(now) > 0) {
            age--;
        }
        return age;
    }

    public static Integer calc(DateEntity age) {
        return calc(age.getYear(), age.getMonth(), age.getDay());
    }

    public static Integer calc(String idNumber) {
        return calc(IdNBirthParser.parse(idNumber));
    }
}