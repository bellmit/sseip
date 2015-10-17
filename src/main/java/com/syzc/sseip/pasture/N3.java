package com.syzc.sseip.pasture;

import org.apache.commons.io.IOUtils;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class N3 {
    public static void main(String[] args) throws IOException {
        Pattern t = Pattern.compile("\t\t([^\\s]{2,5}?)[<]/li[>]", Pattern.MULTILINE);

        String path = "E:\\codeslike\\names\\3-12-0-1.htm";
        File f = new File(path);
        FileReader fileReader = new FileReader(f);
        String s = IOUtils.toString(fileReader);
//        System.out.println(s);

        Matcher m = t.matcher(s);
        while (m.find()) {
            System.out.println(m.group(1));
        }
    }
}