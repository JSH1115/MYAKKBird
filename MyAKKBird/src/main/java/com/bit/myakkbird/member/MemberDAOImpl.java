package com.bit.myakkbird.member;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO{

	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public MemberVO login(MemberVO dto) {
		 
		return sqlSession.selectOne("com.bit.mapper.MemberMapper.userCheck", dto);
	}

	public void keepLogin(String uid, String sessionId, Date next) {
		 Map<String, Object> map =new HashMap<String,Object>();
	        map.put("m_id", uid);
	        map.put("sessionId", sessionId);
	        map.put("next", next);

	        sqlSession.update("com.bit.mapper.MemberMapper.keepLogin",map);
		
	}

	public MemberVO checkUserWithSessionKey(String sessionId) {
		
		return sqlSession.selectOne("com.bit.mapper.MemberMapper.checkUserWithSessionKey",sessionId);
	}

}