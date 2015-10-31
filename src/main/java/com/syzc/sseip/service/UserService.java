package com.syzc.sseip.service;

import com.syzc.sseip.dao.UserDao;
import com.syzc.sseip.entity.User;
import com.syzc.sseip.entity.UserLogon;
import com.syzc.sseip.entity.enumtype.Role;
import com.syzc.sseip.util.Page;

public interface UserService extends BaseService<User, UserDao> {
//    User add(User user);

//    Boolean remove(Long id);

//    Boolean update(User user);

    //    User get(Long userId);

//    Page<User> list(Long offset, Byte size);

    Boolean updatePassword(Long userId, String oldPassword, String newPassword);

    Boolean resetPassword(Long userId, String newPassword);

    Page<User> listByGroup(Long groupId, Long pageNo, Byte size);

    Page<User> listByRole(Role role, Long pageNo, Byte size);

    Boolean leaveGroup(Long userId);

    Boolean changeGroup(Long userId, Long groupId);

    User login(String userName, String password, String ip);

    Boolean updateRole(Long userId, Role role);

    Role getRole(Long userId);

    Boolean saveLogonInfo(UserLogon userLogon);

    Page<UserLogon> listUserLogonByUser(Long userId, Long pageNo, Short size);
}