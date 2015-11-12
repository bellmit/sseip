package com.syzc.sseip.controller;

import com.syzc.sseip.entity.User;
import com.syzc.sseip.entity.enumtype.Role;
import com.syzc.sseip.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
public class ManagementController {
    private Logger logger = Logger.getLogger(ManagementController.class);
    private UserService userService;

    @Resource
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = "/welcome")
    public String index() {
        return "/index";
    }

    @RequestMapping(value = "/default")
    public String defaultPage(HttpSession session) {
        User user = (User) session.getAttribute("loginUser");
        if (user.getRole() == Role.ADMIN || user.getRole() == Role.TELADMIN) {
            return "redirect:/customer/filter/1";
        } else if (user.getRole() == Role.EMPLOYEE) {
            return "redirect:/customer/filter-own/1";
        }
        return "redirect:about:blank";
    }

    @RequestMapping(value = "/")
    public String indexRoot() {
        return "redirect:/welcome";
    }

    @RequestMapping(value = "profile")
    public String profile() {
        return "/self-profile";
    }
}