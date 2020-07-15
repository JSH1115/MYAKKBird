package com.bit.myakkbird.accept;

public interface AcceptService {
	
	//지연님
	public String isMatchedWhenC(String id);							//요청테이블. 회원과 근로자가 서로 매칭된 상태인지 체크
	public String isMatchedWhenE(String id);
	
	//승주님
	public String isMatched(String id);							//요청테이블. 회원과 근로자가 서로 매칭된 상태인지 체크

	public int applyInsert(AcceptVO acceptVO);					//요청하기(근로자 > 회원)에게 신청

	public AcceptVO applyChk(AcceptVO acceptVO);				//요청 전 신청이력 체크
}
