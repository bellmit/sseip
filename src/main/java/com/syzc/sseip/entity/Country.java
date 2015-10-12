package com.syzc.sseip.entity;

import java.util.Date;

public class Country {
    private Long id;
    private String name;
    private String a2Code;
    private String memo;
    private Date updated;

    public Country() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getA2Code() {
        return a2Code;
    }

    public void setA2Code(String a2Code) {
        this.a2Code = a2Code;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public Date getUpdated() {
        return updated;
    }

    public void setUpdated(Date updated) {
        this.updated = updated;
    }
}