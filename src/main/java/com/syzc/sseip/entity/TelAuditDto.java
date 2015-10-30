package com.syzc.sseip.entity;

import com.syzc.sseip.entity.enumtype.CallState;
import com.syzc.sseip.entity.enumtype.HospitalizationType;
import com.syzc.sseip.entity.enumtype.Weight;

public class TelAuditDto {
    private Long customerId;
    private String memoItem;
    private Boolean ifReport;
    private Boolean valid;
    private HospitalizationType hospitalization;
    private CallState callState;
    private Weight weight;

    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }

    public String getMemoItem() {
        return memoItem;
    }

    public void setMemoItem(String memoItem) {
        this.memoItem = memoItem;
    }

    public Boolean getIfReport() {
        return ifReport;
    }

    public void setIfReport(Boolean ifReport) {
        this.ifReport = ifReport;
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

    public CallState getCallState() {
        return callState;
    }

    public void setCallState(CallState callState) {
        this.callState = callState;
    }

    public Weight getWeight() {
        return weight;
    }

    public void setWeight(Weight weight) {
        this.weight = weight;
    }
}