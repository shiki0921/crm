package com.shiki.crm.web.controller;

import com.shiki.crm.domain.Role;
import com.shiki.crm.page.PageResult;
import com.shiki.crm.query.QueryObject;
import com.shiki.crm.service.IRoleService;
import com.shiki.crm.util.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author shiki
 * @date 2019/12/11 - 23:02
 */

@Controller
public class RoleController {

    @Autowired
    private IRoleService roleService;

    @RequestMapping("/role")
    public String role(){
        return "role";
    }

    @RequestMapping("/role_queryRoleForEmp")
    @ResponseBody
    public List<Role> queryRoleForEmp(){
        List<Role> result = null;
        result = roleService.selectAll();
        return result;
    }

    @RequestMapping("/role_queryRoleIdByEid")
    @ResponseBody
    public List<Long> queryRoleIdByEid(Long eid){
        List<Long> result = null;
        result = roleService.queryRoleIdByEid(eid);
        return result;
    }

    @RequestMapping("/role_list")
    @ResponseBody
    public PageResult list(QueryObject qo){
        PageResult pageResult = null;
        pageResult = roleService.queryForPage(qo);
        return pageResult;
    }

    @RequestMapping("/role_save")
    @ResponseBody
    public AjaxResult save(Role role){
        AjaxResult result = null;
        try {
            roleService.insert(role);
            result = new AjaxResult(true, "保存成功");
        } catch (Exception e) {
            e.printStackTrace();
            result = new AjaxResult(false, "保存异常，请联系管理员");
        }
        return result;
    }

    @RequestMapping("/role_update")
    @ResponseBody
    public AjaxResult update(Role role){
        AjaxResult result = null;
        try {
            roleService.updateByPrimaryKey(role);
            result = new AjaxResult(true, "更新成功");
        } catch (Exception e) {
            e.printStackTrace();
            result = new AjaxResult(false, "更新异常，请联系管理员");
        }
        return result;
    }
}
