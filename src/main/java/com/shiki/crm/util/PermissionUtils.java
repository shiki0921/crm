package com.shiki.crm.util;

import com.shiki.crm.domain.Employee;
import com.shiki.crm.domain.Menu;
import com.shiki.crm.domain.Permission;
import com.shiki.crm.service.IPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author shiki
 * @date 2019/12/22 - 16:35
 */
@Component
public class PermissionUtils {

    private static IPermissionService permissionService;

    public static boolean checkPermission(String function){
        HttpSession session = UserContext.get().getSession();
        Employee user = (Employee)session.getAttribute(UserContext.USER_IN_SESSION);
        //如果是超级管理员直接放行
        if (user.getAdmin()){
            return true;
        }
        //查询权限表看是否需要权限控制
        Permission p = permissionService.queryByResource(function);
        if (p!=null){
            //该请求需要权限控制
            //先获取用户的权限
            List<Permission> userPermissions = (List<Permission>)session.getAttribute(UserContext.PERMISSION_IN_SESSION);
            //All权限匹配
            String allFunction = function.split(":")[0]+"All";
            for (Permission permission:
                 userPermissions) {
                if (permission.getResource().equals(function) || allFunction.equals(permission.getResource())){
                    //能找到，说明用户有这样的权限
                    return true;
                }
            }
            return false;
        }else{
            //不需要权限控制，直接放行
            return true;
        }

    }

    @Autowired
    public void setPermissionService(IPermissionService permissionService) {
        PermissionUtils.permissionService = permissionService;
    }

    public static void getMenuForPermission(List<Menu> allMenu){
        Menu menu = null;
        for(int i = allMenu.size()-1;i >= 0;i--){
            menu = allMenu.get(i);
            if (checkPermission(menu.getResource())){
                //用户有这样的菜单权限
                if (menu.getChildren() != null&&menu.getChildren().size() > 0){
                    getMenuForPermission(menu.getChildren());
                }
            }else{
                allMenu.remove(i);
            }
        }
    }
}
