package com.syzc.sseip.dao;

import com.syzc.sseip.entity.Group;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GroupDao extends BaseDao<Group> {
    Long cleanUsers(Long groupId);

    List<Group> listAll();
}