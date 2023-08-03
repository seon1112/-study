package com.example.demo.vo;

import java.sql.Date;

import lombok.Data;


@Data

public class Coding_testVO {
	//변경된 db에 맞게 vo수정
	private int ct_no;
	private int q_no;
	private int a_no;
	private String p_timer;
	private String p_code;
	private Date p_date;
	private String p_lang;
	private String p_link;
	
	//quiz에 있는 vo
	private String q_title;
	private String q_level;
	//추가한 vo
	private int rownum;  //rownum
	private int ct;  //문제 푼 개수
	private String date; //p_date String
}
