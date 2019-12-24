package com.shiki.crm.service;

import com.shiki.crm.domain.Employee;
import com.shiki.crm.page.PageResult;
import com.shiki.crm.query.EmployeeQueryObject;

import java.util.List;

/**
 * @author shiki
 * @date 2019/11/26 - 22:34
 */
public interface IEmployeeService {

    int deleteByPrimaryKey(Long id);

    int insert(Employee record);

    int update(Employee record);

    Employee selectByPrimaryKey(Long id);

    List<Employee> selectAll();

    int updateByPrimaryKey(Employee record);

    Employee getEmployeeForLogin(String username,String password);

    PageResult queryForPage(EmployeeQueryObject qo);

    void updateState(Long id);
}
