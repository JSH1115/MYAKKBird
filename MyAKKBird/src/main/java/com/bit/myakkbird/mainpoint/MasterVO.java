package com.bit.myakkbird.mainpoint;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class MasterVO {
	private String m_password;        //회원 비밀번호
	private String m_photo;           //회원 사진
	private String m_name;            //회원 이름
	private int m_age;                //회원 나이
	private String m_gender;          //회원 성별
	private String m_address_road;    //회원 지번주소
	private String m_address_detail;  //회원 상세주소
	private String m_email;           //회원 이메일
	private String m_phone;           //회원 전화번호
	private String m_category;        //회원 하위선택 카테고리
	private String m_type;            //회원 타입
	private int m_heart;              //회원 하트 개수
	private String m_status;          //회원 탈퇴 여부
	
	private int b_num;                //게시글 번호 
	private String m_id;              //회원 아이디 
	private String b_type;            //글 유형
	private String b_category;        //하위선택카테고리
	private int b_money;              //시급
	private Date b_start;             //시작 날짜
	private Date b_end;               //끝나는 날짜
	private String b_d_detail;        //상세 근무 시간
	private String b_address_road;    //주소(지번)
	private String b_address_detail;  //주소(상세) 
	private String b_subject;         //제목
	private String b_content;         //내용 
	private String b_org_file;        //첨부 파일명
	private String b_up_file;         //업로드 파일명 
	private int b_readcount;       	  //조회수
	private Date b_date;              //게시글 올린 날짜
	private String b_apply;           //게시글 신청 여부
	private String b_delete;          //게시글 삭제 여부
	
	private String img;               //카테고리 그림 저장을 위한 변수
	
	public String getM_password() {
		return m_password;
	}
	public void setM_password(String m_password) {
		this.m_password = m_password;
	}
	public String getM_photo() {
		return m_photo;
	}
	public void setM_photo(String m_photo) {
		this.m_photo = m_photo;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public int getM_age() {
		return m_age;
	}
	public void setM_age(int m_age) {
		this.m_age = m_age;
	}
	public String getM_gender() {
		return m_gender;
	}
	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}
	public String getM_address_road() {
		return m_address_road;
	}
	public void setM_address_road(String m_address_road) {
		this.m_address_road = m_address_road;
	}
	public String getM_address_detail() {
		return m_address_detail;
	}
	public void setM_address_detail(String m_address_detail) {
		this.m_address_detail = m_address_detail;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public String getM_category() {
		return m_category;
	}
	public void setM_category(String m_category) {
		this.m_category = m_category;
	}
	public String getM_type() {
		return m_type;
	}
	public void setM_type(String m_type) {
		this.m_type = m_type;
	}
	public int getM_heart() {
		return m_heart;
	}
	public void setM_heart(int m_heart) {
		this.m_heart = m_heart;
	}
	public String getM_status() {
		return m_status;
	}
	public void setM_status(String m_status) {
		this.m_status = m_status;
	}
	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getB_type() {
		return b_type;
	}
	public void setB_type(String b_type) {
		this.b_type = b_type;
	}
	public String getB_category() {
		return b_category;
	}
	public void setB_category(String b_category) {
		this.b_category = b_category;
	}
	public int getB_money() {
		return b_money;
	}
	public void setB_money(int b_money) {
		this.b_money = b_money;
	}
	public Date getB_start() {
		return b_start;
	}
	public void setB_start(Date b_start) {
		this.b_start = b_start;
	}
	public Date getB_end() {
		return b_end;
	}
	public void setB_end(Date b_end) {
		this.b_end = b_end;
	}
	public String getB_d_detail() {
		return b_d_detail;
	}
	public void setB_d_detail(String b_d_detail) {
		this.b_d_detail = b_d_detail;
	}
	public String getB_address_road() {
		return b_address_road;
	}
	public void setB_address_road(String b_address_road) {
		this.b_address_road = b_address_road;
	}
	public String getB_address_detail() {
		return b_address_detail;
	}
	public void setB_address_detail(String b_address_detail) {
		this.b_address_detail = b_address_detail;
	}
	public String getB_subject() {
		return b_subject;
	}
	public void setB_subject(String b_subject) {
		this.b_subject = b_subject;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public String getB_org_file() {
		return b_org_file;
	}
	public void setB_org_file(String b_org_file) {
		this.b_org_file = b_org_file;
	}
	public String getB_up_file() {
		return b_up_file;
	}
	public void setB_up_file(String b_up_file) {
		this.b_up_file = b_up_file;
	}
	public int getB_readcount() {
		return b_readcount;
	}
	public void setB_readcount(int b_readcount) {
		this.b_readcount = b_readcount;
	}
	public Date getB_date() {
		return b_date;
	}
	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}
	public String getB_apply() {
		return b_apply;
	}
	public void setB_apply(String b_apply) {
		this.b_apply = b_apply;
	}
	public String getB_delete() {
		return b_delete;
	}
	public void setB_delete(String b_delete) {
		this.b_delete = b_delete;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
}
