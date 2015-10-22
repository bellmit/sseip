package com.syzc.sseip.controller;

import com.syzc.sseip.entity.User;
import com.syzc.sseip.entity.Website;
import com.syzc.sseip.entity.enumtype.Role;
import com.syzc.sseip.service.WebsiteService;
import com.syzc.sseip.util.HosException;
import com.syzc.sseip.util.NotExistException;
import com.syzc.sseip.util.Page;
import com.syzc.sseip.util.exception.AuthException;
import org.apache.log4j.Level;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/website")
public class WebsiteController {
    private WebsiteService websiteService;
    public final Byte pageSize = 10;

    @Resource
    public void setWebsiteService(WebsiteService websiteService) {
        this.websiteService = websiteService;
    }

    @RequestMapping({"/list/{page:\\d+}", "/list"})
    public String list(@PathVariable("page") Long pageNo, Model model, HttpSession session) {
        Page<Website> page;
        page = websiteService.list(pageNo, pageSize);
        model.addAttribute("page", page);
        model.addAttribute("path", "/website/list");
        return "website-list";
    }

    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    public String remove(Long id, Model model, HttpServletRequest request, HttpSession session) {
        User user = (User) session.getAttribute("loginUser");
        if (user.getRole() != Role.ADMIN) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        //删除操作
        Boolean r = websiteService.remove(id);
        if (!r) {
            throw NotExistException.create(Level.DEBUG);
        }
        String referer = request.getHeader("Referer");
        if (referer == null) {
            referer = "/";
        }
        return "redirect:" + referer;
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(Model model, HttpSession session) {
        User user = (User) session.getAttribute("loginUser");
        if (user.getRole() != Role.ADMIN) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        return "website-add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(Website website, Model model, HttpSession session) {
        User user = (User) session.getAttribute("loginUser");
        if (user.getRole() != Role.ADMIN) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        if (websiteService.add(website) != null) {
            model.addAttribute("website", website);
            return "website-added";
        } else {
            throw HosException.create("创建失败", Level.DEBUG);
        }
    }

    @RequestMapping(value = "/update/{id:\\d+}", method = RequestMethod.GET)
    public String update(@PathVariable("id") Long id, Model model, HttpSession session) {
        User user = (User) session.getAttribute("loginUser");
        if (user.getRole() != Role.ADMIN) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        Website website = websiteService.get(id);
        if (website == null) {
            throw NotExistException.create(Level.DEBUG);
        }
        model.addAttribute("website", website);
        return "website-update";
    }

    @RequestMapping(value = "/update/{id:\\d+}", method = RequestMethod.POST)
    public String update(@PathVariable("id") Long id, Website website, Model model, HttpSession session) {
        User user = (User) session.getAttribute("loginUser");
        if (user.getRole() != Role.ADMIN) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        website.setId(id);
        if (!websiteService.update(website)) {
            throw HosException.create("目标不存在", Level.DEBUG);
        }
        website = websiteService.get(id);
        model.addAttribute("website", website);
        model.addAttribute("success", "更新完成");
        return "website-update";
    }
}