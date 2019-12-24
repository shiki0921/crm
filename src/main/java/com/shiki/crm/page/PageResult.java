package com.shiki.crm.page;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * @author shiki
 * @date 2019/12/3 - 22:49
 */

@Getter@Setter
public class PageResult {

    private Integer total;

    private List rows;

    public PageResult(Integer total, List rows) {
        this.total = total;
        this.rows = rows;
    }
}
