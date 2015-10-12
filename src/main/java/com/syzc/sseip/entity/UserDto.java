package com.syzc.sseip.entity;

public class UserDto extends User {
    private Group group;

    public UserDto() {
    }

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
    }
}