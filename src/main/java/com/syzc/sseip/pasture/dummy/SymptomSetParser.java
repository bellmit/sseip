package com.syzc.sseip.pasture.dummy;

import org.apache.commons.lang.StringUtils;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.security.SecureRandom;
import java.util.*;

public class SymptomSetParser {
    static Set<String> sset;
    static ArrayList<String> arr;
    static SecureRandom r = new SecureRandom();

    public static void main(String[] args) throws IOException {
        Random random = new Random();
        for (int i = 0; i < 5; i++) {
            System.out.println(simpleSymptom(random.nextInt(5) + 1));
        }
    }

    public static String simpleSymptom(int c) throws IOException {
        if (arr == null) {
            arr = new ArrayList<>(parse());
        }

        Set<String> ch = new HashSet<>();
        while (ch.size() < c) {
            ch.add(arr.get(r.nextInt(arr.size())));
        }
//        System.out.println(JSON.toJSONString(ch, true));
        ArrayList<String> charr = new ArrayList<>(ch);
        Collections.shuffle(charr, r);

        return StringUtils.join(charr, ",");
    }

    public static Set<String> parse() throws IOException {
        if (sset == null) {

//            final String path = "E:\\codeslike\\notes\\symptom.lst";
            final String path = SymptomSetParser.class.getResource("/dummy/symptom.lst").getFile();
            Set<String> set = new HashSet<>();
            String line;
            int ln = 0;
            try (BufferedReader br = new BufferedReader(new FileReader(path))) {
                while ((line = br.readLine()) != null) {
                    if (line.length() > 0) {
                        set.add(line);
                        ln++;
                    }
                }
            }
            if (set.size() <= 5) {
                System.out.println("症状集合的尺寸太少了");
                System.out.println(set.size());
            }
            sset = set;
        }
        return sset;
    }
}