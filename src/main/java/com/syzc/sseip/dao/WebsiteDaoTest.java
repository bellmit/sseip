package com.syzc.sseip.dao;

import com.alibaba.fastjson.JSON;
import com.syzc.sseip.entity.Website;
import com.syzc.sseip.util.LocalAcUtil;

public class WebsiteDaoTest {
    public static void main(String[] args) {
        WebsiteDao d = LocalAcUtil.getAc().getBean(WebsiteDao.class);
        System.out.println(JSON.toJSONString(d.get(1L), true));
        System.out.println(JSON.toJSONString(d.list(0L, (byte) 10), true));
        System.out.println(d.count());

        Website e;

        System.out.println(JSON.toJSONString(d.listAll(), true));

//        e = new Website();
//        e.setName("微型网站");
//        e.setUrl("http://micro.example.com");
//        System.out.println(d.add(e));
//        System.out.println(e.getId());
//        System.out.println(JSON.toJSONString(d.get(e.getId()), true));

//        System.out.println(d.count());
//        System.out.println(d.remove(1L));
//        System.out.println(d.count());

//        e = new Website();
//        e.setId(4L);
//        e.setName("超大型网站");
//        e.setUrl("http://taobao.com/");
//        System.out.println(d.update(e));

//        System.out.println(d.existUrl("123"));
//        System.out.println(d.exist(3L));
//        System.out.println(d.existUrl("http://taobao.com/"));
    }
}