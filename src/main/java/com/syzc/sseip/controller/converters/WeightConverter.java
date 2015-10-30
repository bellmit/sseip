package com.syzc.sseip.controller.converters;

import com.syzc.sseip.entity.enumtype.Weight;
import org.springframework.core.convert.converter.Converter;

public class WeightConverter implements Converter<String, Weight> {
    @Override
    public Weight convert(String source) {
        try {
            return Weight.get(Integer.parseInt(source));
        } catch (NumberFormatException e) {
            return null;
        }
    }
}