package com.shiki.crm.web.controller;

import com.shiki.crm.page.PageResult;
import com.shiki.crm.query.PermissionQueryObject;
import com.shiki.crm.service.IPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author shiki
 * @date 2019/12/15 - 14:49
 */

@Controller
public class PermissionController {

    @Autowired
    private IPermissionService permissionService;

    @RequestMapping("/permission_list")
    @ResponseBody
    public PageResult queryPermissionForPage(PermissionQueryObject qo){
        PageResult result = null;
        result = permissionService.selectByCondition(qo);
        return result;
    }

    @RequestMapping("/permission_queryByRid")
    @ResponseBody
    public PageResult queryByRid(Long rid){
        PageResult result = null;
        result = permissionService.queryByRid(rid);
        return result;
    }
}
