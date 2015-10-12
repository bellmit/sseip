package com.syzc.sseip.service;

import com.syzc.sseip.dao.BaseDao;
import com.syzc.sseip.dao.CountryDao;
import com.syzc.sseip.entity.Country;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class CountryServiceImpl extends BaseServiceImpl<Country, CountryDao> implements CountryService {
    private CountryDao countryDao;

    @Resource
    public void setCountryDao(CountryDao countryDao) {
        this.countryDao = countryDao;
    }

    @Override
    protected BaseDao<Country> getDao() {
        return countryDao;
    }

    @Override
    public Country add(Country entity) {
        countryDao.add(entity);
        return entity = countryDao.get(entity.getId());
    }
}