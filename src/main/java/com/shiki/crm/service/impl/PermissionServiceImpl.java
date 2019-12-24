package com.shiki.crm.service.impl;

import com.shiki.crm.domain.Employee;
import com.shiki.crm.domain.Permission;
import com.shiki.crm.mapper.PermissionMapper;
import com.shiki.crm.page.PageResult;
import com.shiki.crm.query.QueryObject;
import com.shiki.crm.service.IPermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

/**
 * @author shiki
 * @date 2019/12/15 - 14:43
 */
@Service
public class PermissionServiceImpl implements IPermissionService {

    @Autowired
    private PermissionMapper permissionDao;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return this.permissionDao.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Permission record) {
        return this.permissionDao.insert(record);
    }

    @Override
    public Permission selectByPrimaryKey(Long id) {
        return this.permissionDao.selectByPrimaryKey(id);
    }

    @Override
    public List<Permission> selectAll() {
        return this.permissionDao.selectAll();
    }

    @Override
    public int updateByPrimaryKey(Permission record) {
        return this.permissionDao.updateByPrimaryKey(record);
    }

    @Override
    public Long selectByConditionCount(QueryObject qo) {
        return this.permissionDao.selectByConditionCount(qo);
    }

    @Override
    public PageResult selectByCondition(QueryObject qo) {
        //查询总记录数
        Long count = this.permissionDao.selectByConditionCount(qo);
        if (count == 0){
            return new PageResult(0, Collections.EMPTY_LIST);
        }
        //查询总结果集
        List<Permission> result = this.permissionDao.selectByCondition(qo);
        return new PageResult(count.intValue(),result);
    }

    @Override
    public PageResult queryByRid(Long rid) {
        List<Permission> result = this.permissionDao.queryByRid(rid);
        return new PageResult(result.size(),result);
    }

    @Override
    public Permission queryByResource(String function) {
        return this.permissionDao.queryByResource(function);
    }

    @Override
    public List<Permission> queryPermissionByEid(Long id) {
        return this.permissionDao.queryPermissionByEid(id);
    }
}
