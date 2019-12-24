package com.shiki.crm.mapper;

import com.shiki.crm.domain.Role;
import com.shiki.crm.query.QueryObject;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Role record);

    Role selectByPrimaryKey(Long id);

    List<Role> selectAll();

    int updateByPrimaryKey(Role record);

    Long queryForPageCount(QueryObject qo);

    List<Role> queryForPage(QueryObject qo);

    /**
     * 中间表维护
     * @param rid
     * @param pid
     * @return
     */
    int handerPermission(@Param("rid") Long rid, @Param("pid") Long pid);

    int deletePermissionByRid(Long rid);

    List<Long> queryRoleIdByEid(Long eid);
}