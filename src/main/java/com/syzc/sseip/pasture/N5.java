package com.syzc.sseip.pasture;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

public class N5 {
    public static void main(String[] args) throws IOException {
        String folderPathE = "E:/codeslike/name-eng-list.lst";
        String folderPathC = "E:/codeslike/name-chn-list.lst";

        BufferedReader r;
        r = new BufferedReader(new FileReader(folderPathC));
        String l;
        long ln = 0;
        Set<String> ss = new HashSet<>();
        while ((l = r.readLine()) != null) {
            System.out.println(l);
            ss.add(l);
            ln++;
        }
        r.close();

        r = new BufferedReader(new FileReader(folderPathE));
        while ((l = r.readLine()) != null) {
            System.out.println(l);
            ss.add(l);
            ln++;
        }
        r.close();
        System.out.println(ss.size());
        System.out.println(ln);

    }
}