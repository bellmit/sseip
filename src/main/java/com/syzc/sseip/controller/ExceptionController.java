package com.syzc.sseip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ExceptionController {
    @ExceptionHandler({Exception.class})
    public String exp(Exception ex, HttpServletRequest request) {
        
        return "exception-caught.ftl";
    }
}
