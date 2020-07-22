package com.bit.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.bit.myakkbird.mainpoint.MasterVO;
import com.bit.myakkbird.member.MemberVO;
import com.bit.myakkbird.mypage.BoardVO;

public interface BoardMapper {
	public BoardVO getDetail(int b_num);				//게시글내용불러오기
	public void setReadCountUpdate(int b_num);			//조회수
	public BoardVO applyCount(int b_num);				//게시글 지원자 수
	
	public MemberVO memberLookUp(MemberVO memberVO);	//게시글작성전 회원확인
	public int UpdateHeart(String m_id);				//하트차감
	public int insertBoard(BoardVO boardVO);			//게시글작성
	public MasterVO updateCall(
			@Param("b_num") int b_num, 
			@Param("m_id") String m_id);	            //게시글 수정 전 기본정보 불러오기
	public int updateBoard(BoardVO boardVO);			//게시글 수정

	//지연 
	public int totalBoardCount();                       //메인에 뿌려줄 게시물 개수
}
