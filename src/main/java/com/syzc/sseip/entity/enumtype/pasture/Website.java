package com.syzc.sseip.entity.enumtype.pasture;

import com.alibaba.fastjson.JSON;

import java.util.HashMap;
import java.util.Map;

public enum Website {
    WECHAT(1, "微信组"), KIDNEY_K1(2, "肾K1"), KIDNEY_K2(3, "肾K2"), KIDNEY_KW(4, "肾KW"), _114(5, "114");
    protected Integer code;
    protected String textName;

    Website(Integer code, String textName) {
        this.code = code;
        this.textName = textName;
    }

    public int getCode() {
        return code;
    }

    public String getTextName() {
        return textName;
    }

    public static Website get(int code) {
        return map.get(code);
    }

    private static Map<Integer, Website> map = new HashMap<>();

    static {
        for (Website r : Website.values()) {
            map.put(r.code, r);
        }
    }

    public static void main(String[] args) {
        System.out.println(JSON.toJSONString(Website.values(), true));
        for (Website w : Website.values()) {
            System.out.println(w.getTextName());
            System.out.println(w.getCode());
        }
    }
}