package com.syzc.sseip.pasture;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class P {
    public static void main(String[] args) {
        Pattern p = Pattern.compile("(^|a)(?<d>\\d+)");
        String str = "a123a456a789";
        Matcher m = p.matcher(str);
        while (m.find()) {
            System.out.println(m.group("d"));
        }
    }
}