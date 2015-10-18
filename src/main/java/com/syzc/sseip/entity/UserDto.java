package com.syzc.sseip.entity;

import java.io.Serializable;

public class UserDto extends User implements Serializable {
    private static final long serialVersionUID = 2042209216352215111L;
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