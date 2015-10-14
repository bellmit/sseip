package com.syzc.sseip.service;

import com.syzc.sseip.dao.AccessPointTypeDao;
import com.syzc.sseip.dao.BaseDao;
import com.syzc.sseip.entity.pasture.AccessPointType;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class AccessPointTypeServiceImpl extends BaseServiceImpl<AccessPointType, AccessPointTypeDao> implements AccessPointTypeService {
    private AccessPointTypeDao accessPointTypeDao;

    @Resource
    public void setAccessPointTypeDao(AccessPointTypeDao accessPointTypeDao) {
        this.accessPointTypeDao = accessPointTypeDao;
    }

    @Override
    protected BaseDao<AccessPointType> getDao() {
        return accessPointTypeDao;
    }

    @Override
    public AccessPointType add(AccessPointType entity) {
        accessPointTypeDao.add(entity);
        entity = accessPointTypeDao.get(entity.getId());
        return entity;
    }
}