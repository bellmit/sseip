package com.syzc.sseip.controller;

import com.syzc.sseip.entity.*;
import com.syzc.sseip.entity.enumtype.*;
import com.syzc.sseip.service.*;
import com.syzc.sseip.util.HosException;
import com.syzc.sseip.util.Page;
import com.syzc.sseip.util.exception.AuthException;
import org.apache.commons.lang.StringUtils;
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
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
@RequestMapping("/customer")
public class CustomerController {
    private static final Logger logger = Logger.getLogger(CustomerController.class);
    public final Byte pageSize = 20;

    //    private static final Pattern achorHrefPattern = Pattern.compile("[<]a\\s.*?href\\s*?=\\s*?\"https?://(?!www10.53kf.com)(\\S*?)/|\"", Pattern.DOTALL);
    private static final Pattern achorHrefPattern = Pattern.compile("[<]a\\s.*?href\\s*?=\\s*?\"https?://(?!\\w+.53kf.com)(\\S*?)[?#;/\"]", Pattern.DOTALL);

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

/*
    //    @RequestMapping(value = "/list/{page:\\d+}")
    public String list(@PathVariable("page") Long pageNo, Model model, HttpSession session) {
        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        if (loginUser.getRole() == null || loginUser.getRole() == Role.EMPTY) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        Page<Customer> page;
        */
/*if (loginUser.getRole() == Role.DIRECTOR || loginUser.getRole() == Role.EMPLOYEE) {
            if (loginUser.getGroupId() == null) {
                throw AuthException.create("没有权限", Level.DEBUG);
            }
            page = customerService.listByGroup(loginUser.getGroupId(), pageNo, pageSize);
        } else {
            //admin || manager
            page = customerService.list(pageNo, pageSize);
        }*//*

        if (loginUser.getRole() != Role.ADMIN) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }
        //admin || manager
        page = customerService.list(pageNo, pageSize);

        model.addAttribute("page", page);
        model.addAttribute("path", "/customer/list");
        return "customer-list";
    }
*/

//    @RequestMapping(value = "/filter/{page:\\d+}")
//    public String filterAll(
//            @RequestParam(value = "dateRange", required = false) Long[] dateRange,
//            @RequestParam(required = false) Long websiteId,
//            @RequestParam(required = false) String tel,
//            @RequestParam(required = false) String name,
//            @RequestParam(required = false) Long countryId,
//            @RequestParam(required = false) Long userId,
//            @RequestParam(required = false) String email,
//            @RequestParam(required = false) Long diseaseTypeId,
//            @RequestParam(required = false) Boolean valid,
//            @RequestParam(required = false) HospitalizationType hospitalization,
//            @RequestParam(required = false) Byte stars,
//            @RequestParam(required = false) Boolean discard,
//            @RequestParam(required = false) Boolean ifReport,
//            @PathVariable("page") Long pageNo, Model model, HttpSession session, HttpServletRequest request) {
//
//        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
//
//        Date till = null;
//        Date since = null;
//        if (dateRange != null && dateRange.length == 2) {
//            since = new Date(dateRange[0]);
//            till = new Date(dateRange[1]);
//        }
//
////        System.out.println(Arrays.toString(dateRange));
////        System.out.println(since);
////        System.out.println(till);
//
////        System.out.println(Arrays.asList(sex, website, accessPointType, diseaseType, faraway, emergency, groupId, userId));
//
//        /*if (loginUser.getRole() == null || loginUser.getRole() == Role.EMPTY) {
//            throw AuthException.create("没有权限", Level.DEBUG);
//        }*/
//
//        Page<Customer> page;
//        /*if (loginUser.getRole() == Role.DIRECTOR || loginUser.getRole() == Role.EMPLOYEE) {
//            if (loginUser.getGroupId() == null) {
//                throw AuthException.create("没有权限", Level.DEBUG);
//            }
//            // check groupId range ..?
//            page = customerService.listByFilter(since, till, websiteId, tel, name, countryId, userId, email, diseaseTypeId, valid, hospitalization, stars, pageNo, pageSize);
//        } else {
//            //admin || manager
//            page = customerService.listByFilter(since, till, websiteId, tel, name, countryId, userId, email, diseaseTypeId, valid, hospitalization, stars, pageNo, pageSize);
////            page = customerService.listByFilter(sex, website, accessPointType, diseaseType, faraway, emergency, since, till,
////                    groupId, userId, pageNo, pageSize);
//        }*/
//        if (loginUser.getRole() != Role.ADMIN && loginUser.getRole() != Role.TELADMIN) {
//            throw AuthException.create("没有权限", Level.DEBUG);
//        }
//
//        //测试参数编码格式， 遇到get请求name解码错误， 因为服务器解析url参数设置编码格式。
////        System.out.println("since, till, websiteId, tel, name, countryId, userId, email, diseaseTypeId, valid, hospitalization, stars, discard, ifReport, pageNo, pageSize");
////        System.out.println(Arrays.toString(new Object[]{since, till, websiteId, tel, name, countryId, userId, email, diseaseTypeId, valid, hospitalization, stars, discard, ifReport, pageNo, pageSize}));
///*
//        if (name != null) {
//            try {
//                System.out.println(new String(name.getBytes("ISO8859-1"), "UTF-8"));
//            } catch (UnsupportedEncodingException e) {
//                e.printStackTrace();
//            }
//        }
//*/
//
//        //admin || manager
//        page = customerService.listByFilter(since, till, websiteId, tel, name, countryId, userId, email, diseaseTypeId,
//                valid, hospitalization, stars, discard, ifReport, pageNo, pageSize);
//
////            page = customerService.listByFilter(sex, website, accessPointType, diseaseType, faraway, emergency, since, till,
////                    groupId, userId, pageNo, pageSize);
//
//        List<Group> groups = new ArrayList<>();
//        List<User> users = new ArrayList<>();
//        /*if (loginUser.getRole() == Role.ADMIN || loginUser.getRole() == Role.MANAGER) {
//            groups = groupService.listAll();
//            users = userService.list(1L, Byte.MAX_VALUE).getList();
//        } else {
//            if (loginUser.getRole() == Role.DIRECTOR || loginUser.getRole() == Role.EMPLOYEE) {
//                Group group = groupService.get(loginUser.getGroupId());
//                groups = Arrays.asList(new Group[]{group});
//                users = userService.listByGroup(loginUser.getGroupId(), pageNo, Byte.MAX_VALUE).getList();
//            }
//        }*/
//        groups = groupService.listAll();
//        users = userService.list(1L, Byte.MAX_VALUE).getList();
//
//        String query = request.getQueryString();
//        model.addAttribute("query", query);
//
//        model.addAttribute("groups", groups);
//        model.addAttribute("users", users);
//
//        if (dateRange != null && dateRange.length > 0) {
//            model.addAttribute("dateRange", new Date[]{since, till});
//        }
//
//        model.addAttribute("diseaseTypes", diseaseTypeService.listAll());
//        model.addAttribute("sexTypes", Sex.values());
//        model.addAttribute("websites", websiteService.listAll());
//        model.addAttribute("hospitalizationTypes", HospitalizationType.values());
//        model.addAttribute("countries", countryService.listAll());
//
//        model.addAttribute("page", page);
//        model.addAttribute("path", "/customer/filter");
//        return "customer-filter-list";
//    }

