package com.shiki.crm.mapper;

import com.shiki.crm.domain.Employee;
import com.shiki.crm.page.PageResult;
import com.shiki.crm.query.EmployeeQueryObject;
import org.apache.ibatis.annotations.Param;
import org.springframework.context.annotation.Profile;

import java.util.List;

public interface EmployeeMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Employee record);

    Employee selectByPrimaryKey(Long id);

    List<Employee> selectAll();

    int updateByPrimaryKey(Employee record);

    Employee getEmployeeForLogin(@Param("username") String username, @Param("password") String password);

    Long queryForPageCount(EmployeeQueryObject qo);

    List<Employee> queryForPage(EmployeeQueryObject qo);

    void updateState(Long id);

    int handleRelation(@Param("eid") Long eid,@Param("rid") Long rid);

    int deleteRelationByEid(Long eid);
}