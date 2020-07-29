package com.bit.myakkbird.wish;

public interface WishService {
	
	// 찜했는지 체크
	public int checkLikeService(int b_num, String m_id);
	// 회원인지 체크
	public int checkMemberService(String m_id);
	// 근로자인지 체크
	public int checkWorkerService(String m_id);
	// 찜했는지 다시 한번 체크
	public int checkLikeReService(int b_num, String m_id);
	// 찜 추가
	public int insertLikeService(int b_num, String m_id);
	// 찜 삭제
	public int deleteLikeService(int b_num, String m_id);
}
