package com.syzc.sseip.controller.converters;

import com.syzc.sseip.entity.enumtype.HospitalizationType;
import org.springframework.core.convert.converter.Converter;

public class HospitalizationTypeConverter implements Converter<String, HospitalizationType> {
    @Override
    public HospitalizationType convert(String source) {
        try {
            return HospitalizationType.get(Integer.parseInt(source));
        } catch (NumberFormatException e) {
            return null;
        }
    }
}