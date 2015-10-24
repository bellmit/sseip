package com.syzc.sseip.controller;

import com.alibaba.fastjson.JSON;
import com.syzc.sseip.entity.Group;
import com.syzc.sseip.entity.User;
import com.syzc.sseip.entity.UserDto;
import com.syzc.sseip.entity.enumtype.Role;
import com.syzc.sseip.service.GroupService;
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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * group等于是宣传推广的部门
 */
@Controller
@RequestMapping("/group")
public class GroupController {
    public static final Byte pageSize = 10;
    private UserService userService;
    private GroupService groupService;

    @Resource
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Resource
    public void setGroupService(GroupService groupService) {
        this.groupService = groupService;
    }

    @RequestMapping(value = "/list/{page:\\d+}")
    public String list(@PathVariable("page") Long pageNo, Model model, HttpSession session) {

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        if (loginUser.getRole() == null || (loginUser.getRole() == Role.EMPTY)) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        Page<Group> page = groupService.list(pageNo, pageSize);
        model.addAttribute("page", page);
        model.addAttribute("path", "/group/list");
        return "/group-list";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(HttpSession session) {

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        /*if (loginUser.getRole() == null || (loginUser.getRole() != Role.ADMIN && loginUser.getRole() != Role.MANAGER)) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }*/
        if (loginUser.getRole() == null || (loginUser.getRole() != Role.ADMIN)) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }
        return "group-add";
    }

    @RequestMapping(value = "add", method = RequestMethod.POST) // expanse if request json response
    public String add(Group group, Model model, HttpSession session) {

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        /*if (loginUser.getRole() == null || (loginUser.getRole() != Role.ADMIN && loginUser.getRole() != Role.MANAGER)) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }*/
        if (loginUser.getRole() == null || (loginUser.getRole() != Role.ADMIN)) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        //group.id 不参与sql insert操作
        group = groupService.add(group);
        model.addAttribute("group", group);
//        return "group-add-result"; //回到组操作页面-列表，继续添加，回到首页
        return "redirect:/group/list/1";
    }

    @RequestMapping(value = "remove", method = RequestMethod.POST)
    public String remove(@RequestParam("groupid") Long groupid, Model model, HttpServletRequest request, HttpSession session) {

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        /*if (loginUser.getRole() == null || (loginUser.getRole() != Role.ADMIN && loginUser.getRole() != Role.MANAGER)) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }*/
        if (loginUser.getRole() == null || (loginUser.getRole() != Role.ADMIN)) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        String referer = request.getHeader("Referer");
        if (referer == null) {
            referer = "/group/list/1";
        }
        if (groupService.remove(groupid)) {
//            model.addAttribute("removed", "");
            return "redirect:" + referer;
        } else {
            model.addAttribute("removefailed", "");// bootstrap - danger colored css class
            return "redirect:" + referer;
        }
    }

    @RequestMapping(value = "edit/{groupid:\\d+}", method = RequestMethod.GET)
    public String updateView(@PathVariable("groupid") Long groupId, Model model, HttpSession session) {

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        /*if (loginUser.getRole() == null || (loginUser.getRole() != Role.ADMIN && loginUser.getRole() != Role.MANAGER)) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }*/
        if (loginUser.getRole() == null || (loginUser.getRole() != Role.ADMIN)) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        Group group = groupService.get(groupId);
        model.addAttribute("group", group);
        return "group-update";
    }

    @RequestMapping(value = "edit/{groupid:\\d+}", method = RequestMethod.POST)
    public String update(@PathVariable("groupid") Long groupId, Group group, Model model, HttpSession session) {

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        /*if (loginUser.getRole() == null || (loginUser.getRole() != Role.ADMIN && loginUser.getRole() != Role.MANAGER)) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }*/
        if (loginUser.getRole() == null || (loginUser.getRole() != Role.ADMIN)) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        group.setId(groupId);
        System.out.println(JSON.toJSONString(group, true));
        if (groupService.update(group)) {
            model.addAttribute("success", "更新完成");
        } else {
            model.addAttribute("error", "更新失败");
        }
        return "group-update";
    }

    @RequestMapping(value = "/user-list/{group:\\d+}/{page:\\d+}")
    public String listUsers(@PathVariable("group") Long groupId, @PathVariable("page") Long pageNo, Model model, HttpSession session) {

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        if (loginUser.getRole() == null || loginUser.getRole() == Role.EMPTY) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        Group group = groupService.get(groupId);
        Page<User> page;

        /*if (loginUser.getRole() == Role.DIRECTOR || loginUser.getRole() == Role.EMPLOYEE) {
            if (loginUser.getGroup() == null || loginUser.getGroup().getId() != groupId) {
                throw AuthException.create("没有权限", Level.DEBUG);
            }
        }*/
        if (loginUser.getRole() == Role.EMPLOYEE) {
            if (loginUser.getGroup() == null || loginUser.getGroup().getId() != groupId) {
                throw AuthException.create("没有权限", Level.DEBUG);
            }
        }

        page = userService.listByGroup(groupId, pageNo, pageSize);
        model.addAttribute("group", group);
        model.addAttribute("page", page);
        model.addAttribute("path", "/group/user-list/" + groupId);
        return "group-user-list";
    }

    @RequestMapping(value = "/join", method = RequestMethod.POST)
    public String joinUser(Long userId, Long groupId, HttpServletRequest request, HttpSession session) {

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        /*if (loginUser.getRole() == null || (loginUser.getRole() != Role.ADMIN && loginUser.getRole() != Role.MANAGER)) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }*/
        if (loginUser.getRole() == null || (loginUser.getRole() != Role.ADMIN)) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        String referer = request.getHeader("Referer");
        if (referer == null) {
            referer = "/";
        }
        userService.changeGroup(userId, groupId);
        return "redirect:" + referer;
    }

    //alternative, list groups with pagination, (and compound filter), for group manager to select as the user's new group
    @RequestMapping(value = "/user-update/{user:\\d+}", method = RequestMethod.GET)
    public String updateUserGroup(@PathVariable("user") Long userId, Model model, HttpSession session) {

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        /*if (loginUser.getRole() == null || (loginUser.getRole() != Role.ADMIN && loginUser.getRole() != Role.MANAGER)) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }*/
        if (loginUser.getRole() == null || (loginUser.getRole() != Role.ADMIN)) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        User user = userService.get(userId);
        if (user == null) {
            throw HosException.create("用户不存在", Level.DEBUG);
        }
        List<Group> groups = groupService.listAll();
        model.addAttribute("user", user);
        model.addAttribute("groups", groups);
        return "user-group-update";
    }

    @RequestMapping(value = "/user-update/{user:\\d+}", method = RequestMethod.POST)
    public String updateUserGroup(@PathVariable("user") Long userId, @RequestParam(value = "group", required = false) Long groupId, Model model, HttpSession session) {

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        /*if (loginUser.getRole() == null || (loginUser.getRole() != Role.ADMIN && loginUser.getRole() != Role.MANAGER)) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }*/
        if (loginUser.getRole() == null || (loginUser.getRole() != Role.ADMIN)) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        if (userService.changeGroup(userId, groupId)) {
            model.addAttribute("success", "修改用户部门完成");
        } else {
            model.addAttribute("error", "修改用户部门失败");
        }
        User user = userService.get(userId);
        List<Group> groups = groupService.listAll();
        model.addAttribute("user", user);
        model.addAttribute("groups", groups);
        return "user-group-update";
    }
}