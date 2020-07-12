package com.bit.myakkbird.mypage;

import java.util.ArrayList;

import com.bit.myakkbird.mainpoint.MasterVO;
import com.bit.myakkbird.member.MemberVO;

public interface BoardService {

	public BoardVO getDetail(int b_num);				//게시글 자세히보기
	public BoardVO applyCount(int b_num);				//게시글 당 지원자 수 구하기
	
	public MemberVO memberLookUpService(MemberVO memberVO);
	public int UpdateHeartServiec(String m_id);
	public int insertBoardService(BoardVO boardVO);
	public MasterVO updateCallService(int b_num, String m_id);
	public int updateBoardService(BoardVO boardVO);
	
}
