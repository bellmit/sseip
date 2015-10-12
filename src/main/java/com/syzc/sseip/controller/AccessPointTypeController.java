package com.syzc.sseip.controller;

import com.syzc.sseip.entity.AccessPointType;
import com.syzc.sseip.service.AccessPointTypeService;
import com.syzc.sseip.util.HosException;
import com.syzc.sseip.util.NotExistException;
import com.syzc.sseip.util.Page;
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
@RequestMapping("/access-point-type")
public class AccessPointTypeController {
    private AccessPointTypeService accessPointTypeService;
    public final Byte pageSize = 10;

    @Resource
    public void setAccessPointTypeService(AccessPointTypeService accessPointTypeService) {
        this.accessPointTypeService = accessPointTypeService;
    }

    @RequestMapping({"/list/{page:\\d+}", "/list"})
    public String list(@PathVariable("page") Long pageNo, Model model, HttpSession session) {
        Page<AccessPointType> page;
        page = accessPointTypeService.list(pageNo, pageSize);
        model.addAttribute("page", page);
        model.addAttribute("path", "/access-point-type/list");
        return "access-point-type-list";
    }

    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    public String remove(Long id, Model model, HttpServletRequest request, HttpSession session) {
        //删除操作
        Boolean r = accessPointTypeService.remove(id);
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
        return "access-point-type-add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(AccessPointType accessPointType, Model model, HttpSession session) {
        if (accessPointTypeService.add(accessPointType) != null) {
            model.addAttribute("accessPointType", accessPointType);
            return "access-point-type-added";
        } else {
            throw HosException.create("创建失败", Level.DEBUG);
        }
    }

    @RequestMapping(value = "/update/{id:\\d+}", method = RequestMethod.GET)
    public String update(@PathVariable("id") Long id, Model model, HttpSession session) {
        AccessPointType accessPointType = accessPointTypeService.get(id);
        if (accessPointType == null) {
            throw NotExistException.create(Level.DEBUG);
        }
        model.addAttribute("accessPointType", accessPointType);
        return "access-point-type-update";
    }

    @RequestMapping(value = "/update/{id:\\d+}", method = RequestMethod.POST)
    public String update(@PathVariable("id") Long id, AccessPointType accessPointType, Model model, HttpSession session) {
        accessPointType.setId(id);
        if (!accessPointTypeService.update(accessPointType)) {
            throw HosException.create("目标不存在", Level.DEBUG);
        }
        accessPointType = accessPointTypeService.get(id);
        model.addAttribute("accessPointType", accessPointType);
        model.addAttribute("success", "更新完成");
        return "access-point-type-update";
    }
}