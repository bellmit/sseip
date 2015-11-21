package com.syzc.sseip.pasture.olddata;

import java.util.HashMap;
import java.util.Map;

public class UserExtractor {
    private static Map<String, Long> map = new HashMap<>();

    static {
        map.put("李东欢", 16L);
        map.put("谷彩云", 16L);
        map.put("李梅", 13L);
        map.put("杨雅晴", 14L);
        map.put("英文资源", 21L);
        map.put("英文资源库", 12L);
        map.put("赵雅晴", 15L);
        map.put("周顺", 11L);

        //提交用户
        map.put("王兴涛8", 11L);
        map.put("张楠", 11L);
        map.put("李东欢KF", 11L);
        map.put("种忖", 11L);
        map.put("种忖kf", 11L);
        map.put("李东欢kf", 11L);
        map.put("周倩", 11L);

        //额外评论用户
        map.put("仝新强国际门诊", 11L);
        map.put("张雷", 11L);
        map.put("文海绚", 11L);
        map.put("曹海斌1", 11L);
        map.put("文海绚", 11L);
        map.put("邹英才", 11L);
    }

    public static Long get(String realname) {
        if (realname == null) {
            return null;
        }
        return map.get(realname.trim());
    }

    public static void main(String[] args) {
        System.out.println(map.get("周顺"));
    }
}