package com.shiki.crm.web.controller;

import com.shiki.crm.domain.Menu;
import com.shiki.crm.service.IMenuService;
import com.shiki.crm.util.UserContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author shiki
 * @date 2019/12/22 - 19:44
 */

@Controller
public class MenuController {

    @Autowired
    private IMenuService menuService;

    @RequestMapping("/menu")
    @ResponseBody
    public List<Menu> menu(HttpSession session){
        List<Menu> result = null;
        result = (List<Menu>)session.getAttribute(UserContext.MENU_IN_SESSION);
        return result;
    }
}
