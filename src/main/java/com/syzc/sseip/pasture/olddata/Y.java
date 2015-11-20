package com.syzc.sseip.pasture.olddata;

import com.syzc.sseip.entity.Customer;
import com.syzc.sseip.entity.enumtype.HospitalizationType;
import com.syzc.sseip.entity.enumtype.Sex;
import com.syzc.sseip.entity.enumtype.Weight;
import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Y {
    private static final Pattern achorHrefPattern = Pattern.compile("[<]a\\s.*?href\\s*?=\\s*?\"https?://(?!\\w+.53kf.com)(\\S*?)[?#;/\"]", Pattern.DOTALL);

    public static void main(String[] args) throws IOException, ParseException {
        String p = "C:/Users/TechUser/Documents/yingwen2.csv";
        File pf = new File(p);
//        System.out.println(pf.exists());
        Reader reader = new FileReader(pf);
        CSVParser ps = CSVFormat.DEFAULT.withHeader(
//                new String[]{"ID", "UserName", "Sex", "Age", "Address", "Tel", "SubTime", "zhengzhuang", "LtRecord", "kfmark", "ZbUserName", "WebAddress", "SubUserName", "mzbeizhu", "sfzy", "quanzhong", "hfTime", "sfyx", "zhuanruren", "zhuanchuren", "zhuanyitime", "zhuanyijilu", "telstatus", "sfsc", "sfjj", "bingzhong", "LastTime", "kfusername", "kfusertel", "kfuseraddr", "kfbeizhu", "strurl", "zystyle", "mzusername", "mzusertel", "mzuseraddr", "sfby", "sfck"}
        ).parse(reader);


        CSVRecord r;
        Customer customer;
        for (Iterator<CSVRecord> ir = ps.iterator(); ir.hasNext(); ) {
            r = ir.next();
            customer = new Customer();
//            System.out.println(r.getRecordNumber());

            customer.setPatientName(r.get("UserName"));
            customer.setSex(sexConverter(r.get("Sex")));
            customer.setAge(ageConverter(r.get("Age")));
            // country ignore for now
            //tel & country mixed
            customer.setAdded(subTimeParser(r.get("SubTime")));
            customer.setSymptom(r.get("zhengzhuang"));
            customer.setContactRecords(Jsoup.clean(r.get("LtRecord"), Whitelist.relaxed()));
            // owner
            // website group
            // initial owner
            // memo list

            customer.setHospitalization(HospitalizationType.NO);
            customer.setWeight(Weight.get(weightConverter(r.get("quanzhong"))));
            customer.setRevisitDate(revisitDateParser(r.get("hfTime")));
            customer.setValid(!r.get("sfyx").equals("0"));
            customer.setDiscard(!r.get("sfsc").equals("0"));
            customer.setEmergency(!r.get("sfjj").equals("0"));
            // disease type
            customer.setUpdated(revisitDateParser(r.get("LastTime")));

            if (customer.getContactRecords() != null) {
                Matcher m = achorHrefPattern.matcher(customer.getContactRecords());
                if (m.find()) {
                    customer.setSourceWebsite(m.group(1));
                } else {
//                System.out.println("source website not found");
                }
            }

//            System.out.println(Jsoup.clean(r.get("LtRecord"), Whitelist.relaxed()));
//            System.out.println(JSON.toJSONString(Jsoup.clean(r.get("LtRecord"), Whitelist.relaxed())));

//            System.out.println(JSON.toJSONString(customer, true));
//            System.out.println(JSON.toJSONString(customer.getSymptom()));
//            System.out.println(customer.getSymptom());
//            System.out.println(JSON.toJSONString(customer.getRevisitDate()));

//            System.out.println(customer.getValid());
//            System.out.println(customer.getDiscard());
//            System.out.println(customer.getEmergency());

//            System.out.println(customer.getUpdated());
//            System.out.println(customer.getSourceWebsite());
            if (r.getRecordNumber() % 10 == -1) {
                break;
            }
        }
        ps.close();
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
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        return sdf.parse(str);
    }

    static Date revisitDateParser(String str) throws ParseException {
        if (str == null || str.length() == 0) {
            return null;
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        return sdf.parse(str);
    }

    static Integer weightConverter(String str) {
        if (str == null || str.length() == 0) {
            return null;
        } else {
            return Integer.parseInt(str) + 1;
        }
    }
}