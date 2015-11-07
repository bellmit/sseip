package com.syzc.sseip.service;

import com.syzc.sseip.dao.BaseDao;
import com.syzc.sseip.dao.UserDao;
import com.syzc.sseip.dao.UserLogonQueryDto;
import com.syzc.sseip.entity.User;
import com.syzc.sseip.entity.UserLogon;
import com.syzc.sseip.entity.UserLogonDto;
import com.syzc.sseip.entity.enumtype.Role;
import com.syzc.sseip.util.LocalAcUtil;
import com.syzc.sseip.util.Page;
import com.syzc.sseip.util.PageUtil;
import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImpl extends BaseServiceImpl<User, UserDao> implements UserService {
    private static final Logger logger = Logger.getLogger(UserServiceImpl.class);
    private UserDao userDao;

    @Resource
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public BaseDao<User> getDao() {
        return this.userDao;
    }

    @Override
    public User add(User user) {
/*
        if (userDao.existUsername(user.getUsername())) {
            return null;
        }
*/
        if (!userDao.add(user)) {
            return null;
        }
        user = userDao.get(user.getId());
        return user;
    }

/*
    @Override
    public Boolean remove(Long id) {
        return userDao.remove(id);
    }
*/

/*
    @Override
    public Boolean update(User user) {
        return userDao.update(user);
    }
*/

/*
    @Override
    public User get(Long userId) {
        return userDao.get(userId);
    }
*/

    /*
        @Override
        public Page<User> list(Long pageNo, Byte size) {
            Long total = userDao.count();
            Page<User> page = PageUtil.make(pageNo, size, total);
            page.setList(userDao.list(page.getRowOffset(), page.getPageSize()));
            return page;
        }
    */

    @Override
    public Boolean updateInfo(User user) {
        return userDao.updateInfo(user);
    }

    @Override
    public Boolean updatePassword(Long userId, String oldPassword, String newPassword) {
        return userDao.updatePassword(userId, oldPassword, newPassword);
    }

    @Override
    public Boolean updateResetPassword(Long userId, String newPassword) {
        return userDao.updateResetPassword(userId, newPassword);
    }

    @Override
    public Page<User> listByGroup(Long groupId, Long pageNo, Byte size) {
        Long total = userDao.countByGroup(groupId);
        Page<User> page = PageUtil.make(pageNo, size, total);
        page.setList(userDao.listByGroup(groupId, page.getRowOffset(), page.getPageSize()));
        return page;
    }

    @Override
    public Page<User> listByRole(Role role, Long pageNo, Byte size) {
        Long total = userDao.countByRole(role);
        Page<User> page = PageUtil.make(pageNo, size, total);
        page.setList(userDao.listByRole(role, page.getRowOffset(), page.getPageSize()));
        return page;
    }

    @Override
    public Boolean leaveGroup(Long userId) {
        return userDao.updateGroup(userId, null);
    }

    @Override
    public Boolean changeGroup(Long userId, Long groupId) {
        return userDao.updateGroup(userId, groupId);
    }

    public Boolean exist(String username) {
        return userDao.existUsername(username);
    }

    @Override
    public User login(String userName, String password, String ip) {
        return userDao.login(userName, password, ip);
    }

    @Override
    public Boolean updateRole(Long userId, Role role) {
        return userDao.updateRole(userId, role);
    }

    @Override
    public Boolean updateLimitedIp(Long userId, String ip) {
        return userDao.updateLimitedIp(userId, ip);
    }

    @Override
    public Role getRole(Long userId) {
        return userDao.getRole(userId);
    }

    @Override
    public Boolean saveLogonInfo(UserLogon userLogon) {
        return userDao.insertUserLogon(userLogon);
    }

    @Override
    public Page<UserLogon> listUserLogonByUser(Long userId, Long pageNo, Short size) {
        Long count = userDao.countUserLogonByUser(userId);
        Page page;
        page = PageUtil.make(pageNo, (long) size, count);
        if (count > 0) {
            page.setList(userDao.listUserLogonByUser(userId, page.getRowOffset(), (short) page.getPageSize()));
        }
        return page;
    }

    @Override
    public List<User> listAllByGroup(Long groupId) {
        return userDao.listAllByGroup(groupId);
    }

    @Override
    public Page<UserLogonDto> filterUserLogon(UserLogonQueryDto query, Long pageNo, Short size) {
        Long count = userDao.countFilterUserLogon(query);
        Page page;
        page = PageUtil.make(pageNo, (long) size, count);
        if (count > 0) {
            page.setList(userDao.filterUserLogon(query, page.getRowOffset(), (short) page.getPageSize()));
        }
        return page;
    }

    public static void main(String[] args) {
        ApplicationContext ac;
        ac = LocalAcUtil.getAc();
        UserService s = (UserService) ac.getBean("userService");
        System.out.println(s);
//        System.out.println(JSON.toJSONString(s.login("abc2", "abc2"), true));
//        System.out.println(JSON.toJSONString(s.get(3L), true));

//        System.out.println(JSON.toJSONString(s.list(0L, (byte) 10), true));
//        System.out.println(JSON.toJSONString(s.listByGroup(1L, 0L, (byte) 10), true));

//        System.out.println(JSON.toJSONString(s.listByRole(Role.DIRECTOR, 1L, (byte) 10)));
    }
}