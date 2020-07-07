package com.bit.myakkbird.search;


import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.mapper.SearchMapper;
import com.bit.myakkbird.mainpoint.MasterVO;
import com.bit.myakkbird.mypage.BoardVO;

@Service
public class SearchServiceImpl implements SearchService {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<BoardVO> autoTextService() {
		SearchMapper searchMapper = sqlSession.getMapper(SearchMapper.class);
		List<BoardVO> boardList = searchMapper.autoText();
		
		return boardList;
	}
	
	@Override
	public ArrayList<MasterVO> CBListInfiniteService(String m_id, int startNo) {
		SearchMapper searchMapper = sqlSession.getMapper(SearchMapper.class);
		ArrayList<MasterVO> cbInfinite = 
				searchMapper.CBListInfinite(m_id, startNo);
		
		return cbInfinite;
	}
	
	@Override
	public MasterVO CBdetailService(String m_id, int b_num) {
		SearchMapper searchMapper = sqlSession.getMapper(SearchMapper.class);
		
		return searchMapper.CBdetail(m_id, b_num);
	}
	
	@Override
	public int BoardDeleteService(int b_num) {
		SearchMapper searchMapper = sqlSession.getMapper(SearchMapper.class);
		int result = searchMapper.BoardDelete(b_num);
		if(result == 1) {
			System.out.println("삭제 성공!");
		} else {
			System.out.println("삭제 실패!");
		}
		
		return result;
	}

	@Override
	public ArrayList<MasterVO> boardSearchService(String b_address_road) {
		SearchMapper searchMapper = sqlSession.getMapper(SearchMapper.class);
		ArrayList<MasterVO> boardSearch =
				searchMapper.boardSearch(b_address_road);
		
		return boardSearch;
	}
	
	@Override
	public ArrayList<MasterVO> boardInfiniteService(String b_address_road, int startNo) {
		SearchMapper searchMapper = sqlSession.getMapper(SearchMapper.class);
		ArrayList<MasterVO> boardInfinite =
				searchMapper.boardInfinite(b_address_road, startNo);
		
		return boardInfinite;
	}
	
	@Override
	public ArrayList<MasterVO> searchDataService(String b_address_road, 
			String b_category, String choice) {
		SearchMapper searchMapper = sqlSession.getMapper(SearchMapper.class);
		ArrayList<MasterVO> searchBoardList = 
				searchMapper.searchData(b_address_road, b_category, choice);
		
		return searchBoardList;
	}

	@Override
	public ArrayList<MasterVO> searchInfiniteService(String b_address_road, 
			String b_category, String choice, int startNo) {
		SearchMapper searchMapper = sqlSession.getMapper(SearchMapper.class);
		ArrayList<MasterVO> searchInfinite =
				searchMapper.searchInfinite(b_address_road, b_category, 
						choice, startNo);
		
		return searchInfinite;
	}

}