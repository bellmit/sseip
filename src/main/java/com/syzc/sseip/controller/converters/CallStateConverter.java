package com.syzc.sseip.controller.converters;

import com.syzc.sseip.entity.enumtype.CallState;
import org.springframework.core.convert.converter.Converter;

public class CallStateConverter implements Converter<String, CallState> {
    @Override
    public CallState convert(String source) {
        try {
            return CallState.get(Integer.parseInt(source));
        } catch (NumberFormatException e) {
            return null;
        }
    }
}