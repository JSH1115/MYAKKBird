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
	public String mypage_menu(String id) {	 //硫ㅻ쾭���엯(�쉶�썝,洹쇰줈�옄,愿�由ъ옄)泥댄겕
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		String m_type = memberMapper.memberType(id);
		return m_type;
	}

	@Override
	public MemberVO profile(String id) {	//媛쒖씤�쉶�썝�젙蹂� (�봽濡쒗븘�궡�뿭)紐⑤몢 議고쉶
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		MemberVO memberVO = memberMapper.profile(id);
		return memberVO;
	}

	@Override
	public int modifyProfile(MemberVO memberVO) {	//媛쒖씤�쉶�썝�젙蹂� �닔�젙
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		int res = memberMapper.modifyProfile(memberVO);
		return res;
	}

	@Override
	public int insertMember(MemberVO memberVO) {	//�쉶�썝媛��엯
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		int res = memberMapper.insertMember(memberVO);
		
		return res;
	
	}

	@Override
	public MemberVO userCheck(MemberVO memberVO) {		//濡쒓렇�씤泥댄겕
		return dao.login(memberVO);
	}

	@Override
	public MemberVO heartCheck(MemberVO memberVO) {	//寃곗젣�븯湲�
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

}
