package com.bit.myakkbird.review;

public class LikeVO {
	private int l_num; 		//좋아요 번호
	private int r_num; 		//리뷰번호
	private String m_id; 	//회원아이디
	private int l_check;	//좋아요누른 상태 체크
	
	public int getL_num() {
		return l_num;
	}
	public void setL_num(int l_num) {
		this.l_num = l_num;
	}
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getL_check() {
		return l_check;
	}
	public void setL_check(int l_check) {
		this.l_check = l_check;
	}
	
}