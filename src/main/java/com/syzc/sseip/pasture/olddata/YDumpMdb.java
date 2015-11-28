package com.syzc.sseip.pasture.olddata;

import com.alibaba.fastjson.JSONArray;
import com.syzc.sseip.dao.CustomerDao;
import com.syzc.sseip.dao.MemoDao;
import com.syzc.sseip.entity.CustomerDto;
import com.syzc.sseip.entity.Memo;
import com.syzc.sseip.entity.enumtype.HospitalizationType;
import com.syzc.sseip.entity.enumtype.Sex;
import com.syzc.sseip.entity.enumtype.Weight;
import com.syzc.sseip.pasture.olddata.mdbdumper.ExtractorMdb;
import com.syzc.sseip.util.HosException;
import com.syzc.sseip.util.LocalAcUtil;
import org.apache.log4j.Level;
import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class YDumpMdb {
    private static final Pattern achorHrefPattern = Pattern.compile("[<]a\\s.*?href\\s*?=\\s*?\"https?://(?!\\w+.53kf.com)(\\S*?)[?#;/\"]", Pattern.DOTALL);

    public static void main(String[] args) throws IOException, ParseException, SQLException, ClassNotFoundException {
        CustomerDao cd = (CustomerDao) LocalAcUtil.getAc().getBean("customerDao");
        MemoDao md = (MemoDao) LocalAcUtil.getAc().getBean("memoDao");

//        File jf;
//        jf = new File("e:/customer-details.json.gz");

//        JSONWriter jw;

//        GZIPOutputStream gzos = new GZIPOutputStream(new BufferedOutputStream(new FileOutputStream(jf), 6553600), true);
//        jw = new JSONWriter(new OutputStreamWriter(gzos));

        CustomerDto customer;

        Set<String> ds = new HashSet<>();
        Set<Integer> uids = new HashSet<>();
        Matcher m;

        long cnt = 2000;
//        jw.startArray();
        JSONArray jarr = new JSONArray(9000);

        ResultSet ir;
        ir = ExtractorMdb.ext();
        for (; ir.next(); ) {
            cnt++;
            customer = new CustomerDto();
            /*if (r.getRecordNumber() % 100 == 0) {
                System.out.println(r.getRecordNumber());
            }*/

            customer.setId(cnt);
            customer.setPatientName(ir.getString("UserName"));
            customer.setSex(sexConverter(ir.getString("Sex")));
            customer.setAge(ageConverter(ir.getString("Age")));
            // country ignore for now; mix addr & kf addr, or only addr
            //tel & country mixed
            // kfuseraddr (indu), Address 是国家名字
            customer.setAdded(subTimeParser(ir.getString("SubTime")));
            customer.setSymptom(ir.getString("zhengzhuang"));
            if (ir.getString("LtRecord") != null) {
                customer.setContactRecords(Jsoup.clean(ir.getString("LtRecord"), Whitelist.relaxed()));
            }

            customer.setHospitalization(HospitalizationType.NO);
            customer.setWeight(Weight.get(weightConverter(ir.getString("quanzhong"))));
            customer.setRevisitDate(revisitDateParser(ir.getString("hfTime")));
            customer.setValid(!ir.getString("sfyx").equals("0"));
            customer.setDiscard(!ir.getString("sfsc").equals("0"));
            customer.setEmergency(!ir.getString("sfjj").equals("0"));
            customer.setUpdated(revisitDateParser(ir.getString("LastTime")));

            if (customer.getContactRecords() != null) {
                m = achorHrefPattern.matcher(customer.getContactRecords());
                if (m.find()) {
                    customer.setSourceWebsite(m.group(1));
                } else {
//                System.out.println("source website not found");
                }
            }

            customer.setWebsiteId(28L);
            customer.setDiseaseTypeId(DiseaseTExtractor.diseaseTMap.get(ir.getString("bingzhong")));
            customer.setOwnerUserId(UserExtractor.get(ir.getString("ZbUserName")));
            customer.setUserId(UserExtractor.get(ir.getString("SubUserName")));
            customer.setPatientCountryId(PCountryExtractorMdb.t(ir));

            {
                if (ir.getString("Tel") != null) {
                    String v = ir.getString("Tel").trim();
                    if (v.length() > 0) {
                        customer.setEmail(v);
                        customer.setTel(TelExtractor.extr(v));
                    }
                }
            }

            //提取备注列表； 参考custoemr id
            customer.setMemos(MemoExtractor.extract(ir.getString("mzbeizhu")));

            try {
                cd.addOld(customer);
                for (Memo memo : customer.getMemos()) {
                    System.out.println(memo.getContent().length());
                    md.addToCustomerF(memo, customer.getId());
                }
            } catch (Exception e) {
                throw HosException.create(e, String.format("DB write error while dumping the old data, at row (+2000)%d", cnt), Level.ERROR);
            }

//            jw.writeObject(customer);
//            jarr.add(customer);
//            System.out.println(cnt);

//            JSON.parseObject(JSON.toJSONString(customer), CustomerDto.class);

        }

//        jw.writeObject(jarr);

        ir.close();
//        jw.endArray();

//        jw.flush();
//        jw.close();
//        gzos.close();

//        System.out.println(JSON.toJSONString(ds, true));
//        System.out.println(JSON.toJSONString(uids, true));
    }

    static Sex sexConverter(String str) {
        if (str == null) {
            return null;
        }
        if (str.equals("女")) {
            return Sex.FEMALE;
        } else if (str.equals("男")) {
            return Sex.MALE;
        } else {
            return null;
        }
    }

    static Short ageConverter(String str) {
        if (str == null) {
            return null;
        }
        Pattern pattern = Pattern.compile("^\\d+");
        Matcher m = pattern.matcher(str);
        if (m.find()) {
            return Short.valueOf(m.group());
        }
        return null;
    }

    static Date subTimeParser(String str) throws ParseException {
        final SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        final SimpleDateFormat sdfO = new SimpleDateFormat("yyyy/MM/dd");
        final SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        if (str == null) {
            return null;
        }
        try {
            return sdf.parse(str);
        } catch (ParseException e) {
            try {
                return sdfO.parse(str);
            } catch (ParseException e1) {
                return sdf1.parse(str);
            }
        }
    }

    static Date revisitDateParser(String str) throws ParseException {
        if (str == null || str.length() == 0) {
            return null;
        }
        final SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        final SimpleDateFormat sdfO = new SimpleDateFormat("yyyy/MM/dd");
        final SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        try {
            return sdf.parse(str);
        } catch (ParseException e) {
            try {
                return sdfO.parse(str);
            } catch (ParseException e1) {
                return sdf1.parse(str);
            }
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