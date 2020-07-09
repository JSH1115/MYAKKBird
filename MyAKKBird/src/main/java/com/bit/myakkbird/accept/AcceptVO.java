package com.bit.myakkbird.accept;

public class AcceptVO {
	private int a_num;			//요청번호
	private int b_num;			//게시글번호
	private String c_id;		//요청받는사람(회원ID)
	private String e_id;		//요청한사람(근로자ID)
	private String a_date;		//요청일
	private String a_apply;		//수락여부 N:Default Y:매칭완료
	private int apply_chk;		//게시글에 지원한 이력 체크용
	
	public int getA_num() {
		return a_num;
	}
	public void setA_num(int a_num) {
		this.a_num = a_num;
	}
	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public String getE_id() {
		return e_id;
	}
	public void setE_id(String e_id) {
		this.e_id = e_id;
	}
	public String getA_date() {
		return a_date;
	}
	public void setA_date(String a_date) {
		this.a_date = a_date;
	}
	public String getA_apply() {
		return a_apply;
	}
	public void setA_apply(String a_apply) {
		this.a_apply = a_apply;
	}
	public int getApply_chk() {
		return apply_chk;
	}
	public void setApply_chk(int apply_chk) {
		this.apply_chk = apply_chk;
	}
	
	
}
