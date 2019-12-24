package com.shiki.crm.util;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.shiki.crm.domain.Employee;
import com.shiki.crm.domain.Log;
import com.shiki.crm.service.ILogService;
import org.aspectj.lang.JoinPoint;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * @author shiki
 * @date 2019/12/8 - 1:23
 */
public class LogUtil {

    @Autowired
    private ILogService logService;

    public void writeLog(JoinPoint joinPoint){
        // 防止AOP拦截logService本身，造成死循环
        if (joinPoint.getTarget() instanceof ILogService) {
            return;
        }

        Log log = new Log();
        //从ThreadLocal中获取当前线程的request
        HttpServletRequest request = UserContext.get();
        //从session中获取用户信息
        Employee currentUser = (Employee) request.getSession().getAttribute(UserContext.USER_IN_SESSION);
        //操作时间
        log.setOptime(new Date());
        //操作用户
        log.setOpuser(currentUser);
        //登录ip
        log.setOpip(request.getRemoteAddr());

        //完整function名:类名+方法名
        String className = joinPoint.getTarget().toString();
        String functionName = joinPoint.getSignature().toString();
        //用户操作
        log.setFunction(className+":"+functionName);

        //将请求参数转为JSON字符串
        ObjectMapper objMapper = new ObjectMapper();
        String params = null;
        try {
            params = objMapper.writeValueAsString(joinPoint.getArgs());
            //修改参数
            log.setParams(params);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        logService.insert(log);
    }
}
