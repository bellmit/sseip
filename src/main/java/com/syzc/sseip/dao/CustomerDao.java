package com.syzc.sseip.dao;

import com.syzc.sseip.entity.Customer;
import com.syzc.sseip.entity.enumtype.HospitalizationType;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface CustomerDao extends BaseDao<Customer> {
    List<Customer> listByUser(@Param("userId") Long userId, @Param("offset") Long offset, @Param("size") Byte size);

    Long countByUser(Long userId);

    List<Customer> listByGroup(@Param("groupId") Long groupId, @Param("offset") Long offset, @Param("size") Byte size);

    Long countByGroup(Long groupId);

    List<Customer> listByFilter(@Param("since") Date since,
                                @Param("till") Date till,
                                @Param("websiteId") Long websiteId,
                                @Param("tel") String tel,
                                @Param("name") String name,
                                @Param("countryId") Long countryId,
                                @Param("userId") Long userId,
                                @Param("email") String email,
                                @Param("diseaseTypeId") Long diseaseTypeId,
                                @Param("valid") Boolean valid,
                                @Param("hospitalization") HospitalizationType hospitalization,
                                @Param("stars") Byte stars,
                                @Param("offset") Long offset,
                                @Param("size") Byte size
    );

    Long countByFilter(@Param("since") Date since,
                       @Param("till") Date till,
                       @Param("websiteId") Long websiteId,
                       @Param("tel") String tel,
                       @Param("name") String name,
                       @Param("countryId") Long countryId,
                       @Param("userId") Long userId,
                       @Param("email") String email,
                       @Param("diseaseTypeId") Long diseaseTypeId,
                       @Param("valid") Boolean valid,
                       @Param("hospitalization") HospitalizationType hospitalization,
                       @Param("stars") Byte stars
    );

    /*
        List<Customer> listByFilter(@Param("sex") Sex sex, @Param("website") Website website,
                                    @Param("accessPointType") AccessPointType accessPointType,
                                    @Param("diseaseType") DiseaseType diseaseType, @Param("faraway") Boolean faraway,
                                    @Param("emergency") Boolean emergency, @Param("since") Date since,
                                    @Param("till") Date till, @Param("groupId") Long groupId,
                                    @Param("userId") Long userId, @Param("offset") Long offset, @Param("size") Byte size);

        Long countByFilter(@Param("sex") Sex sex, @Param("website") Website website,
                           @Param("accessPointType") AccessPointType accessPointType,
                           @Param("diseaseType") DiseaseType diseaseType,
                           @Param("faraway") Boolean faraway, @Param("emergency") Boolean emergency, @Param("since") Date since,
                           @Param("till") Date till,
                           @Param("groupId") Long groupId, @Param("userId") Long userId);
    */
    Boolean updateOwnUserId(@Param("id") Long id, @Param("newOwnerUserId") Long ownerUserId);

    Long updateOwnUserIds(@Param("customerIds") Long[] customerIds, @Param("newOwnerUserId") Long ownerUserId);
}