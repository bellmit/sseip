package com.syzc.sseip.pasture.olddata;

import com.alibaba.fastjson.*;
import com.syzc.sseip.entity.CustomerDto;

import java.io.*;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;

public class Rjson3c {
    public static void main(String[] args) throws IOException {
        JSONReader jr;
//        jr = new JSONReader(new BufferedReader(new FileReader("e:/customer-details.json")));
        jr = new JSONReader(new BufferedReader(new InputStreamReader(new GZIPInputStream(new BufferedInputStream(new FileInputStream("e:/customer-details.json.gz"), 104857600)), "UTF-8"), 10485760));

        GZIPOutputStream gzos = new GZIPOutputStream(new BufferedOutputStream(new FileOutputStream("e:/customer-details2.json.gz"), 10485760));
        JSONWriter jw = new JSONWriter(new BufferedWriter(new OutputStreamWriter(gzos, "UTF-8"), 10485760));

        CustomerDto dto;
        JSONArray jarr;
        jarr = (JSONArray) jr.readObject();
        System.out.println(jarr.size());
//        jr.startArray();
        int cnt = 0;
        JSONObject jo;

        jw.writeObject(jarr);
        jw.close();
        gzos.close();


        for (int i = 0; i < jarr.size(); i++) {
            cnt++;
//            Object o = jr.readObject();

//            jo = (JSONObject) o;

            dto = jarr.getObject(i, CustomerDto.class);

            System.out.println(JSON.toJSONString(dto));

//            jo.toJSONString();

//            dto = (CustomerDto) jr.readObject(CustomerDto.class);
//            if (dto == null) {
//                break;
//            }
//            System.out.println(cnt);

/*
            if (cnt == 152) {
//                System.out.println(JSON.toJSONString(o, true));
                System.out.println(o.toString());
                break;
            }
*/
        }
//        jr.endArray();
        jr.close();
        System.out.println(cnt);
    }
}