package com.bit.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.bit.myakkbird.member.MemberVO;
import com.bit.myakkbird.pay.PayVO;

public interface PayMapper {
	// 결제내역 추가
	public void insertPay(HashMap<String,Object> params);
	// 하트 추가
	public void updateHeart(HashMap<String,Object> params);
	// 결제내역 횟수
	public int payListCount(String m_id);
	// 결제내역 목록
	public ArrayList<PayVO> payList(
			@Param("m_id") String m_id, 
			@Param("startrow") int startrow, 
			@Param("endrow") int endrow);
	// 결제내역 회원 확인
	public MemberVO checkMember(String m_id);
}
