package com.syzc.sseip.controller;

import com.alibaba.fastjson.JSON;
import com.syzc.sseip.entity.Customer;
import com.syzc.sseip.entity.Group;
import com.syzc.sseip.entity.User;
import com.syzc.sseip.entity.UserDto;
import com.syzc.sseip.entity.enumtype.HospitalizationType;
import com.syzc.sseip.entity.enumtype.Role;
import com.syzc.sseip.entity.enumtype.Sex;
import com.syzc.sseip.entity.enumtype.pasture.AccessPointType;
import com.syzc.sseip.service.*;
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
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/customer")
public class CustomerController {
    private static final Logger logger = Logger.getLogger(CustomerController.class);
    public final Byte pageSize = 10;

    private CountryService countryService;
    private DiseaseTypeService diseaseTypeService;
    private WebsiteService websiteService;

    private CustomerService customerService;
    private GroupService groupService;
    private UserService userService;

    @Resource
    public void setCountryService(CountryService countryService) {
        this.countryService = countryService;
    }

    @Resource
    public void setDiseaseTypeService(DiseaseTypeService diseaseTypeService) {
        this.diseaseTypeService = diseaseTypeService;
    }

    @Resource
    public void setWebsiteService(WebsiteService websiteService) {
        this.websiteService = websiteService;
    }

    @Resource
    public void setCustomerService(CustomerService customerService) {
        this.customerService = customerService;
    }

    @Resource
    public void setGroupService(GroupService groupService) {
        this.groupService = groupService;
    }

    @Resource
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    //    @RequestMapping(value = "/list/{page:\\d+}")
    public String list(@PathVariable("page") Long pageNo, Model model, HttpSession session) {
        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        if (loginUser.getRole() == null || loginUser.getRole() == Role.EMPTY) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        Page<Customer> page;
        if (loginUser.getRole() == Role.DIRECTOR || loginUser.getRole() == Role.EMPLOYEE) {
            if (loginUser.getGroupId() == null) {
                throw AuthException.create("没有权限", Level.DEBUG);
            }
            page = customerService.listByGroup(loginUser.getGroupId(), pageNo, pageSize);
        } else {
            //admin || manager
            page = customerService.list(pageNo, pageSize);
        }

        model.addAttribute("page", page);
        model.addAttribute("path", "/customer/list");
        return "customer-list";
    }

    @RequestMapping(value = "/filter/{page:\\d+}")
    public String filter(
            @RequestParam(value = "dateRange", required = false) Long[] dateRange,
            @RequestParam(required = false) Long websiteId,
            @RequestParam(required = false) String tel,
            @RequestParam(required = false) String name,
            @RequestParam(required = false) Long countryId,
            @RequestParam(required = false) Long userId,
            @RequestParam(required = false) String email,
            @RequestParam(required = false) Long diseaseTypeId,
            @RequestParam(required = false) Boolean valid,
            @RequestParam(required = false) HospitalizationType hospitalization,
            @RequestParam(required = false) Byte stars,
            @PathVariable("page") Long pageNo, Model model, HttpSession session, HttpServletRequest request) {

        Date till = null;
        Date since = null;
        if (dateRange != null && dateRange.length == 2) {
            since = new Date(dateRange[0]);
            till = new Date(dateRange[1]);
        }
//        System.out.println(Arrays.toString(dateRange));
//        System.out.println(since);
//        System.out.println(till);

//        System.out.println(Arrays.asList(sex, website, accessPointType, diseaseType, faraway, emergency, groupId, userId));

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        if (loginUser.getRole() == null || loginUser.getRole() == Role.EMPTY) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        Page<Customer> page;
        if (loginUser.getRole() == Role.DIRECTOR || loginUser.getRole() == Role.EMPLOYEE) {
            if (loginUser.getGroupId() == null) {
                throw AuthException.create("没有权限", Level.DEBUG);
            }
            // check groupId range ..?
            page = customerService.listByFilter(since, till, websiteId, tel, name, countryId, userId, email, diseaseTypeId, valid, hospitalization, stars, pageNo, pageSize);
        } else {
            //admin || manager
            page = customerService.listByFilter(since, till, websiteId, tel, name, countryId, userId, email, diseaseTypeId, valid, hospitalization, stars, pageNo, pageSize);
//            page = customerService.listByFilter(sex, website, accessPointType, diseaseType, faraway, emergency, since, till,
//                    groupId, userId, pageNo, pageSize);
        }

        List<Group> groups = new ArrayList<>();
        List<User> users = new ArrayList<>();
        if (loginUser.getRole() == Role.ADMIN || loginUser.getRole() == Role.MANAGER) {
            groups = groupService.listAll();
            users = userService.list(1L, Byte.MAX_VALUE).getList();
        } else {
            if (loginUser.getRole() == Role.DIRECTOR || loginUser.getRole() == Role.EMPLOYEE) {
                Group group = groupService.get(loginUser.getGroupId());
                groups = Arrays.asList(new Group[]{group});
                users = userService.listByGroup(loginUser.getGroupId(), pageNo, Byte.MAX_VALUE).getList();
            }
        }

        String query = request.getQueryString();
        model.addAttribute("query", query);

        model.addAttribute("groups", groups);
        model.addAttribute("users", users);

        if (dateRange != null && dateRange.length > 0) {
            model.addAttribute("dateRange", new Date[]{since, till});
        }

        model.addAttribute("accessPointTypes", AccessPointType.values());

        model.addAttribute("diseaseTypes", diseaseTypeService.listAll());
        model.addAttribute("sexTypes", Sex.values());
        model.addAttribute("websites", websiteService.listAll());
        model.addAttribute("hospitalizationTypes", HospitalizationType.values());
        model.addAttribute("countries", countryService.listAll());

        model.addAttribute("page", page);
        model.addAttribute("path", "/customer/filter");
        return "customer-filter-list";
    }

