package com.syzc.sseip.dao;

import com.syzc.sseip.entity.pasture.AccessPointType;

public interface AccessPointTypeDao extends BaseDao<AccessPointType> {
    Boolean existName(String name);
}