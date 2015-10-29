package com.syzc.sseip.pasture.dummy;

import java.util.Arrays;
import java.util.HashSet;

public class SourceWebsiteComposer {
    public static void main(String[] args) {
        String[] arr = {"com", "cn", "com.cn", "gov", "gov.cn", "biz", "cc", "name", "pro", "med.pro", "coop", "info", "mobi", "club"};
        System.out.println(arr.length);
        System.out.println(new HashSet<String>(Arrays.asList(arr)).size());
    }
}