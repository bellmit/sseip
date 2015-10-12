package com.syzc.sseip.pasture;

import org.springframework.format.datetime.DateFormatter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class S {
    public static void main(String[] args) throws ParseException {
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH");
        Date d = f.parse("2015-10-09 15");
        System.out.println(d);

        DateFormatter g = new DateFormatter();
        System.out.println(g.print(d, Locale.CHINESE));

    }
}