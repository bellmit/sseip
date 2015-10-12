package com.syzc.sseip.controller.converters;

import com.syzc.sseip.entity.enumtype.AccessPointType;
import org.springframework.core.convert.converter.Converter;

public class AccessPointTypeConverter implements Converter<String, AccessPointType> {
    @Override
    public AccessPointType convert(String source) {
        try {
            return AccessPointType.get(Integer.parseInt(source));
        } catch (NumberFormatException e) {
            return null;
        }
    }
}