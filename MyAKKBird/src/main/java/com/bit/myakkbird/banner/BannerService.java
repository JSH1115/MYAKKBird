package com.bit.myakkbird.banner;

public interface BannerService {

	// 이벤트 하트 받았는지 체크
	public int checkGotHeartService(String m_id);
	// 이벤트 하트 내역 추가
	public int insertGotHeartService(String m_id);
	// 이벤트 하트 추가
	public int updateGotHeartService(String m_id);
}