    @RequestMapping(value = "/filter-own/{page:\\d+}")
    public String filterOwn(
            @RequestParam(value = "dateRange", required = false) Long[] dateRange,
            @RequestParam(required = false) Long websiteId,
            @RequestParam(required = false) String tel,
            @RequestParam(required = false) String name,
            @RequestParam(required = false) Long countryId,
            @RequestParam(required = false) String email,
            @RequestParam(required = false) Long diseaseTypeId,
            @RequestParam(required = false) Boolean valid,
            @RequestParam(required = false) HospitalizationType hospitalization,
            @RequestParam(required = false) Byte stars,
            @PathVariable("page") Long pageNo, Model model, HttpSession session, HttpServletRequest request) {

        Date till = null;
        Date since = null;
        if (dateRange != null && dateRange.length == 2) {
            since = new Date(dateRange[0]);
            till = new Date(dateRange[1]);
        }
//        System.out.println(Arrays.toString(dateRange));
//        System.out.println(since);
//        System.out.println(till);

//        System.out.println(Arrays.asList(sex, website, accessPointType, diseaseType, faraway, emergency, groupId, userId));

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        if (loginUser.getRole() == null || loginUser.getRole() == Role.EMPTY) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        Page<Customer> page;
        if (loginUser.getRole() == Role.DIRECTOR || loginUser.getRole() == Role.EMPLOYEE) {
            if (loginUser.getGroupId() == null) {
                throw AuthException.create("没有权限", Level.DEBUG);
            }
            // check groupId range ..?
            page = customerService.listByFilter(since, till, websiteId, tel, name, countryId, loginUser.getId(), email, diseaseTypeId, valid, hospitalization, stars, pageNo, pageSize);
        } else {
            //admin || manager
            page = customerService.listByFilter(since, till, websiteId, tel, name, countryId, loginUser.getId(), email, diseaseTypeId, valid, hospitalization, stars, pageNo, pageSize);
//            page = customerService.listByFilter(sex, website, accessPointType, diseaseType, faraway, emergency, since, till,
//                    groupId, userId, pageNo, pageSize);
        }

        List<User> users;
/*
        users = new ArrayList<>();
        if (loginUser.getRole() == Role.ADMIN || loginUser.getRole() == Role.MANAGER) {
            users = userService.list(1L, Byte.MAX_VALUE).getList();
        } else {
            if (loginUser.getRole() == Role.DIRECTOR || loginUser.getRole() == Role.EMPLOYEE) {
                Group group = groupService.get(loginUser.getGroupId());
                users = userService.listByGroup(loginUser.getGroupId(), pageNo, Byte.MAX_VALUE).getList();
            }
        }
*/
        users = userService.listAll();

        String query = request.getQueryString();
        model.addAttribute("query", query);

        model.addAttribute("websiteId", websiteId);
        model.addAttribute("tel", tel);
        model.addAttribute("name", name);
        model.addAttribute("countryId", countryId);
        model.addAttribute("email", email);
        model.addAttribute("diseaseTypeId", diseaseTypeId);
        model.addAttribute("valid", valid);
        model.addAttribute("hospitalization", hospitalization);
        model.addAttribute("stars", stars);

        model.addAttribute("users", users);

        if (dateRange != null && dateRange.length > 0) {
            model.addAttribute("dateRange", new Date[]{since, till});
        }

        model.addAttribute("diseaseTypes", diseaseTypeService.listAll());
        model.addAttribute("sexTypes", Sex.values());
        model.addAttribute("websites", websiteService.listAll());
        model.addAttribute("hospitalizationTypes", HospitalizationType.values());
        model.addAttribute("countries", countryService.listAll());

        model.addAttribute("page", page);
        model.addAttribute("path", "/customer/filter-own");
        return "customer-filter-own-list";
    }

