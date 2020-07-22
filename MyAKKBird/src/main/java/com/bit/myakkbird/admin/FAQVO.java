package com.bit.myakkbird.admin;

import java.util.Date;

public class FAQVO {
	private int f_num;         // FAQ번호
	private String f_sub;      // FAQ제목
	private String f_content;  // FAQ내용
	private Date f_date;       // FAQ작성일
	private int f_readcount;   // FAQ조회수
	
	public int getF_num() {
		return f_num;
	}
	public void setF_num(int f_num) {
		this.f_num = f_num;
	}
	public String getF_sub() {
		return f_sub;
	}
	public void setF_sub(String f_sub) {
		this.f_sub = f_sub;
	}
	public String getF_content() {
		return f_content;
	}
	public void setF_content(String f_content) {
		this.f_content = f_content;
	}
	public Date getF_date() {
		return f_date;
	}
	public void setF_date(Date f_date) {
		this.f_date = f_date;
	}
	public int getF_readcount() {
		return f_readcount;
	}
	public void setF_readcount(int f_readcount) {
		this.f_readcount = f_readcount;
	}
	
}