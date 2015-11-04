package com.syzc.sseip.controller;

import com.alibaba.fastjson.JSON;
import com.syzc.sseip.entity.Group;
import com.syzc.sseip.entity.User;
import com.syzc.sseip.entity.UserDto;
import com.syzc.sseip.entity.UserLogon;
import com.syzc.sseip.entity.enumtype.Role;
import com.syzc.sseip.service.GroupService;
import com.syzc.sseip.service.UserService;
import com.syzc.sseip.util.HosException;
import com.syzc.sseip.util.Page;
import com.syzc.sseip.util.exception.AuthException;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.LinkedList;
import java.util.List;
import java.util.regex.Pattern;

@Controller
@RequestMapping("/user")
public class UserController {
    protected static final Pattern idNPattern = Pattern.compile("\\d{17}[\\dxX]");
    private static final Logger logger = Logger.getLogger(UserController.class);
    public final Byte pageSize = 10;

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

    // update others
    @RequestMapping(value = "/update/{userid:[\\d]+}", method = RequestMethod.GET)
    public String updateUser(@PathVariable("userid") Long userId, Model model, HttpServletRequest request, HttpSession session) {

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
//        System.out.println(JSON.toJSONString(loginUser, true));

        /*if (loginUser.getRole() == null || (loginUser.getRole() != Role.ADMIN && loginUser.getRole() != Role.MANAGER && loginUser.getRole() != Role.EMPLOYEE)) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }*/
        if (loginUser.getRole() == null || (loginUser.getRole() != Role.ADMIN && loginUser.getRole() != Role.EMPLOYEE)) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        //合并了不同种类操作； 普通雇员只能修改自己的资料
        if (loginUser.getRole() == Role.EMPLOYEE && !loginUser.getId().equals(userId)) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        String referer = request.getHeader("Referer");
        if (referer == null) {
            referer = "/";
        }
        User user = userService.get(userId);
        if (user == null) {
            throw HosException.create("对应的用户不存在", Level.TRACE);
        }
        model.addAttribute("user", user);
        model.addAttribute("referer", referer);
        model.addAttribute("path", "/users/update");
        return "/user-update";
    }

    @RequestMapping(value = "/update/{userid:[\\d]+}", method = RequestMethod.POST)
    public String updateUser(@PathVariable("userid") Long userId, @RequestParam("referer") String referer, User user, Model model, HttpSession session) {

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        /*if (loginUser.getRole() == null || (loginUser.getRole() != Role.ADMIN && loginUser.getRole() != Role.MANAGER && loginUser.getRole() != Role.EMPLOYEE)) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }*/
        if (loginUser.getRole() == null || (loginUser.getRole() != Role.ADMIN && loginUser.getRole() != Role.EMPLOYEE)) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        if (loginUser.getRole() == Role.EMPLOYEE && !loginUser.getId().equals(userId)) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        user.setId(userId);
        logger.trace(JSON.toJSONString(user, true));
        if (userService.update(user)) {
            user = userService.get(userId);
            logger.trace(JSON.toJSONString(user, true));
            model.addAttribute("user", user);
            model.addAttribute("referer", referer);
            model.addAttribute("path", "/users/update");
            model.addAttribute("success", "修改完成！");
            return "/user-update";
        } else {
            throw HosException.create("管理员修改用户信息错误", Level.WARN);
        }
    }

