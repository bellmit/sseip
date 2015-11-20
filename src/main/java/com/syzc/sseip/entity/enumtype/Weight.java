package com.syzc.sseip.entity.enumtype;

import java.util.HashMap;
import java.util.Map;

public enum Weight {
    LOW(1, "低"), MEDIUM(2, "中"), HIGH(3, "高");
    protected int code;
    protected String weightName;

    Weight(int code, String weightName) {
        this.code = code;
        this.weightName = weightName;
    }

    public int getCode() {
        return code;
    }

    public String getWeightName() {
        return weightName;
    }

    public static Weight get(Integer code) {
        if (code == null) {
            return null;
        }
        return map.get(code);
    }

    private final static Map<Integer, Weight> map = new HashMap<>();

    static {
        for (Weight r : Weight.values()) {
            map.put(r.code, r);
        }
    }

    public static void main(String[] args) {
        System.out.println(Weight.get(2));
        System.out.println(Weight.get(8));
    }
}