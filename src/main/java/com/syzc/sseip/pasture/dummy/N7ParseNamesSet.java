package com.syzc.sseip.pasture.dummy;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

public class N7ParseNamesSet {
    public static void main(String[] args) throws IOException {
        Set<String> se = parseSet();
        System.out.println(se.size());
        FileWriter w = new FileWriter("E:/codeslike/name-combo-set.lst");
        for (String s : se) {
            w.append(s);
            w.append('\n');
        }
        w.close();
    }

    public static HashSet<String> parseSet() throws IOException {
        final String folderPathE = "E:/codeslike/name-eng-list.lst";
        final String folderPathC = "E:/codeslike/name-chn-list.lst";

        BufferedReader r;
        r = new BufferedReader(new FileReader(folderPathC));
        String line;
        HashSet<String> ss = new HashSet<>();
        while ((line = r.readLine()) != null) {
//            System.out.println(line);
            ss.add(line);
        }
        r.close();

        r = new BufferedReader(new FileReader(folderPathE));
        while ((line = r.readLine()) != null) {
//            System.out.println(line);
            ss.add(line);
        }
        r.close();
        System.out.println(String.format("parsed %d individual names", ss.size()));
        return ss;
    }
}