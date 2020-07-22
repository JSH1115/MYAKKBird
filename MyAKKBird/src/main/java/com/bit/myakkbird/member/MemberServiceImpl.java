package com.bit.myakkbird.member;

import java.util.Date;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.mapper.MemberMapper;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	MemberDAO dao;
	
	@Override
	public String mypage_menu(String id) {	 //멤버타입(회원,근로자,관리자)체크
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		String m_type = memberMapper.memberType(id);
		return m_type;
	}

	@Override
	public MemberVO profile(String id) {	//개인회원정보 (프로필내역)모두 조회
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		MemberVO memberVO = memberMapper.profile(id);
		return memberVO;
	}

	@Override
	public int modifyProfile(MemberVO memberVO) {	//개인회원정보 수정
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		int res = memberMapper.modifyProfile(memberVO);
		return res;
	}

	@Override
	public int insertMember(MemberVO memberVO) {	//회원가입
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		int res = memberMapper.insertMember(memberVO);
		
		return res;
	}

	@Override
	public MemberVO userCheck(MemberVO memberVO) {		//로그인체크
		return dao.login(memberVO);
	}

	@Override
	public MemberVO heartCheck(MemberVO memberVO) {	//결제하기
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		MemberVO vo = memberMapper.heartCheck(memberVO);
		return vo;
	}
	
	@Override
    public void keepLogin(String uid, String sessionId, Date next) {
 
        dao.keepLogin(uid, sessionId, next);
    }
 
    @Override
    public MemberVO checkUserWithSessionKey(String sessionId) {
        return dao.checkUserWithSessionKey(sessionId);
    }
    
	@Override
	public int idcheck(String m_id) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		int res = memberMapper.idcheck(m_id);
		return res;
	}

	@Override
	public MemberVO searchId(MemberVO memberVO) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		
		MemberVO vo = memberMapper.findId(memberVO);
		return vo; 
	}
	
	@Override
	public MemberVO searchPw(MemberVO memberVO) {
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		
		MemberVO vo = memberMapper.findPw(memberVO);
		return vo; 
	}
	
	@Override
	public int heartCnt(String type_id) {	//하트개수구하기
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		int heart = memberMapper.heartCnt(type_id);
		return heart;
	}

}
