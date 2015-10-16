package com.syzc.sseip.pasture;

import org.apache.commons.io.IOUtils;

import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Arrays;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class N2 {
    static FileWriter w;

    public static void main(String[] args) throws IOException {
        String folderPath = "E:\\codeslike\\names2";
        File dir = new File(folderPath);

        File outputEngNameFile = new File("E:/codeslike/eng-name-list.lst");
        if (outputEngNameFile.exists()) {
            outputEngNameFile.delete();
        }
        w = new FileWriter(outputEngNameFile, true);

        System.out.println(Arrays.toString(dir.listFiles()));
        System.out.println(dir.listFiles().length);

        for (File f : dir.listFiles()) {
            filter(f);
        }

        w.close();
    }

    private static void filter(File f) throws IOException {
        Pattern t = Pattern.compile("class=\"list\"(.*)[<]/table[>]");
        Pattern t2 = Pattern.compile("[<]td[>](.*?)[<]/td[>]");

        FileReader fileReader = new FileReader(f);
        String s = IOUtils.toString(fileReader);

        Matcher m = t.matcher(s);
        if (!m.find()) return;
        String s2 = m.group(1);
//        System.out.println(s2);
        Matcher m2 = t2.matcher(s2);
        while (m2.find()) {
//            System.out.println(m2.group(1));
            System.out.println(m2.group(1).replaceAll("[<].*?[>]", ""));
            w.append(m2.group(1).replaceAll("[<].*?[>]", ""));
            w.append('\n');
        }
    }
}