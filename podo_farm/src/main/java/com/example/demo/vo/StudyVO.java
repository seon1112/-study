package com.example.demo.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class StudyVO {
	private int s_no;
	private String s_name;
	private String s_title;
	private String s_content;
	private String s_goal;
	private Date s_o_date;
	private Date s_e_date;
	private String member;
	private String s_condition;
}
