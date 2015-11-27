package com.syzc.sseip.service;

import com.alibaba.fastjson.JSON;
import com.syzc.sseip.dao.BaseDao;
import com.syzc.sseip.dao.CustomerDao;
import com.syzc.sseip.dao.MemoDao;
import com.syzc.sseip.entity.*;
import com.syzc.sseip.entity.enumtype.HospitalizationType;
import com.syzc.sseip.util.LocalAcUtil;
import com.syzc.sseip.util.Page;
import com.syzc.sseip.util.PageUtil;
import com.syzc.sseip.util.exception.AuthException;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service
public class CustomerServiceImpl extends BaseServiceImpl<Customer, CustomerDao> implements CustomerService {
    private static final Logger logger = Logger.getLogger(CustomerServiceImpl.class);
    private MemoDao memoDao;
    private CustomerDao customerDao;

    @Resource
    public void setCustomerDao(CustomerDao customerDao) {
        this.customerDao = customerDao;
    }

    @Resource
    public void setMemoDao(MemoDao memoDao) {
        this.memoDao = memoDao;
    }

    @Override
    public Customer add(Customer entity) {
        customerDao.add(entity);
        entity = customerDao.get(entity.getId());
        return entity;
    }

    @Override
    protected BaseDao<Customer> getDao() {
        return this.customerDao;
    }

    @Override
    public Page<Customer> listByGroup(Long groupId, Long pageNo, Byte size) {
        Long total = customerDao.countByGroup(groupId);
        Page<Customer> page = PageUtil.make(pageNo, size, total);
        page.setList(customerDao.listByGroup(groupId, page.getRowOffset(), page.getPageSize()));
        return page;
    }

    @Override
    public Page<Customer> listByUser(Long userId, Long pageNo, Byte size) {
        Long total = customerDao.countByUser(userId);
        Page<Customer> page = PageUtil.make(pageNo, size, total);
        page.setList(customerDao.listByUser(userId, page.getRowOffset(), page.getPageSize()));
        return page;
    }

    @Override
    public Page<Customer> listByFilter(Date since, Date till, Long websiteId, String tel, String name, Long countryId,
                                       Long userId, String email, Long diseaseTypeId, Boolean valid,
                                       HospitalizationType hospitalization, Byte stars, Boolean discard, Boolean ifReport, Long pageNo, Byte size) {

//        System.out.println("since, till, websiteId, tel, name, countryId, userId, email, diseaseTypeId, valid, hospitalization, stars, discard, ifReport, pageNo, pageSize");
//        System.out.println(Arrays.toString(new Object[]{since, till, websiteId, tel, name, countryId, userId, email, diseaseTypeId, valid, hospitalization, stars, discard, ifReport, pageNo, size}));

        Long total = customerDao.countByFilter(since, till, websiteId, tel, name, countryId, userId, email, diseaseTypeId,
                valid, hospitalization, stars, discard, ifReport);
        Page<Customer> page = PageUtil.make(pageNo, size, total);
        page.setList(customerDao.listByFilter(since, till, websiteId, tel, name, countryId, userId, email, diseaseTypeId,
                valid, hospitalization, stars, discard, ifReport, page.getRowOffset(), page.getPageSize()));
        return page;
    }

    @Override
    public Page<Customer> listByFilterA(CustomerQueryDto dto, Long pageNo, Byte size) {

//        System.out.println("since, till, websiteId, tel, name, countryId, userId, email, diseaseTypeId, valid, hospitalization, stars, discard, ifReport, pageNo, pageSize");
//        System.out.println(Arrays.toString(new Object[]{since, till, websiteId, tel, name, countryId, userId, email, diseaseTypeId, valid, hospitalization, stars, discard, ifReport, pageNo, size}));

        Long total = customerDao.countByFilterA(dto);
        Page<Customer> page = PageUtil.make(pageNo, size, total);
        page.setList(customerDao.listByFilterA(dto, page.getRowOffset(), page.getPageSize()));
        return page;
    }

    @Override
    public Long updateOwner(Long[] ids, Long userId, Long currUserId) {
        return customerDao.updateOwnUserIds(ids, userId, currUserId);
    }

