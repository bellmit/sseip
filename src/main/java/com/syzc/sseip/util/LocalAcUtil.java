package com.syzc.sseip.util;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Arrays;

public class LocalAcUtil {
    static ApplicationContext ac = null;

    public static ApplicationContext getAc() {
        if (ac == null) {
            ac = new ClassPathXmlApplicationContext("applicationContext.xml", "spring-mybatis.xml");
        }
        return ac;
    }

    public static void printBeanNames(ApplicationContext ac) {
        System.out.println(Arrays.toString(ac.getBeanDefinitionNames()));
    }
}