    //    ,{dateRangeR:\d+}
//    @RequestMapping(value = "/filterA/{dateRangeL:[^,]*},{dateRangeR:\\d*}")
    @RequestMapping(value = {"/filter", "/filter/{dateRangeL:[^|]*}|{dateRangeR:[^|]*}|{websiteId:\\d*}|{userId:\\d*}|" +
            "{ifReport:[^|]*}|{hospitalization:\\d*}|{name:[^|]*}|{email:[^|]*}|{tel:[^|]*}|{valid:\\d*}|" +
            "{discard:\\d*}|{stars:0|1|2|3|4|5|}|{countryId:\\d*}|{diseaseTypeId:\\d*}"})
    public String filterAll(@RequestParam(value = "page", defaultValue = "1") Long pageNo, CustomerQueryDto dto, HttpSession session, Model model, HttpServletRequest request) {
        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        if (loginUser.getRole() != Role.ADMIN && loginUser.getRole() != Role.TELADMIN) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        Page<Customer> page = customerService.listByFilterA(dto, pageNo, pageSize);

        List<User> users = userService.list(1L, Byte.MAX_VALUE).getList();
        model.addAttribute("query", dto);
        model.addAttribute("users", users);

        model.addAttribute("diseaseTypes", diseaseTypeService.listAll());
        model.addAttribute("sexTypes", Sex.values());
        model.addAttribute("websites", websiteService.listAll());
        model.addAttribute("hospitalizationTypes", HospitalizationType.values());
        model.addAttribute("countries", countryService.listAll());

        model.addAttribute("page", page);
        model.addAttribute("path", request.getRequestURI());
        model.addAttribute("basePath", "/customer/filter");
        return "customer-filter-list";
    }

