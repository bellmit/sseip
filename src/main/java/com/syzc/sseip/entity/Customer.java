package com.syzc.sseip.entity;

import com.syzc.sseip.entity.enumtype.AccessPointType;
import com.syzc.sseip.entity.enumtype.DiseaseType;
import com.syzc.sseip.entity.enumtype.Sex;
import com.syzc.sseip.entity.enumtype.Website;

import java.util.Date;

public class Customer {
    private Long id;
    private String name;
    private Sex sex;
    private Short age;
    private String address;
    private String symptom;
    private String tel;

    private Website website;
    private DiseaseType diseaseType;
    private AccessPointType accessPointType;

    private Boolean faraway;
    private Boolean emergency;

    private Date added;

//    private Date calledTime;
//    private String callBackRecord;

    private Long userId;
    private Long groupId;

    private String[] images;

    public Customer() {
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

    public Sex getSex() {
        return sex;
    }

    public void setSex(Sex sex) {
        this.sex = sex;
    }

    public Short getAge() {
        return age;
    }

    public void setAge(Short age) {
        this.age = age;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getSymptom() {
        return symptom;
    }

    public void setSymptom(String symptom) {
        this.symptom = symptom;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public Website getWebsite() {
        return website;
    }

    public void setWebsite(Website website) {
        this.website = website;
    }

    public DiseaseType getDiseaseType() {
        return diseaseType;
    }

    public void setDiseaseType(DiseaseType diseaseType) {
        this.diseaseType = diseaseType;
    }

    public AccessPointType getAccessPointType() {
        return accessPointType;
    }

    public void setAccessPointType(AccessPointType accessPointType) {
        this.accessPointType = accessPointType;
    }

    public Boolean getFaraway() {
        return faraway;
    }

    public void setFaraway(Boolean faraway) {
        this.faraway = faraway;
    }

    public Boolean getEmergency() {
        return emergency;
    }

    public void setEmergency(Boolean emergency) {
        this.emergency = emergency;
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

    public Long getGroupId() {
        return groupId;
    }

    public void setGroupId(Long groupId) {
        this.groupId = groupId;
    }
}