package com.syzc.sseip.controller;

import com.syzc.sseip.entity.User;
import com.syzc.sseip.entity.UserDto;
import com.syzc.sseip.entity.enumtype.Role;
import com.syzc.sseip.service.UserService;
import com.syzc.sseip.util.HosException;
import com.syzc.sseip.util.Page;
import com.syzc.sseip.util.exception.AuthException;
import org.apache.log4j.Level;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/role")
public class RoleController {
    private final byte pageSize = 10;
    private UserService userService;

    @Resource
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/list")
    public String list(Model model, HttpSession session) {

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        if (loginUser.getRole() == null || loginUser.getRole() == Role.EMPTY) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        model.addAttribute("roleTypes", Role.values());
        return "role-list";
    }

    @RequestMapping("/user-list/{role:\\d+}/{page:\\d+}")
    public String listUsers(@PathVariable("role") Integer code, @PathVariable("page") Long pageNo, Model model, HttpSession session) {

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        /*if (loginUser.getRole() == null || (loginUser.getRole() != Role.ADMIN && loginUser.getRole() != Role.MANAGER)) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }*/
        if (loginUser.getRole() == null || (loginUser.getRole() != Role.ADMIN)) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        Role role = Role.get(code);
        if (role == null) {
            throw HosException.create("没有这个角色啊", Level.DEBUG);
        }
        Page<User> page = userService.listByRole(role, pageNo, pageSize);
        model.addAttribute("roleTypes", Role.values());
        model.addAttribute("role", role);
        model.addAttribute("page", page);
        model.addAttribute("path", "/role/user-list/" + code);
        return "role-user-list";
    }

    @RequestMapping(value = "/updaterole/{user:\\d+}", method = RequestMethod.GET)
    public String upadateUserRole(@PathVariable("user") Long userId, Model model, HttpSession session) {

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        /*if (loginUser.getRole() == null || (loginUser.getRole() != Role.ADMIN && loginUser.getRole() != Role.MANAGER)) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }*/
        if (loginUser.getRole() == null || (loginUser.getRole() != Role.ADMIN)) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        User user = userService.get(userId);
        model.addAttribute("roleTypes", Role.values());

        model.addAttribute("user", user);
        return "/user-role-update";
    }

    @RequestMapping(value = "/updaterole/{user:\\d+}", method = RequestMethod.POST)
    public String upadateUserRole(@PathVariable("user") Long userId, @RequestParam("role") Role role, Model model, HttpSession session) {

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        /*if (loginUser.getRole() == null || (loginUser.getRole() != Role.ADMIN && loginUser.getRole() != Role.MANAGER)) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }*/
        if (loginUser.getRole() == null || (loginUser.getRole() != Role.ADMIN)) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        model.addAttribute("roleTypes", Role.values());
        if (userService.updateRole(userId, role)) {
            User user = userService.get(userId);
            model.addAttribute("user", user);
            model.addAttribute("success", "更改用户角色完成");
//            return "/user-role-update";
            return "/user-role-update";
        } else {
            User user = userService.get(userId);
            model.addAttribute("user", user);
            model.addAttribute("error", "更改用户角色没有完成");
            return "/user-role-update";
        }
    }
}