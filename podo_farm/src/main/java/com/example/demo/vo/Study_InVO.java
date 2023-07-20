package com.example.demo.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Study_InVO {
	   private int r_no;
	   private int a_no;
	   private int s_no;
	   private String s_leader;
	   private String r_ok;
	   private String a_git;
	   private String a_level;
	   private int a_programmers;
	   private Date s_a_regdate;


}