    @RequestMapping(value = "/by-group/{group:\\d+}/{page:\\d+}")
    public String listByGroup(@PathVariable("group") Long groupId, @PathVariable("page") Long pageNo, Model model) {
        Page<Customer> page = customerService.listByGroup(groupId, pageNo, pageSize);
        model.addAttribute("page", page);
        model.addAttribute("path", "/customer/by-group/" + groupId);
        return "customer-list-by-group";
    }

    // should get result of the query as dto
    @RequestMapping(value = "/by-user/{user:\\d+}/{page:\\d+}")
    public String listByUser(@PathVariable("user") Long userId, @PathVariable("page") Long pageNo, Model model) {
        Page<Customer> page = customerService.listByUser(userId, pageNo, pageSize);
        model.addAttribute("page", page);
        model.addAttribute("path", "/customer/by-user/" + userId);
        return "customer-list-by-user";
    }

    // shoutld be a dto, with required details of group and user
    @RequestMapping(value = {"/get/{id:\\d+}", "/detail/{id:\\d+}"})
    public String get(@PathVariable("id") Long id, Model model, HttpSession session) {

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        if (loginUser.getRole() == null || loginUser.getRole() == Role.EMPTY) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        Customer customer = customerService.get(id);

        if (loginUser.getRole() == Role.DIRECTOR && customer != null && loginUser.getGroupId() != null
                && !loginUser.getGroupId().equals(customer.getGroupId())) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        if (loginUser.getRole() == Role.EMPLOYEE && customer != null && !loginUser.getId().equals(customer.getUserId())) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        if (customer == null) {
            throw HosException.create("没有这个客户的资料", Level.DEBUG);
        }

        model.addAttribute("customer", customer);
        return "customer-get";
    }

    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    public String remove(Long id, Model model, HttpServletRequest request, HttpSession session) {

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        if (loginUser.getRole() == null || loginUser.getRole() == Role.EMPTY) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        Customer customer = customerService.get(id);

        if (loginUser.getRole() == Role.DIRECTOR && customer != null && loginUser.getGroupId() != null
                && !loginUser.getGroupId().equals(customer.getGroupId())) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        if (loginUser.getRole() == Role.EMPLOYEE && customer != null && !loginUser.getId().equals(customer.getUserId())) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }
        if (customer == null) {
            throw HosException.create("没有这个客户的资料", Level.DEBUG);
        }

        String referer = request.getHeader("Referer");
        if (referer == null) {
            referer = "/";
        }
        // may present a web page, with links to the source referer, the customer consultance list, the publisher function page
        return "redirect:" + referer;
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(Model model, HttpSession session) {

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        if (loginUser.getRole() == null || loginUser.getRole() == Role.EMPTY) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        model.addAttribute("countries", countryService.listAll());
        model.addAttribute("diseaseTypes", diseaseTypeService.listAll());
        model.addAttribute("websites", websiteService.listAll());

        model.addAttribute("sexTypes", Sex.values());

        model.addAttribute("hospitalizationTypes", HospitalizationType.values());
        return "customer-add";
    }

