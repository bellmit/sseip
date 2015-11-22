package com.syzc.sseip.pasture.olddata;

import org.apache.commons.csv.CSVRecord;

import java.io.IOException;
import java.util.Iterator;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class TelExtractor {
    public static String extr(String s) {
        Pattern pTel;
        pTel = Pattern.compile("([\\u0021-\\u002d\\u002f-\\u0039][\\u0020-\\u002d\\u002f-\\u0039]+[\\u0021-\\u002d\\u002f-\\u0039])");
        Matcher m;
        if (s.lastIndexOf('@') < 0 && s.matches("\\s*[\\d\\s]{3,}\\s*")) {
//            System.out.println(s.trim());
            return s.trim();
        }

        return null;
    }

    public static String extr(CSVRecord rec) {
        String s = rec.get("Tel");
        Pattern pTel;
        pTel = Pattern.compile("([\\u0021-\\u002d\\u002f-\\u0039][\\u0020-\\u002d\\u002f-\\u0039]+[\\u0021-\\u002d\\u002f-\\u0039])");
        Matcher m;
        if (s.lastIndexOf('@') < 0 && s.matches("\\s*[\\d\\s]{3,}\\s*")) {
//            System.out.println(s.trim());
            return s.trim();
        }

        return null;
    }

    public static void main(String[] args) throws IOException {
        Pattern pOnlyTel;
        Pattern pTel;
        Pattern pEmail;
        // /(^|\s|[^\u0031-\u00ff])([\u0021-\u002d\u002f-\u0039][\u0020-\u002d\u002f-\u0039]+[\u0021-\u002d\u002f-\u0039])($|\s|[^\u0031-\u00ff])/g
        pOnlyTel = Pattern.compile("(^|\\s)([\\u0021-\\u002d\\u002f-\\u0039][\\u0020-\\u002d\\u002f-\\u0039]+[\\u0021-\\u002d\\u002f-\\u0039])($|\\s)");
        pTel = Pattern.compile("([\\u0021-\\u002d\\u002f-\\u0039][\\u0020-\\u002d\\u002f-\\u0039]+[\\u0021-\\u002d\\u002f-\\u0039])");
        pEmail = Pattern.compile("[\\u0021-\\u00ff]+@[\\u0021-\\u00ff]+");
        CSVRecord rec;
        String s;
        Matcher m;

//        m = pOnlyTel.matcher("Characters ! # $ % & ' * + - / = ? ^ _ ` { | } ~");
//        if (m.find()) {
//            System.out.println(m.group(2));
//        }

        int cnt = 0;
        int i = 0;
        for (Iterator<CSVRecord> r = Extractor.ext().iterator(); r.hasNext(); ) {
//            System.out.println(extr(r.next()));
            System.out.println(extr(r.next().get("Tel")));

/*
            i++;
            rec = r.next();
            s = rec.get("Tel");
//            System.out.println(s);
//            m = pOnlyTel.matcher(s);
//            m = pEmail.matcher(s);
            if (s.lastIndexOf('@') < 0 && s.matches("\\s*[\\d\\s]{3,}\\s*")) {
                cnt++;
//                System.out.println(m.group(2));
                m = pTel.matcher(s);
                while (m.find()) {
                    System.out.println(i);
                    System.out.println(s);
                    System.out.println("+++++" + m.group());
                }
            }
*/

        }
        System.out.println(cnt);
    }
}