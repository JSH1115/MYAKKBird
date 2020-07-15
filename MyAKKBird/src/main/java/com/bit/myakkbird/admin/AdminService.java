package com.bit.myakkbird.admin;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.bit.myakkbird.mainpoint.MasterVO;
import com.bit.myakkbird.member.MemberVO;

public interface AdminService {
	
	public int memberCountService(MasterVO masterVO);
	public ArrayList<MasterVO> memberListService(MasterVO masterVO);
}