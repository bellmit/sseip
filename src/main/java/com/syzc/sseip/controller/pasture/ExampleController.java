package com.syzc.sseip.controller.pasture;

import com.alibaba.fastjson.JSON;
import com.syzc.sseip.entity.ExampleEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;

@Controller
public class ExampleController {
    @RequestMapping(value = "/pasture/a")
//    @ResponseBody
    String a() {
        return "redirect:/login";
    }

    @RequestMapping(value = "/pasture/b")
    @ResponseBody
    String b(String[] str) {
        System.out.println(Arrays.toString(str));
        return "success!";
    }

    @RequestMapping(value = "/pasture/c")
    @ResponseBody
    String c(ExampleEntity e) {
        System.out.println(JSON.toJSONString(e, true));
//        System.out.println(JSON.toJSONString(ss, true));
        return "success!";
    }
}