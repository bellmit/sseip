package com.syzc.sseip.service;

import com.syzc.sseip.dao.BaseDao;
import com.syzc.sseip.util.Page;

import java.util.List;

public interface BaseService<T, Q extends BaseDao<T>> {
    T add(T entity);

    Boolean remove(Long id);

    Boolean update(T entity);

    T get(Long id);

    Page<T> list(Long pageNo, Byte size);

    List<T> listAll();
}