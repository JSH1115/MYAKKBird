package com.bit.myakkbird.pay;

import java.util.ArrayList;
import java.util.HashMap;

import com.bit.myakkbird.member.MemberVO;

public interface PayService {
	// 결제내역 추가
	public void insertPay(HashMap<String,Object> params);
	// 하트 추가
	public void updateHeart(HashMap<String,Object> params);
	// 결제내역 횟수
	public int payListCountService(String m_id);
	// 결제내역 목록
	public ArrayList<PayVO> payListService(String m_id,
			int startrow, int endrow);
	// 결제내역 회원 확인
	public MemberVO checkMemberService(String m_id);
}
