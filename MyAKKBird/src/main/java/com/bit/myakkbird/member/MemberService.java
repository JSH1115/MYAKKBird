package com.bit.myakkbird.member;

import java.util.Date;

public interface MemberService {

	public String mypage_menu(String id);						//멤버타입(회원,근로자,관리자)체크
	public MemberVO profile(String id);							//개인회원정보 (프로필내역)모두 조회
	public int modifyProfile(MemberVO memberVO);				//개인회원정보 수정
	
	//호준님
	public int insertMember(MemberVO memberVO);					//회원가입
	public MemberVO userCheck(MemberVO memberVO);					//로그인체크
	public MemberVO heartCheck(MemberVO memberVO);				//결제하기
	public void keepLogin(String uid, String sessionId, Date next);
    public MemberVO checkUserWithSessionKey(String sessionId);
    public int idcheck(String m_id);
    public MemberVO searchId(MemberVO memberVO);
    public MemberVO searchPw(MemberVO memberVO);
	
    //승주님
    public int heartCnt(String type_id);		//하트개수구하기
}
