package com.syzc.sseip.pasture;

import java.util.HashMap;
import java.util.Map;

public class Ma {
    public static void main(String[] args) {
        Map<String, String> map = new HashMap<>();
        map.put("1", "123");
        System.out.println(map.get(new String("1")));
    }
}