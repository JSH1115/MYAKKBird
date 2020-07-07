package com.bit.myakkbird.member;

import java.util.Date;



public interface MemberService {

	public String mypage_menu(String id);						//硫ㅻ쾭���엯(�쉶�썝,洹쇰줈�옄,愿�由ъ옄)泥댄겕
	public MemberVO profile(String id);							//媛쒖씤�쉶�썝�젙蹂� (�봽濡쒗븘�궡�뿭)紐⑤몢 議고쉶
	public int modifyProfile(MemberVO memberVO);				//媛쒖씤�쉶�썝�젙蹂� �닔�젙
	
	//�샇以��떂
	public int insertMember(MemberVO memberVO);					//�쉶�썝媛��엯
	public MemberVO userCheck(MemberVO memberVO) ;					//濡쒓렇�씤泥댄겕
	public MemberVO heartCheck(MemberVO memberVO);				//寃곗젣�븯湲�
	
	public void keepLogin(String uid, String sessionId, Date next);
    public MemberVO checkUserWithSessionKey(String sessionId);
}
