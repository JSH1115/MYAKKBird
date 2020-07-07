package com.bit.myakkbird.accept;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.mapper.AcceptMapper;

@Service("acceptService")
public class AcceptServiceImpl implements AcceptService{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public String isMatched(String id) {		//요청테이블. 회원과 근로자가 서로 매칭된 상태인지 체크
		AcceptMapper acceptMapper = sqlSession.getMapper(AcceptMapper.class);
		String matchedPpl = acceptMapper.isMatched(id);
		return matchedPpl;
	}

}
