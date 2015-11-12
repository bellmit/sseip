package com.syzc.sseip.entity;

import com.syzc.sseip.entity.enumtype.CallState;
import com.syzc.sseip.entity.enumtype.HospitalizationType;
import com.syzc.sseip.entity.enumtype.Sex;
import com.syzc.sseip.entity.enumtype.Weight;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class Customer implements Serializable {
    private static final long serialVersionUID = 1564478954650903113L;
    private Long id;
    private Sex sex; //患者性别
    private Short age; //患者年龄

    private String liaisonName; //咨询者名字
    private String liaisonAddress; //咨询者住址
    private String relationship; //咨询者和患者的关系
    private Long liaisonCountryId;

    private String patientName;
    private String patientAddress;
    private Long patientCountryId;
    private String symptom; //症状描述
    private Long diseaseTypeId;
    private HospitalizationType hospitalization;

    private Boolean emergency;

    private String email; //联系邮件
    private String tel; //联系电话

    private Long websiteId;

    private Date added;
    private Date updated;

    private String memo; //备注
    private String contactRecords; //聊天、邮件记录

    private Byte stars;
    private Boolean valid;

    private Long userId;
    private Long ownerUserId;
    private Long groupId;

    private Boolean discard;

    private Boolean ifReport;
    private Weight weight;

    private CallState callState;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date revisitDate;

    /**
     * 来源网址
     */
    private String sourceWebsite;

    private Boolean emailSent;

    //    private Date calledTime;

    public Customer() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public String getSymptom() {
        return symptom;
    }

    public void setSymptom(String symptom) {
        this.symptom = symptom;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
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

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public Byte getStars() {
        return stars;
    }

    public void setStars(Byte stars) {
        this.stars = stars;
    }

    public Boolean getValid() {
        return valid;
    }

    public void setValid(Boolean valid) {
        this.valid = valid;
    }

    public HospitalizationType getHospitalization() {
        return hospitalization;
    }

    public void setHospitalization(HospitalizationType hospitalization) {
        this.hospitalization = hospitalization;
    }

    public String getLiaisonName() {
        return liaisonName;
    }

    public void setLiaisonName(String liaisonName) {
        this.liaisonName = liaisonName;
    }

    public String getLiaisonAddress() {
        return liaisonAddress;
    }

    public void setLiaisonAddress(String liaisonAddress) {
        this.liaisonAddress = liaisonAddress;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public String getPatientAddress() {
        return patientAddress;
    }

    public void setPatientAddress(String patientAddress) {
        this.patientAddress = patientAddress;
    }

    public String getRelationship() {
        return relationship;
    }

    public void setRelationship(String relationship) {
        this.relationship = relationship;
    }

    public Long getLiaisonCountryId() {
        return liaisonCountryId;
    }

    public void setLiaisonCountryId(Long liaisonCountryId) {
        this.liaisonCountryId = liaisonCountryId;
    }

    public Long getPatientCountryId() {
        return patientCountryId;
    }

    public void setPatientCountryId(Long patientCountryId) {
        this.patientCountryId = patientCountryId;
    }

    public Long getDiseaseTypeId() {
        return diseaseTypeId;
    }

    public void setDiseaseTypeId(Long diseaseTypeId) {
        this.diseaseTypeId = diseaseTypeId;
    }

    public Long getWebsiteId() {
        return websiteId;
    }

    public void setWebsiteId(Long websiteId) {
        this.websiteId = websiteId;
    }

    public String getContactRecords() {
        return contactRecords;
    }

    public void setContactRecords(String contactRecords) {
        this.contactRecords = contactRecords;
    }

    public Date getUpdated() {
        return updated;
    }

    public void setUpdated(Date updated) {
        this.updated = updated;
    }

    public Long getOwnerUserId() {
        return ownerUserId;
    }

    public void setOwnerUserId(Long ownerUserId) {
        this.ownerUserId = ownerUserId;
    }

    public Boolean getDiscard() {
        return discard;
    }

    public void setDiscard(Boolean discard) {
        this.discard = discard;
    }

    public Boolean getIfReport() {
        return ifReport;
    }

    public void setIfReport(Boolean ifReport) {
        this.ifReport = ifReport;
    }

    public String getSourceWebsite() {
        return sourceWebsite;
    }

    public void setSourceWebsite(String sourceWebsite) {
        this.sourceWebsite = sourceWebsite;
    }

    public Weight getWeight() {
        return weight;
    }

    public void setWeight(Weight weight) {
        this.weight = weight;
    }

    public CallState getCallState() {
        return callState;
    }

    public void setCallState(CallState callState) {
        this.callState = callState;
    }

    public Date getRevisitDate() {
        return revisitDate;
    }

    public void setRevisitDate(Date revisitDate) {
        this.revisitDate = revisitDate;
    }

    public Boolean getEmailSent() {
        return emailSent;
    }

    public void setEmailSent(Boolean emailSent) {
        this.emailSent = emailSent;
    }
}