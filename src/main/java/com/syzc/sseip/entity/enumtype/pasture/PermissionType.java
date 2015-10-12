package com.syzc.sseip.entity.enumtype.pasture;

import java.util.HashMap;
import java.util.Map;

public enum PermissionType {
    //    READ(1), WRITE(2), ADD(3), REMOVE(4);
    EMPLOYEE(5), DIRECTOR(6), MANAGER(7), ADMIN(8);
    protected int code;

    PermissionType(int code) {
        this.code = code;
    }

    public int getCode() {
        return code;
    }

    public static PermissionType get(int code) {
        return map.get(code);
    }

    private static Map<Integer, PermissionType> map;

    static {
        map = new HashMap<>();
        for (PermissionType r : PermissionType.values()) {
            map.put(r.code, r);
        }
    }

    public static void main(String[] args) {
        System.out.println(PermissionType.get(2));
        System.out.println(PermissionType.get(8));
    }
}