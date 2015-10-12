package com.syzc.sseip.util.exception;

import com.syzc.sseip.util.HosException;
import org.apache.log4j.Level;

public class AuthException extends HosException {
    protected AuthException(Throwable cause, String msg, Level level) {
        super(cause, msg, level);
    }

    protected AuthException(Throwable cause, Level level) {
        super(cause, level);
    }

    protected AuthException(String msg, Level level) {
        super(msg, level);
    }
}