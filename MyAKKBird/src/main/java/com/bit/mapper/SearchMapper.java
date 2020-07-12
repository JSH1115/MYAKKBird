package com.bit.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bit.myakkbird.mainpoint.MasterVO;
import com.bit.myakkbird.mypage.BoardVO;

public interface SearchMapper {
	public List<BoardVO> autoText();
	
	public ArrayList<MasterVO> CBList(String m_id);
	
	public ArrayList<MasterVO> CBListInfinite(
			@Param("m_id") String m_id,
			@Param("startNo") int startNo);
	
	public int chkApplyCount(int b_num);
	
	public MasterVO CBdetail(
			@Param("m_id") String m_id,
			@Param("b_num") int b_num);
	
	public int BoardDelete(int b_num);
	
	public ArrayList<MasterVO> CBSearchList(
			@Param("m_id") String m_id,
			@Param("choice") String choice,
			@Param("b_apply") String b_apply);
	
	public ArrayList<MasterVO> CBSInfinite(
			@Param("m_id") String m_id,
			@Param("choice") String choice,
			@Param("b_apply") String b_apply,
			@Param("startNo") int startNo);
	
	public ArrayList<MasterVO> boardSearch(String b_address_road);
	
	public ArrayList<MasterVO> boardInfinite(
			@Param("b_address_road") String b_address_road,
			@Param("startNo") int startNo);
	
	public ArrayList<MasterVO> searchData(
			@Param("b_address_road")String b_address_road, 
			@Param("b_category") String b_category,
			@Param("choice") String choice);
	
	public ArrayList<MasterVO> searchInfinite(
			@Param("b_address_road")String b_address_road, 
			@Param("b_category") String b_category,
			@Param("choice") String choice,
			@Param("startNo") int startNo);
	
}
