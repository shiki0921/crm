package com.shiki.crm.service;

import com.shiki.crm.domain.Log;

import java.util.List;

/**
 * @author shiki
 * @date 2019/12/8 - 16:15
 */
public interface ILogService {

    int deleteByPrimaryKey(Long id);

    int insert(Log record);

    Log selectByPrimaryKey(Long id);

    List<Log> selectAll();

    int updateByPrimaryKey(Log record);
}
