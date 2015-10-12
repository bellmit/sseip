package com.syzc.sseip.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class IdNBirthParser {
    protected final static Pattern datePattern = Pattern.compile("^\\d{6}(\\d{4})(\\d{2})(\\d{2})");

    public static DateEntity parse(String idNumber) {
        Matcher m = datePattern.matcher(idNumber);
        if (!m.find()) {
            return null;
        } else {
            DateEntity e = new DateEntity(Integer.valueOf(m.group(1)), Integer.valueOf(m.group(2)), Integer.valueOf(m.group(3)));
            return e;
        }
    }
}