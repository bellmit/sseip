package com.syzc.sseip.service;

import com.alibaba.fastjson.JSON;
import com.syzc.sseip.util.LocalAcUtil;

public class CountryServiceImplTest {
    public static void main(String[] args) {
        CountryService s = (CountryService) LocalAcUtil.getAc().getBean("countryServiceImpl");
        System.out.println(JSON.toJSONString(s.list(1L, (byte) 10), true));
        System.out.println(JSON.toJSONString(s.get(1L), true));
    }
}