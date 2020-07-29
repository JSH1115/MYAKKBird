package com.bit.mapper;

public interface BannerMapper {
	
	// 이벤트 하트 받았는지 체크
	public int checkGotHeart(String m_id);
	// 이벤트 하트 내역 추가
	public int insertGotHeart(String m_id);
	// 이벤트 하트 추가
	public int updateGotHeart(String m_id);
}
