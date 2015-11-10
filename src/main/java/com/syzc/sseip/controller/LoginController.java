package com.syzc.sseip.controller;

import com.google.code.kaptcha.Producer;
import com.syzc.sseip.entity.User;
import com.syzc.sseip.entity.UserLogon;
import com.syzc.sseip.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import java.util.regex.Pattern;

@Controller
@RequestMapping("/login")
public class LoginController {
    private static final Logger logger = Logger.getLogger(LoginController.class);
    @Resource
    private UserService userService;
    @Resource
    private Producer producer;

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

/*
    public void setProducer(Producer producer) {
        this.producer = producer;
    }
*/

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String login(@RequestParam(required = false) String refer, HttpSession httpSession) {
        if (httpSession.getAttribute("loginUserId") != null) {
            if (refer == null || refer.length() == 0) {
                refer = "/";
            }
            return "redirect:" + refer;
        }
        return "/login";
    }

    @RequestMapping(value = "", method = RequestMethod.POST)
    public String login(@RequestParam("captcha") String captcha, @RequestParam("username") String username,
                        @RequestParam("password") String password, @RequestParam(required = false) String refer,
                        HttpSession httpSession, Model model, HttpServletRequest request) {
        String kaptcha = (String) httpSession.getAttribute("kaptcha");
        if (!captcha.equals(kaptcha)) {
            model.addAttribute("error", "验证码错误");
            return "/login";
        }

        String addr;
        addr = request.getHeader("X-Real-IP");
        if (addr == null) {
            addr = request.getHeader("X-Forwarded-For");
            if (addr == null) {
                addr = request.getRemoteAddr();
            } else {
                int idx = addr.indexOf(',');
                if (idx >= 0) {
                    addr = addr.substring(0, idx);
                }
            }
        }

        User login = userService.login(username, password, addr);
        if (login == null) {
            model.addAttribute("error", "用户名或者密码或者接入IP有错误，是不是忘了。");
//        ContextLoader.getCurrentWebApplicationContext().getServletContext().getServletContextName()
            return "/login";
        }

        UserLogon userLogon;
        userLogon = new UserLogon();
        userLogon.setIp(addr);
        userLogon.setUserId(login.getId());
        userService.saveLogonInfo(userLogon);

        httpSession.setAttribute("loginUser", login);
        httpSession.setAttribute("loginUserId", login.getId());
        if (refer != null) {
            return "redirect:" + refer;
        }
        return "redirect:/welcome";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
//        return "/logout";
        return "redirect:/login";
    }

    @RequestMapping("/captcha")
    public String captcha(HttpSession session, HttpServletResponse response) throws IOException {
        String text = producer.createText();

        BufferedImage bufferedImage = producer.createImage(text);
        session.setAttribute("kaptcha", text);
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        response.setContentType("image/jpeg");
        ImageIO.write(bufferedImage, "jpeg", response.getOutputStream());
        response.getOutputStream().close();
        return null;
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register() {
        return "/register";
    }

    protected static final Pattern idNPattern = Pattern.compile("\\d{17}[\\dxX]");

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(@RequestParam("captcha") String captcha, User form, @RequestParam("confirmPwd") String confirmPwd, Model model, HttpSession httpSession) {
//        logger.trace(JSON.toJSONString(form, true));
//        logger.trace(captcha);
        String kaptcha = (String) httpSession.getAttribute("kaptcha");

        if (!captcha.equals(kaptcha)) {
            model.addAttribute("error", "验证码错误");
            return "/register";
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
            model.addAttribute("form", form);
            model.addAttribute("errors", errors);
            return "/register";
        }
        form = userService.add(form);
        httpSession.setAttribute("loginUser", form);
        httpSession.setAttribute("loginUserId", form.getId());
        return "redirect:/welcome";
    }
}