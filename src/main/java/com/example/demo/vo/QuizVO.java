package com.example.demo.vo;

import lombok.Data;

@Data
public class QuizVO {
	private int q_no;
	private String q_title;
	private String q_level;
	public int getQ_no() {
		return q_no;
	}
	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getQ_level() {
		return q_level;
	}
	public void setQ_level(String q_level) {
		this.q_level = q_level;
	}
	
	
}
