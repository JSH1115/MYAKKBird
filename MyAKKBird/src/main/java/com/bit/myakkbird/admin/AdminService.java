package com.bit.myakkbird.admin;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.bit.myakkbird.mainpoint.MasterVO;
import com.bit.myakkbird.member.MemberVO;

public interface AdminService {
	
	public int memberCountService(MasterVO masterVO);
	public ArrayList<MasterVO> memberListService(MasterVO masterVO);
	
	
	//호준님 (신고, 매칭)
	public int matchCountService(MasterVO masterVO);
	public ArrayList<MasterVO> matchListService(MasterVO masterVO);

	public int dangerCountService(MasterVO masterVO);
	public ArrayList<MasterVO> dangerListService(MasterVO masterVO);
	
	public void dangerOKService(String d_id);
	public void dangerNOService(String d_id);
}