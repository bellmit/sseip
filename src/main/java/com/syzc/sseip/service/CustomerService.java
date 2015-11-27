package com.syzc.sseip.service;

import com.syzc.sseip.dao.CustomerDao;
import com.syzc.sseip.entity.*;
import com.syzc.sseip.entity.enumtype.HospitalizationType;
import com.syzc.sseip.util.Page;

import java.util.Date;
import java.util.List;

public interface CustomerService extends BaseService<Customer, CustomerDao> {
    Page<Customer> listByGroup(Long groupId, Long pageNo, Byte size);

    Page<Customer> listByUser(Long userId, Long pageNo, Byte size);

    Page<Customer> listByFilter(Date since, Date till, Long websiteId, String tel, String name, Long countryId, Long userId,
                                String email, Long diseaseTypeId, Boolean valid, HospitalizationType hospitalization, Byte stars,
                                Boolean discard, Boolean ifReport, Long pageNo, Byte size);

    Page<Customer> listByFilterA(CustomerQueryDto dto, Long pageNo, Byte size);

//    Page<Customer> listByFilter(Sex sex, Website website, AccessPointType accessPointType, DiseaseType diseaseType, Boolean faraway, Boolean emergency, Date since, Date till, Long groupId, Long userId, Long pageNo, Byte size);

    Long updateOwner(Long[] ids, Long userId, Long currUserId);

    Boolean updateDiscard(Long id, Boolean discard, Long userId);

    Boolean updateMemo(Long id, String memo);

    Boolean addMemo(String memo, Long customerId, Long userId);

    List<Memo> listAllMemo(Long customerId);

    Boolean updateTelAuditDto(TelAuditDto telAuditDto);

    CustomerStatDto statAll();

    Page<Customer> pageRevisitTodayByUser(Long userId, Long pageNo, Integer size);

    Page<Customer> pageRevisitWeekByUser(Long userId, Long pageNo, Integer size);

    Page<Customer> pageRevisitMonthByUser(Long userId, Long pageNo, Integer size);

    Page<Customer> pageRevisitByUserDate(Long userId, Date start, Date end, Long pageNo, Integer size);
}