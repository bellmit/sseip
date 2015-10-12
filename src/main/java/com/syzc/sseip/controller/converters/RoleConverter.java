package com.syzc.sseip.controller.converters;

import com.syzc.sseip.entity.enumtype.Role;
import org.springframework.core.convert.converter.Converter;

public class RoleConverter implements Converter<String, Role> {
    @Override
    public Role convert(String source) {
        try {
            return Role.get(Integer.parseInt(source));
        } catch (NumberFormatException e) {
            return null;
        }
    }
}