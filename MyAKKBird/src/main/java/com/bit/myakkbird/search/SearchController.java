package com.bit.myakkbird.search;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bit.myakkbird.mainpoint.MasterVO;
import com.bit.myakkbird.mypage.BoardVO;

@RestController
public class SearchController {
	
	@Autowired
	private SearchService searchService;
	
	@RequestMapping(value="/cb_load.ak", produces="application/json;charset=UTF-8")
	public ArrayList<MasterVO> cbLoad(String m_id) {
		ArrayList<MasterVO> cb_Load =
				searchService.CBListService(m_id);
		
		return cb_Load;
	}
	
	@RequestMapping(value="/cb_infinite.ak", produces="application/json;charset=UTF-8")
	public ArrayList<MasterVO> cbInfinite(String m_id, int startNo) {
		ArrayList<MasterVO> cb_infinite = 
				searchService.CBListInfiniteService(m_id, startNo);
		
		return cb_infinite;
	}
	
	@RequestMapping(value="/chk_applyCount.ak", produces="application/json;charset=UTF-8")
	public int chkApplyCount(int b_num) {
		int result = searchService.chkApplyCountService(b_num);
		
		return result;
	}
	
	@RequestMapping(value="/board_delete.ak", produces="application/json;charset=UTF-8")
	public int boardDelete(int b_num) {
		int result = searchService.BoardDeleteService(b_num);
		if(result == 1) {
			System.out.println("내 게시글 삭제 성공!");
		} else {
			System.out.println("내 게시글 삭제 실패!");
		}
		
		return result;
	}
	
	@RequestMapping(value="/cb_sload.ak", produces="application/json;charset=UTF-8")
	public ArrayList<MasterVO> cbSearchLoad(String m_id, String choice,
			String b_apply) {
		System.out.println("선택한 검색조건 : " + choice);
		System.out.println("선택한 매칭여부 : " + b_apply);
		
		ArrayList<MasterVO> cb_SearchLoad =
				searchService.CBSearchListService(m_id, choice, b_apply);
		
		return cb_SearchLoad;
	}
	
	@RequestMapping(value="/cb_sinfinite.ak", produces="application/json;charset=UTF-8")
	public ArrayList<MasterVO> cbSInfinite(String m_id, String choice,
			String b_apply, int startNo) {
		ArrayList<MasterVO> cb_SInfinite =
				searchService.CBSListInfiniteService(m_id, choice, b_apply, startNo);
		
		return cb_SInfinite;
	}
	
	@RequestMapping(value="/board_search.ak", produces="application/json;charset=UTF-8")
	public ArrayList<MasterVO> boardSearch(String b_address_road) {
		ArrayList<MasterVO> board_search =
				searchService.boardSearchService(b_address_road);
		
		return board_search;
	}
	
	
	@RequestMapping(value="/board_Infinite.ak", produces="application/json;charset=UTF-8")
	public ArrayList<MasterVO> boardInfinite(String b_address_road, int startNo) {
		ArrayList<MasterVO> board_infinite =
				searchService.boardInfiniteService(b_address_road, startNo);
		
		return board_infinite;
	}
	
	@RequestMapping(value="/search_data.ak", produces="application/json;charset=UTF-8")
	public ArrayList<MasterVO> searchData(String b_address_road, 
			String b_category, String choice) {
		System.out.println("검색한 주소 : " + b_address_road);
		System.out.println("선택한 검색조건 : " + choice);
		System.out.println("선택한 카테고리 : " + b_category);
		
		ArrayList<MasterVO> search_board = 
				searchService.searchDataService(b_address_road, b_category,
						choice);
		
		return search_board;
	}
	
	@RequestMapping(value="/search_data2.ak", produces="application/json;charset=UTF-8")
	public ArrayList<MasterVO> searchData2(String b_address_road, 
			String b_category, String choice, int startNo) {
		ArrayList<MasterVO> search_infinite = 
				searchService.searchInfiniteService(b_address_road, b_category, 
						choice, startNo);
		
		return search_infinite;
	}
	
	@RequestMapping(value="/like_boardList.ak", produces="application/json;charset=UTF-8")
	public ArrayList<MasterVO> likeBoardList(String m_id) {
		ArrayList<MasterVO> like_board =
				searchService.likeBoardListService(m_id);
		
		return like_board;
	}
	
	@RequestMapping(value="like_bInfinite.ak", produces="application/json;charset=UTF-8")
	public ArrayList<MasterVO> likeBInfinite(String m_id, int startNo) {
		ArrayList<MasterVO> like_bInfinite =
				searchService.likeBListInfiniteService(m_id, startNo);
		
		return like_bInfinite;
	}
}
