package com.bit.myakkbird.pay;

import java.util.Date;

public class PayVO {
	private int p_num;
	private String m_id;
	private Date p_date;
	private int p_price;
	private String p_pg;
	private String p_info;
	
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
	public String getP_info() {
		return p_info;
	}
	public void setP_info(String p_info) {
		this.p_info = p_info;
	}
	
}
