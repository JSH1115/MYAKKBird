package com.bit.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bit.myakkbird.mainpoint.MasterVO;
import com.bit.myakkbird.mypage.BoardVO;

public interface SearchMapper {
	
	// 내 게시글 출력(5개만 출력)
	public ArrayList<MasterVO> CBList(String m_id);
	
	// 내 게시글 출력(무한 스크롤)
	public ArrayList<MasterVO> CBListInfinite(
			@Param("m_id") String m_id,
			@Param("startNo") int startNo);
	
	// 내 게시글 지원 인원 체크
	public int chkApplyCount(int b_num);
	
	// 내 게시글 삭제
	public int BoardDelete(int b_num);
	
	// 내 게시글 검색 출력(5개만 출력)
	public ArrayList<MasterVO> CBSearchList(
			@Param("m_id") String m_id,
			@Param("choice") String choice,
			@Param("b_apply") String b_apply);
	
	// 내 게시글 검색 출력(무한 스크롤)
	public ArrayList<MasterVO> CBSInfinite(
			@Param("m_id") String m_id,
			@Param("choice") String choice,
			@Param("b_apply") String b_apply,
			@Param("startNo") int startNo);
	
	// 게시글 검색 후 출력(5개만 출력)
	public ArrayList<MasterVO> boardSearch(String b_address_road);
	
	// 게시글 검색 후 출력(무한 스크롤) 
	public ArrayList<MasterVO> boardInfinite(
			@Param("b_address_road") String b_address_road,
			@Param("startNo") int startNo);
	
	// 게시글 조건 검색 후 출력(5개만 출력)
	public ArrayList<MasterVO> searchData(
			@Param("b_address_road") String b_address_road, 
			@Param("b_category") String b_category,
			@Param("choice") String choice);
	
	// 게시글 조건 검색 후 출력(무한 스크롤) 
	public ArrayList<MasterVO> searchInfinite(
			@Param("b_address_road") String b_address_road, 
			@Param("b_category") String b_category,
			@Param("choice") String choice,
			@Param("startNo") int startNo);
	
	// 게시글 찜하기 출력(5개만 출력)
	public ArrayList<MasterVO> likeBoardList(String m_id);
	
	// 게시글 찜하기 출력(무한 스크롤) 
	public ArrayList<MasterVO> likeBListInfinite(
			@Param("m_id") String m_id,
			@Param("startNo") int startNo);
}
