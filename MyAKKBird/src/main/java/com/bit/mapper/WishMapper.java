package com.bit.mapper;

import org.apache.ibatis.annotations.Param;

public interface WishMapper {
	
	public int checkLike(
			@Param("b_num") int b_num, 
			@Param("m_id") String m_id);
	
	public int checkMember(String m_id);
	public int checkWorker(String m_id);
	public int checkLikeRe(
			@Param("b_num") int b_num, 
			@Param("m_id") String m_id);
	
	public int insertLike(
			@Param("b_num") int b_num, 
			@Param("m_id") String m_id);
	
	public int deleteLike(
			@Param("b_num") int b_num, 
			@Param("m_id") String m_id);
}
