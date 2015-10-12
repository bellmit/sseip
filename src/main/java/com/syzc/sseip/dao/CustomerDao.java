package com.syzc.sseip.dao;

import com.syzc.sseip.entity.Customer;
import com.syzc.sseip.entity.enumtype.AccessPointType;
import com.syzc.sseip.entity.enumtype.DiseaseType;
import com.syzc.sseip.entity.enumtype.Sex;
import com.syzc.sseip.entity.enumtype.Website;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CustomerDao extends BaseDao<Customer> {
    List<Customer> listByUser(@Param("userId") Long userId, @Param("offset") Long offset, @Param("size") Byte size);

    Long countByUser(Long userId);

    List<Customer> listByGroup(@Param("groupId") Long groupId, @Param("offset") Long offset, @Param("size") Byte size);

    Long countByGroup(Long groupId);

    List<Customer> listByFilter(@Param("sex") Sex sex, @Param("website") Website website,
                                @Param("accessPointType") AccessPointType accessPointType, @Param("diseaseType") DiseaseType diseaseType,
                                @Param("faraway") Boolean faraway, @Param("emergency") Boolean emergency, @Param("groupId") Long groupId,
                                @Param("userId") Long userId, @Param("offset") Long offset, @Param("size") Byte size);

    Long countByFilter(@Param("sex") Sex sex, @Param("website") Website website,
                       @Param("accessPointType") AccessPointType accessPointType,
                       @Param("diseaseType") DiseaseType diseaseType,
                       @Param("faraway") Boolean faraway, @Param("emergency") Boolean emergency,
                       @Param("groupId") Long groupId, @Param("userId") Long userId);
}