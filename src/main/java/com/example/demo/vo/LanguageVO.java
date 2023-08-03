package com.example.demo.vo;

import lombok.Data;

@Data
public class LanguageVO {
	private int l_no;
	private int s_no;
	private String l_lang;
	private String l_img;
	public int getL_no() {
		return l_no;
	}
	public void setL_no(int l_no) {
		this.l_no = l_no;
	}
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public String getL_lang() {
		return l_lang;
	}
	public void setL_lang(String l_lang) {
		this.l_lang = l_lang;
	}
	public String getL_img() {
		return l_img;
	}
	public void setL_img(String l_img) {
		this.l_img = l_img;
	}
	
	
	
}
