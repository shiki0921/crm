package com.shiki.crm.domain;

import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

@Getter@Setter
@Alias("Permission")
public class Permission {
    private Long id;

    private String name;

    private String resource;

}