package com.syzc.sseip.pasture.olddata;

import org.apache.commons.csv.CSVRecord;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class TelExtractorPractice {
    public static void main(String[] args) throws IOException {
        Pattern pattern;
        pattern = Pattern.compile("(^|\\s)([\\s\\w\\d@.!#$%&'*+-/=?_{|}~`\\^]+)($|\\s)");
        CSVRecord rec;
        String s;
        Matcher m;
        m = pattern.matcher("Characters ! # $ % & ' * + - / = ? ^ _ ` { | } ~");
        if (m.find()) {
            System.out.println(m.group(2));
        }

/*
        for (Iterator<CSVRecord> r = Extractor.ext().iterator(); r.hasNext(); ) {
            rec = r.next();
            s = rec.get("Tel");
            m = pattern.matcher(s);
            if (m.find()) {
                System.out.println(m.group(2));
            }
        }
*/
    }
}