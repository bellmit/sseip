package com.syzc.sseip.pasture.dummy;

import java.io.IOException;
import java.security.SecureRandom;

public class RandomSimpleEnString {
    private static String s;
    //    static final String path = "E:\\codeslike\\notes\\小学生生字大全.txt";
    static final String path = RandomSimpleEnString.class.getResource("/dummy/pupil-characters.txt").getFile();

    public static void main(String[] args) throws IOException {
        System.out.println(genString(20));
        System.out.println(genString(30));
        System.out.println(genString(50));
    }

    public static String genString(int len) throws IOException {
        if (s == null) {
            StringBuilder builder = new StringBuilder();
            for (char i = 'A'; i <= 'Z'; i++) {
                builder.append(i);
            }
            for (char i = 'a'; i <= 'z'; i++) {
                builder.append(i);
            }
            s = builder.toString();
        }

        SecureRandom r = new SecureRandom();
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < len; i++) {
            builder.append(s.charAt(r.nextInt(s.length())));
        }
        return builder.toString();
    }
}