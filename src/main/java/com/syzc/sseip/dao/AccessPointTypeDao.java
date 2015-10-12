package com.syzc.sseip.dao;

import com.syzc.sseip.entity.AccessPointType;

public interface AccessPointTypeDao extends BaseDao<AccessPointType> {
    Boolean existName(String name);
}