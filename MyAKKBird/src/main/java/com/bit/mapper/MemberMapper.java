package com.bit.mapper;

import com.bit.myakkbird.member.MemberVO;

public interface MemberMapper {
	
	public String memberType(String id);				//멤버타입(회원,근로자,관리자)체크
	public MemberVO profile(String id);					//개인회원정보 (프로필내역)모두 조회
	public int modifyProfile(MemberVO memberVO);		//개인회원정보 수정
	
	//호준님
	public int insertMember(MemberVO memberVO);
	public int userCheck(MemberVO memberVO);
	public MemberVO heartCheck(MemberVO memberVO);
	
}
