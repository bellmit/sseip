package com.syzc.sseip.pasture.olddata;

import org.apache.commons.csv.CSVRecord;

import java.io.IOException;
import java.util.Iterator;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class MemoExtractorPracticeBImpr {
    public static void main(String[] args) throws IOException {
//        PrintStream ps = new PrintStream(new BufferedOutputStream(new FileOutputStream("e:/sout.txt")));
//        System.setOut(ps);

//        </br>客服(2014-07-06 11:40:16)删除此记录
//        pDel = Pattern.compile("[<]/br[>]客服\\(\\d+-\\d+-\\d+ \\d+:\\d+:\\d+\\)删除此记录\\s*", Pattern.DOTALL | Pattern.UNICODE_CHARACTER_CLASS);

//        (2015-11-11 11:17:16)
        Pattern pMemoEntry, pFullEntry;
        //没有用户名
//        pMemoEntry = Pattern.compile("(^|(([<]br\\s*/[>])|([<]/\\s*br[>]))*)[\r\n]*" +
//                "(.*?)([<][^/>]+[>])+[(]\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2}[)]([<]/[^/>]+[>])+", Pattern.DOTALL);

        //没有
        pMemoEntry = Pattern.compile("(^|(([<]br\\s*/[>])|([<]/\\s*br[>]))*)[\r\n]*" +
                "(?<memo>.*?)([<][^/>]+[>])+[(](?<date>\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2})[)]([<]/[^/>]+[>])+([<][^/>]+[>])+(?<user>[^<]*)([<]/[^/>]+[>])+", Pattern.DOTALL);

        pFullEntry = Pattern.compile(
                "((" + "[<]/br[>]客服\\(\\d+-\\d+-\\d+ \\d+:\\d+:\\d+\\)删除此记录\\s*" + ")|(" + "(^|(([<]br\\s*/[>])|([<]/\\s*br[>]))*)[\r\n]*" +
                        "(.*?)([<][^/>]+[>])+[(]\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2}[)]([<]/[^/>]+[>])+([<][^/>]+[>])+.*?([<]/[^/>]+[>])+" + "))"
        );

        CSVRecord r;
        Matcher m, n;

//        System.out.println(p1.pattern());
//        System.out.println(pDel.pattern());
//        System.out.println(pOnlyDate.pattern());

        for (Iterator<CSVRecord> i = Extractor.ext().iterator(); i.hasNext(); ) {
            r = i.next();
            String memosStr = r.get("mzbeizhu");
//            System.out.println(JSON.toJSONString(memosStr));

//            m = pMemoEntry.matcher(memosStr);
//            m = pDel.matcher(memosStr);
            m = pFullEntry.matcher(memosStr);
            System.out.println(r.getRecordNumber());
//            System.out.println(r.get("ID"));
            while (m.find()) {
                n = pMemoEntry.matcher(m.group());
                if (n.matches()) {
                    System.out.println("find:");
                    System.out.println(n.group("memo"));
                    System.out.println(n.group("date"));
                    System.out.println(n.group("user"));

                }
            }

/*
            ss = memosStr.split("(([<]br\\s*//*
[>])|([<]/\\s*br[>])){1,2}[\r\n]*");
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

//                            System.out.println(JSON.toJSONString(memosStr));

                            System.exit(1);
                        }
                        System.out.println(m.group(1).replace("&nbsp;", "").trim() + "-----" + m.group(2) + "-----" + m.group(3));
                    }
                }
            }
*/

            /*if (r.getRecordNumber() > 1) {
                break;
            }*/
        }

        System.out.println(pMemoEntry.pattern());

//        ps.close();
    }
}