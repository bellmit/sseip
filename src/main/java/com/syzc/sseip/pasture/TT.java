package com.syzc.sseip.pasture;

import com.syzc.sseip.dao.TDao;
import com.syzc.sseip.util.LocalAcUtil;

public class TT {
    public static void main(String[] args) {
        TDao tDao = (TDao) LocalAcUtil.getAc().getBean("TDao");

    }
}