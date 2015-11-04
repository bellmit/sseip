package com.syzc.sseip.entity;

import java.io.Serializable;
import java.util.Date;

public class Memo implements Serializable {
    private static final long serialVersionUID = -1935362549375905743L;
    private Long id;
    private String content;
    private Date added;
    private Long userId;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getAdded() {
        return added;
    }

    public void setAdded(Date added) {
        this.added = added;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }
}