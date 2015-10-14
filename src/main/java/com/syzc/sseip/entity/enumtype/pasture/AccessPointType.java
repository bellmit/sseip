package com.syzc.sseip.entity.enumtype.pasture;

import com.alibaba.fastjson.JSON;

import java.util.HashMap;
import java.util.Map;

public enum AccessPointType {
    CUSTOMER_SERVICE(1, "客服"), HOT_LINE(2, "热线"), PROPAGANDA(3, "宣传"), QQ_PROPAGANDA(4, "QQ宣传"), QQ_CUSTOMER_SERVICE(5, "QQ客服"), WEIBO_CUSTOMER_SERVICE(6, "微博客服");
    protected Integer code;
    protected String textName;

    AccessPointType(Integer code, String textName) {
        this.code = code;
        this.textName = textName;
    }

    public int getCode() {
        return code;
    }

    public String getTextName() {
        return textName;
    }

    public static AccessPointType get(int code) {
        return map.get(code);
    }

    private static Map<Integer, AccessPointType> map = new HashMap<>();

    static {
        for (AccessPointType r : AccessPointType.values()) {
            map.put(r.code, r);
        }
    }

    public static void main(String[] args) {
        System.out.println(JSON.toJSONString(AccessPointType.values(), true));
        for (AccessPointType w : AccessPointType.values()) {
            System.out.println(w.getTextName());
            System.out.println(w.getCode());
        }
    }
}