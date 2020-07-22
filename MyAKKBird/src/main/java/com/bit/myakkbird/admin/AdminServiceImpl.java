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

	
	// ========================================================================
	
	//호준님 (신고, 매칭)
	@Override
	public int matchCountService(MasterVO masterVO) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		int result = adminMapper.matchCount(masterVO);
		
		return result;
	}
	
	@Override
	public ArrayList<MasterVO> matchListService(MasterVO masterVO) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		ArrayList<MasterVO> matchList = adminMapper.matchList(masterVO);
		
		return matchList;
	}
	
	@Override
	public int dangerCountService(MasterVO masterVO) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		int result = adminMapper.dangerCount(masterVO);
		
		return result;
	}
	
	@Override
	public ArrayList<MasterVO> dangerListService(MasterVO masterVO) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		ArrayList<MasterVO> dangerList = adminMapper.dangerList(masterVO);
		
		return dangerList;
	}
	
	@Override
	public void dangerOKService(String d_id) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		adminMapper.dangerOK(d_id);
		
	}
	
	@Override
	public void dangerNOService(String d_id) {
		AdminMapper adminMapper = sqlSession.getMapper(AdminMapper.class);
		adminMapper.dangerNO(d_id);
		
	}
}