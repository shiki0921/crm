package com.shiki.crm.util;

import javax.servlet.http.HttpServletRequest;

/**
 * @author shiki
 * @date 2019/11/28 - 0:12
 */
public class UserContext {

    public static final String USER_IN_SESSION = "USER_IN_SESSION";

    public static final String PERMISSION_IN_SESSION = "PERMISSION_IN_SESSION";

    public static final String MENU_IN_SESSION = "MENU_IN_SESSION";

    private static ThreadLocal<HttpServletRequest> local = new ThreadLocal<>();

    public static void set(HttpServletRequest request){
        local.set(request);
    }

    public static HttpServletRequest get(){
        return local.get();
    }
}
