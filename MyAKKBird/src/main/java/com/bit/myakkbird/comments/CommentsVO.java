package com.bit.myakkbird.comments;

public class CommentsVO {
	private int c_num;			//댓글번호
	private int b_num;			//게시글번호
	private String m_id;		//댓글쓴아이디
	private String c_content;	//댓글내용
	private String c_date;		//댓글작성일
	private int c_re_ref;		//댓글 답변 글의 그룹
	private int c_re_lev;		//댓글 답변 글의 깊이
	private int c_re_seq;		//댓글 답변 글의 순서
	private int comment_cnt;	//한게시글 당 댓글의 총 개수
	
	
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
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
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public String getC_date() {
		return c_date;
	}
	public void setC_date(String c_date) {
		this.c_date = c_date;
	}
	public int getC_re_ref() {
		return c_re_ref;
	}
	public void setC_re_ref(int c_re_ref) {
		this.c_re_ref = c_re_ref;
	}
	public int getC_re_lev() {
		return c_re_lev;
	}
	public void setC_re_lev(int c_re_lev) {
		this.c_re_lev = c_re_lev;
	}
	public int getC_re_seq() {
		return c_re_seq;
	}
	public void setC_re_seq(int c_re_seq) {
		this.c_re_seq = c_re_seq;
	}
	public int getComment_cnt() {
		return comment_cnt;
	}
	public void setComment_cnt(int comment_cnt) {
		this.comment_cnt = comment_cnt;
	}
	
}
