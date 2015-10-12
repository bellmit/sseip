package com.syzc.sseip.util;

import org.apache.log4j.Logger;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class UrlComponentUtil {
    private static final Logger logger = Logger.getLogger(UrlComponentUtil.class);

    public static String encoding(String things) {
        try {
            return URLEncoder.encode(things, "UTF-8").replace("+", "%20");
        } catch (UnsupportedEncodingException e) {
            logger.error("在转换字符串到url查询参数格式时，遇到不支持的编码格式UTF-8错误", e);
            return null;
        }
    }
}