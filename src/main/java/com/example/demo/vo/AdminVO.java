package com.example.demo.vo;

import lombok.Data;

import java.util.Date;

@Data
public class AdminVO {
    private String a_nick;
    private int a_no;
    private int ct;
    private int a_programmers;
    private String a_level;
    private String a_git;
    private Date s_a_regdate;
}