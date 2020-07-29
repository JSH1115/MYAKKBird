package com.bit.mapper;

import org.apache.ibatis.annotations.Param;

public interface WishMapper {
	
	// 찜했는지 체크
	public int checkLike(
			@Param("b_num") int b_num, 
			@Param("m_id") String m_id);
	// 회원인지 체크
	public int checkMember(String m_id);
	// 근로자인지 체크
	public int checkWorker(String m_id);
	// 찜했는지 다시 한번 체크
	public int checkLikeRe(
			@Param("b_num") int b_num, 
			@Param("m_id") String m_id);
	// 찜 추가
	public int insertLike(
			@Param("b_num") int b_num, 
			@Param("m_id") String m_id);
	// 찜 삭제
	public int deleteLike(
			@Param("b_num") int b_num, 
			@Param("m_id") String m_id);
}
