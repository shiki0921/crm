package com.shiki.crm.service;

import com.shiki.crm.domain.Permission;
import com.shiki.crm.page.PageResult;
import com.shiki.crm.query.QueryObject;

import java.util.List;

/**
 * @author shiki
 * @date 2019/12/15 - 14:43
 */
public interface IPermissionService {
    int deleteByPrimaryKey(Long id);

    int insert(Permission record);

    Permission selectByPrimaryKey(Long id);

    List<Permission> selectAll();

    int updateByPrimaryKey(Permission record);

    Long selectByConditionCount(QueryObject qo);

    PageResult selectByCondition(QueryObject qo);

    PageResult queryByRid(Long rid);

    Permission queryByResource(String function);

    List<Permission> queryPermissionByEid(Long id);
}
