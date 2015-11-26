package com.syzc.sseip.pasture.olddata;

import com.alibaba.fastjson.JSONWriter;
import com.syzc.sseip.entity.CustomerDto;
import com.syzc.sseip.entity.enumtype.HospitalizationType;
import com.syzc.sseip.entity.enumtype.Sex;
import com.syzc.sseip.entity.enumtype.Weight;
import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;

import java.io.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.zip.GZIPOutputStream;

public class Yjson {
    private static final Pattern achorHrefPattern = Pattern.compile("[<]a\\s.*?href\\s*?=\\s*?\"https?://(?!\\w+.53kf.com)(\\S*?)[?#;/\"]", Pattern.DOTALL);

    public static void main(String[] args) throws IOException, ParseException {
        File jf;
        jf = new File("e:/customer-details.json.gz");

        JSONWriter jw;
//        jw = new JSONWriter(new BufferedWriter(new OutputStreamWriter(new GZIPOutputStream(new FileOutputStream(jf))), 6553600));

        GZIPOutputStream gzos = new GZIPOutputStream(new BufferedOutputStream(new FileOutputStream(jf), 6553600), true);
        jw = new JSONWriter(new OutputStreamWriter(gzos));

        String p;
//        p = "C:/Users/TechUser/Documents/yingwen2.csv";
        p = "e:/yingwen-new.csv";
        File pf = new File(p);
//        System.out.println(pf.exists());
        Reader reader = new FileReader(pf);
        CSVParser ps = CSVFormat.DEFAULT.withHeader(
//                new String[]{"ID", "UserName", "Sex", "Age", "Address", "Tel", "SubTime", "zhengzhuang", "LtRecord", "kfmark", "ZbUserName", "WebAddress", "SubUserName", "mzbeizhu", "sfzy", "quanzhong", "hfTime", "sfyx", "zhuanruren", "zhuanchuren", "zhuanyitime", "zhuanyijilu", "telstatus", "sfsc", "sfjj", "bingzhong", "LastTime", "kfusername", "kfusertel", "kfuseraddr", "kfbeizhu", "strurl", "zystyle", "mzusername", "mzusertel", "mzuseraddr", "sfby", "sfck"}
        ).parse(reader);

        CSVRecord r;
        CustomerDto customer;

        Set<String> ds = new HashSet<>();
        Set<Integer> uids = new HashSet<>();
        Matcher m;

        long cnt = 2000;
        jw.startArray();
        for (Iterator<CSVRecord> ir = ps.iterator(); ir.hasNext(); ) {
            cnt++;
            r = ir.next();
            customer = new CustomerDto();
            if (r.getRecordNumber() % 100 == 0) {
                System.out.println(r.getRecordNumber());
            }

            customer.setId(cnt);
            customer.setPatientName(r.get("UserName"));
            customer.setSex(sexConverter(r.get("Sex")));
            customer.setAge(ageConverter(r.get("Age")));
            // country ignore for now; mix addr & kf addr, or only addr
            //tel & country mixed
            // kfuseraddr (indu), Address 是国家名字
            customer.setAdded(subTimeParser(r.get("SubTime")));
            customer.setSymptom(r.get("zhengzhuang"));
            customer.setContactRecords(Jsoup.clean(r.get("LtRecord"), Whitelist.relaxed()));

            customer.setHospitalization(HospitalizationType.NO);
            customer.setWeight(Weight.get(weightConverter(r.get("quanzhong"))));
            customer.setRevisitDate(revisitDateParser(r.get("hfTime")));
            customer.setValid(!r.get("sfyx").equals("0"));
            customer.setDiscard(!r.get("sfsc").equals("0"));
            customer.setEmergency(!r.get("sfjj").equals("0"));
            customer.setUpdated(revisitDateParser(r.get("LastTime")));

            if (customer.getContactRecords() != null) {
                m = achorHrefPattern.matcher(customer.getContactRecords());
                if (m.find()) {
                    customer.setSourceWebsite(m.group(1));
                } else {
//                System.out.println("source website not found");
                }
            }

//            System.out.println(r.get("ZbUserName"));
//            ds.add(r.get("ZbUserName"));
//            ds.add(r.get("SubUserName"));

//            uids.add(UserExtractor.map.get(r.get("ZbUserName")));

            /*if (UserExtractor.map.get(r.get("ZbUserName")) == null && r.get("ZbUserName") != null && r.get("ZbUserName").length() > 0) {
                System.out.println(r.get("ZbUserName"));
            }*/

            customer.setWebsiteId(28L);
            customer.setDiseaseTypeId(DiseaseTExtractor.diseaseTMap.get(r.get("bingzhong")));
            customer.setOwnerUserId(UserExtractor.get(r.get("ZbUserName")));
            customer.setUserId(UserExtractor.get(r.get("SubUserName")));
            customer.setPatientCountryId(PCountryExtractor.t(r));

            {
                String v = r.get("Tel").trim();
                if (v.length() > 0) {
                    customer.setEmail(v);
                    customer.setTel(TelExtractor.extr(v));
                }
            }

            //提取备注列表； 参考custoemr id
            customer.setMemos(MemoExtractor.extract(r.get("mzbeizhu")));

//            System.out.println(r.get("Address"));

            /*if (DiseaseTExtractor.diseaseTMap.get(r.get("bingzhong")) == null && r.get("bingzhong") != null && r.get("bingzhong").length() > 0) {
                System.out.println(r.get("bingzhong"));
            }*/

//            System.out.println(Jsoup.clean(r.get("LtRecord"), Whitelist.relaxed()));
//            System.out.println(JSON.toJSONString(Jsoup.clean(r.get("LtRecord"), Whitelist.relaxed())));

//            System.out.println(JSON.toJSONString(customer, true));

//            jw.writeObject(customer);
            jw.writeValue(customer);

//            System.out.println(JSON.toJSONString(customer.getSymptom()));
//            System.out.println(customer.getSymptom());
//            System.out.println(JSON.toJSONString(customer.getRevisitDate()));

//            System.out.println(customer.getValid());
//            System.out.println(customer.getDiscard());
//            System.out.println(customer.getEmergency());

//            System.out.println(customer.getUpdated());
//            System.out.println(customer.getSourceWebsite());

            // limit loop count
/*
            if (r.getRecordNumber() % 10 == -1) {
                break;
            }
*/
        }
        ps.close();
        jw.endArray();
//        jw.close();
        jw.flush();
        gzos.close();

//        System.out.println(JSON.toJSONString(ds, true));
//        System.out.println(JSON.toJSONString(uids, true));
    }

