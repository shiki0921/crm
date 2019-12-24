package com.shiki.crm.service.impl;

import com.shiki.crm.domain.Employee;
import com.shiki.crm.domain.Role;
import com.shiki.crm.mapper.EmployeeMapper;
import com.shiki.crm.page.PageResult;
import com.shiki.crm.query.EmployeeQueryObject;
import com.shiki.crm.service.IEmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

/**
 * @author shiki
 * @date 2019/11/26 - 22:41
 */

@Service
public class EmployeeImpl implements IEmployeeService {

    @Autowired
    private EmployeeMapper employeeDao;
    @Override
    public int deleteByPrimaryKey(Long id) {
        return this.employeeDao.deleteByPrimaryKey(id);
    }

    @Override
    public Employee getEmployeeForLogin(String username, String password) {
        return this.employeeDao.getEmployeeForLogin(username, password);
    }

    @Override
    public int insert(Employee record) {
        int effectiveCount = employeeDao.insert(record);
        List<Role> roles = record.getRoles();
        if (roles != null){
            for(Role role:roles){
                employeeDao.handleRelation(record.getId(),role.getId());
            }
        }
        return effectiveCount;
    }

    @Override
    public int update(Employee record) {
        int effectiveCount = employeeDao.updateByPrimaryKey(record);
        employeeDao.deleteRelationByEid(record.getId());
        List<Role> roles = record.getRoles();
        if (roles != null){
            for(Role role:roles){
                employeeDao.handleRelation(record.getId(),role.getId());
            }
        }
        return effectiveCount;
    }

    @Override
    public Employee selectByPrimaryKey(Long id) {
        return this.employeeDao.selectByPrimaryKey(id);
    }

    @Override
    public void updateState(Long id) {
        employeeDao.updateState(id);
    }

    @Override
    public List<Employee> selectAll() {
        return this.employeeDao.selectAll();
    }

    @Override
    public int updateByPrimaryKey(Employee record) {
        return this.employeeDao.updateByPrimaryKey(record);
    }

    @Override
    public PageResult queryForPage(EmployeeQueryObject qo) {
        //查询总记录数
        Long count = this.employeeDao.queryForPageCount(qo);
        if (count == 0){
            return new PageResult(0, Collections.EMPTY_LIST);
        }
        //查询总结果集
        List<Employee> result = this.employeeDao.queryForPage(qo);
        return new PageResult(count.intValue(),result);
    }
}
