package com.syzc.sseip.dao;

import com.alibaba.fastjson.JSON;
import com.syzc.sseip.entity.Memo;
import com.syzc.sseip.util.LocalAcUtil;
import org.springframework.context.ApplicationContext;

public class MemoDaoTestB {
    public static void main(String[] args) {
        ApplicationContext ac = LocalAcUtil.getAc();
        MemoDao d = (MemoDao) ac.getBean("memoDao");

//        System.out.println(d.listAllByCustomer(1L));
//        System.out.println(JSON.toJSONString(d.listAllByCustomer(1L), true));

        Memo memo;
        memo = new Memo();
        memo.setContent("abcdefg");
        System.out.println(JSON.toJSONString(d.get(memo.getId()), true));
        System.out.println(d.addToCustomer(memo, 1L, 1L));
        System.out.println(memo.getId());
        System.out.println(JSON.toJSONString(d.get(memo.getId()), true));

        System.exit(0);
    }
}