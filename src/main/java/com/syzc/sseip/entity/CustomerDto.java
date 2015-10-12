package com.syzc.sseip.entity;

public class CustomerDto extends Customer {
    private User user;
    private Group group;

    public CustomerDto() {
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
    }
}