package com.bit.mapper;

import com.bit.myakkbird.danger.DangerVO;
import com.bit.myakkbird.mypage.BoardVO;

public interface DangerMapper {
	
	public int insertBoardDanger(DangerVO dangerVO);	//신고하기
	public BoardVO getname(int b_num);					//글쓴이이름불러오기
}
