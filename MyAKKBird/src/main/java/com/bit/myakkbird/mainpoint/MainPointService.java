package com.bit.myakkbird.mainpoint;

import java.util.ArrayList;

import com.bit.myakkbird.mypage.BoardVO;

public interface MainPointService {
	public ArrayList<MasterVO> selectBoardService(String b_address_road);
	
	//지연
	public int totalBoardCount();	// 총 게시물 받아오기
	public int countAccept();
}
