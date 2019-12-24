package com.shiki.crm.web.interceptor;

import com.shiki.crm.domain.Employee;
import com.shiki.crm.util.PermissionUtils;
import com.shiki.crm.util.UserContext;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Method;

/**
 * @author shiki
 * @date 2019/11/28 - 0:20
 */
public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object handler) throws Exception {

        //----------为当前线程绑定request对象----------
        UserContext.set(httpServletRequest);

        //----------登录拦截----------
        Employee currentUser = (Employee) httpServletRequest.getSession().getAttribute(UserContext.USER_IN_SESSION);
        if (currentUser == null){
            httpServletResponse.sendRedirect("/login.jsp");
            return false;
        }
        //对于静态资源handler对于的类为DefaultServletHttpRequestHandler，此时不需要做URL权限控制
        //当handler是HandlerMethod类型对象，此时才标识需要访问控制器的方法，此时才需要做URL权限控制
        if (handler instanceof HandlerMethod){
            //url权限控制
            //1.将请求转为权限表达式
            HandlerMethod handlerMethod = (HandlerMethod) handler;
            Object bean = handlerMethod.getBean();
            Method method = handlerMethod.getMethod();
            System.out.println("=====================");
            System.out.println(bean.getClass().getName());
            System.out.println(method.getName());
            String function = bean.getClass().getName() + ":" + handlerMethod.getMethod().getName();
            System.out.println("=====================");
            if (PermissionUtils.checkPermission(function)){
                return true;
            }else{
                //请求页面
                //跳转到noPermission页面
                //ajax请求
                //返回的数据为{success:false;msg:"没有权限"}
                if (method.isAnnotationPresent(ResponseBody.class)){
                    httpServletResponse.sendRedirect("noPermission.json");
                }else {
                    httpServletResponse.sendRedirect("noPermission.jsp");
                }
                return false;
            }
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
