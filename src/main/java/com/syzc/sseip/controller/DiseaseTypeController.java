package com.syzc.sseip.controller;

import com.syzc.sseip.entity.DiseaseType;
import com.syzc.sseip.entity.User;
import com.syzc.sseip.entity.enumtype.Role;
import com.syzc.sseip.service.DiseaseTypeService;
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
@RequestMapping("/disease-type")
public class DiseaseTypeController {
    private DiseaseTypeService diseaseTypeService;
    public final Byte pageSize = 10;

    @Resource
    public void setDiseaseTypeService(DiseaseTypeService diseaseTypeService) {
        this.diseaseTypeService = diseaseTypeService;
    }

    @RequestMapping({"/list/{page:\\d+}", "/list"})
    public String list(@PathVariable("page") Long pageNo, Model model, HttpSession session) {
        Page<DiseaseType> page;
        page = diseaseTypeService.list(pageNo, pageSize);
        model.addAttribute("page", page);
        model.addAttribute("path", "/disease-type/list");
        return "disease-type-list";
    }

    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    public String remove(Long id, Model model, HttpServletRequest request, HttpSession session) {
        User user = (User) session.getAttribute("loginUser");
        if (user.getRole() != Role.ADMIN) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        //删除操作
        Boolean r = diseaseTypeService.remove(id);
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

        return "disease-type-add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(DiseaseType diseaseType, Model model, HttpSession session) {
        User user = (User) session.getAttribute("loginUser");
        if (user.getRole() != Role.ADMIN) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        if (diseaseTypeService.add(diseaseType) != null) {
            model.addAttribute("diseaseType", diseaseType);
            return "disease-type-added";
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

        DiseaseType diseaseType = diseaseTypeService.get(id);
        if (diseaseType == null) {
            throw NotExistException.create(Level.DEBUG);
        }
        model.addAttribute("diseaseType", diseaseType);
        return "disease-type-update";
    }

    @RequestMapping(value = "/update/{id:\\d+}", method = RequestMethod.POST)
    public String update(@PathVariable("id") Long id, DiseaseType diseaseType, Model model, HttpSession session) {
        User user = (User) session.getAttribute("loginUser");
        if (user.getRole() != Role.ADMIN) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        diseaseType.setId(id);
        if (!diseaseTypeService.update(diseaseType)) {
            throw HosException.create("目标不存在", Level.DEBUG);
        }
        diseaseType = diseaseTypeService.get(id);
        model.addAttribute("diseaseType", diseaseType);
        model.addAttribute("success", "更新完成");
        return "disease-type-update";
    }
}