    //    @RequestMapping(value = "/filter-own/{page:\\d+}")
    @RequestMapping(value = {"/filter-own", "/filter-own/{dateRangeL:[^|]*}|{dateRangeR:[^|]*}|{websiteId:\\d*}|{ifReport:[^|]*}" +
            "|{hospitalization:\\d*}|{name:[^|]*}|{email:[^|]*}|{tel:[^|]*}|{valid:\\d*}|{discard:\\d*}" +
            "|{countryId:\\d*}|{diseaseTypeId:\\d*}"})
    public String filterOwn(@RequestParam(value = "page", defaultValue = "1") Long pageNo, CustomerQueryDto dto, HttpSession session, Model model, HttpServletRequest request) {
        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        if (loginUser.getRole() != Role.EMPLOYEE) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        Page<Customer> page;
        dto.setUserId(loginUser.getId());
        page = customerService.listByFilterA(dto, pageNo, pageSize);

        List<User> users;
        if (loginUser.getGroupId() != null) {
            users = userService.listAllByGroup(loginUser.getGroupId());
        } else {
            users = new ArrayList<>();
        }

        model.addAttribute("query", dto);
        model.addAttribute("users", users);

        model.addAttribute("diseaseTypes", diseaseTypeService.listAll());
        model.addAttribute("sexTypes", Sex.values());
        model.addAttribute("websites", websiteService.listAll());
        model.addAttribute("hospitalizationTypes", HospitalizationType.values());
        model.addAttribute("countries", countryService.listAll());

        model.addAttribute("page", page);
        model.addAttribute("path", request.getRequestURI());
        model.addAttribute("basePath", "/customer/filter-own");
        return "customer-filter-own-list";
    }

/*
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
            @RequestParam(required = false) Boolean discard,
            @RequestParam(required = false) Boolean ifReport,
            @PathVariable("page") Long pageNo, Model model, HttpSession session, HttpServletRequest request) {

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        if (loginUser.getRole() != Role.EMPLOYEE) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

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

        Page<Customer> page;

        page = customerService.listByFilter(since, till, websiteId, tel, name, countryId, loginUser.getId(), email,
                diseaseTypeId, valid, hospitalization, stars, discard, ifReport, pageNo, pageSize);

        List<User> users;
*/
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
*//*

        if (loginUser.getGroupId() != null) {
            users = userService.listAllByGroup(loginUser.getGroupId());
        } else {
            users = new ArrayList<>();
        }

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
*/

    @RequestMapping(value = "/revisit/today")
    public String revisitTodayList(@RequestParam(required = false, defaultValue = "1", value = "page") Long pageNo, HttpSession session, Model model) {
        Long userId = (Long) session.getAttribute("loginUserId");
        Page<Customer> page = customerService.pageRevisitTodayByUser(userId, pageNo, (int) pageSize);
        model.addAttribute("page", page);
        model.addAttribute("path", "/customer/revisit/today");
        return "customer-revisit-today-list";
    }

    @RequestMapping(value = "/revisit/week")
    public String revisitWeekList(@RequestParam(required = false, defaultValue = "1", value = "page") Long pageNo, HttpSession session, Model model) {
        Long userId = (Long) session.getAttribute("loginUserId");
        Page<Customer> page = customerService.pageRevisitWeekByUser(userId, pageNo, (int) pageSize);
        model.addAttribute("page", page);
        model.addAttribute("path", "/customer/revisit/week");
        return "customer-revisit-week-list";
    }

