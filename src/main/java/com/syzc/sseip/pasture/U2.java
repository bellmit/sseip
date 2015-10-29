package com.syzc.sseip.pasture;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class U2 {
    private static final Pattern achorHrefPattern = Pattern.compile("[<]a.*?href.*?=.*?\"(http\\S*?)\"", Pattern.DOTALL);

    public static void main(String[] args) {
        Matcher m = achorHrefPattern.matcher("<a href=\"http://ri.search.yahoo.com/_ylt=AwrBT4Aa1DFWTrIA556l87UF;_ylu=X3oDMTByMjB0aG5zBGNvbG8DYmYxBHBvcwMxBHZ0aWQDBHNlYwNzYw--/RV=2/RE=1446134938/RO=10/RU=http%3a%2f%2fwww.yahoo.com%2fpolitics%2fcruz-and-rubio-score-points-by-bashing-media-032804180.html/RK=0/RS=DF7Sx_gEL4ynRdHnrRF5GMWC2xg-\">asdfa</a>");
        if (m.find()) {
            System.out.println(m.group(1));
        } else {
            System.out.println("not found.");
        }

    }
}