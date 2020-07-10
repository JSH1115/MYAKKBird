package com.bit.myakkbird.banner;

import java.util.Date;

public class BannerVO {
	private int ba_num;    //광고번호
	private String m_id;   //회원 아이디
	private String ba_got; //하트 받은 상태 Y:하트받음 N:안받음 
	private Date ba_date;  //하트 받은 날짜
	
	public int getBa_num() {
		return ba_num;
	}
	public void setBa_num(int ba_num) {
		this.ba_num = ba_num;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getBa_got() {
		return ba_got;
	}
	public void setBa_got(String ba_got) {
		this.ba_got = ba_got;
	}
	public Date getBa_date() {
		return ba_date;
	}
	public void setBa_date(Date ba_date) {
		this.ba_date = ba_date;
	}
	
}
