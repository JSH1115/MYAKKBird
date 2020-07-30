package com.bit.myakkbird.danger;

import java.sql.Date;

import com.bit.myakkbird.admin.PageVO;

public class DangerVO extends PageVO {
	private int d_num;			//신고 번호 
	private int b_num;			//게시글 번호 
	private int c_num;			//댓글 번호 
	private String m_id;		//신고하는회원ID 
	private String d_id;		//신고받는회원ID 
	private String d_con;		//신고사유 
	private String d_status;	//처리상태          //D:처리전 O:처리완료 X:사유부족처리x
	private String d_type;		//신고유형          //A:허위정보 B:음란성 C:도배/홍보 D:규정위반 E:기타
	private Date d_date;		//신고일자 
	private Date d_s_date;		//처리일자 
	
	
	public int getD_num() {
		return d_num;
	}
	public void setD_num(int d_num) {
		this.d_num = d_num;
	}
	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getD_id() {
		return d_id;
	}
	public void setD_id(String d_id) {
		this.d_id = d_id;
	}
	public String getD_con() {
		return d_con;
	}
	public void setD_con(String d_con) {
		this.d_con = d_con;
	}
	public String getD_status() {
		return d_status;
	}
	public void setD_status(String d_status) {
		this.d_status = d_status;
	}
	public String getD_type() {
		return d_type;
	}
	public void setD_type(String d_type) {
		this.d_type = d_type;
	}
	public Date getD_date() {
		return d_date;
	}
	public void setD_date(Date d_date) {
		this.d_date = d_date;
	}
	public Date getD_s_date() {
		return d_s_date;
	}
	public void setD_s_date(Date d_s_date) {
		this.d_s_date = d_s_date;
	}
	
}
