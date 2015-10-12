package com.syzc.sseip.service;

import com.syzc.sseip.dao.BaseDao;
import com.syzc.sseip.dao.WebsiteDao;
import com.syzc.sseip.entity.Website;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class WebsiteServiceImpl extends BaseServiceImpl<Website, WebsiteDao> implements WebsiteService {
    private WebsiteDao websiteDao;

    @Resource
    public void setWebsiteDao(WebsiteDao websiteDao) {
        this.websiteDao = websiteDao;
    }

    @Override
    protected BaseDao<Website> getDao() {
        return websiteDao;
    }

    @Override
    public Website add(Website entity) {
        websiteDao.add(entity);
        return websiteDao.get(entity.getId());
    }
}