package com.bit.myakkbird.member;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {
	private String m_id;				//회원아이디
	private String m_password;			//회원비밀번호
	private String m_photo;				//회원프로필사진
	private String m_name;				//회원이름
	private int m_age;					//회원나이
	private String m_gender;			//회원성별
	private String m_address_road;		//회원주소(지번)
	private String m_address_detail;	//회원주소(상세)
	private String m_email;				//회원이메일
	private String m_phone;				//회원휴대전화
	private String m_category;			//하위선택카테고리 	//A:정기청소 B:특수장비청소 C:입주청소(이사청소) D:상주청소 E:빌딩청소 F:방역
	private String m_type;				//회원구분칼럼		//C:고객회원 E:근로자회원 M:관리자
	private int m_heart;				//하트 개수		//디폴트3개
	private String m_status;			//회원 탈퇴여부		//N:탈퇴안함(디폴트) Y:탈퇴회원
	private MultipartFile file;			//input타입에서 프로필사진을 저장하기위한 변수
	private String org_file;            //원본 파일 이름 저장
	private boolean useCookie;          //쿠키 사용
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
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
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getOrg_file() {
		return org_file;
	}
	public void setOrg_file(String org_file) {
		this.org_file = org_file;
	}
	public boolean isUseCookie() {
		return useCookie;
	}
	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}
	

}
