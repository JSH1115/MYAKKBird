package com.bit.mapper;

import java.util.ArrayList;

import com.bit.myakkbird.mainpoint.MasterVO;

public interface AdminMapper {
	
	public int memberCount(MasterVO masterVO);
	public ArrayList<MasterVO> memberList(MasterVO masterVO);
	
	
	
	
	// 호준님 (매칭, 신고 내역)
	public int matchCount(MasterVO masterVO);
	public ArrayList<MasterVO> matchList(MasterVO masterVO);
	
	public int dangerCount(MasterVO masterVO);
	public ArrayList<MasterVO> dangerList(MasterVO masterVO);

	public void dangerOK(String d_id);
	public void dangerNO(String d_id);
}