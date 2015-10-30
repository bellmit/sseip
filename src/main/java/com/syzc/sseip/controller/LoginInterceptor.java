package com.syzc.sseip.controller;

import com.syzc.sseip.service.UserService;
import com.syzc.sseip.util.UrlComponentUtil;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Service
public class LoginInterceptor extends HandlerInterceptorAdapter {
    private static final Logger logger = Logger.getLogger(LoginController.class);
    @Resource
    UserService userService;

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
//        HandlerMethod hm = (HandlerMethod) handler;
        //可能是 DefaultServletHttpRequestHandler， 找不到对应的， 转而寻找静态资源。
        Long id = (Long) session.getAttribute("loginUserId");

        StringBuilder refer = new StringBuilder();
        {
            refer.append(request.getRequestURL()); // just a name for login page's redirect
            if (request.getQueryString() != null) {
                refer.append('?');
                refer.append(request.getQueryString());
            }
//            logger.trace(String.format("%d - %s", id, refer.toString()));
        }
        if (id == null) {
/*
            StringBuilder refer = new StringBuilder();
            refer.append(request.getRequestURL());
            if (request.getQueryString() != null) {
                refer.append('?');
                refer.append(request.getQueryString());
            }
*/
            response.sendRedirect(request.getContextPath() + "/login?refer=" + UrlComponentUtil.encoding(refer.toString()));
            //kj代码里缺少的这个， 否则报已经提交——在后头的提交找不到内容的页面里。
            return false;
        }
//        System.out.println(JSON.toJSONString(userService.get(id)));
        session.setAttribute("loginUser", userService.get(id));
        return super.preHandle(request, response, handler);
    }
}