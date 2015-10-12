package com.syzc.sseip.service;

import com.alibaba.fastjson.JSON;
import com.syzc.sseip.dao.BaseDao;
import com.syzc.sseip.dao.CustomerDao;
import com.syzc.sseip.entity.Customer;
import com.syzc.sseip.entity.enumtype.Sex;
import com.syzc.sseip.util.LocalAcUtil;
import com.syzc.sseip.entity.enumtype.AccessPointType;
import com.syzc.sseip.entity.enumtype.pasture.DiseaseType;
import com.syzc.sseip.entity.enumtype.Website;
import com.syzc.sseip.util.Page;
import com.syzc.sseip.util.PageUtil;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

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
    public Page<Customer> listByFilter(Sex sex, Website website, AccessPointType accessPointType, DiseaseType diseaseType, Boolean faraway, Boolean emergency, Long groupId, Long userId, Long pageNo, Byte size) {
        Long total = customerDao.countByFilter(sex, website, accessPointType, diseaseType, faraway, emergency, groupId, userId);
        Page<Customer> page = PageUtil.make(pageNo, size, total);
        page.setList(customerDao.listByFilter(sex, website, accessPointType, diseaseType, faraway, emergency, groupId, userId, page.getRowOffset(), page.getPageSize()));
        return page;
    }

    public static void main(String[] args) {
        ApplicationContext ac;
        ac = LocalAcUtil.getAc();
        CustomerService s = (CustomerService) ac.getBean("customerServiceImpl");
        System.out.println(JSON.toJSONString(s.listByGroup(1L, 1L, (byte) 10), true));

        System.out.println(JSON.toJSONString(s.listByUser(3L, 1L, (byte) 10), true));
        System.out.println(JSON.toJSONString(s.list(1L, (byte) 10), true));

        System.out.println(JSON.toJSONString(s.get(3L), true));
    }
}