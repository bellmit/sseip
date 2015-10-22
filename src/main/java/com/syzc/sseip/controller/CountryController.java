package com.syzc.sseip.controller;

import com.syzc.sseip.entity.Country;
import com.syzc.sseip.entity.User;
import com.syzc.sseip.entity.enumtype.Role;
import com.syzc.sseip.service.CountryService;
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
@RequestMapping(("/country"))
public class CountryController {
    private CountryService countryService;
    public final Byte pageSize = 10;

    @Resource
    public void setCountryService(CountryService countryService) {
        this.countryService = countryService;
    }

    @RequestMapping({"/list/{page:\\d+}", "/list"})
    public String list(@PathVariable("page") Long pageNo, Model model, HttpSession session) {
        Page<Country> page;
        page = countryService.list(pageNo, pageSize);
        model.addAttribute("page", page);
        model.addAttribute("path", "/country/list");
        return "country-list";
    }

/*
    @RequestMapping(value = {"/get/{id:\\d+}", "/detail/{id:\\d+}"})
    public String get(@PathVariable("id") Long id, Model model, HttpSession session) {
        return "country-get";
    }
*/

    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    public String remove(Long id, Model model, HttpServletRequest request, HttpSession session) {
        User user = (User) session.getAttribute("loginUser");
        if (user.getRole() != Role.ADMIN) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        //删除操作
        Boolean r = countryService.remove(id);
        if (!r) {
            //不存在
            throw HosException.create("目标不存在", Level.DEBUG);
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

        return "country-add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(Country country, Model model, HttpSession session) {
        User user = (User) session.getAttribute("loginUser");
        if (user.getRole() != Role.ADMIN) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        if (countryService.add(country) != null) {
            model.addAttribute("country", country);
            return "country-added";
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

        Country country = countryService.get(id);
        if (country == null) {
            throw NotExistException.create(Level.DEBUG);
        }
        model.addAttribute("country", country);
        return "country-update";
    }

    @RequestMapping(value = "/update/{id:\\d+}", method = RequestMethod.POST)
    public String update(@PathVariable("id") Long id, Country country, Model model, HttpSession session) {
        User user = (User) session.getAttribute("loginUser");
        if (user.getRole() != Role.ADMIN) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        country.setId(id);
        if (!countryService.update(country)) {
            throw HosException.create("目标不存在", Level.DEBUG);
        }
        country = countryService.get(id);
        model.addAttribute("country", country);
        model.addAttribute("success", "更新完成");
        return "country-update";
    }
}