    @RequestMapping(value = "/revisit/month")
    public String revisitMonthList(@RequestParam(required = false, defaultValue = "1", value = "page") Long pageNo, HttpSession session, Model model) {
        Long userId = (Long) session.getAttribute("loginUserId");
        Page<Customer> page = customerService.pageRevisitMonthByUser(userId, pageNo, (int) pageSize);
        model.addAttribute("page", page);
        model.addAttribute("path", "/customer/revisit/month");
        return "customer-revisit-month-list";
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

        /*if (loginUser.getRole() == Role.DIRECTOR && customer != null && loginUser.getGroupId() != null
                && !loginUser.getGroupId().equals(customer.getGroupId())) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }*/

        if (loginUser.getRole() == Role.EMPLOYEE && customer != null && !loginUser.getId().equals(customer.getOwnerUserId())) {
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
        /*if (loginUser.getRole() == null || loginUser.getRole() == Role.EMPTY) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }*/
        if (loginUser.getRole() == null || loginUser.getRole() != Role.ADMIN) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        Customer customer = customerService.get(id);

        /*if (loginUser.getRole() == Role.DIRECTOR && customer != null && loginUser.getGroupId() != null
                && !loginUser.getGroupId().equals(customer.getGroupId())) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }*/

        /*if (loginUser.getRole() == Role.EMPLOYEE && customer != null && !loginUser.getId().equals(customer.getOwnerUserId())) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }*/
        if (customer == null) {
            throw HosException.create("没有这个客户的资料", Level.DEBUG);
        }
        customerService.remove(id);

        String referer = request.getHeader("Referer");
        if (referer == null) {
            referer = "/default";
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
    public String add(String memoItem, Customer customer, Model model, HttpSession session) {

//        System.out.println(JSON.toJSONString(customer, true));

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        if (loginUser.getRole() == null || loginUser.getRole() == Role.EMPTY) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        if (customer.getContactRecords() != null) {
            Matcher m = achorHrefPattern.matcher(customer.getContactRecords());
            if (m.find()) {
                customer.setSourceWebsite(m.group(1));
            } else {
//                System.out.println("source website not found");
            }
        } else {
//            System.out.println("contact records null");
        }

        User user = (User) session.getAttribute("loginUser");
        customer.setUserId(user.getId());
        customer.setGroupId(user.getGroupId());
//        System.out.println(JSON.toJSONString(customer, true));
        //should complete the operation. if failed, some exception should be thrown, about customed "CustomerAddFailException"
        customer = customerService.add(customer);
//        System.out.println(JSON.toJSONString(customer, true));
        if (customer == null) {
            throw HosException.create("添加出错", Level.DEBUG);
        } else {
            // 添加 memoItem 备注栏
            if (!StringUtils.isBlank(memoItem)) {
                customerService.addMemo(memoItem, customer.getId(), user.getId());
            }

            model.addAttribute("success", "");
            return "redirect:/customer/add";
        }


//        model.addAttribute("customer", customer);
        // with info label, and links to user console, own role's customer list, or "/", and "add more", and show page with authorized edit links...
//        return "customer-added";
//        return "redirect:/customer/filter-own/1";
    }

    @RequestMapping(value = "/update/{id:\\d+}", method = RequestMethod.GET)
    public String update(@PathVariable("id") Long id, @RequestParam(required = false) String referer, Model model, HttpSession session, HttpServletRequest request) {

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
//        if (loginUser.getRole() == null || loginUser.getRole() == Role.EMPTY) {
        if (loginUser.getRole() != Role.EMPLOYEE) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        //不修改部门和联系人部分
        Customer customer = customerService.get(id);

        /*if (loginUser.getRole() == Role.DIRECTOR && customer != null && loginUser.getGroupId() != null
                && !loginUser.getGroupId().equals(customer.getGroupId())) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }*/

        /*if (customer != null && loginUser.getGroupId() != null && !loginUser.getGroupId().equals(customer.getGroupId())) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }*/

        if (loginUser.getRole() == Role.EMPLOYEE && customer != null && !loginUser.getId().equals(customer.getOwnerUserId())) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        if (customer == null) {
            throw HosException.create("没有这个客户的资料", Level.DEBUG);
        }

        if (referer == null) {
            referer = request.getHeader("Referer");// may be still null
        }
        model.addAttribute("referer", referer);

        model.addAttribute("countries", countryService.listAll());
        model.addAttribute("diseaseTypes", diseaseTypeService.listAll());
        model.addAttribute("websites", websiteService.listAll());

        model.addAttribute("sexTypes", Sex.values());

        model.addAttribute("hospitalizationTypes", HospitalizationType.values());
        model.addAttribute("customer", customer);
        return "customer-update";
    }

    @RequestMapping(value = "/update/{id:\\d+}", method = RequestMethod.POST)
    public String update(@PathVariable("id") Long id, String memoItem, Customer customer, @RequestParam(required = false) String referer, Model model, HttpSession session) {

        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
//        if (loginUser.getRole() == null || loginUser.getRole() == Role.EMPTY) {
        if (loginUser.getRole() != Role.EMPLOYEE) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        Customer oldCustomer = customerService.get(id);

        /*if (loginUser.getRole() == Role.DIRECTOR && oldCustomer != null && loginUser.getGroupId() != null
                && !loginUser.getGroupId().equals(oldCustomer.getGroupId())) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }*/

        if (loginUser.getRole() == Role.EMPLOYEE && oldCustomer != null && !loginUser.getId().equals(oldCustomer.getOwnerUserId())) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        if (oldCustomer == null) {
            throw HosException.create("没有这个客户的资料", Level.DEBUG);
        }

        customer.setId(id);

        if (customer.getContactRecords() != null) {
            Matcher m = achorHrefPattern.matcher(customer.getContactRecords());
            if (m.find()) {
                customer.setSourceWebsite(m.group(1));
            } else {
//                System.out.println("source website not found");
            }
        } else {
//            System.out.println("contact records null");
        }

        if (memoItem != null && memoItem.length() > 0 && !memoItem.matches("\\s*")) {
            if (customerService.addMemo(memoItem, id, loginUser.getId())) {
//                model.addAttribute("success", "备注添加完成");
            } else {
//                model.addAttribute("error", "备注添加失败");
            }
        }

        if (customerService.update(customer)) {
//            model.addAttribute("success", "更新完成");
            if (referer == null || referer.equals("")) {
                referer = "/default";
            }
            return "redirect:" + referer;
        } else {
//            model.addAttribute("error", "更新失败");
        }

        customer = customerService.get(id);

        model.addAttribute("referer", referer);

        model.addAttribute("countries", countryService.listAll());
        model.addAttribute("diseaseTypes", diseaseTypeService.listAll());
        model.addAttribute("websites", websiteService.listAll());

        model.addAttribute("sexTypes", Sex.values());

        model.addAttribute("hospitalizationTypes", HospitalizationType.values());
        model.addAttribute("customer", customer);

//        return "customer-update";
        return "customer-update";
    }

    @RequestMapping(value = "/append-memo", method = RequestMethod.POST)
    public String addMemo(String memoItem, Long customerId, Model model, HttpSession session) {
        Long loginUserId = (Long) session.getAttribute("loginUserId");
        boolean state = false;
        try {
            state = customerService.addMemo(memoItem, customerId, loginUserId);
        } catch (Exception e) {
            logger.debug(e);
        }
        model.addAttribute("memos", customerService.listAllMemo(customerId));
        return "customer-update-memo-fragment";
    }

    //目前只有普通用户操作； dao更新操作只执行对应当前登录用户id的项
    @RequestMapping(value = "/pass", method = RequestMethod.POST)
    public String updateOwner(@RequestParam("new-owner-user-id") Long newOwnerUserId,
                              @RequestParam(value = "customer-ids", required = false) Long[] customerIds,
                              Model model, HttpSession session, HttpServletRequest request) {
        if (newOwnerUserId == null) {
            throw HosException.create("目标用户不能为空", Level.DEBUG);
        }
        if (customerIds == null || customerIds.length == 0) {
            throw HosException.create("选中患者资料数量为空", Level.DEBUG);
        }

        User loginUser = (User) session.getAttribute("loginUser");
        if (loginUser == null || loginUser.getRole() == null || loginUser.getRole() != Role.EMPLOYEE) {
            throw AuthException.create("没有权限", Level.TRACE);
        }

//        System.out.println(Arrays.toString(customerIds));
        String referer = request.getHeader("Referer");

        Long count = customerService.updateOwner(customerIds, newOwnerUserId, loginUser.getId());

        User user = userService.get(newOwnerUserId);
/*
        session.setAttribute("newOwnerUserId", newOwnerUserId);
        session.setAttribute("user", user);
        session.setAttribute("customerIds", customerIds);
        session.setAttribute("passedCount", count);
*/

//        session.setAttribute("referer", referer);

        if (referer == null) {
            referer = "/default";
        }
//        return "customer-pass-result";
        return "redirect:" + referer;
    }

    //只有普通用户操作
    @RequestMapping(value = "update-discard", method = RequestMethod.POST)
    public String updateDiscard(@RequestParam("id") Long customerId, Boolean discard, HttpServletRequest request, HttpSession session) {
        String referer = request.getHeader("Referer");
        if (referer == null) {
//            referer = request.getContextPath();
            referer = "/default";
        }
        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
        customerService.updateDiscard(customerId, discard, loginUser.getId());
        return "redirect:" + referer;
    }

    @RequestMapping(value = "/{id:\\d+}/update-by-tel-admin", method = RequestMethod.GET)
    public String updateMemo(@PathVariable Long id, @RequestParam(required = false) String referer, Model model, HttpServletRequest request, HttpSession session) {
        UserDto loginUser = (UserDto) session.getAttribute("loginUser");

        if (loginUser.getRole() != Role.TELADMIN) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }
        if (referer == null) {
            referer = request.getHeader("Referer");// may be still null
        }
        Customer customer = customerService.get(id);
        if (customer == null) {
            throw HosException.create("没有这个客户的资料", Level.DEBUG);
        }

        model.addAttribute("customer", customer);
        model.addAttribute("hospitalizationTypes", HospitalizationType.values());
        model.addAttribute("weights", Weight.values());
        model.addAttribute("callStates", CallState.values());

        return "customer-memo-udpate-by-tel-admin";
    }

    @RequestMapping(value = "/{id:\\d+}/update-by-tel-admin", method = RequestMethod.POST)
    public String updateMemo(@PathVariable("id") Long customerId, TelAuditDto telAuditDto, @RequestParam(required = false) String referer, Model model, HttpServletRequest request, HttpSession session) {
        UserDto loginUser = (UserDto) session.getAttribute("loginUser");
/*
        System.out.println(customerId);
        System.out.println(telAuditDto.getCustomerId());
*/

        if (loginUser.getRole() != Role.TELADMIN) {
            throw AuthException.create("没有权限", Level.DEBUG);
        }

        if (referer == null) {
            referer = "/default";
        }
        Customer customer = customerService.get(customerId);
        if (customer == null) {
            throw HosException.create("没有这个客户的资料", Level.DEBUG);
        }

//        System.out.println("1");
//        System.out.println(telAuditDto);
//        System.out.println(telAuditDto.getMemoItem());
//        System.out.println(telAuditDto.getMemoItem().matches("\\s*"));
//        telAuditDto.getMemoItem().length() > 0
        if (telAuditDto.getMemoItem() != null && !telAuditDto.getMemoItem().matches("\\s*")) {
//            System.out.println("2");
            if (customerService.addMemo(telAuditDto.getMemoItem(), customerId, loginUser.getId())) {
//                System.out.println("3");
                model.addAttribute("success", "备注添加完成");
            } else {
//                System.out.println("4");
                model.addAttribute("error", "备注添加失败");
            }
        }
//        System.out.println("5");
        telAuditDto.setCustomerId(customerId);
/*
        System.out.println("customerService");
        System.out.println(customerService);
        System.out.println("telAuditDto");
        System.out.println(telAuditDto);
        System.out.println(JSON.toJSONString(telAuditDto, true));
*/
//        System.out.println("6");
//        System.out.println(customerService);
        if (customerService.updateTelAuditDto(telAuditDto)) {
//            System.out.println("7");
            model.addAttribute("success", "选项更新完成");
        } else {
//            System.out.println("8");
            model.addAttribute("error", "选项更新失败");
        }

        customer = customerService.get(customerId);
//        System.out.println("9");
        model.addAttribute("customer", customer);
        model.addAttribute("hospitalizationTypes", HospitalizationType.values());
        model.addAttribute("weights", Weight.values());
        model.addAttribute("callStates", CallState.values());
        model.addAttribute("referer", referer);

        return "customer-memo-udpate-by-tel-admin";
    }

    @RequestMapping(value = "/stats")
    public String stats(Model model, HttpSession session) {
        User currentUser = (User) session.getAttribute("loginUser");
        if (currentUser.getRole() == null || currentUser.getRole() != Role.ADMIN) {
            throw HosException.create("", Level.DEBUG);
        }
        CustomerStatDto stats = customerService.statAll();
        model.addAttribute("stats", stats);
        return "customer-stats";
    }
}