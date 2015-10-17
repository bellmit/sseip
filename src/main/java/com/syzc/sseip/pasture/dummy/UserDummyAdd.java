package com.syzc.sseip.pasture.dummy;

import com.alibaba.fastjson.JSON;
import com.syzc.sseip.entity.User;
import com.syzc.sseip.entity.enumtype.Role;
import com.syzc.sseip.service.UserService;
import com.syzc.sseip.util.LocalAcUtil;

import java.io.IOException;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.HashSet;

public class UserDummyAdd {
    public static void main(String[] args) throws IOException {
        UserService s = (UserService) LocalAcUtil.getAc().getBean("userServiceImpl");
        System.out.println(JSON.toJSONString(s.listAll(), true));

        SecureRandom r = new SecureRandom();

        HashSet<String> nameSet = N7ParseNamesSet.parseSet();
        ArrayList<String> nameList = new ArrayList<>(nameSet);

        User u;
        for (String un : RandomUserNameSet.genSet()) {
            u = new User();
            u.setUsername(un);
            u.setPassword(un);
            u.setRealName(nameList.get(r.nextInt(nameList.size())));
            u.setAge(r.nextInt(10) + 22);
            u.setPhone(String.valueOf(RandomTelNum.genTel()));
            u.setRole(Role.EMPTY);
            u.setGroupId(r.nextInt(2) + 1L);
            System.out.println(JSON.toJSONString(u, true));
            s.add(u);
        }
    }
}