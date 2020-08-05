package com.bit.myakkbird.mainpoint;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import com.bit.myakkbird.admin.PageVO;

public class MasterVO extends PageVO {
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
	private String b_up_file2;        //업로드 파일명2
	private String b_up_file3;        //업로드 파일명3
	private int b_readcount;       	  //조회수
	private Date b_date;              //게시글 올린 날짜
	private String b_apply;           //게시글 신청 여부
	private String b_delete;          //게시글 삭제 여부
	private String w_state;           //게시글 찜 여부
	
	private String img;               //카테고리 그림 저장을 위한 변수
	
	private int a_num;				  //요청번호
	private String a_date;			  //요청일
	private String e_id;			  //요청한사람(근로자ID)
	private String a_apply;			  //수락여부
	private int applyEmp_chk;		  //게시글 당 지원한 지원자 수	
	
	private int r_num;				//리뷰번호
	private String r_id;			//리뷰 받는 아이디
	private String r_content;		//리뷰내용
	private String r_date;			//작성일
	private double r_star;			//별점 1 2 3 4 5(Default)
	private String r_up_file;		//업로드리뷰파일명
	private int r_like;				//좋아요
	private int r_cnt;				//리뷰 총 개수
	
	private String c_id;        //작성인(고객ID
	private int d_num;			//신고 번호 		
	private int c_num;			//댓글 번호 		
	private String d_id;		//신고받는회원ID 
	private String d_con;		//신고사유 
	private String d_status;	//처리상태          //D:처리전 O:처리완료 X:사유부족처리x
	private String d_type;		//신고유형          //A:허위정보 B:음란성 C:도배/홍보 D:규정위반 E:기타
	private Date d_date;		//신고일자 
	private Date d_s_date;		//처리일자 
	
	private String c_content;   //댓글 신고내용
	private String bnum;        //게시글 번호(join)
	
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
	public String getW_state() {
		return w_state;
	}
	public void setW_state(String w_state) {
		this.w_state = w_state;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getA_num() {
		return a_num;
	}
	public void setA_num(int a_num) {
		this.a_num = a_num;
	}
	public String getA_date() {
		return a_date;
	}
	public void setA_date(String a_date) {
		this.a_date = a_date;
	}
	public String getE_id() {
		return e_id;
	}
	public void setE_id(String e_id) {
		this.e_id = e_id;
	}
	public String getA_apply() {
		return a_apply;
	}
	public void setA_apply(String a_apply) {
		this.a_apply = a_apply;
	}
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
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
	public int getR_like() {
		return r_like;
	}
	public void setR_like(int r_like) {
		this.r_like = r_like;
	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public int getD_num() {
		return d_num;
	}
	public void setD_num(int d_num) {
		this.d_num = d_num;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
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
	public int getApplyEmp_chk() {
		return applyEmp_chk;
	}
	public void setApplyEmp_chk(int applyEmp_chk) {
		this.applyEmp_chk = applyEmp_chk;
	}
	public int getR_cnt() {
		return r_cnt;
	}
	public void setR_cnt(int r_cnt) {
		this.r_cnt = r_cnt;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public String getBnum() {
		return bnum;
	}
	public void setBnum(String bnum) {
		this.bnum = bnum;
	}
	
}
