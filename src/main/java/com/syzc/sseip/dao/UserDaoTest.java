package com.syzc.sseip.dao;

import com.syzc.sseip.entity.User;
import com.syzc.sseip.entity.UserLogon;
import com.syzc.sseip.util.LocalAcUtil;
import org.springframework.context.ApplicationContext;

public class UserDaoTest {
    public static void main(String[] args) {
        ApplicationContext ac = LocalAcUtil.getAc();
        System.out.println(ac);
        UserDao d = (UserDao) ac.getBean("userDao");

        User u;
//        u = new User();
//        u.setUsername("abc");
//        u.setPassword("abc");
//        u.setRealName("天蓝");
//        u.setAge(42);
//        u.setIdNumber("123456789012345678");
//        u.setAddress("石家庄市");
//        u.setPhone("13331533315");
//        u.setGroupId(1L);
//        u.setRole(Role.EMPLOYEE);

//        System.out.println(JSON.toJSONString(d.add(u), true));
//        System.out.println(JSON.toJSONString(u.getId(), true));
//        System.out.println(JSON.toJSONString(d.get(u.getId()), true));

        User user;
//        System.out.println(JSON.toJSONString(d.login("abc", "abc", null), true));

//        System.out.println(d.remove(1L));

//        u.setId(3L);
//        u.setUsername("abc2");
//        u.setPassword("abc2");
//        u.setRealName("天蓝2");
//        u.setAge(62);
//        u.setIdNumber("123456789012345679");
//        u.setAddress("石家庄市2");
//        u.setPhone("133315333152");
//        System.out.println(d.update(u));

/*
        System.out.println(JSON.toJSONString(d.list(0L, (byte) 10), true));
        System.out.println(d.count());
*/

/*
        System.out.println(JSON.toJSONString(d.list(50L, (byte) 10), true));
        System.out.println(d.count());
*/

//        System.out.println(JSON.toJSONString(d.listByGroup(1L, 0L, (byte) 10), true));
//        System.out.println(d.countByGroup(1L));

//        System.out.println(JSON.toJSONString(d.listByRole(Role.DIRECTOR, 0L, (byte) 10), true));
//        System.out.println(d.countByRole(Role.DIRECTOR));

//        System.out.println(JSON.toJSONString(d.listByRole(Role.MANAGER, 0L, (byte) 10), true));
//        System.out.println(d.countByRole(Role.MANAGER));

//        System.out.println(d.updateResetPassword(3L, "abc"));
//        System.out.println(d.updatePassword(3L, "abc", "abc2"));

//        System.out.println(d.exist("abc3"));

//        System.out.println(d.updateGroup(3L, 1L));
//        System.out.println(d.updateGroup(3L, null));

//        System.out.println(d.updateRole(3L, Role.DIRECTOR));

//        System.out.println(d.getRole(3L));

//        System.out.println(JSON.toJSONString(d.get(3L), true));

        UserLogon userLogon;
        userLogon = new UserLogon();
        userLogon.setIp("987");
        userLogon.setUserId(7L);
//        System.out.println(d.insertUserLogon(userLogon));

        userLogon = new UserLogon();
        userLogon.setIp("ffddee");
        userLogon.setUserId(7L);
//        System.out.println(d.updateUserLogon(userLogon));

//        System.out.println(JSON.toJSONString(d.listUserLogonByUser(52L, 0L, (short) 100), true));
//        System.out.println(JSON.toJSONString(d.listUserLogonByUser(51L, 0L, (short) 100), true));
        System.out.println(d.countUserLogonByUser(51L));
        System.out.println(d.countUserLogonByUser(52L));
    }
}