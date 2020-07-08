package com.bit.myakkbird.wish;

public interface WishService {
	
	public int checkLikeService(int b_num, String m_id);
	public int checkMemberService(String m_id);
	public int checkWorkerService(String m_id);
	public int checkLikeReService(int b_num, String m_id);
	public int insertLikeService(int b_num, String m_id);
	public int deleteLikeService(int b_num, String m_id);
}
