package com.syzc.sseip.pasture.olddata;

import com.alibaba.fastjson.JSON;
import org.apache.commons.csv.CSVRecord;

import java.io.IOException;
import java.util.Iterator;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class MemoExtractorPractice {
    public static void main(String[] args) throws IOException {
        Pattern p1;
        p1 = Pattern.compile("^(.*?)[<].*?[>][(](\\d.*?)[)][<].*?[>]([^<].*)[<]", Pattern.DOTALL);

        CSVRecord r;
        Matcher m;
        for (Iterator<CSVRecord> i = Extractor.ext().iterator(); i.hasNext(); ) {
            r = i.next();
            String memosStr = r.get("mzbeizhu");
//            System.out.println(JSON.toJSONString(memosStr));
            String[] ss = memosStr.split("(([<]br\\s*/\\s*[>])|([<]/br[>])){1,2}[\r\n]*");
            for (String si : ss) {
                if (si.length() == 0 || si.matches("\\s*")) {
                    continue;
                }
//                System.out.println(si);
//                System.out.println(JSON.toJSONString(si));

                m = p1.matcher(si);
                if (!m.find()) {
                    System.out.println("=======");
                    System.out.println("!!!!!!!");
                    System.out.println(r.getRecordNumber());
                    System.out.println("!!!!!!!");
                    System.out.println(memosStr);
                    System.out.println("!!!!!!!");
                    System.out.println(si);
                    System.out.println("!!!!!!!");
                    System.out.println(JSON.toJSONString(si, true));
/*
                    System.out.println(JSON.toJSONString(memosStr));
*/
                    System.exit(1);
                }
                System.out.println(m.group(1) + "-----" + m.group(2) + "-----" + m.group(3));
            }

            /*if (r.getRecordNumber() > 1) {
                break;
            }*/
        }
    }
}