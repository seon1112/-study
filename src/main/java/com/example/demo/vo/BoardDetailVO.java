package com.example.demo.vo;


import lombok.Data;

@Data
public class BoardDetailVO {
	private Integer b_no;
	private int a_no;
	private String b_title;
	private String b_content;
	private String b_date;
	private String b_code;
	private String b_p_lang;
	private String b_p_title;
	private String a_nick;
	private String a_img;
	
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public int getA_no() {
		return a_no;
	}
	public void setA_no(int a_no) {
		this.a_no = a_no;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public String getB_date() {
		return b_date;
	}
	public void setB_date(String b_date) {
		this.b_date = b_date;
	}
	public String getB_code() {
		return b_code;
	}
	public void setB_code(String b_code) {
		this.b_code = b_code;
	}
	public String getB_p_lang() {
		return b_p_lang;
	}
	public void setB_p_lang(String b_p_lang) {
		this.b_p_lang = b_p_lang;
	}
	public String getB_p_title() {
		return b_p_title;
	}
	public void setB_p_title(String b_p_title) {
		this.b_p_title = b_p_title;
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
	public void setB_no(Integer b_no) {
		this.b_no = b_no;
	}
}