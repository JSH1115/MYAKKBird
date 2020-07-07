package com.bit.myakkbird.member;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {
	private String m_id;				//�쉶�썝�븘�씠�뵒
	private String m_password;			//�쉶�썝鍮꾨�踰덊샇
	private String m_photo;				//�쉶�썝�봽濡쒗븘�궗吏�
	private String m_name;				//�쉶�썝�씠由�
	private int m_age;					//�쉶�썝�굹�씠
	private String m_gender;			//�쉶�썝�꽦蹂�
	private String m_address_road;		//�쉶�썝二쇱냼(吏�踰�)
	private String m_address_detail;	//�쉶�썝二쇱냼(�긽�꽭)
	private String m_email;				//�쉶�썝�씠硫붿씪
	private String m_phone;				//�쉶�썝�쑕���쟾�솕
	private String m_category;			//�븯�쐞�꽑�깮移댄뀒怨좊━ 	//A:�젙湲곗껌�냼 B:�듅�닔�옣鍮꾩껌�냼 C:�엯二쇱껌�냼(�씠�궗泥��냼) D:�긽二쇱껌�냼 E:鍮뚮뵫泥��냼 F:諛⑹뿭
	private String m_type;				//�쉶�썝援щ텇移쇰읆		//C:怨좉컼�쉶�썝 E:洹쇰줈�옄�쉶�썝 M:愿�由ъ옄
	private int m_heart;				//�븯�듃 媛쒖닔		//�뵒�뤃�듃3媛�
	private String m_status;			//�쉶�썝 �깉�눜�뿬遺�		//N:�깉�눜�븞�븿(�뵒�뤃�듃) Y:�깉�눜�쉶�썝
	private MultipartFile file;			//input���엯�뿉�꽌 �봽濡쒗븘�궗吏꾩쓣 ���옣�븯湲곗쐞�븳 蹂��닔
	private String org_file; // 원본 파일 이름 저장
	private boolean useCookie;
	
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
