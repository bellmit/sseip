package com.syzc.sseip.pasture.olddata;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.JSONReader;
import com.syzc.sseip.entity.CustomerDto;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;

public class Rjson {
    public static void main(String[] args) throws FileNotFoundException {
        JSONReader jr = new JSONReader(new BufferedReader(new FileReader("e:/customer-details.json")));
        int cnt = 0;
        Object o;
        CustomerDto dto;
        JSONObject jo;
        do {
            cnt++;
//            jo = (JSONObject) jr.readObject();
            dto = (CustomerDto) jr.readObject(CustomerDto.class);
            System.out.println(cnt);
            System.out.println(JSON.toJSONString(dto));
//            System.out.println(dto);
        } while (dto != null);
        System.out.println(cnt);
    }
}