    static Sex sexConverter(String str) {
        if (str.equals("女")) {
            return Sex.FEMALE;
        } else if (str.equals("男")) {
            return Sex.MALE;
        } else {
            return null;
        }
    }

    static Short ageConverter(String str) {
        Pattern pattern = Pattern.compile("^\\d+");
        Matcher m = pattern.matcher(str);
        if (m.find()) {
            return Short.valueOf(m.group());
        }
        return null;
    }

    static String telConverter(String str) {
        Pattern pattern = Pattern.compile("^\\d+");
        return null;
    }

    static Date subTimeParser(String str) throws ParseException {
        final SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        final SimpleDateFormat sdfO = new SimpleDateFormat("yyyy/MM/dd");

        try {
            return sdf.parse(str);
        } catch (ParseException e) {
            return sdfO.parse(str);
        }
    }

    static Date revisitDateParser(String str) throws ParseException {
        if (str == null || str.length() == 0) {
            return null;
        }
        final SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        final SimpleDateFormat sdfO = new SimpleDateFormat("yyyy/MM/dd");

        try {
            return sdf.parse(str);
        } catch (ParseException e) {
            return sdfO.parse(str);
        }
    }

    static Integer weightConverter(String str) {
        if (str == null || str.length() == 0) {
            return null;
        } else {
            return Integer.parseInt(str) + 1;
        }
    }
}