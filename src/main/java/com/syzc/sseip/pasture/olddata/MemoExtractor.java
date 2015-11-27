package com.syzc.sseip.pasture.olddata;

import com.alibaba.fastjson.JSON;
import com.syzc.sseip.entity.Memo;
import org.apache.commons.csv.CSVRecord;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class MemoExtractor {
    static Pattern pMemoEntry = Pattern.compile("(^?(([<]br\\s*/[>])|([<]/\\s*br[>]))*)[\r\n]*" +
            "(?<memo>.*?)([<][^/>]+[>])+[(](?<date>\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2})[)]([<]/[^/>]+[>])+([<][^/>]+[>])+(?<user>[^<]*)([<]/[^/>]+[>])+", Pattern.DOTALL);
    static Pattern pFullEntry = Pattern.compile(
            "((" + "[<]/br[>]客服\\(\\d+-\\d+-\\d+ \\d+:\\d+:\\d+\\)删除此记录\\s*" + ")|(" + pMemoEntry.pattern() + "))"
    );
    static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    static Set<String> ss = new HashSet<>();

    public static List<Memo> extract(String memosStr) throws ParseException {
        Matcher m, n;
        if (memosStr == null) {
            return new ArrayList<>();
        }
        m = pFullEntry.matcher(memosStr);
        Memo memo;
        List<Memo> list = new LinkedList<>();
        while (m.find()) {
            n = pMemoEntry.matcher(m.group());
            if (n.matches()) {
//                System.out.println("find:");
//                System.out.println(n.group("memo"));
//                System.out.println(n.group("date"));
//                System.out.println(n.group("user"));
                memo = new Memo();
                memo.setContent(n.group("memo"));
                memo.setAdded(sdf.parse(n.group("date")));
                memo.setUserId(UserExtractor.get(n.group("user")));
                if (UserExtractor.get(n.group("user")) == null && n.group("user") != null && n.group("user").trim().length() > 0) {
//                    System.out.println(n.group("user").length());
//                    System.out.println(n.group("user"));
//                    System.exit(1);
                    ss.add(n.group("user"));
                }
                list.add(memo);
            }
        }

        return list;
    }

    public static void main(String[] args) throws IOException, ParseException {
//        PrintStream ps = new PrintStream(new BufferedOutputStream(new FileOutputStream("e:/sout.txt")));
//        System.setOut(ps);
        System.out.println("here 0");

        for (Iterator<CSVRecord> i = Extractor.ext().iterator(); i.hasNext(); ) {
            CSVRecord r;
            r = i.next();
            String memosStr = r.get("mzbeizhu");
            System.out.println(r.getRecordNumber());
            extract(memosStr);
            System.out.println(JSON.toJSONString(extract(memosStr), true));
        }
        System.out.println(ss);
//        ps.close();
    }
}