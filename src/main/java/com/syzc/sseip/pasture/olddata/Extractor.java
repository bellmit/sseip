package com.syzc.sseip.pasture.olddata;

import com.syzc.sseip.entity.Customer;
import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.util.Iterator;

public class Extractor {
    public static CSVParser ext() throws IOException {
        String p = "C:/Users/TechUser/Documents/yingwen2.csv";
        File pf = new File(p);
        Reader reader = new FileReader(pf);
//                new String[]{"ID", "UserName", "Sex", "Age", "Address", "Tel", "SubTime", "zhengzhuang", "LtRecord", "kfmark", "ZbUserName", "WebAddress", "SubUserName", "mzbeizhu", "sfzy", "quanzhong", "hfTime", "sfyx", "zhuanruren", "zhuanchuren", "zhuanyitime", "zhuanyijilu", "telstatus", "sfsc", "sfjj", "bingzhong", "LastTime", "kfusername", "kfusertel", "kfuseraddr", "kfbeizhu", "strurl", "zystyle", "mzusername", "mzusertel", "mzuseraddr", "sfby", "sfck"}
        CSVParser ps = CSVFormat.DEFAULT.withHeader(
        ).parse(reader);
        return ps;
    }

    public static void main(String[] args) throws IOException {
        String p = "C:/Users/TechUser/Documents/yingwen.csv";
        File pf = new File(p);
        Reader reader = new FileReader(pf);
//                new String[]{"ID", "UserName", "Sex", "Age", "Address", "Tel", "SubTime", "zhengzhuang", "LtRecord", "kfmark", "ZbUserName", "WebAddress", "SubUserName", "mzbeizhu", "sfzy", "quanzhong", "hfTime", "sfyx", "zhuanruren", "zhuanchuren", "zhuanyitime", "zhuanyijilu", "telstatus", "sfsc", "sfjj", "bingzhong", "LastTime", "kfusername", "kfusertel", "kfuseraddr", "kfbeizhu", "strurl", "zystyle", "mzusername", "mzusertel", "mzuseraddr", "sfby", "sfck"}
        CSVParser ps = CSVFormat.DEFAULT.withHeader().parse(reader);
        CSVRecord r;
        Customer customer;
        for (Iterator<CSVRecord> ir = ps.iterator(); ir.hasNext(); ) {
            r = ir.next();
            customer = new Customer();
            r.getRecordNumber();
            if (r.getRecordNumber() % 10 == 0) {
                break;
            }
        }
        ps.close();
    }
}