package com.bit.myakkbird.danger;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.mapper.DangerMapper;
import com.bit.myakkbird.mypage.BoardVO;

@Service("dangerService")
public class DangerServiceImpl implements DangerService{
	
	@Autowired
	private SqlSession sqlSession;

	
	@Override
	public int insertBoardDanger( DangerVO dangerVO) {		//게시글 신고하기
		DangerMapper dangerMapper = sqlSession.getMapper(DangerMapper.class);
		
		int res = dangerMapper.insertBoardDanger(dangerVO);
		
		if(res == 1) {
			System.out.println("게시글 신고 완료");
		} else {
			System.out.println("게시글 신고 실패");
		}
		
		return res;
	}


	@Override
	public BoardVO getname(int b_num) {			//글쓴이 이름 불러오기
		DangerMapper dangerMapper = sqlSession.getMapper(DangerMapper.class);
		
		System.out.println("서비스");
		BoardVO board = dangerMapper.getname(b_num);
		return board;
	}

	@Override
	public BoardVO getnameComm(int c_num) {	//댓글쓴이 이름 불러오기
		DangerMapper dangerMapper = sqlSession.getMapper(DangerMapper.class);
		
		BoardVO board = dangerMapper.getnameComm(c_num);
		return board;
	}

	@Override
	public int insertCommentsDanger(DangerVO dangerVO) {	//댓글신고하기
		DangerMapper dangerMapper = sqlSession.getMapper(DangerMapper.class);
		
		int res = dangerMapper.insertCommentsDanger(dangerVO);
		
		if(res == 1) {
			System.out.println("댓글 신고 완료");
		} else {
			System.out.println("댓글 신고 실패");
		}
		
		return res;
	}

}