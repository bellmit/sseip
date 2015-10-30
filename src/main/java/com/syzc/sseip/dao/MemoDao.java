package com.syzc.sseip.dao;

import com.syzc.sseip.entity.Memo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MemoDao extends BaseDao<Memo> {
    Boolean addToCustomer(@Param("entity") Memo memo, @Param("customerId") Long customerId);

    Long countByCustomer(Long customerId);

    List<Memo> listAllByCustomer(Long customerId);
}