    @Override
    public Boolean updateDiscard(Long id, Boolean discard, Long userId) {
        Customer customer = customerDao.get(id);
        if (customer == null) {
            return false;
        }
        if (!customer.getOwnerUserId().equals(userId)) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }
        return customerDao.updateDiscard(id, discard);
    }

    @Override
    public Boolean updateMemo(Long id, String memo) {
        return customerDao.updateMemo(id, memo);
    }

    @Override
    public Boolean addMemo(String memo, Long customerId, Long userId) {
        if (StringUtils.isBlank(memo)) {
            return false;
        }

        Memo m = new Memo();
        m.setContent(memo);
        return memoDao.addToCustomer(m, customerId, userId);
    }

    @Override
    public List<Memo> listAllMemo(Long customerId) {
        return memoDao.listAllByCustomer(customerId);
    }

    @Override
    public Boolean updateTelAuditDto(TelAuditDto telAuditDto) {
//        logger.trace("enter updateTelAuditDto");
//        System.out.println("customerDao");
//        System.out.println(customerDao);
//        System.out.println(JSON.toJSONString(telAuditDto, true));
        Boolean r = customerDao.updateTelAuditDto(telAuditDto);
//        System.out.println("updateTelAuditDto - 1");
//        System.out.println(r);
        return r;
    }

    @Override
    public CustomerStatDto statAll() {
        CustomerStatDto dto = new CustomerStatDto();
        dto.setInHospitalCount(customerDao.statAllInHospitalCount());
        dto.setReportedCount(customerDao.statAllReportedCount());
        return dto;
    }

    @Override
    public Page<Customer> pageRevisitTodayByUser(Long userId, Long pageNo, Integer size) {
        Long count = customerDao.countRevisitTodayByUser(userId);
        Page<Customer> page = PageUtil.make(pageNo, (long) size, count);
        page.setList(customerDao.listRevisitTodayByUser(userId, page.getRowOffset(), ((int) (page.getPageSize()))));
        return page;
    }

    @Override
    public Page<Customer> pageRevisitWeekByUser(Long userId, Long pageNo, Integer size) {
        Date date = new Date();
        /*
        一周内, i = (8 - i) % 7;
         */
        Calendar c = Calendar.getInstance();
//        c.add(Calendar.DAY_OF_YEAR, (8 - Calendar.getInstance().get(Calendar.DAY_OF_WEEK)) % 7);
        c.setFirstDayOfWeek(Calendar.MONDAY);
        c.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);

        Long count = customerDao.countRevisitByUserDate(userId, date, c.getTime());
        Page<Customer> page = PageUtil.make(pageNo, (long) size, count);
        page.setList(customerDao.listRevisitByUserDate(userId, date, c.getTime(), page.getRowOffset(), ((int) (page.getPageSize()))));
        return page;
    }

    @Override
    public Page<Customer> pageRevisitMonthByUser(Long userId, Long pageNo, Integer size) {
        Date date = new Date();
        /*
        计算月末
         */
        Calendar c;
        c = Calendar.getInstance();
        c.add(Calendar.MONTH, 1);
        c.set(Calendar.DAY_OF_MONTH, 0);

        Long count = customerDao.countRevisitByUserDate(userId, date, c.getTime());
        Page<Customer> page = PageUtil.make(pageNo, (long) size, count);
        page.setList(customerDao.listRevisitByUserDate(userId, date, c.getTime(), page.getRowOffset(), ((int) (page.getPageSize()))));
        return page;
    }

    @Override
    public Page<Customer> pageRevisitByUserDate(Long userId, Date start, Date end, Long pageNo, Integer size) {
        Long count = customerDao.countRevisitByUserDate(userId, start, end);
        Page<Customer> page = PageUtil.make(pageNo, (long) size, count);
        page.setList(customerDao.listRevisitByUserDate(userId, start, end, page.getRowOffset(), ((int) (page.getPageSize()))));
        return page;
    }

    public static void main(String[] args) {
        ApplicationContext ac;
        ac = LocalAcUtil.getAc();
        CustomerService s = (CustomerService) ac.getBean("customerServiceImpl");
//        System.out.println(JSON.toJSONString(s.listByGroup(1L, 1L, (byte) 10), true));

//        System.out.println(JSON.toJSONString(s.listByUser(3L, 1L, (byte) 10), true));
//        System.out.println(JSON.toJSONString(s.list(1L, (byte) 10), true));

//        System.out.println(JSON.toJSONString(s.get(3L), true));

        System.out.println(JSON.toJSONString(s.listByFilter(null, null, null, null, null, null, null, null, null,
                null, null, null, null, null, 0L, (byte) 10), true));
    }
}