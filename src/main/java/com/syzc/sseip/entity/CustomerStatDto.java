package com.syzc.sseip.entity;

import java.util.Date;

public class CustomerStatDto {
    //stats
    private Long inHospitalCount;
    private Long reportedCount;
    private Long validCount;
    private Long emergencyCount;

    // by category
    private Long ownerId;
    private Long countryId;
    private Long websiteId;
    private Date start;
    private Date end;

    public Long getInHospitalCount() {
        return inHospitalCount;
    }

    public void setInHospitalCount(Long inHospitalCount) {
        this.inHospitalCount = inHospitalCount;
    }

    public Long getReportedCount() {
        return reportedCount;
    }

    public void setReportedCount(Long reportedCount) {
        this.reportedCount = reportedCount;
    }

    public Long getValidCount() {
        return validCount;
    }

    public void setValidCount(Long validCount) {
        this.validCount = validCount;
    }

    public Long getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(Long ownerId) {
        this.ownerId = ownerId;
    }

    public Long getCountryId() {
        return countryId;
    }

    public void setCountryId(Long countryId) {
        this.countryId = countryId;
    }

    public Long getEmergencyCount() {
        return emergencyCount;
    }

    public void setEmergencyCount(Long emergencyCount) {
        this.emergencyCount = emergencyCount;
    }

    public Long getWebsiteId() {
        return websiteId;
    }

    public void setWebsiteId(Long websiteId) {
        this.websiteId = websiteId;
    }

    public Date getStart() {
        return start;
    }

    public void setStart(Date start) {
        this.start = start;
    }

    public Date getEnd() {
        return end;
    }

    public void setEnd(Date end) {
        this.end = end;
    }
}