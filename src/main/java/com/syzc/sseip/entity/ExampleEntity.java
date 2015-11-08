package com.syzc.sseip.entity;

import java.util.List;

public class ExampleEntity {
    private List<ExampleSubEntity> es;

    public ExampleEntity() {
    }

    public List<ExampleSubEntity> getEs() {
        return es;
    }

    public void setEs(List<ExampleSubEntity> es) {
        this.es = es;
    }
}