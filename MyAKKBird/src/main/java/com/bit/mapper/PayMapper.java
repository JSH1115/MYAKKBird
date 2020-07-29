package com.bit.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.bit.myakkbird.member.MemberVO;
import com.bit.myakkbird.pay.PayVO;

public interface PayMapper {
	public void insertPay(HashMap<String,Object> params);
	public void updateHeart(HashMap<String,Object> params);
	
	public int payListCount(String m_id);
	public ArrayList<PayVO> payList(
			@Param("m_id") String m_id, 
			@Param("startrow") int startrow, 
			@Param("endrow") int endrow);
	public MemberVO checkMember(String m_id);
}
