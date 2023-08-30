package com.example.demo.vo;

import java.sql.Date;

import lombok.Data;


@Data
public class AccountVO {
	private int a_no;
	private String a_nick;
	private String a_name;
	private String a_gender;
	private String a_email;
	private String a_img;
	private Date a_regdate;
	public int getA_no() {
		return a_no;
	}
	public void setA_no(int a_no) {
		this.a_no = a_no;
	}
	public String getA_nick() {
		return a_nick;
	}
	public void setA_nick(String a_nick) {
		this.a_nick = a_nick;
	}
	public String getA_name() {
		return a_name;
	}
	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
	public String getA_gender() {
		return a_gender;
	}
	public void setA_gender(String a_gender) {
		this.a_gender = a_gender;
	}
	public String getA_email() {
		return a_email;
	}
	public void setA_email(String a_email) {
		this.a_email = a_email;
	}
	public String getA_img() {
		return a_img;
	}
	public void setA_img(String a_img) {
		this.a_img = a_img;
	}
	public Date getA_regdate() {
		return a_regdate;
	}
	public void setA_regdate(Date a_regdate) {
		this.a_regdate = a_regdate;
	}
	
}
