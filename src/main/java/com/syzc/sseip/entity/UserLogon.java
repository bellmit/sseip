package com.syzc.sseip.entity;

import java.io.Serializable;
import java.util.Date;

public class UserLogon implements Serializable {
    private static final long serialVersionUID = 5419204435606519473L;
    private Long id;
    private Long userId;
    private Date lastSignIn;
    private String lastIP;
    private String lastMacAddr;

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

    public Date getLastSignIn() {
        return lastSignIn;
    }

    public void setLastSignIn(Date lastSignIn) {
        this.lastSignIn = lastSignIn;
    }

    public String getLastIP() {
        return lastIP;
    }

    public void setLastIP(String lastIP) {
        this.lastIP = lastIP;
    }

    public String getLastMacAddr() {
        return lastMacAddr;
    }

    public void setLastMacAddr(String lastMacAddr) {
        this.lastMacAddr = lastMacAddr;
    }
}