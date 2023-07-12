package com.example.demo.vo;

import java.sql.Date;

import lombok.Data;


@Data

public class Coding_testVO {
	private int rownum;  //rownum
	private int ct;  //문제 푼 개수
	private String date; //p_date String
	private int ct_no;
	private int a_no;
	private String p_title;
	private String p_level;
	private String p_timer;
	private String p_time;
	private String p_memory;
	private String p_code;
	private String p_content;
	private Date p_date;
	private String p_lang;

}
