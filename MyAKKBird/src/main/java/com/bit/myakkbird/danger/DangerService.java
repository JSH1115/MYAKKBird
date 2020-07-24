package com.bit.myakkbird.danger;

import com.bit.myakkbird.mypage.BoardVO;

public interface DangerService {
	
	public int insertBoardDanger( DangerVO dangerVO);	//신고하기(게시글)
	
	public BoardVO getname(int b_num);					//글쓴이이름불러오기
	
	public BoardVO getnameComm(int c_num);				//댓글쓴이 이름불러오기
	
	public int insertCommentsDanger(DangerVO dangerVO);	//신고하기(댓글)
	
}
