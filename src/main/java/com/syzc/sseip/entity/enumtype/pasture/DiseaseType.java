package com.syzc.sseip.entity.enumtype.pasture;

import com.alibaba.fastjson.JSON;

import java.util.HashMap;
import java.util.Map;

public enum DiseaseType {
    NEPHROTIC_SYNDROME(1, "肾病综合征"), TOXURIA(2, "尿毒症"), RENAL_FAILURE(3, "肾衰竭"), CHRONIC_KIDNEY_DISEASE(4, "慢性肾炎");
    protected int code;
    protected String textName;

    DiseaseType(int code, String textName) {
        this.code = code;
        this.textName = textName;
    }

    public int getCode() {
        return code;
    }

    public String getTextName() {
        return textName;
    }

    public static DiseaseType get(int code) {
        return map.get(code);
    }

    private static Map<Integer, DiseaseType> map = new HashMap<>();

    static {
        for (DiseaseType r : DiseaseType.values()) {
            map.put(r.code, r);
        }
    }

    public static void main(String[] args) {
        System.out.println(JSON.toJSONString(DiseaseType.values(), true));
/*
        for (DiseaseType w : DiseaseType.values()) {
            System.out.println(w.getName());
            System.out.println(w.getCode());
        }
*/
        System.out.println(DiseaseType.get(1));
        System.out.println(DiseaseType.get(1).getTextName());
        System.out.println(DiseaseType.get(1).getCode());
        System.out.println(DiseaseType.get(2));
    }
}