package com.shiki.crm.service.impl;

import com.shiki.crm.domain.Menu;
import com.shiki.crm.mapper.MenuMapper;
import com.shiki.crm.service.IMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author shiki
 * @date 2019/12/22 - 19:43
 */

@Service
public class MenuServiceImpl implements IMenuService {

    @Autowired
    private MenuMapper menuMapper;

    @Override
    public List<Menu> queryMenu() {
        return this.menuMapper.selectRoot();
    }
}
