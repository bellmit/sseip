package com.syzc.sseip.service;

import com.syzc.sseip.dao.CustomerDao;
import com.syzc.sseip.entity.Customer;
import com.syzc.sseip.entity.enumtype.AccessPointType;
import com.syzc.sseip.entity.enumtype.DiseaseType;
import com.syzc.sseip.entity.enumtype.Sex;
import com.syzc.sseip.entity.enumtype.Website;
import com.syzc.sseip.util.Page;

public interface CustomerService extends BaseService<Customer, CustomerDao> {

    Page<Customer> listByGroup(Long groupId, Long pageNo, Byte size);

    Page<Customer> listByUser(Long userId, Long pageNo, Byte size);

    Page<Customer> listByFilter(Sex sex, Website website, AccessPointType accessPointType, DiseaseType diseaseType,
                                Boolean faraway, Boolean emergency, Long groupId, Long userId, Long pageNo, Byte size);
}