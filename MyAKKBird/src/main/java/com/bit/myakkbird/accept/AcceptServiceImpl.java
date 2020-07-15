package com.bit.myakkbird.accept;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.mapper.AcceptMapper;

@Service("acceptService")
public class AcceptServiceImpl implements AcceptService{
	
	@Autowired
	private SqlSession sqlSession;
	
	//지연님
	@Override
	public String isMatchedWhenC(String id) {		//요청테이블. 회원과 근로자가 서로 매칭된 상태인지 체크
		AcceptMapper acceptMapper = sqlSession.getMapper(AcceptMapper.class);
		String matchedPpl = acceptMapper.isMatchedWhenC(id);
		return matchedPpl;
	}

	@Override
	public String isMatchedWhenE(String id) {
		AcceptMapper acceptMapper = sqlSession.getMapper(AcceptMapper.class);
		String matchedPpl = acceptMapper.isMatchedWhenE(id);
		return matchedPpl;
	}
	
	//승주님
	@Override
	public String isMatched(String id) {		//요청테이블. 회원과 근로자가 서로 매칭된 상태인지 체크
		AcceptMapper acceptMapper = sqlSession.getMapper(AcceptMapper.class);
		String matchedPpl = acceptMapper.isMatched(id);
		return matchedPpl;
	}

	@Override
	public int applyInsert(AcceptVO acceptVO) {	//요청하기(근로자 > 회원)에게 신청
		AcceptMapper acceptMapper = sqlSession.getMapper(AcceptMapper.class);
		int res = acceptMapper.applyInsert(acceptVO);
		return res;
	}

	@Override
	public AcceptVO applyChk(AcceptVO acceptVO) {//요청 전 신청내역 체크
		AcceptMapper acceptMapper = sqlSession.getMapper(AcceptMapper.class);
		AcceptVO apply_chk = acceptMapper.applyChk(acceptVO);
		return apply_chk;
	}

}
