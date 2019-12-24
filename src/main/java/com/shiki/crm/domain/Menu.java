package com.shiki.crm.domain;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Setter@Getter
public class Menu {
    private Long id;

    private String text;

    private String state;

    private Boolean checked;

    private String resource;

    private String attributes;

    private List<Menu> children;

}