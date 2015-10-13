package com.syzc.sseip.entity;

public class UserDto extends User {
    private Group group;
    private UserLogon userLogon;

    public UserDto() {
    }

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
    }

    public UserLogon getUserLogon() {
        return userLogon;
    }

    public void setUserLogon(UserLogon userLogon) {
        this.userLogon = userLogon;
    }
}