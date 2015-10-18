package com.syzc.sseip.entity;

import java.io.Serializable;

public class Department implements Serializable {
    private static final long serialVersionUID = -6324458868620916282L;
    private Long id;
    private Long name;

    public Department() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getName() {
        return name;
    }

    public void setName(Long name) {
        this.name = name;
    }
}