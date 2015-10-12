package com.syzc.sseip.dao;

import com.alibaba.fastjson.JSON;
import com.syzc.sseip.util.LocalAcUtil;
import com.syzc.sseip.entity.Group;
import org.springframework.context.ApplicationContext;

public class GroupDaoTest {
    public static void main(String[] args) {
        ApplicationContext ac = LocalAcUtil.getAc();
        System.out.println(ac);
        GroupDao d = (GroupDao) ac.getBean("groupDao");
        System.out.println(d);
        System.out.println(JSON.toJSONString(d.get(1L), true));
        System.out.println(JSON.toJSONString(d.listAll(), true));
        System.out.println(JSON.toJSONString(d.list(0L, (byte) 10), true));
        System.out.println(d.count());

        Group group;
        group = new Group();
        group.setId(1L);
        group.setDescription("早上好");
        group.setName("救国同盟会");
//        System.out.println(d.update(group));

        group = new Group();
        group.setDescription("慈善组织");
        group.setName("河北红十字会");
//        System.out.println(d.add(group));
//        System.out.println(JSON.toJSONString(group, true));

//        System.out.println(d.cleanUsers(5L));
        System.out.println(d.remove(4L));
    }
}