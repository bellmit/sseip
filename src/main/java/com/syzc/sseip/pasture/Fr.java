package com.syzc.sseip.pasture;

import com.alibaba.fastjson.JSON;
import com.syzc.sseip.dao.UserLogonQueryDto;
import com.syzc.sseip.util.UrlComponentUtil;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Arrays;
import java.util.Date;

public class Fr {
    public static void main(String[] args) throws UnsupportedEncodingException {
        String queryCombo;
        String[] arr;
        queryCombo = "";
        arr = queryCombo.split("-");
        UserLogonQueryDto query;
//        query = new UserLogonQueryDto();

        System.out.println(arr.length);
        System.out.println(String.format("***%s***", arr[0]));

        queryCombo = "123-易连初-1237129387-12938792387-11.22.33.44.55";
        arr = queryCombo.split("-");
        System.out.println(Arrays.toString(arr));

/*
        queryCombo = "123--1237129387-12938792387-11.22.33.44.55";
        arr = queryCombo.split("-");
        System.out.println(Arrays.toString(arr));
*/

        arr = new String[]{"123", "易-连初", "1237129387", "12938792387", "11.22.33.44.55"};
        String[] arr2;
        arr2 = new String[arr.length < 5 ? arr.length : 5];
        for (int i = 0; i < arr2.length; i++) {
            arr2[i] = UrlComponentUtil.encoding(arr[i]).replace("-", "%2d");
        }
        System.out.println(Arrays.toString(arr2));
        String query2;
        query2 = "123-%E6%98%93%2d%E8%BF%9E%E5%88%9D-1237129387-12938792387-11.22.33.44.55";
//        System.out.println(query2);

        arr = query2.split("-", 5);
        for (int i = 0; i < arr.length; i++) {
            try {
                System.out.println(URLDecoder.decode(arr[i], "UTF-8"));
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }

 /*
Long userId;
String realName;
Date start;
Date end;
String ip;
*/
        query = new UserLogonQueryDto();
        Long userId = Long.parseLong(arr[0]);
        Long startLong = Long.parseLong(arr[2]);
        Long endLong = Long.parseLong(arr[3]);
        query.setUserId(userId);
        query.setRealName(URLDecoder.decode(arr[1], "UTF-8"));
        query.setStart(new Date(startLong));
        query.setEnd(new Date(endLong));
        query.setIp(URLDecoder.decode(arr[4], "UTF-8"));

        System.out.println(JSON.toJSONString(query, true));

        System.out.println(Arrays.toString("1-2-3-4-5-6-7-8-9".split("-", 5)));
    }
}