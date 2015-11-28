package com.syzc.sseip.entity;

import com.syzc.sseip.entity.enumtype.HospitalizationType;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class CustomerQueryDto {
    @DateTimeFormat(pattern = "yyyy-MM-dd HH")
    private Date dateRangeL;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH")
    private Date dateRangeR;
    private Long websiteId;
    private Long userId;
    private Boolean ifReport;
    private HospitalizationType hospitalization;
    private String name;
    private String email;
    private String tel;
    private Boolean valid;
    private Boolean discard;
    private Byte stars;
    private Long countryId;
    private Long diseaseTypeId;

    public Date getDateRangeL() {
        return dateRangeL;
    }

    public void setDateRangeL(Date dateRangeL) {
        this.dateRangeL = dateRangeL;
    }

    public Date getDateRangeR() {
        return dateRangeR;
    }

    public void setDateRangeR(Date dateRangeR) {
        this.dateRangeR = dateRangeR;
    }

    public Long getWebsiteId() {
        return websiteId;
    }

    public void setWebsiteId(Long websiteId) {
        this.websiteId = websiteId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Boolean getIfReport() {
        return ifReport;
    }

    public void setIfReport(Boolean ifReport) {
        this.ifReport = ifReport;
    }

    public HospitalizationType getHospitalization() {
        return hospitalization;
    }

    public void setHospitalization(HospitalizationType hospitalization) {
        this.hospitalization = hospitalization;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public Boolean getValid() {
        return valid;
    }

    public void setValid(Boolean valid) {
        this.valid = valid;
    }

    public Boolean getDiscard() {
        return discard;
    }

    public void setDiscard(Boolean discard) {
        this.discard = discard;
    }

    public Byte getStars() {
        return stars;
    }

    public void setStars(Byte stars) {
        this.stars = stars;
    }

    public Long getCountryId() {
        return countryId;
    }

    public void setCountryId(Long countryId) {
        this.countryId = countryId;
    }

    public Long getDiseaseTypeId() {
        return diseaseTypeId;
    }

    public void setDiseaseTypeId(Long diseaseTypeId) {
        this.diseaseTypeId = diseaseTypeId;
    }
}