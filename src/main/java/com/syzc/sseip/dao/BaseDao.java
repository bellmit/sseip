package com.syzc.sseip.dao;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BaseDao<T> {
    Boolean add(@Param("entity") T entity);

    Boolean remove(Long id);

    Boolean update(@Param("entity") T entity);

    T get(Long id);

    List<T> list(@Param("offset") Long offset, @Param("size") Byte size);

    List<T> listAll();

    Long count();

    Boolean exist(Long id);
}