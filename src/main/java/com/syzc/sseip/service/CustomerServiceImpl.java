package com.syzc.sseip.service;

import com.alibaba.fastjson.JSON;
import com.syzc.sseip.dao.BaseDao;
import com.syzc.sseip.dao.CustomerDao;
import com.syzc.sseip.dao.MemoDao;
import com.syzc.sseip.entity.Customer;
import com.syzc.sseip.entity.Memo;
import com.syzc.sseip.entity.TelAuditDto;
import com.syzc.sseip.entity.enumtype.HospitalizationType;
import com.syzc.sseip.util.LocalAcUtil;
import com.syzc.sseip.util.Page;
import com.syzc.sseip.util.PageUtil;
import com.syzc.sseip.util.exception.AuthException;
import org.apache.log4j.Level;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

@Service
public class CustomerServiceImpl extends BaseServiceImpl<Customer, CustomerDao> implements CustomerService {
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
    public Long passOn(Long[] ids, Long userId, Long currUserId) {
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
    public Boolean addMemo(String memo, Long customerId) {
        Memo m = new Memo();
        m.setContent(memo);
        return memoDao.addToCustomer(m, customerId);
    }

    @Override
    public Boolean updateTelAuditDto(TelAuditDto telAuditDto) {
        return customerDao.updateTelAuditDto(telAuditDto);
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