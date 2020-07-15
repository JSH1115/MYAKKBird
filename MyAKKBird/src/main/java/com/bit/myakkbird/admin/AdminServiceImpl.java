package com.bit.myakkbird.admin;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.mapper.AdminMapper;
import com.bit.myakkbird.mainpoint.MasterVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int memberCountService(MasterVO masterVO) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		int result = adminMapper.memberCount(masterVO);
		
		return result;
	}
	
	@Override
	public ArrayList<MasterVO> memberListService(MasterVO masterVO) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		ArrayList<MasterVO> memberList = adminMapper.memberList(masterVO);
		
		return memberList;
	}

}