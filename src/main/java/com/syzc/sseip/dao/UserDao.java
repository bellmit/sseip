package com.syzc.sseip.dao;

import com.syzc.sseip.entity.User;
import com.syzc.sseip.entity.UserLogon;
import com.syzc.sseip.entity.UserLogonDto;
import com.syzc.sseip.entity.enumtype.Role;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao extends BaseDao<User> {
    List<User> listByGroup(@Param("groupId") Long groupId, @Param("offset") Long offset, @Param("size") Byte size);

    Long countByGroup(Long groupId);

    List<User> listByRole(@Param("role") Role role, @Param("offset") Long offset, @Param("size") Byte size);

    Long countByRole(Role role);

//    Boolean updateInfo(@Param("user") User user);

    Boolean updateResetPassword(@Param("id") Long userId, @Param("password") String password);

    Boolean updatePassword(@Param("id") Long userId, @Param("oldPassword") String oldPassword, @Param("newPassword") String newPassword);

    /**
     * 判断用户存不存在； 读取新加入的用户.
     *
     * @param username 用户名
     * @return 用户entiry
     */
    User getByUserName(String username);

    Boolean existUsername(String username);

    User login(@Param("username") String userName, @Param("password") String password, @Param("ip") String ip);

    User login2(@Param("username") String userName, @Param("password") String password, @Param("ip") byte[] ip);

    Boolean updateGroup(@Param("userId") Long userId, @Param("groupId") Long groupId);

    Boolean updateRole(@Param("userId") Long userId, @Param("role") Role role);

    Boolean updateLimitedIp(@Param("userId") Long userId, @Param("ip") String ip);

    Role getRole(Long id);

    Boolean insertUserLogon(@Param("userLogon") UserLogon userLogon);

    Boolean updateUserLogon(@Param("userLogon") UserLogon userLogon);

    Boolean updateInfo(@Param("entity") User user);

    List<UserLogon> listUserLogonByUser(@Param("id") Long id, @Param("offset") Long offset, @Param("size") Short size);

    Long countUserLogonByUser(@Param("id") Long id);

    // limit 1000
    List<User> listAllByGroup(Long groupId);

    List<UserLogonDto> filterUserLogon(@Param("query") UserLogonQueryDto query, @Param("offset") Long offset, @Param("size") Short size);

    Long countFilterUserLogon(@Param("query") UserLogonQueryDto query);

    Object qqq(@Param("ip") byte[] ip);

    Integer qqq2(@Param("ip") byte[] ip);

    Integer qqq3(@Param("ip") byte[] ip);
}