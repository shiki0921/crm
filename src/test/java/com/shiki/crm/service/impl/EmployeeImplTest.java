package com.shiki.crm.service.impl;

import com.shiki.crm.domain.Employee;
import com.shiki.crm.service.IEmployeeService;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @author shiki
 * @date 2019/11/26 - 22:49
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:application.xml")
public class EmployeeImplTest {

    @Autowired
    private IEmployeeService employeeService;

    @org.junit.Test
    public void deleteByPrimaryKey() {
    }

    @org.junit.Test
    public void insert() {
        Employee emp = new Employee();
        emp.setUsername("wangwu");
        int insert = employeeService.insert(emp);
        System.out.println(insert);
    }

    @org.junit.Test
    public void selectByPrimaryKey() {
    }

    @org.junit.Test
    public void selectAll() {
    }

    @org.junit.Test
    public void updateByPrimaryKey() {
    }
}