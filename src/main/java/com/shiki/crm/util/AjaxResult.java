package com.shiki.crm.util;

import lombok.Getter;
import lombok.Setter;

/**
 * @author shiki
 * @date 2019/12/8 - 0:25
 */

@Getter@Setter
public class AjaxResult {

    private boolean success = false;

    private String msg;

    public AjaxResult(String msg) {
        this.msg = msg;
    }

    public AjaxResult(boolean success, String msg) {
        this.success = success;
        this.msg = msg;
    }
}
