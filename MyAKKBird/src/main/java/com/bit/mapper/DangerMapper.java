package com.bit.mapper;

import com.bit.myakkbird.danger.DangerVO;
import com.bit.myakkbird.mypage.BoardVO;

public interface DangerMapper {
	
	public int insertBoardDanger(DangerVO dangerVO);	//게시글신고하기
	
	public BoardVO getname(int b_num);					//글쓴이이름불러오기
	
	public BoardVO getnameComm(int c_num);				//댓글쓴이 이름불러오기
	
	public int insertCommentsDanger(DangerVO dangerVO);	//댓글신고하기
}
