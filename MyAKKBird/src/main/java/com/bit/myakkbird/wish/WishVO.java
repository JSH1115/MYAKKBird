package com.bit.myakkbird.wish;

import java.sql.Date;

public class WishVO {
	private int w_num;      // 찜번호
	private String m_id;    // 회원 아이디
	private int b_num;      // 게시글 번호
	private Date w_date;    // 찜한 날짜
	private String w_state; // 찜상태  
	
	public int getW_num() {
		return w_num;
	}
	public void setW_num(int w_num) {
		this.w_num = w_num;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
	public Date getW_date() {
		return w_date;
	}
	public void setW_date(Date w_date) {
		this.w_date = w_date;
	}
	public String getW_state() {
		return w_state;
	}
	public void setW_state(String w_state) {
		this.w_state = w_state;
	}
	
	
}
