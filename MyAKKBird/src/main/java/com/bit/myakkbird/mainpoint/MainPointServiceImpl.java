package com.bit.myakkbird.mainpoint;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.mapper.AcceptMapper;
import com.bit.mapper.BoardMapper;
import com.bit.mapper.MainPointMapper;
import com.bit.myakkbird.mypage.BoardVO;

@Service
public class MainPointServiceImpl implements MainPointService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<MasterVO> selectBoardService(String b_address_road) {
		MainPointMapper mainPointMapper = sqlSession.getMapper(MainPointMapper.class);
		
		return mainPointMapper.selectBoard(b_address_road);
	}
	
	// 지연
	@Override
	public int totalBoardCount() {
		BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
		int totalBoardCount = boardMapper.totalBoardCount();
		return totalBoardCount;
	}
	
	@Override
	public int countAccept() {
		AcceptMapper acceptMapper = sqlSession.getMapper(AcceptMapper.class);
		int countAccept = acceptMapper.countAccept();
		return countAccept;
	}

}
