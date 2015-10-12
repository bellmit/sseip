package com.syzc.sseip.entity.enumtype.pasture;

import java.util.HashMap;
import java.util.Map;

public enum PermissionTypeBak {
    //    READ(1), WRITE(2), ADD(3), REMOVE(4);
    EMPLOYEE(5), DIRECTOR(6), MANAGER(7), ADMIN(8);
    protected int code;

    PermissionTypeBak(int code) {
        this.code = code;
    }

    public int getCode() {
        return code;
    }

    public static PermissionTypeBak get(int code) {
        return map.get(code);
    }

    private static Map<Integer, PermissionTypeBak> map;

    static {
        map = new HashMap<>();
        for (PermissionTypeBak r : PermissionTypeBak.values()) {
            map.put(r.code, r);
        }
    }

    public static void main(String[] args) {
        System.out.println(PermissionTypeBak.get(2));
        System.out.println(PermissionTypeBak.get(8));
    }
}