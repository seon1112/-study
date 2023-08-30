package com.example.demo.vo;

import lombok.Data;

@Data
public class StudyListVO {
	private Integer s_no;
	private String s_name;
	private String s_title;
	private String s_goal;
	private String s_o_date;
	private String s_e_date;
	private String s_member;
	private String a_nick;
	private String a_img;
	private String languages;
	private String languagesImg;
	private int accessPeopleCnt;
	public Integer getS_no() {
		return s_no;
	}
	public void setS_no(Integer s_no) {
		this.s_no = s_no;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getS_title() {
		return s_title;
	}
	public void setS_title(String s_title) {
		this.s_title = s_title;
	}
	public String getS_goal() {
		return s_goal;
	}
	public void setS_goal(String s_goal) {
		this.s_goal = s_goal;
	}
	public String getS_o_date() {
		return s_o_date;
	}
	public void setS_o_date(String s_o_date) {
		this.s_o_date = s_o_date;
	}
	public String getS_e_date() {
		return s_e_date;
	}
	public void setS_e_date(String s_e_date) {
		this.s_e_date = s_e_date;
	}
	public String getS_member() {
		return s_member;
	}
	public void setS_member(String s_member) {
		this.s_member = s_member;
	}
	public String getA_nick() {
		return a_nick;
	}
	public void setA_nick(String a_nick) {
		this.a_nick = a_nick;
	}
	public String getA_img() {
		return a_img;
	}
	public void setA_img(String a_img) {
		this.a_img = a_img;
	}
	public String getLanguages() {
		return languages;
	}
	public void setLanguages(String languages) {
		this.languages = languages;
	}
	public String getLanguagesImg() {
		return languagesImg;
	}
	public void setLanguagesImg(String languagesImg) {
		this.languagesImg = languagesImg;
	}
	public int getAccessPeopleCnt() {
		return accessPeopleCnt;
	}
	public void setAccessPeopleCnt(int accessPeopleCnt) {
		this.accessPeopleCnt = accessPeopleCnt;
	}
	
	
	
}