    // must be a dto, request receiver
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(Customer customer, Model model, HttpSession session) {

        System.out.println(JSON.toJSONString(customer, true));

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        if (loginUser.getRole() == null || loginUser.getRole() == Role.EMPTY) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        User user = (User) session.getAttribute("loginUser");
        customer.setUserId(user.getId());
        customer.setGroupId(user.getGroupId());
        System.out.println(JSON.toJSONString(customer, true));
        //should complete the operation. if failed, some exception should be thrown, about customed "CustomerAddFailException"
        customer = customerService.add(customer);
        System.out.println(JSON.toJSONString(customer, true));

        model.addAttribute("customer", customer);
        // with info label, and links to user console, own role's customer list, or "/", and "add more", and show page with authorized edit links...
        return "customer-added";
    }

    @RequestMapping(value = "/update/{id:\\d+}", method = RequestMethod.GET)
    public String update(@PathVariable("id") Long id, Model model, HttpSession session) {

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        if (loginUser.getRole() == null || loginUser.getRole() == Role.EMPTY) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        //不修改部门和联系人部分
        Customer customer = customerService.get(id);

        if (loginUser.getRole() == Role.DIRECTOR && customer != null && loginUser.getGroupId() != null
                && !loginUser.getGroupId().equals(customer.getGroupId())) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        if (loginUser.getRole() == Role.EMPLOYEE && customer != null && !loginUser.getId().equals(customer.getUserId())) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        if (customer == null) {
            throw HosException.create("没有这个客户的资料", Level.DEBUG);
        }

        model.addAttribute("countries", countryService.listAll());
        model.addAttribute("diseaseTypes", diseaseTypeService.listAll());
        model.addAttribute("websites", websiteService.listAll());

        model.addAttribute("sexTypes", Sex.values());

        model.addAttribute("hospitalizationTypes", HospitalizationType.values());
        model.addAttribute("customer", customer);
        return "customer-update";
    }

    @RequestMapping(value = "/update/{id:\\d+}", method = RequestMethod.POST)
    public String update(@PathVariable("id") Long id, Customer customer, Model model, HttpSession session) {

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        if (loginUser.getRole() == null || loginUser.getRole() == Role.EMPTY) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        Customer oldCustomer = customerService.get(id);

        if (loginUser.getRole() == Role.DIRECTOR && oldCustomer != null && loginUser.getGroupId() != null
                && !loginUser.getGroupId().equals(oldCustomer.getGroupId())) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        if (loginUser.getRole() == Role.EMPLOYEE && oldCustomer != null && !loginUser.getId().equals(oldCustomer.getUserId())) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        if (oldCustomer == null) {
            throw HosException.create("没有这个客户的资料", Level.DEBUG);
        }

        customer.setId(id);
        if (customerService.update(customer)) {
            customer = customerService.get(id);
            model.addAttribute("success", "更新完成");
        } else {
            model.addAttribute("error", "更新失败");
        }
        model.addAttribute("countries", countryService.listAll());
        model.addAttribute("diseaseTypes", diseaseTypeService.listAll());
        model.addAttribute("websites", websiteService.listAll());

        model.addAttribute("sexTypes", Sex.values());

        model.addAttribute("hospitalizationTypes", HospitalizationType.values());
        model.addAttribute("customer", customer);
        return "customer-update";
    }

    @RequestMapping(value = "/pass", method = RequestMethod.POST)
    public String passOn(@RequestParam("new-owner-user-id") Long newOwnerUserId, @RequestParam("customer-ids") Long[] customerIds, Model model, HttpSession session, HttpServletRequest request) {
        if (newOwnerUserId == null) {
            throw HosException.create("目标用户不能为空", Level.DEBUG);
        }
        System.out.println(Arrays.toString(customerIds));
        String referer = request.getHeader("Referer");

        User loginUser = (User) session.getAttribute("loginUser");

        Long count = customerService.passOn(customerIds, newOwnerUserId, loginUser.getId());

        User user = userService.get(newOwnerUserId);
        session.setAttribute("newOwnerUserId", newOwnerUserId);
        session.setAttribute("user", user);
        session.setAttribute("customerIds", customerIds);
        session.setAttribute("passedCount", count);

//        session.setAttribute("referer", referer);

        if (referer == null) {
            referer = request.getContextPath() + "/customer/filter-own/1";
        }
//        return "customer-pass-result";
        return "redirect:" + referer;
    }
}