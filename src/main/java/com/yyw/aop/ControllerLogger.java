package com.yyw.aop;

import org.aspectj.lang.JoinPoint;

import java.util.Arrays;
import java.util.logging.Logger;

/**
 * Created by Administrator on 2018/1/12.
 */
public class ControllerLogger {
    private static final Logger log=Logger.getLogger("ControllerLogger");
    //代表前置增强的方法
    public void before(JoinPoint jp){
        log.info("before 调用："+jp.getTarget()+"类的"+
                jp.getSignature().getName()+"入参："+ Arrays.toString(jp.getArgs()));
    }
    //代表后置增强的方法
    public void after(JoinPoint jp,Object result){
        log.info("before 调用："+jp.getTarget()+"类的"+
                jp.getSignature().getName()+"返回："+result);
    }
}
