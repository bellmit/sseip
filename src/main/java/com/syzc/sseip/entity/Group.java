package com.syzc.sseip.entity;

import java.io.Serializable;

//扩展Dto，增加成员数量字段； 查询时候联合查询获取数量； 修改基本列表查询，或增加dto 列表查询
public class Group implements Serializable {
    private static final long serialVersionUID = -5327691808977625142L;
    private Long id;
    private String name;
    private String description;

    public Group() {
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}