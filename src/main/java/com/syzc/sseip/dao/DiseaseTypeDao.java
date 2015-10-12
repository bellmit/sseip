package com.syzc.sseip.dao;

import com.syzc.sseip.entity.DiseaseType;

public interface DiseaseTypeDao extends BaseDao<DiseaseType> {
    Boolean existName(String name);
}