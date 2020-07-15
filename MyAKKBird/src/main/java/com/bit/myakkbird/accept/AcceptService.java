package com.bit.myakkbird.accept;

import java.util.ArrayList;

import com.bit.myakkbird.mainpoint.MasterVO;

public interface AcceptService {
	
	//지연님
	public String isMatchedWhenC(String id);							//요청테이블. 회원과 근로자가 서로 매칭된 상태인지 체크
	public String isMatchedWhenE(String id);
	
	//승주님
	public String isMatched(String id);							//요청테이블. 회원과 근로자가 서로 매칭된 상태인지 체크

	public int applyInsert(AcceptVO acceptVO);					//요청하기(근로자 > 회원)에게 신청

	public AcceptVO applyChk(AcceptVO acceptVO);				//요청 전 신청이력 체크

	public ArrayList<MasterVO> clientAcceptList(String m_id);	//수락한 게시물내역불러오기(고객) 5개미리 불러오기

	public ArrayList<MasterVO> acceptListInfinite(String m_id, int startNo) throws Exception;	//수락한 게시물내역불러오기(고객) 무한스크롤

	public ArrayList<MasterVO> clientApplyList(String m_id);	//신청받은 게시물내역 불러오기(고객) 5개 미리 불러오기

	public ArrayList<MasterVO> applyListInfinite(String m_id, int startNo) throws Exception;	//신청받은 게시물내역불러오기(고객) 무한스크롤

	public MasterVO acceptBoardList(String m_id, int b_num);	//하나의 게시글 정보 불러오기 (매칭완료페이지)

	public ArrayList<MasterVO> applyEmpProfile(int b_num);		//신청한근로자 리스트 불러오기

	public MasterVO empProfile(String r_id);					//근로자의 프로필정보 불러오기

	public ArrayList<MasterVO> applyEmpReview(String r_id);		//신청한근로자 리뷰정보 불러오기

}
