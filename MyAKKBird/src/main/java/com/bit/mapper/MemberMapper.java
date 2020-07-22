package com.bit.mapper;

import com.bit.myakkbird.member.MemberVO;

public interface MemberMapper {
	
	//지연님
	public String memberType(String id);				//멤버타입(회원,근로자,관리자)체크
	public MemberVO profile(String id);					//개인회원정보 (프로필내역)모두 조회
	public int modifyProfile(MemberVO memberVO);		//개인회원정보 수정
	
	//호준님
	public int insertMember(MemberVO memberVO);
	public MemberVO userCheck(MemberVO memberVO);
	public MemberVO heartCheck(MemberVO memberVO);
	public MemberVO keepLogin(MemberVO memberVO);
	public MemberVO checkUserWithSessionKey(MemberVO memberVO);
	public int idcheck(String m_id);
	public MemberVO findId(MemberVO memberVO);
	public MemberVO findPw(MemberVO memberVO);
	
	//승주님
	public int heartCnt(String type_id);		//하트개수구하기
	
}
