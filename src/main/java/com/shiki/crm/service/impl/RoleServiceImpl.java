package com.shiki.crm.service.impl;

import com.shiki.crm.domain.Permission;
import com.shiki.crm.domain.Role;
import com.shiki.crm.mapper.RoleMapper;
import com.shiki.crm.page.PageResult;
import com.shiki.crm.query.QueryObject;
import com.shiki.crm.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

/**
 * @author shiki
 * @date 2019/12/15 - 15:51
 */

@Service
public class RoleServiceImpl implements IRoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return this.roleMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Role record) {
        int effectiveCount = this.roleMapper.insert(record);
        List<Permission> permissions = record.getPermissions();
        for (Permission p: permissions) {
            this.roleMapper.handerPermission(record.getId(),p.getId());
        }
        return effectiveCount;
    }

    @Override
    public Role selectByPrimaryKey(Long id) {
        return this.roleMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Role> selectAll() {
        return this.roleMapper.selectAll();
    }

    @Override
    public int updateByPrimaryKey(Role record) {
        int effectiveCount = this.roleMapper.updateByPrimaryKey(record);
        //处理中间表关系
        //先删除
        this.roleMapper.deletePermissionByRid(record.getId());
        //后新增
        List<Permission> permissions = record.getPermissions();
        for (Permission p: permissions) {
            this.roleMapper.handerPermission(record.getId(),p.getId());
        }
        return effectiveCount;
    }

    @Override
    public PageResult queryForPage(QueryObject qo) {
        //查询总记录数
        Long count = this.roleMapper.queryForPageCount(qo);
        if (count == 0){
            return new PageResult(0, Collections.EMPTY_LIST);
        }
        //查询总结果集
        List<Role> result = this.roleMapper.queryForPage(qo);
        return new PageResult(count.intValue(),result);
    }

    @Override
    public List<Long> queryRoleIdByEid(Long eid) {
        return this.roleMapper.queryRoleIdByEid(eid);
    }

}
