package com.syzc.sseip.entity.enumtype;

import java.util.HashMap;
import java.util.Map;

public enum CallState {
    打电话(1), 未打电话(2), 无人接听(3), 有意向(4), 关机(5), 停机(6), 拒接(7), 重复(8), 通话中(9), 呼叫等待(10), 来电转移(11), WhatsApp(12);
    protected int code;

    CallState(int code) {
        this.code = code;
    }

    public int getCode() {
        return code;
    }

    public static CallState get(Integer code) {
        if (code == null) {
            return null;
        }
        return map.get(code);
    }

    private final static Map<Integer, CallState> map = new HashMap<>();

    static {
        for (CallState r : CallState.values()) {
            map.put(r.code, r);
        }
    }

    public static void main(String[] args) {
        System.out.println(CallState.get(3));
        System.out.println(CallState.get(4));
        System.out.println(CallState.get(5));
    }
}