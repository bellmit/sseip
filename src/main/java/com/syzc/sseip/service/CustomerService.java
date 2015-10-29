package com.syzc.sseip.service;

import com.syzc.sseip.dao.CustomerDao;
import com.syzc.sseip.entity.Customer;
import com.syzc.sseip.entity.enumtype.HospitalizationType;
import com.syzc.sseip.util.Page;

import java.util.Date;

public interface CustomerService extends BaseService<Customer, CustomerDao> {

    Page<Customer> listByGroup(Long groupId, Long pageNo, Byte size);

    Page<Customer> listByUser(Long userId, Long pageNo, Byte size);

    Page<Customer> listByFilter(Date since, Date till, Long websiteId, String tel, String name, Long countryId, Long userId,
                                String email, Long diseaseTypeId, Boolean valid, HospitalizationType hospitalization, Byte stars,
                                Boolean discard, Boolean ifReport, Long pageNo, Byte size);

//    Page<Customer> listByFilter(Sex sex, Website website, AccessPointType accessPointType, DiseaseType diseaseType, Boolean faraway, Boolean emergency, Date since, Date till, Long groupId, Long userId, Long pageNo, Byte size);

    Long passOn(Long[] ids, Long userId, Long currUserId);

    Boolean updateDiscard(Long id, Boolean discard, Long userId);

    Boolean updateMemo(Long id, String memo);
}