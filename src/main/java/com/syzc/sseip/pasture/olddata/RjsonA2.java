package com.syzc.sseip.pasture.olddata;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.JSONReader;
import com.alibaba.fastjson.JSONWriter;
import com.alibaba.fastjson.util.TypeUtils;
import com.syzc.sseip.entity.CustomerDto;

import java.io.*;
import java.util.zip.GZIPInputStream;

public class RjsonA2 {
    public static void main(String[] args) throws IOException {

        JSONReader jr = new JSONReader(new BufferedReader(new InputStreamReader(new GZIPInputStream(new FileInputStream("e:/customer-details.json.gz"))), 10485760));
        int cnt = 0;
        CustomerDto dto;

        JSONArray ja = (JSONArray) jr.readObject();
        JSONObject jo;

        File jf = new File("e:/customer-details2a.json");
        JSONWriter jw = new JSONWriter(new BufferedWriter(new FileWriter(jf), 10485760));
        jw.startArray();

        for (Object o : ja) {
//            jo = (JSONObject) o;
//            dto = TypeUtils.castToJavaBean(jo, CustomerDto.class);
            dto = TypeUtils.castToJavaBean(o, CustomerDto.class);
            jw.writeValue(dto);
        }

        System.out.println(ja.size());
        System.out.println(cnt);

        jw.endArray();
        jw.close();
    }
}