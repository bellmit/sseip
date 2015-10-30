package com.syzc.sseip.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ExceptionController {
    private Logger logger = Logger.getLogger(ExceptionController.class);

    @ExceptionHandler({Exception.class})
    public String exp(Exception ex, HttpServletRequest request) {
        logger.debug(ex);
        return "exception-caught.ftl";
    }
}
