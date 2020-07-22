package com.bit.myakkbird.review;

import org.springframework.web.multipart.MultipartFile;

public class ReviewVO {
	private int r_num;				//리뷰번호
	private String m_id;			//회원 아이디
	private String r_id;			//리뷰 받는 아이디
	private String r_content;		//리뷰내용
	private String r_date;			//작성일
	private double r_star;			//별점 1 2 3 4 5(Default)
	private String r_up_file;		//업로드리뷰파일명
	private MultipartFile file1;	//input타입에서 리뷰사진을 저장하기위한 변수
	private int r_like;			//좋아요
	private String m_photo;
	private int l_check;
	
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
	public String getR_id() {
		return r_id;
	}
	public void setR_id(String r_id) {
		this.r_id = r_id;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public String getR_date() {
		return r_date;
	}
	public void setR_date(String r_date) {
		this.r_date = r_date;
	}
	public double getR_star() {
		return r_star;
	}
	public void setR_star(double r_star) {
		this.r_star = r_star;
	}
	public String getR_up_file() {
		return r_up_file;
	}
	public void setR_up_file(String r_up_file) {
		this.r_up_file = r_up_file;
	}
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	public int getR_like() {
		return r_like;
	}
	public void setR_like(int r_like) {
		this.r_like = r_like;
	}
	public String getM_photo() {
		return m_photo;
	}
	public void setM_photo(String m_photo) {
		this.m_photo = m_photo;
	}
	public int getL_check() {
		return l_check;
	}
	public void setL_check(int l_check) {
		this.l_check = l_check;
	}

}