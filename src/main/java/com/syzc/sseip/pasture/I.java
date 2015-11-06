package com.syzc.sseip.pasture;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Arrays;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class I {
    public static void main(String[] args) throws UnknownHostException {
        String ip = "132.99.76.9";
        Pattern p = Pattern.compile("^(\\d+)\\.(\\d+)\\.(\\d+)\\.(\\d+)$");
        Matcher m = p.matcher(ip);
        System.out.println(m.find());
        String g1, g2, g3, g4;
        g1 = m.group(1);
        g2 = m.group(2);
        g3 = m.group(3);
        g4 = m.group(4);
        System.out.println(Arrays.toString(new String[]{g1, g2, g3, g4}));
        byte[] ipbs = new byte[4];
//        ipbs[0] = Byte.valueOf(g1);
//        ipbs[1] = Byte.valueOf(g2);
//        ipbs[2] = Byte.valueOf(g3);
//        ipbs[3] = Byte.valueOf(g4);
        System.out.println(m.find());

        InetAddress a;
        a = InetAddress.getByName(ip);
        System.out.println(Arrays.toString(a.getAddress()));

        a = InetAddress.getByName("0:0:0:0:0:0:0:1");
        System.out.println(Arrays.toString(a.getAddress()));
    }
}