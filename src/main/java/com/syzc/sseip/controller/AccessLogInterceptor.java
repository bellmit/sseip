package com.syzc.sseip.controller;

import com.syzc.sseip.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Service
public class AccessLogInterceptor extends HandlerInterceptorAdapter {
    private static final Logger logger = Logger.getLogger(AccessLogInterceptor.class);
    @Resource
    UserService userService;

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
//        HandlerMethod hm = (HandlerMethod) handler;
        //可能是 DefaultServletHttpRequestHandler， 找不到对应的， 转而寻找静态资源。
        Long id = (Long) session.getAttribute("loginUserId");

//        session.setAttribute("loginUser", userService.get(id));
        StringBuilder refer = new StringBuilder();
        {
            refer.append(request.getRequestURL()); // just a name for login page's redirect
            if (request.getQueryString() != null) {
                refer.append('?');
                refer.append(request.getQueryString());
            }
            if (id == null) {
                logger.trace(String.format("from %s:%d - (X-Forwarded-For)%s - (X-Real-IP)%s - Not Login - %s",
                        request.getRemoteAddr(), request.getRemotePort(), request.getHeader("X-Forwarded-For"), request.getHeader("X-Real-IP"), refer.toString()));
            } else {
                logger.trace(String.format("from %s:%d - (X-Forwarded-For)%s - (X-Real-IP)%s - user %d - %s",
                        request.getRemoteAddr(), request.getRemotePort(), request.getHeader("X-Forwarded-For"), request.getHeader("X-Real-IP"), id, refer.toString()));
            }
        }
        return super.preHandle(request, response, handler);
    }
}