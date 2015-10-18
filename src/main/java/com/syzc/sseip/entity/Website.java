package com.syzc.sseip.entity;

import java.io.Serializable;

public class Website implements Serializable {
    private static final long serialVersionUID = -2237508767793715354L;
    private Long id;
    private String name;
    private String url;

    public Website() {
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

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}