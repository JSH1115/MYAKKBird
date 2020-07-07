package com.bit.mapper;

import com.bit.myakkbird.member.MemberVO;

public interface MemberMapper {
	
	public String memberType(String id);				//硫ㅻ쾭���엯(�쉶�썝,洹쇰줈�옄,愿�由ъ옄)泥댄겕
	public MemberVO profile(String id);					//媛쒖씤�쉶�썝�젙蹂� (�봽濡쒗븘�궡�뿭)紐⑤몢 議고쉶
	public int modifyProfile(MemberVO memberVO);		//媛쒖씤�쉶�썝�젙蹂� �닔�젙
	
	//�샇以��떂
	public int insertMember(MemberVO memberVO);
	public MemberVO userCheck(MemberVO memberVO);
	public MemberVO heartCheck(MemberVO memberVO);
	public MemberVO keepLogin(MemberVO memberVO);
	public MemberVO checkUserWithSessionKey(MemberVO memberVO);
	
}
