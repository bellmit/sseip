package com.syzc.sseip.pasture.dummy;

import org.apache.commons.io.IOUtils;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.security.SecureRandom;

public class RandomSimpleCnString {
    public static void main(String[] args) throws IOException {
        System.out.println(genString(20));
        System.out.println(genString(30));
        System.out.println(genString(50));
    }

    private static String s;
    static final String path = "E:\\codeslike\\notes\\小学生生字大全.txt";

    public static String genString(int len) throws IOException {
        if (s == null) {
            try (FileReader fr = new FileReader(path)) {
                s = IOUtils.toString(new BufferedReader(fr));
            }
        }

        SecureRandom r = new SecureRandom();
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < len; i++) {
            builder.append(s.charAt(r.nextInt(s.length())));
        }
        return builder.toString();
    }
}