package com.bit.myakkbird.mypage;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {
	private int b_num;                //게시글 번호 
	private String m_id;              //회원 아이디 
	private String b_type;            //글 유형
	private String b_category;        //하위선택카테고리	//A:정기청소 B:특수청소 C:입주청소(이사청소) D:상주청소 E:빌딩청소 F:방역청소
	private int b_money;              //시급
	private Date b_start;             //시작 날짜
	private Date b_end;               //끝나는 날짜
	private String b_d_detail;        //상세 근무 시간
	private String b_address_road;    //주소(지번)
	private String b_address_detail;  //주소(상세) 
	private String b_subject;         //제목
	private String b_content;         //내용 
	private MultipartFile file;       //멀티파트 파일
	private String b_org_file;        //첨부 파일명
	private String b_up_file;         //업로드 파일명 
	private String b_up_file2;         //업로드 파일명2
	private String b_up_file3;         //업로드 파일명3
	private int b_readcount;       	  //조회수
	private Date b_date;              //게시글 올린 날짜
	private String b_apply;           //게시글 신청 여부
	private String b_delete;          //게시글 삭제 여부
	private String m_name;			  //회원이름
	private String m_name1, m_name2;  //이름 첫글자, 세번째~마지막글자
	private int apply_cnt;		  	  //게시글에 지원한 총 지원자 수
	private String m_photo;			  //프로필 사진
	
	public String getM_name1() {
		return m_name1;
	}
	public void setM_name1(String m_name1) {
		this.m_name1 = m_name1;
	}
	public String getM_name2() {
		return m_name2;
	}
	public void setM_name2(String m_name2) {
		this.m_name2 = m_name2;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
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
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
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
	public int getB_readcount() {
		return b_readcount;
	}
	public void setB_readcount(int b_readcount) {
		this.b_readcount = b_readcount;
	}
	public int getApply_cnt() {
		return apply_cnt;
	}
	public void setApply_cnt(int apply_cnt) {
		this.apply_cnt = apply_cnt;
	}
	public String getB_up_file2() {
		return b_up_file2;
	}
	public void setB_up_file2(String b_up_file2) {
		this.b_up_file2 = b_up_file2;
	}
	public String getB_up_file3() {
		return b_up_file3;
	}
	public void setB_up_file3(String b_up_file3) {
		this.b_up_file3 = b_up_file3;
	}
	public String getM_photo() {
		return m_photo;
	}
	public void setM_photo(String m_photo) {
		this.m_photo = m_photo;
	}
	
	
}
