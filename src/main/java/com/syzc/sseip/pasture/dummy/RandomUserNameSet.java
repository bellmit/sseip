package com.syzc.sseip.pasture.dummy;

import com.alibaba.fastjson.JSON;

import java.security.SecureRandom;
import java.util.HashSet;
import java.util.Set;

public class RandomUserNameSet {
    public static void main(String[] args) {
        System.out.println(JSON.toJSONString(genSet(), true));
    }

    public static Set<String> genSet() {
        SecureRandom r = new SecureRandom();
        Set<String> set = new HashSet<>();
        char a, b, c;

        while (set.size() < 50) {
            a = (char) (97 + r.nextInt(26));
            b = (char) (97 + r.nextInt(26));
            c = (char) (97 + r.nextInt(26));
            set.add(String.format("%c%c%c", a, b, c));
        }
        return set;
    }
}