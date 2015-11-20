package com.syzc.sseip.pasture.olddata;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class MemoExtractorPracticeA {
    public static void main(String[] args) {
        String s;
        s = "已发<span style=\"color:#0000FF;\">(2015-05-28 10:11:58)</span><span style=\"color:#0000FF;\">赵雅晴</span>";
        s = "\n2014/03/03 15:56:52发邮件了&nbsp;&nbsp;&nbsp;&nbsp;<font color='#0000FF'><b>(2014-03-03 15:56:58)</b></font><font color='#0000FF'><b>张雷</b></font>";
        Pattern p2 = Pattern.compile("^(.*?)[<].*?[>][(](\\d.*?)[)][<].*?[>]([^<].*)[<]", Pattern.DOTALL);
        Matcher m = p2.matcher(s);
        if (!m.find()) {
            System.out.println("not found");
        } else {
            System.out.println(m.group(1));
            System.out.println(m.group(2));
            System.out.println(m.group(3));
        }
    }
}