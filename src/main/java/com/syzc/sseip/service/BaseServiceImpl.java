package com.syzc.sseip.service;

import com.syzc.sseip.dao.BaseDao;
import com.syzc.sseip.util.Page;
import com.syzc.sseip.util.PageUtil;

import java.util.List;

public abstract class BaseServiceImpl<T, Q extends BaseDao<T>> implements BaseService<T, Q> {
    abstract protected BaseDao<T> getDao();

    @Override
    public Boolean remove(Long id) {
        return getDao().remove(id);
    }

    @Override
    public Boolean update(T entity) {
        return getDao().update(entity);
    }

    @Override
    public T get(Long id) {
        return getDao().get(id);
    }

    @Override
    public Page<T> list(Long pageNo, Byte size) {
        Long total = getDao().count();
        Page<T> page = PageUtil.make(pageNo, (long) size, total);
        page.setList(getDao().list(page.getRowOffset(), page.getPageSize()));
        return page;
    }

    @Override
    public List<T> listAll() {
        return getDao().listAll();
    }
}