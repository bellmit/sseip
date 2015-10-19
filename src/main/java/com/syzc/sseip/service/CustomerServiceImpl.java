package com.syzc.sseip.service;

import com.alibaba.fastjson.JSON;
import com.syzc.sseip.dao.BaseDao;
import com.syzc.sseip.dao.CustomerDao;
import com.syzc.sseip.entity.Customer;
import com.syzc.sseip.entity.enumtype.HospitalizationType;
import com.syzc.sseip.util.LocalAcUtil;
import com.syzc.sseip.util.Page;
import com.syzc.sseip.util.PageUtil;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

@Service
public class CustomerServiceImpl extends BaseServiceImpl<Customer, CustomerDao> implements CustomerService {
    private CustomerDao customerDao;

    @Resource
    public void setCustomerDao(CustomerDao customerDao) {
        this.customerDao = customerDao;
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
    public Page<Customer> listByFilter(Date since, Date till, Long websiteId, String tel, String name, Long countryId, Long userId, String email, Long diseaseTypeId, Boolean valid, HospitalizationType hospitalization, Byte stars, Long pageNo, Byte size) {
        Long total = customerDao.countByFilter(since, till, websiteId, tel, name, countryId, userId, email, diseaseTypeId, valid, hospitalization, stars);
        Page<Customer> page = PageUtil.make(pageNo, size, total);
        page.setList(customerDao.listByFilter(since, till, websiteId, tel, name, countryId, userId, email, diseaseTypeId, valid, hospitalization, stars, page.getRowOffset(), page.getPageSize()));
        return page;
    }

    @Override
    public Boolean passOn(Long id, Long userId) {
        return customerDao.updateOwnUserId(id, userId);
    }

    @Override
    public Long passOn(Long[] ids, Long userId) {
        return customerDao.updateOwnUserIds(ids, userId);
    }

    public static void main(String[] args) {
        ApplicationContext ac;
        ac = LocalAcUtil.getAc();
        CustomerService s = (CustomerService) ac.getBean("customerServiceImpl");
//        System.out.println(JSON.toJSONString(s.listByGroup(1L, 1L, (byte) 10), true));

//        System.out.println(JSON.toJSONString(s.listByUser(3L, 1L, (byte) 10), true));
//        System.out.println(JSON.toJSONString(s.list(1L, (byte) 10), true));

//        System.out.println(JSON.toJSONString(s.get(3L), true));

        System.out.println(JSON.toJSONString(s.listByFilter(null, null, null, null, null, null, null, null, null, null, null, null, 0L, (byte) 10), true));
    }
}