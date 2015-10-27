package com.syzc.sseip.util;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;

import java.util.LinkedList;

public class HosException extends RuntimeException {
    protected LinkedList<String> msgList = new LinkedList<>();
    protected Level level;

    protected HosException(Throwable cause, String msg, Level level) {
        super(msg, cause);
        addMsg(msg);
        this.level = level;
    }

    protected HosException(Throwable cause, Level level) {
        super(cause);
        this.level = level;
    }

    protected HosException(String msg, Level level) {
        super(msg);
        addMsg(msg);
        this.level = level;
    }

    public void addMsg(String msg) {
        msgList.add(msg);
    }

    public LinkedList<String> getMsgList() {
        return msgList;
    }

    public void setMsgList(LinkedList<String> msgList) {
        this.msgList = msgList;
    }

    public Level getLevel() {
        return level;
    }

    public void setLevel(Level level) {
        this.level = level;
    }

    /**
     * 不必然生成new的对象。e是当前类的实例的时候不生成新的。
     *
     * @param e     包裹异常
     * @param msg   填写消息
     * @param level 错误等级，可以是空的
     * @return 包裹起来异常的本类实例
     */
    public static HosException create(Throwable t, String msg, Level level) {
        if (t instanceof HosException) {
            HosException t1 = (HosException) t;
            t1.addMsg(msg);
            if (t1.level == null) {
                t1.level = level;
            }
            return t1;
        } else {
            HosException e2;
            e2 = new HosException(t, msg, level);
            return e2;
        }
    }

    public static HosException create(String msg, Level level) {
        HosException e = new HosException(msg, level);
        return e;
    }

    public static HosException create(Throwable t, Level level) {
        if (t instanceof HosException) {
            HosException t1 = (HosException) t;
            if (t1.level == null) {
                t1.level = level;
            }
            return t1;
        } else {
            HosException e = new HosException(t, level);
            return e;
        }
    }

    public void print(Logger logger) {
        if (level.isGreaterOrEqual(logger.getParent().getLevel())) {
            String str;
//            str = String.join("\n", msgList); // java 8
            str = StringUtils.join(msgList, '\n');

            logger.log(level, str, this);
        }
    }

    public static void main(String[] args) {
//        System.out.println(Level.OFF.getSyslogEquivalent());
//        System.out.println(Level.FATAL.getSyslogEquivalent());
//        System.out.println(Level.ERROR.getSyslogEquivalent());
//        System.out.println(Level.WARN.getSyslogEquivalent());
//        System.out.println(Level.INFO.getSyslogEquivalent());
//        System.out.println(Level.DEBUG.getSyslogEquivalent());
//        System.out.println(Level.TRACE.getSyslogEquivalent());
//        System.out.println(Level.ALL.getSyslogEquivalent());
        System.out.println(Level.ALL.isGreaterOrEqual(Level.OFF));
        System.out.println(Level.WARN.isGreaterOrEqual(Level.DEBUG));
        Logger logger = Logger.getLogger(HosException.class);
//        logger.trace(null);
//        logger.trace(null, null);
        System.out.println(logger.getParent().getLevel());

        HosException he;
//        he = HosException.create("异常消息", Level.INFO);
//        he.print(logger);
        he = HosException.create("异常消息", Level.INFO);
        he.addMsg("第一行消息");
        he.addMsg("第二行消息");
        he.print(logger);
    }
}