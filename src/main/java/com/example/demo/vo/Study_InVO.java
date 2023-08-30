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
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public int getA_no() {
		return a_no;
	}
	public void setA_no(int a_no) {
		this.a_no = a_no;
	}
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public String getS_leader() {
		return s_leader;
	}
	public void setS_leader(String s_leader) {
		this.s_leader = s_leader;
	}
	public String getR_ok() {
		return r_ok;
	}
	public void setR_ok(String r_ok) {
		this.r_ok = r_ok;
	}
	public String getA_git() {
		return a_git;
	}
	public void setA_git(String a_git) {
		this.a_git = a_git;
	}
	public String getA_level() {
		return a_level;
	}
	public void setA_level(String a_level) {
		this.a_level = a_level;
	}
	public int getA_programmers() {
		return a_programmers;
	}
	public void setA_programmers(int a_programmers) {
		this.a_programmers = a_programmers;
	}
	public Date getS_a_regdate() {
		return s_a_regdate;
	}
	public void setS_a_regdate(Date s_a_regdate) {
		this.s_a_regdate = s_a_regdate;
	}
	   
}
