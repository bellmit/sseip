package com.syzc.sseip.controller;

import com.alibaba.fastjson.JSON;
import com.syzc.sseip.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;

@Controller
public class ExampleController {
    @RequestMapping(value = "/login/a")
//    @ResponseBody
    String a() {
        return "redirect:/login";
    }

    @RequestMapping(value = "/login/b")
    @ResponseBody
    String b(String[] str) {
        System.out.println(Arrays.toString(str));
        return "success!";
    }

    @RequestMapping(value = "/login/c")
    @ResponseBody
    String c(User[] users) {
        System.out.println(JSON.toJSONString(users, true));
        return "success!";
    }
}