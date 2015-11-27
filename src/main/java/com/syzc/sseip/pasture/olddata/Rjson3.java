package com.syzc.sseip.pasture.olddata;

import com.alibaba.fastjson.JSONReader;
import com.syzc.sseip.entity.CustomerDto;

import java.io.*;
import java.util.ArrayList;
import java.util.zip.GZIPInputStream;

public class Rjson3 {
    public static void main(String[] args) throws IOException {
        JSONReader jr;
        jr = new JSONReader(new BufferedReader(new InputStreamReader(new GZIPInputStream(new BufferedInputStream(new FileInputStream("e:/customer-details.json.gz"), 104857600)), "UTF-8"), 10485760));

        CustomerDto dto;
        ArrayList<Integer> al;
        jr.startArray();
        int cnt = 0;
        while (jr.hasNext()) {
            cnt++;
            System.out.println(cnt);

//            Object o = jr.readObject();

            jr.readObject(CustomerDto.class);

//            dto = (CustomerDto) jr.readObject(CustomerDto.class);

/*
            if (dto == null) {
                break;
            }
*/

/*
            if (cnt == 152) {
//                System.out.println(JSON.toJSONString(o, true));
                System.out.println(o.toString());
                break;
            }
*/
        }
        jr.endArray();
        jr.close();
        System.out.println(cnt);
    }
}