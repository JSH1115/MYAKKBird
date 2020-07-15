package com.bit.mapper;

import java.util.ArrayList;

import com.bit.myakkbird.mainpoint.MasterVO;

public interface AdminMapper {
	
	public int memberCount(MasterVO masterVO);
	public ArrayList<MasterVO> memberList(MasterVO masterVO);
	
}