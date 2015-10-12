package com.syzc.sseip.service;

import com.syzc.sseip.dao.BaseDao;
import com.syzc.sseip.dao.DiseaseTypeDao;
import com.syzc.sseip.entity.DiseaseType;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class DiseaseTypeServiceImpl extends BaseServiceImpl<DiseaseType, DiseaseTypeDao> implements DiseaseTypeService {
    private DiseaseTypeDao diseaseTypeDao;

    @Resource
    public void setDiseaseTypeDao(DiseaseTypeDao diseaseTypeDao) {
        this.diseaseTypeDao = diseaseTypeDao;
    }

    @Override
    protected BaseDao<DiseaseType> getDao() {
        return diseaseTypeDao;
    }

    @Override
    public DiseaseType add(DiseaseType entity) {
        diseaseTypeDao.add(entity);
        return diseaseTypeDao.get(entity.getId());
    }
}