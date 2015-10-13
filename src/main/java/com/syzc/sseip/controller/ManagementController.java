package com.syzc.sseip.controller;

import com.syzc.sseip.entity.User;
import com.syzc.sseip.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

    @RequestMapping(value = "/")
    public String indexRoot() {
        return "redirect:/welcome";
    }

    @RequestMapping(value = "profile")
    public String profile(Model model, HttpSession session) {
        User loginUser = (User) session.getAttribute("loginUser");
        Long logonId = loginUser.getId();
        User user = userService.get(logonId);
        model.addAttribute("user", user);
        return "/self-profile";
    }
}