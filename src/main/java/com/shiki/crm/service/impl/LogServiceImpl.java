package com.shiki.crm.service.impl;

import com.shiki.crm.domain.Log;
import com.shiki.crm.mapper.LogMapper;
import com.shiki.crm.service.ILogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author shiki
 * @date 2019/12/8 - 16:16
 */

@Service
public class LogServiceImpl implements ILogService {

    @Autowired
    private LogMapper logDao;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return this.logDao.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Log record) {
        return this.logDao.insert(record);
    }

    @Override
    public Log selectByPrimaryKey(Long id) {
        return this.logDao.selectByPrimaryKey(id);
    }

    @Override
    public List<Log> selectAll() {
        return this.logDao.selectAll();
    }

    @Override
    public int updateByPrimaryKey(Log record) {
        return this.logDao.updateByPrimaryKey(record);
    }
}
