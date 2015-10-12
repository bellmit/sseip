package com.syzc.sseip.service;

import com.syzc.sseip.dao.GroupDao;
import com.syzc.sseip.entity.Group;

import java.util.List;

public interface GroupService extends BaseService<Group, GroupDao> {
    List<Group> listAll();
}