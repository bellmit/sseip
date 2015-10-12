package com.syzc.sseip.dao;

import com.syzc.sseip.entity.Website;

public interface WebsiteDao extends BaseDao<Website> {
    Boolean existUrl(String url);
}