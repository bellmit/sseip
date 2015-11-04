package com.syzc.sseip.entity;

public class MemoDto extends Memo {
    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}