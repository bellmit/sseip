package com.syzc.sseip.pasture.dummy;

import java.security.SecureRandom;

public class RandomTelNum {
    static SecureRandom r = new SecureRandom();

    public static long genTel() {
        long range, r1, seg = 100000L, g1, g2;
        final long max = 18999999999L;
        final long min = 13000000000L;
        range = max - min;
        r1 = range / seg;
        g1 = (long) r.nextInt((int) seg) + r.nextInt((int) r1) * seg + min;
        return g1;
    }

    public static void main(String[] args) {
        for (int i = 0; i < 10; i++) {
            System.out.println(genTel());
        }
    }
}