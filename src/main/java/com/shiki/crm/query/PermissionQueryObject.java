package com.shiki.crm.query;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PermissionQueryObject extends QueryObject{
    private Long rid;
    private String keyword;
}
