package com.syzc.sseip.pasture.olddata;

import java.util.HashMap;
import java.util.Map;

public class DeprWebsiteExtractor {
    static Map<String, Integer> websiteMap = new HashMap<>();

    static {
        websiteMap.put("原肾三网", 25);
        websiteMap.put("原肾六网", 26);
        websiteMap.put("国际宣三网", 27);
        websiteMap.put("肾三资源网", 28);
    }

    public static void main(String[] args) {
        System.out.println(websiteMap.get("肾三资源网"));
    }
}