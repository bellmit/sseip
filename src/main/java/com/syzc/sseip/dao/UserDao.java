package com.syzc.sseip.dao;

import com.syzc.sseip.entity.User;
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

    Boolean resetPassword(@Param("id") Long userId, @Param("password") String password);

    Boolean updatePassword(@Param("id") Long userId, @Param("oldPassword") String oldPassword, @Param("newPassword") String newPassword);

    /**
     * 判断用户存不存在； 读取新加入的用户.
     *
     * @param username 用户名
     * @return 用户entiry
     */
    User getByUserName(String username);

    Boolean exist(String username);

    User login(@Param("username") String userName, @Param("password") String password);

    Boolean updateGroup(@Param("userId") Long userId, @Param("groupId") Long groupId);

    Boolean updateRole(@Param("userId") Long userId, @Param("role") Role role);

    Role getRole(Long id);
}