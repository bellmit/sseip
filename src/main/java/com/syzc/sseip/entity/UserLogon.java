package com.syzc.sseip.entity;

import java.io.Serializable;
import java.util.Date;

public class UserLogon implements Serializable {
    private static final long serialVersionUID = 5419204435606519473L;
    private Long id;
    private Long userId;
    private Date loggedOn;
    private String ip;

    public UserLogon() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Date getLoggedOn() {
        return loggedOn;
    }

    public void setLoggedOn(Date loggedOn) {
        this.loggedOn = loggedOn;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }
}