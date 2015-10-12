package com.syzc.sseip.service;

import com.alibaba.fastjson.JSON;
import com.syzc.sseip.dao.BaseDao;
import com.syzc.sseip.entity.Group;
import com.syzc.sseip.util.LocalAcUtil;
import com.syzc.sseip.dao.GroupDao;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class GroupServiceImpl extends BaseServiceImpl<Group, GroupDao> implements GroupService {
    private GroupDao groupDao;

    @Resource
    public void setGroupDao(GroupDao groupDao) {
        this.groupDao = groupDao;
    }

    @Override
    protected BaseDao<Group> getDao() {
        return this.groupDao;
    }

    @Override
    public Group add(Group entity) {
        groupDao.add(entity);
        entity = groupDao.get(entity.getId());
        return entity;
    }

    @Override
    public List<Group> listAll() {
        return groupDao.listAll();
    }

    public static void main(String[] args) {
        ApplicationContext ac;
        ac = LocalAcUtil.getAc();
        GroupService s = (GroupService) ac.getBean("groupServiceImpl");
        System.out.println(s);

        System.out.println(JSON.toJSONString(s.list(1L, (byte) 10), true));
        System.out.println(JSON.toJSONString(s.get(1L), true));

//        System.out.println(JSON.toJSONString(s.listAll(), true));

    }
}