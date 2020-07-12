package com.bit.myakkbird.mypage;


import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.mapper.BoardMapper;
import com.bit.myakkbird.mainpoint.MasterVO;
import com.bit.myakkbird.member.MemberVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public BoardVO getDetail(int b_num) {					//게시글 자세히 보기
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		boardMapper.setReadCountUpdate(b_num);				//조회수
		
		BoardVO board = boardMapper.getDetail(b_num);
		
		return board;
	}

	@Override
	public BoardVO applyCount(int b_num) {					//게시글당 지원자 수 구하기
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		BoardVO applyCount = boardMapper.applyCount(b_num);
		return applyCount;
	}
	
	@Override
	public MemberVO memberLookUpService(MemberVO memberVO) {
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		
		return boardMapper.memberLookUp(memberVO);
	}
	
	@Override
	public int UpdateHeartServiec(String m_id) {
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		int result = boardMapper.UpdateHeart(m_id);
		if(result == 1) {
			System.out.println("하트 차감 성공");
		} else {
			System.out.println("하트 차감 실패");
		}
		return result;
	} 
	
	@Override
	public int insertBoardService(BoardVO boardVO) {
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		int result = boardMapper.insertBoard(boardVO);
		if(result == 1) {
			System.out.println("게시판 삽입 성공");
		} else {
			System.out.println("게시판 삽입 실패");
		}
		return result;
	}

	@Override
	public MasterVO updateCallService(int b_num, String m_id) {
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		
		return boardMapper.updateCall(b_num, m_id);
	}

	@Override
	public int updateBoardService(BoardVO boardVO) {
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		int result = boardMapper.updateBoard(boardVO);
		
		return result;
	}
	
}