    /*@RequestMapping(value = "/remove/{userid:[\\d]+}")
    public String removeUser(@PathVariable("userid") Long userId, HttpServletRequest request, HttpSession session) {

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        *//*if (loginUser.getRole() == null || (loginUser.getRole() != Role.ADMIN && loginUser.getRole() != Role.MANAGER)) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }*//*
        if (loginUser.getRole() == null || (loginUser.getRole() != Role.ADMIN)) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        String referer = request.getHeader("Referer");
        if (referer == null) {
            referer = "/";
        }
        if (userService.remove(userId)) {
//            model.addAttribute("success", "移除完成！");
            return "redirect:" + referer;
        } else {
            throw HosException.create("删除用户操作没有执行成功", Level.WARN);
        }
    }*/

    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    public String removeUserPost(@RequestParam("id") Long userId, HttpServletRequest request, HttpSession session) {

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
        if (userService.remove(userId)) {
//            model.addAttribute("success", "移除完成！");
            return "redirect:" + referer;
        } else {
            throw HosException.create("删除用户操作没有执行成功", Level.WARN);
        }
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addUser(Model model, HttpSession session) {

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        /*if (loginUser.getRole() == null || (loginUser.getRole() != Role.ADMIN && loginUser.getRole() != Role.MANAGER)) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }*/
        if (loginUser.getRole() == null || (loginUser.getRole() != Role.ADMIN)) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        model.addAttribute("roleTypes", Role.values());
        return "/user-add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addUser(User form, @RequestParam("confirmPwd") String confirmPwd, Model model, HttpSession session) {
//        logger.trace(JSON.toJSONString(form, true));

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        /*if (loginUser.getRole() == null || (loginUser.getRole() != Role.ADMIN && loginUser.getRole() != Role.MANAGER)) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }*/
        if (loginUser.getRole() == null || (loginUser.getRole() != Role.ADMIN)) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        boolean state = true;
        List<String> errors = new LinkedList<>();
        if (form.getPassword() == null || !form.getPassword().equals(confirmPwd)) {
            errors.add("密码不匹配");
            state = false;
        }

/*
        Matcher m = idNPattern.matcher(form.getIdNumber());
        if (!m.matches()) {
            errors.add("身份证号码格式错误");
            logger.trace("错误的身份证号码: " + form.getIdNumber());
            state = false;
        }
        int age = form.getAge();
        int calcAge = AgeUtil.calc(form.getIdNumber());
        if (age != calcAge) {
            errors.add("身份证年龄不匹配");
            logger.trace(String.format("错误的身份证号码与年龄关系: %s,\t%s", form.getIdNumber(), age));
            state = false;
        }
*/

        if (!state) {
//            System.out.println(JSON.toJSONString(errors, true));
            model.addAttribute("roleTypes", Role.values());
            model.addAttribute("form", form);
            model.addAttribute("errors", errors);
            return "/user-add";
        }
        if (form.getRole() == null) {
            form.setRole(Role.EMPTY);
        }
        form = userService.add(form);
        return "redirect:/user/list/1";
    }

    @RequestMapping("/list/{page:\\d+}")
    public String list(@PathVariable("page") Long pageNo, Model model, HttpSession session) {

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        /*if (loginUser.getRole() == null || (loginUser.getRole() != Role.ADMIN && loginUser.getRole() != Role.MANAGER && loginUser.getRole() != Role.DIRECTOR && loginUser.getRole() != Role.EMPLOYEE)) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }*/
        if (loginUser.getRole() == null || (loginUser.getRole() != Role.ADMIN && loginUser.getRole() != Role.EMPLOYEE)) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        Page<User> page;
        /*if (loginUser.getRole() == Role.DIRECTOR || loginUser.getRole() == Role.EMPLOYEE) {
            if (loginUser.getGroupId() == null) {
                throw AuthException.create("没有权限", Level.DEBUG);
            }
            page = userService.listByGroup(loginUser.getGroupId(), pageNo, pageSize);
        } else {
            page = userService.list(pageNo, pageSize);
        }*/
        if (loginUser.getRole() == Role.EMPLOYEE) {
            if (loginUser.getGroupId() == null) {
                throw AuthException.create("没有权限", Level.DEBUG);
            }
            page = userService.listByGroup(loginUser.getGroupId(), pageNo, pageSize);
        } else {
            page = userService.list(pageNo, pageSize);
        }

        model.addAttribute("page", page);
        model.addAttribute("path", "/user/list");
        return "/user-list";
    }

    @RequestMapping("/by-dept/{dept:\\d+}/{page:\\d+}")
    public String listByGroup(@PathVariable("dept") Long groupId, @PathVariable("page") Long pageNo, Model model, HttpSession session) {

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        /*if (loginUser.getRole() == null || (loginUser.getRole() != Role.ADMIN && loginUser.getRole() != Role.MANAGER && loginUser.getRole() != Role.DIRECTOR)) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }*/
        if (loginUser.getRole() == null || (loginUser.getRole() != Role.ADMIN && loginUser.getRole() != Role.EMPLOYEE)) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }
        if (loginUser.getRole() == Role.EMPLOYEE && loginUser.getGroupId() != groupId) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }


