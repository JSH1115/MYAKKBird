package com.bit.myakkbird.pay;

import java.util.Date;

public class PayVO {
	private int p_num;          // 결제번호
	private String m_id;        // 회원 아이디
	private Date p_date;        // 결제날짜
	private int p_price;        // 총 결제 금액
	private String p_pg;        // 결제방식
	private String heart_info;  // 하트충전 갯수
	private String pay_info;    // 결제금액
	private String pay_date;    // 결제날짜포맷
	
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public Date getP_date() {
		return p_date;
	}
	public void setP_date(Date p_date) {
		this.p_date = p_date;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public String getP_pg() {
		return p_pg;
	}
	public void setP_pg(String p_pg) {
		this.p_pg = p_pg;
	}
	
	public String getHeart_info() {
		return heart_info;
	}
	public void setHeart_info(String heart_info) {
		this.heart_info = heart_info;
	}
	
	public String getPay_info() {
		return pay_info;
	}
	public void setPay_info(String pay_info) {
		this.pay_info = pay_info;
	}
	public String getPay_date() {
		return pay_date;
	}
	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}
	
	
}
