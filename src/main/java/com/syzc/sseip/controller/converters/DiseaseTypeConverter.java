package com.syzc.sseip.controller.converters;

import com.syzc.sseip.entity.enumtype.pasture.DiseaseType;
import org.springframework.core.convert.converter.Converter;

public class DiseaseTypeConverter implements Converter<String, DiseaseType> {
    @Override
    public DiseaseType convert(String source) {
        try {
            return DiseaseType.get(Integer.parseInt(source));
        } catch (NumberFormatException e) {
            return null;
        }
    }
}