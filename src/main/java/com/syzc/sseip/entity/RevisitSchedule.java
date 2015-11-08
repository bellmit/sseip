package com.syzc.sseip.entity;

import java.util.Date;

public class RevisitSchedule {
    private Long id;
    private Long customerId;
    private Date date;

    public RevisitSchedule() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}