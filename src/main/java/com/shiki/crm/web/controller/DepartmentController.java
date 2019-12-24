package com.shiki.crm.web.controller;

import com.shiki.crm.domain.Department;
import com.shiki.crm.service.IDepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author shiki
 * @date 2019/12/7 - 11:50
 */

@Controller
public class DepartmentController {

    @Autowired
    private IDepartmentService departmentService;

    @RequestMapping("department_queryForEmployee")
    @ResponseBody
    public List<Department> queryForEmp(){
        List result = null;
        result = departmentService.queryForEmp();
        return result;
    }
}
