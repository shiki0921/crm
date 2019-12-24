package com.shiki.crm.web.controller;

import com.shiki.crm.domain.Employee;
import com.shiki.crm.domain.Menu;
import com.shiki.crm.domain.Permission;
import com.shiki.crm.page.PageResult;
import com.shiki.crm.query.EmployeeQueryObject;
import com.shiki.crm.service.IEmployeeService;
import com.shiki.crm.service.IMenuService;
import com.shiki.crm.service.IPermissionService;
import com.shiki.crm.util.AjaxResult;
import com.shiki.crm.util.PermissionUtils;
import com.shiki.crm.util.UserContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author shiki
 * @date 2019/11/25 - 23:32
 */

@Controller
public class EmployeeController {

    @Autowired
    private IEmployeeService employeeService;

    @Autowired
    private IPermissionService permissionService;

    @Autowired
    private IMenuService menuService;

    @RequestMapping("/employee")
    public String index(){
        return "employee";
    }

    @RequestMapping("/employee_list")
    @ResponseBody
    public PageResult list(EmployeeQueryObject qo){
        PageResult pageResult = null;
        pageResult = employeeService.queryForPage(qo);
        return pageResult;
    }

    @RequestMapping("/login")
    @ResponseBody
    public AjaxResult login(String username, String password, HttpServletRequest request){
        //---------AOP日志相关：把request放入当前线程-----------
        UserContext.set(request);
        AjaxResult result = null;
        Employee currentUser = this.employeeService.getEmployeeForLogin(username,password);
        if (currentUser != null){
            request.getSession().setAttribute(UserContext.USER_IN_SESSION,currentUser);
            //查询用户的权限集合
            List<Permission> userPermission = permissionService.queryPermissionByEid(currentUser.getId());
            request.getSession().setAttribute(UserContext.PERMISSION_IN_SESSION,userPermission);
            List<Menu> userMenu = menuService.queryMenu();
            PermissionUtils.getMenuForPermission(userMenu);
            request.getSession().setAttribute(UserContext.MENU_IN_SESSION,userMenu);
            result = new AjaxResult(true,"登录成功");
        }else{
            result = new AjaxResult("账号或者密码错误");
        }
        return result;
    }

    @RequestMapping("/employee_save")
    @ResponseBody
    public AjaxResult save(Employee emp){
        AjaxResult result = null;
        try{
            emp.setPassword("888888");
            emp.setAdmin(false);
            emp.setState(true);
            employeeService.insert(emp);
            result = new AjaxResult(true,"保存成功");
        }catch (Exception e){
            result = new AjaxResult("保存异常，请联系管理员");
        }
        return result;
    }

    @RequestMapping("/employee_update")
    @ResponseBody
    public AjaxResult update(Employee emp){
        AjaxResult result = null;
        try{
            employeeService.update(emp);
            result = new AjaxResult(true,"更新成功");
        }catch (Exception e){
            result = new AjaxResult("更新异常，请联系管理员");
        }
        return result;
    }

    @RequestMapping("/employee_delete")
    @ResponseBody
    public AjaxResult delete(Long id){
        AjaxResult result = null;
        try{
            employeeService.updateState(id);
            result = new AjaxResult(true,"删除成功");
        }catch (Exception e){
            result = new AjaxResult("删除异常，请联系管理员");
        }
        return result;
    }

}
