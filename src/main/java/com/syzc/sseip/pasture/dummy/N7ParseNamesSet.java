package com.syzc.sseip.pasture.dummy;

import com.syzc.sseip.pasture.Reco;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class N7ParseNamesSet {
    static Set<String> pset;
    static List<String> arr;

    public static void main(String[] args) throws IOException {
        for (String s : parseSetImpr()) {
            System.out.println(s);
        }
    }

    public static void writeMergedNameList() throws IOException {
        //merge Chinese, and English people name list
        Set<String> se = parseSetCombo();
        System.out.println(se.size());
        FileWriter w;
        w = new FileWriter("E:/codeslike/name-combo-set.lst");
        for (String s : se) {
            w.append(s);
            w.append('\n');
        }
        w.close();
    }

    public static List<String> parseArr() throws IOException {
        if (arr == null) {
            arr = new ArrayList<>(parseSetImpr());
        }
        return arr;
    }

    public static Set<String> parseSetCombo() throws IOException {
        if (pset == null) {

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

            pset = ss;
        }
        return pset;
    }

    public static Set<String> parseSetImpr() throws IOException {
        if (pset == null) {

//            final String folderPathE = "E:/codeslike/name-eng-list.lst";
//            final String folderPathC = "E:/codeslike/name-chn-list.lst";

            BufferedReader r;
            r = new BufferedReader(new FileReader(Reco.class.getResource("/dummy/name-combo-set.lst").getFile()));
            String line;
            HashSet<String> ss = new HashSet<>();
            while ((line = r.readLine()) != null) {
//            System.out.println(line);
                ss.add(line);
            }
            r.close();

/*
            r = new BufferedReader(new FileReader(folderPathE));
            while ((line = r.readLine()) != null) {
//            System.out.println(line);
                ss.add(line);
            }
            r.close();
*/
            System.out.println(String.format("parsed %d individual names", ss.size()));

            pset = ss;
        }
        return pset;
    }
}