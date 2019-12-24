package com.shiki.crm.mapper;

import com.shiki.crm.domain.Permission;
import com.shiki.crm.query.PermissionQueryObject;
import com.shiki.crm.query.QueryObject;

import java.util.List;

public interface PermissionMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Permission record);

    Permission selectByPrimaryKey(Long id);

    List<Permission> selectAll();

    int updateByPrimaryKey(Permission record);

    Long selectByConditionCount(QueryObject qo);

    List<Permission> selectByCondition(QueryObject qo);

    List<Permission> queryByRid(Long rid);

    Permission queryByResource(String resource);

    List<Permission> queryPermissionByEid(Long id);
}