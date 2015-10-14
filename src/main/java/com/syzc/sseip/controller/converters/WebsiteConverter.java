package com.syzc.sseip.controller.converters;

import com.syzc.sseip.entity.enumtype.pasture.Website;
import org.springframework.core.convert.converter.Converter;

public class WebsiteConverter implements Converter<String, Website> {
    @Override
    public Website convert(String source) {
        try {
            return Website.get(Integer.parseInt(source));
        } catch (NumberFormatException e) {
            return null;
        }
    }
}