package com.syzc.sseip.pasture.dummy;

import com.alibaba.fastjson.JSON;
import com.syzc.sseip.entity.User;
import com.syzc.sseip.entity.enumtype.Role;
import com.syzc.sseip.service.UserService;
import com.syzc.sseip.util.LocalAcUtil;

import java.io.IOException;
import java.security.SecureRandom;
import java.util.List;

public class UserDummyAdd {
    public static void main(String[] args) throws IOException {
        UserService s = (UserService) LocalAcUtil.getAc().getBean("userServiceImpl");
        System.out.println(JSON.toJSONString(s.listAll(), true));

        SecureRandom r = new SecureRandom();

        List<String> nameList = N7ParseNamesSet.parseArr();

        User u;
        for (String un : RandomUserNameSet.genSet()) {
            u = new User();
            u.setUsername(un);
            u.setPassword(un);
            u.setRealName(nameList.get(r.nextInt(nameList.size())));
            u.setAge(r.nextInt(5) + 21);
            u.setPhone(String.valueOf(RandomTelNum.genTel()));
            u.setRole(Role.EMPLOYEE);
            u.setGroupId(r.nextInt(3) + 1L);
            System.out.println(JSON.toJSONString(u, true));
            s.add(u);
        }
    }
}