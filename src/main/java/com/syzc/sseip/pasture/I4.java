package com.syzc.sseip.pasture;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class I4 {
    public static void main(String[] args) {
        Pattern pattern = Pattern.compile("^\\d+");
        Matcher m = pattern.matcher("12a");
        if (m.find()) {
            System.out.println(m.group());
        }
    }
}