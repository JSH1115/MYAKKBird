package com.bit.myakkbird.search;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bit.myakkbird.mainpoint.MasterVO;
import com.bit.myakkbird.mypage.BoardVO;

public interface SearchService {
	public List<BoardVO> autoTextService();
	
	public ArrayList<MasterVO> CBListService(String m_id);
	public ArrayList<MasterVO> CBListInfiniteService(String m_id, int startNo);
	public MasterVO CBdetailService(String m_id, int b_num);
	public int chkApplyCountService(int b_num);
	public int BoardDeleteService(int b_num);
	public ArrayList<MasterVO> CBSearchListService(String m_id, String choice, 
			String b_apply);
	public ArrayList<MasterVO> CBSListInfiniteService(String m_id, String choice, 
			String b_apply, int startNo);
	
	public ArrayList<MasterVO> boardSearchService(String b_address_road);
	public ArrayList<MasterVO> boardInfiniteService(String b_address_road, 
			int startNo);
	public ArrayList<MasterVO> searchDataService(String b_address_road, 
			String b_category, String choice);
	public ArrayList<MasterVO> searchInfiniteService(String b_address_road, 
			String b_category, String choice, int startNo);
	
}