        /*if (loginUser.getRole() == Role.DIRECTOR && !groupId.equals(loginUser.getGroupId())) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }*/

        Group group = groupService.get(groupId);
        if (group == null) {
            throw HosException.create("用户组不存在", Level.DEBUG);
        }
        Page<User> page = userService.listByGroup(groupId, pageNo, pageSize);
        model.addAttribute("page", page);
        model.addAttribute("group", group);
        return "/user-list-by-dept";
    }

    @RequestMapping(value = "profile/{id:\\d+}")
    public String profile(@PathVariable("id") Long userId, Model model, HttpSession session) {

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        /*if (loginUser.getRole() == null || (loginUser.getRole() != Role.ADMIN && loginUser.getRole() != Role.MANAGER && loginUser.getRole() != Role.DIRECTOR && loginUser.getRole() != Role.EMPLOYEE)) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }*/
        if (loginUser.getRole() == null || (loginUser.getRole() != Role.ADMIN)) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        User user = userService.get(userId);

        //主任查看本部门用户资料
        /*if (loginUser.getRole() == Role.DIRECTOR && user != null && !loginUser.getGroupId().equals(user.getGroupId())) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }*/

        if (user == null) {
            throw HosException.create("查无此人", Level.DEBUG);
        }

        model.addAttribute("user", user);
        return "/user-m-profile";
    }

    @RequestMapping(value = "profile")
    public String profile(Model model, HttpSession session) {

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        if (loginUser.getRole() == null) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }
        User user = userService.get(loginUser.getId());
        session.setAttribute("loginUser", user);

        if (user == null) {
            throw HosException.create("查无此人", Level.DEBUG);
        }

        model.addAttribute("user", user);
        return "/profile-self";
    }

    @RequestMapping(value = "/{userId:\\d+}/log-on-history/{pageNo:\\d+}")
    public String logOnHistory(@PathVariable Long userId, @PathVariable Long pageNo, Model model, HttpSession session) {
        User login = (User) session.getAttribute("loginUser");

        if (login.getRole() != Role.ADMIN) {
            throw HosException.create("没有权限", Level.TRACE);
        }
        User user = userService.get(userId);
        Page<UserLogon> page = userService.listUserLogonByUser(userId, pageNo, (short) pageSize);

        model.addAttribute("user", user);
        model.addAttribute("page", page);

        return "/user-individual-logon-history";
    }

    @RequestMapping(value = "update-password", method = RequestMethod.GET)
    public String updatePassword(Model model, HttpSession session) {
        User user = (User) session.getAttribute("loginUser");
        model.addAttribute("user", user);
        return "user-update-password";
    }

    @RequestMapping(value = "update-password", method = RequestMethod.POST)
    public String updatePassword(String oldPassword, String newPassword, String confirmPassword, HttpSession session) {
        if (!newPassword.equals(confirmPassword)) {
            throw HosException.create("确认密码不匹配", Level.DEBUG);
        }
/*
        if (newPassword.length()<6) {
            throw HosException.create("新密码长度太小", Level.DEBUG);
        }
*/
        Long userId = (Long) session.getAttribute("loginUserId");
        if (userService.updatePassword(userId, oldPassword, newPassword)) {
            return "redirect:/";
        } else {
            throw HosException.create("密码更改失败", Level.DEBUG);
        }
    }
}