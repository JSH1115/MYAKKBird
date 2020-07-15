package com.bit.myakkbird.accept;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.mapper.AcceptMapper;
import com.bit.myakkbird.mainpoint.MasterVO;

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

	@Override
	public ArrayList<MasterVO> clientAcceptList(String m_id) {	//수락한 게시물내역불러오기(고객) 5개미리 불러오기
		AcceptMapper acceptMapper = sqlSession.getMapper(AcceptMapper.class);
	
		return acceptMapper.clientAcceptList(m_id);
	}

	@Override
	public ArrayList<MasterVO> acceptListInfinite(String m_id, int startNo) throws Exception{	//수락한 게시물내역불러오기(고객) 무한스크롤
		AcceptMapper acceptMapper = sqlSession.getMapper(AcceptMapper.class);
		ArrayList<MasterVO> acceptInfinit = acceptMapper.acceptListInfinite(m_id, startNo);
		
		return acceptInfinit;
	}

	@Override
	public ArrayList<MasterVO> clientApplyList(String m_id) {
		AcceptMapper acceptMapper = sqlSession.getMapper(AcceptMapper.class);
		
		return acceptMapper.clientApplyList(m_id);		//신청받은 게시물내역 불러오기(고객) 5개 미리 불러오기
	}

	@Override
	public ArrayList<MasterVO> applyListInfinite(String m_id, int startNo) throws Exception{  //신청받은 게시물내역불러오기(고객) 무한스크롤
		AcceptMapper acceptMapper = sqlSession.getMapper(AcceptMapper.class);
		ArrayList<MasterVO> applyInfinit = acceptMapper.applyListInfinite(m_id, startNo);
		return applyInfinit;
	}

	@Override
	public MasterVO acceptBoardList(String m_id, int b_num) {	//하나의 게시글 정보 불러오기 (매칭완료페이지)
		AcceptMapper acceptMapper = sqlSession.getMapper(AcceptMapper.class);
		MasterVO acceptBoardList = acceptMapper.acceptBoardList(m_id, b_num);
		return acceptBoardList;
	}

	@Override
	public ArrayList<MasterVO> applyEmpProfile(int b_num) {	//신청한근로자 리스트 불러오기
		AcceptMapper acceptMapper = sqlSession.getMapper(AcceptMapper.class);
		ArrayList<MasterVO> applyEmpProfile = acceptMapper.applyEmpProfile(b_num);
		return applyEmpProfile;
	}

	@Override
	public MasterVO empProfile(String r_id) {	//근로자 프로필정보 불러오기
		AcceptMapper acceptMapper = sqlSession.getMapper(AcceptMapper.class);
		MasterVO empProfile = acceptMapper.empProfile(r_id);
		return empProfile;
	}

	@Override
	public ArrayList<MasterVO> applyEmpReview(String r_id) { //신청한근로자 리뷰정보 불러오기
		AcceptMapper acceptMapper = sqlSession.getMapper(AcceptMapper.class);
		ArrayList<MasterVO> applyEmpReview = acceptMapper.applyEmpReview(r_id);
		return applyEmpReview;
	}


}