package com.syzc.sseip.controller;

import com.syzc.sseip.dao.CustomerDao;
import com.syzc.sseip.entity.User;
import com.syzc.sseip.entity.enumtype.Role;
import com.syzc.sseip.pasture.olddata.mdbdumper.YDumpMdbDumper;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ContextLoader;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

@Controller
public class OldDumpController {
    private Logger logger = Logger.getLogger(OldDumpController.class);

    private CustomerDao customerDao;

    @Resource
    public void setCustomerDao(CustomerDao customerDao) {
        this.customerDao = customerDao;
    }

    //    @RequestMapping(value = "/admin/dump-old")
    public void dumpOld(HttpSession session, HttpServletResponse response) {
        User user = (User) session.getAttribute("loginUser");
        if (user == null || user.getRole() != Role.ADMIN) {
            try {
                response.getWriter().print("not authorized");
                response.getWriter().close();
            } catch (IOException e) {
                logger.debug("error while response writing", e);
            }
        }

        final String M = "dumping-old";
        final String N = "/WEB-INF/dump-old.mark";
        File fN = new File(ContextLoader.getCurrentWebApplicationContext().getServletContext().getRealPath(N));
        if (fN.exists()) {
            System.out.println("here1");
            try {
                System.out.println("here2");
                response.getWriter().print("the dumping op has already been called once. abort execution.");
                response.getWriter().close();
            } catch (IOException e) {
                System.out.println("here3");
                logger.debug("error while response writing", e);
            }
            return;
        } else {
            System.out.println("here4");
            try {
                System.out.println("here5");
                fN.createNewFile();
            } catch (IOException e) {
                System.out.println("here6");
                logger.debug("无法创建标记文件，用于标记处理启动", e);
                try {
                    System.out.println("here7");
                    response.getWriter().print("创建标记文件出错");
                    response.getWriter().close();
                } catch (IOException ioe) {
                    System.out.println("here8");
                    logger.debug("error while response writing", ioe);
                }
                return;
            }
        }

        if (session.getAttribute(M) != null) {
            System.out.println("here9");
            try {
                System.out.println("here10");
                response.getWriter().print("the dumping op has already been called once for current login. abort execution.");
                response.getWriter().close();
            } catch (IOException e) {
                System.out.println("here11");
                logger.debug("error while response writing", e);
            }
            return;
        }
        session.setAttribute(M, true);

        try {
            System.out.println("here12");
            response.getWriter().print("started");
            response.getWriter().close();
        } catch (IOException e) {
            System.out.println("here13");
            logger.debug("error while response writing", e);
        }
        session.setAttribute("dump-old-completed", false);
        try {
            System.out.println("here14");
//            BatchDumper.dump(ContextLoader.getCurrentWebApplicationContext().getServletContext().getRealPath("/WEB-INF/customer-details.json.gz"));
            YDumpMdbDumper.dump();
        } catch (Exception e) {
            System.out.println("here15");
            logger.error("error while dumping the old data", e);
        }
        System.out.println("here16");
        session.setAttribute("dump-old-completed", true);
    }

    @RequestMapping(value = "/admin/if-dumped")
    @ResponseBody
    public String ifDumpingCompleted(HttpSession session) {
        final String MARK = "dump-old-completed";
        Boolean state = (boolean) session.getAttribute(MARK);
        if (state != null) {
            if (state) {
                return "dumping completed";
            } else {
                return "the dumping process is still running";
            }
        } else {
            return "not started";
        }
    }

    //    @RequestMapping(value = "max-olds-id")
    @ResponseBody
    public String maxOldsId() {
        return String.valueOf(customerDao.maxOldsId());
    }

    @RequestMapping(value = "clear-old-repo-customers")
    @ResponseBody
    public String clearOldsRepoCustomers(HttpSession session) {
        User user = (User) session.getAttribute("loginUser");
        if (user == null || user.getRole() != Role.ADMIN) {
            return "not authorized";
        }

        customerDao.clearOldsRepoMemo();
        customerDao.clearOldsRepoCustomers();
        return "method called";
    }
}