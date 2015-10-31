package com.syzc.sseip.dao;

import com.alibaba.fastjson.JSON;
import com.syzc.sseip.util.LocalAcUtil;

public class MemoDaoTest {
    public static void main(String[] args) {
        MemoDao d = (MemoDao) LocalAcUtil.getAc().getBean("memoDao");
        System.out.println(JSON.toJSONString(d.get(1L), true));
    }
}