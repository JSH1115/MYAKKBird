package com.bit.myakkbird.search;

import java.util.ArrayList;
import java.util.List;

import com.bit.myakkbird.mainpoint.MasterVO;
import com.bit.myakkbird.mypage.BoardVO;

public interface SearchService {
	
	// 내 게시글 출력(5개만 출력)
	public ArrayList<MasterVO> CBListService(String m_id);
	// 내 게시글 출력(무한 스크롤)
	public ArrayList<MasterVO> CBListInfiniteService(String m_id, int startNo);
	// 내 게시글 지원 인원 체크
	public int chkApplyCountService(int b_num);
	// 내 게시글 삭제
	public int BoardDeleteService(int b_num);
	// 내 게시글 검색 출력(5개만 출력)
	public ArrayList<MasterVO> CBSearchListService(String m_id, String choice, 
			String b_apply);
	// 내 게시글 검색 출력(무한 스크롤)
	public ArrayList<MasterVO> CBSListInfiniteService(String m_id, String choice, 
			String b_apply, int startNo);
	// 게시글 검색 후 출력(5개만 출력)
	public ArrayList<MasterVO> boardSearchService(String b_address_road);
	// 게시글 검색 후 출력(무한 스크롤) 
	public ArrayList<MasterVO> boardInfiniteService(String b_address_road, 
			int startNo);
	// 게시글 조건 검색 후 출력(5개만 출력)
	public ArrayList<MasterVO> searchDataService(String b_address_road, 
			String b_category, String choice);
	// 게시글 조건 검색 후 출력(무한 스크롤) 
	public ArrayList<MasterVO> searchInfiniteService(String b_address_road, 
			String b_category, String choice, int startNo);
	// 게시글 찜하기 출력(5개만 출력)
	public ArrayList<MasterVO> likeBoardListService(String m_id);
	// 게시글 찜하기 출력(무한 스크롤) 
	public ArrayList<MasterVO> likeBListInfiniteService(String m_id, int startNo);
	
}
