package com.syzc.sseip.pasture;

import org.apache.commons.io.IOUtils;

import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Arrays;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class N4 {
    static FileWriter w;

    public static void main(String[] args) throws IOException {
        String folderPath = "E:\\codeslike\\names";
        File dir = new File(folderPath);

        File outputEngNameFile = new File("E:/codeslike/name-chn-list.lst");
        if (outputEngNameFile.exists()) {
            outputEngNameFile.delete();
        }
        w = new FileWriter(outputEngNameFile, true);

        System.out.println(Arrays.toString(dir.listFiles()));
        System.out.println(dir.listFiles().length);

        for (File f : dir.listFiles()) {
            filter(f);
        }

        w.flush();
        w.close();
    }

    private static void filter(File f) throws IOException {
        Pattern t = Pattern.compile("\t\t([^\\s]{2,5}?)[<]/li[>]", Pattern.MULTILINE);

        FileReader fileReader = new FileReader(f);
        String s = IOUtils.toString(fileReader);

        Matcher m = t.matcher(s);
        while (m.find()) {
            System.out.println(m.group(1));
            w.append(m.group(1));
            w.append('\n');
        }
    }
}