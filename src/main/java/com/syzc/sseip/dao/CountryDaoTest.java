package com.syzc.sseip.dao;

import com.alibaba.fastjson.JSON;
import com.syzc.sseip.entity.Country;
import com.syzc.sseip.util.LocalAcUtil;

public class CountryDaoTest {
    public static void main(String[] args) {
        CountryDao d = (CountryDao) LocalAcUtil.getAc().getBean("countryDao");
        System.out.println(d);

/*
        for (Country c : d.listAll()) {
            System.out.println(JSON.toJSONString(c, true));
        }
*/
        
        System.out.println(JSON.toJSONString(d.listAll(), true));

//        System.out.println(d.count());
//        System.out.println(JSON.toJSONString(d.list(0L, (byte) 10), true));

        Country country;
        country = new Country();
//        country.setName("bbb");
//        country.setMemo("备忘");
//        country.setA2Code("ccc");

//        System.out.println(d.add(country));
//        System.out.println(JSON.toJSONString(country, true));
//        System.out.println(JSON.toJSONString(d.get(country.getId()), true));

//        Long id = country.getId();
//        country = new Country();
//        country.setId(id);
//        country.setName("5555");
//        country.setMemo("12345");
//        country.setA2Code("5555");
//        System.out.println(d.update(country));
//        System.out.println(JSON.toJSONString(d.get(id), true));
    }
}