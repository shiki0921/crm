package com.shiki.crm.service;

import com.shiki.crm.domain.Role;
import com.shiki.crm.page.PageResult;
import com.shiki.crm.query.QueryObject;

import java.util.List;

/**
 * @author shiki
 * @date 2019/11/26 - 22:34
 */

public interface IRoleService {

    int deleteByPrimaryKey(Long id);

    int insert(Role record);

    Role selectByPrimaryKey(Long id);

    List<Role> selectAll();

    int updateByPrimaryKey(Role record);

    PageResult queryForPage(QueryObject qo);

    List<Long> queryRoleIdByEid(Long eid);

}
