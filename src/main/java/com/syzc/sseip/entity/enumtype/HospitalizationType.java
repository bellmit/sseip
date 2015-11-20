package com.syzc.sseip.entity.enumtype;

import java.util.HashMap;
import java.util.Map;

public enum HospitalizationType {
    YES(1, "住院"), NO(2, "不住院"), DISCHARGE(3, "出院");
    private int code;
    private String textName;

    HospitalizationType(int code, String textName) {
        this.code = code;
        this.textName = textName;
    }

    public int getCode() {
        return code;
    }

    public String getTextName() {
        return textName;
    }

    public static HospitalizationType get(Integer code) {
        if (code == null) {
            return null;
        }
        return map.get(code);
    }

    private final static Map<Integer, HospitalizationType> map = new HashMap<>();

    static {
        for (HospitalizationType r : HospitalizationType.values()) {
            map.put(r.code, r);
        }
    }
}