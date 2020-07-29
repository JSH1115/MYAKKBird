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
	public ArrayList<MasterVO> CBListService(String m_id) {
		SearchMapper searchMapper = sqlSession.getMapper(SearchMapper.class);
		ArrayList<MasterVO> cbList = searchMapper.CBList(m_id);
		
		return cbList;
	}
	
	@Override
	public ArrayList<MasterVO> CBListInfiniteService(String m_id, int startNo) {
		SearchMapper searchMapper = sqlSession.getMapper(SearchMapper.class);
		ArrayList<MasterVO> cbInfinite = 
				searchMapper.CBListInfinite(m_id, startNo);
		
		return cbInfinite;
	}
	
	@Override
	public int chkApplyCountService(int b_num) {
		SearchMapper searchMapper = sqlSession.getMapper(SearchMapper.class);
		int result = searchMapper.chkApplyCount(b_num);
		
		return result;
	}
	
	@Override
	public int BoardDeleteService(int b_num) {
		SearchMapper searchMapper = sqlSession.getMapper(SearchMapper.class);
		int result = searchMapper.BoardDelete(b_num);
		
		return result;
	}
	
	@Override
	public ArrayList<MasterVO> CBSearchListService(String m_id, String choice,
			String b_apply) {
		SearchMapper searchMapper = sqlSession.getMapper(SearchMapper.class);
		ArrayList<MasterVO> cbSearch = 
				searchMapper.CBSearchList(m_id, choice, b_apply);
		
		return cbSearch;
	}
	
	@Override
	public ArrayList<MasterVO> CBSListInfiniteService(String m_id, String choice, 
			String b_apply, int startNo) {
		SearchMapper searchMapper = sqlSession.getMapper(SearchMapper.class);
		ArrayList<MasterVO> cbSInfinite =
				searchMapper.CBSInfinite(m_id, choice, b_apply, startNo);
		
		return cbSInfinite;
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

	@Override
	public ArrayList<MasterVO> likeBoardListService(String m_id) {
		SearchMapper searchMapper = sqlSession.getMapper(SearchMapper.class);
		ArrayList<MasterVO> likeBoardList = searchMapper.likeBoardList(m_id);
		
		return likeBoardList;
	}

	@Override
	public ArrayList<MasterVO> likeBListInfiniteService(String m_id, int startNo) {
		SearchMapper searchMapper = sqlSession.getMapper(SearchMapper.class);
		ArrayList<MasterVO> likeBInfinite =
				searchMapper.likeBListInfinite(m_id, startNo);
		
		return likeBInfinite;
	}

}
