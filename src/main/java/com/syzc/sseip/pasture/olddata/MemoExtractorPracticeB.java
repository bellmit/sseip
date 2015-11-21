package com.syzc.sseip.pasture.olddata;

import com.alibaba.fastjson.JSON;
import org.apache.commons.csv.CSVRecord;

import java.io.IOException;
import java.util.Iterator;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class MemoExtractorPracticeB {
    public static void main(String[] args) throws IOException {
        Pattern p1, pDel, pOnlyDate;
        p1 = Pattern.compile("^(.*?)[<].*?[>][(](\\d.*?)[)][<].*?[>]([^<].*?)[<]", Pattern.DOTALL);
        pDel = Pattern.compile("客服[(]\\d+-\\d+-\\d.*?[)]删除此记录", Pattern.DOTALL | Pattern.UNICODE_CHARACTER_CLASS);
//        2014/05/12 11:14:43
        pOnlyDate = Pattern.compile("\\d{4}/\\d{2}/\\d{2} \\d{2}:\\d{2}:\\d{2}", Pattern.DOTALL);

//        (2015-11-11 11:17:16)
        Pattern pMemoEntry = Pattern.compile("([<][^/>]+[>])+[(]\\d{4}-\\d{2}-\\d{2}[)]([<]/[^/>]+[>])+", Pattern.DOTALL);

        CSVRecord r;
        Matcher m;
        String[] ss;

        System.out.println(p1.pattern());
        System.out.println(pDel.pattern());
        System.out.println(pOnlyDate.pattern());
        for (Iterator<CSVRecord> i = Extractor.ext().iterator(); i.hasNext(); ) {
            r = i.next();
            String memosStr = r.get("mzbeizhu");
//            System.out.println(JSON.toJSONString(memosStr));
            ss = memosStr.split("(([<]br\\s*/[>])|([<]/\\s*br[>])){1,2}[\r\n]*");
            for (String si : ss) {
                if (si.length() == 0 || si.matches("\\s*")) {
                    continue;
                }
//                System.out.println(si);
//                System.out.println(JSON.toJSONString(si));

                m = pDel.matcher(si);
                if (m.matches()) {
                    System.out.println("DELETED!!!");
                } else {
                    m = pOnlyDate.matcher(si);
                    if (m.matches()) {
                        System.out.println("ONLY DATE!!!");
                    } else {
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
                        System.out.println(m.group(1).replace("&nbsp;", "").trim() + "-----" + m.group(2) + "-----" + m.group(3));
                    }
                }
            }

            /*if (r.getRecordNumber() > 1) {
                break;
            }*/
        }
    }
}