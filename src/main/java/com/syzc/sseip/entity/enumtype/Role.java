package com.syzc.sseip.entity.enumtype;

import java.util.HashMap;
import java.util.Map;

public enum Role {
    EMPLOYEE(1, "基本雇员"),
    //    DIRECTOR(2, "部门主任"),
//    MANAGER(3, "部门经理"),
    ADMIN(4, "系统管理员"), EMPTY(5, "停职"), TELADMIN(6, "电话管理员");
    protected int code;
    protected String roleName;

    Role(int code, String roleName) {
        this.code = code;
        this.roleName = roleName;
    }

    public int getCode() {
        return code;
    }

    public String getRoleName() {
        return roleName;
    }

    public static Role get(Integer code) {
        if (code == null) {
            return null;
        }
        return map.get(code);
    }

    private final static Map<Integer, Role> map = new HashMap<>();

    static {
        for (Role r : Role.values()) {
            map.put(r.code, r);
        }
    }

    public static void main(String[] args) {
        System.out.println(Role.get(2));
        System.out.println(Role.get(8));
    }
}