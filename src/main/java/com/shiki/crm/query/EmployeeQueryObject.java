package com.shiki.crm.query;

import lombok.Getter;
import lombok.Setter;

/**
 * @author shiki
 * @date 2019/12/3 - 23:00
 */

@Getter@Setter
public class EmployeeQueryObject {

    private Integer page;

    private Integer rows;

    private String keyword;

    public Integer getStart() {
        return (page - 1) * rows;
    }
}
