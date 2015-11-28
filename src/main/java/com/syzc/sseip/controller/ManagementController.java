package com.syzc.sseip.controller;

import com.alibaba.fastjson.JSON;
import com.syzc.sseip.entity.User;
import com.syzc.sseip.entity.enumtype.Role;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class ManagementController {
    private Logger logger = Logger.getLogger(ManagementController.class);

    @RequestMapping(value = "/welcome")
    public String index() {
        return "/index";
    }

    @RequestMapping(value = "/default")
    public String defaultPage(HttpSession session) {
        User user = (User) session.getAttribute("loginUser");
        if (user.getRole() == Role.ADMIN || user.getRole() == Role.TELADMIN) {
            return "redirect:/customer/filter";
        } else if (user.getRole() == Role.EMPLOYEE) {
            return "redirect:/customer/filter-own";
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

    @RequestMapping(value = "/admin/sys")
    @ResponseBody
    public String sys() {
        StringBuilder builder = new StringBuilder();

        builder.append("System Properties: \n");
        builder.append(JSON.toJSONString(System.getProperties(), true));
        builder.append("\n");
        builder.append("\n");

        builder.append("System env: \n");
        builder.append(JSON.toJSONString(System.getenv(), true));
        builder.append("\n");
        builder.append("\n");

        builder.append("freeMemory: ");
        builder.append(Runtime.getRuntime().freeMemory());
        builder.append("\n");
        builder.append("totalMemory: ");
        builder.append(Runtime.getRuntime().totalMemory());
        builder.append("\n");
        builder.append("maxMemory: ");
        builder.append(Runtime.getRuntime().maxMemory());
        builder.append("\n");

        builder.append("java.io.tmpdir: ");
        builder.append(System.getProperty("java.io.tmpdir"));
        builder.append("\n");

        return builder.toString();
    }
}