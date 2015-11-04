package com.syzc.sseip.entity;

public class UserLogonDto extends UserLogon {
    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}