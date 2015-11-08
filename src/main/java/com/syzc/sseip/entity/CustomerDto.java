package com.syzc.sseip.entity;

import java.io.Serializable;
import java.util.LinkedList;
import java.util.List;

public class CustomerDto extends Customer implements Serializable {
    private static final long serialVersionUID = -5507854566537408978L;
    private User user;
    private User ownerUser;
    private Group group;
    private Website website;
    private Country liaisonCountry;
    private Country patientCountry;
    private DiseaseType diseaseType;

    private List<Memo> memos = new LinkedList<>();

    private RevisitSchedule revisitSchedule;

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

    public Website getWebsite() {
        return website;
    }

    public void setWebsite(Website website) {
        this.website = website;
    }

    public Country getLiaisonCountry() {
        return liaisonCountry;
    }

    public void setLiaisonCountry(Country liaisonCountry) {
        this.liaisonCountry = liaisonCountry;
    }

    public Country getPatientCountry() {
        return patientCountry;
    }

    public void setPatientCountry(Country patientCountry) {
        this.patientCountry = patientCountry;
    }

    public DiseaseType getDiseaseType() {
        return diseaseType;
    }

    public void setDiseaseType(DiseaseType diseaseType) {
        this.diseaseType = diseaseType;
    }

    public User getOwnerUser() {
        return ownerUser;
    }

    public void setOwnerUser(User ownerUser) {
        this.ownerUser = ownerUser;
    }

    public List<Memo> getMemos() {
        return memos;
    }

    public void setMemos(List<Memo> memos) {
        this.memos = memos;
    }

    public void addMemo(Memo memo) {
        this.memos.add(memo);
    }

    public RevisitSchedule getRevisitSchedule() {
        return revisitSchedule;
    }

    public void setRevisitSchedule(RevisitSchedule revisitSchedule) {
        this.revisitSchedule = revisitSchedule;
    }
}