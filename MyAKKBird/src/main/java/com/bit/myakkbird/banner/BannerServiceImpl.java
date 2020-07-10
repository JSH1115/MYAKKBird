package com.bit.myakkbird.banner;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.mapper.BannerMapper;
import com.bit.mapper.MemberMapper;

@Service
public class BannerServiceImpl implements BannerService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int checkGotHeartService(String m_id) {
		BannerMapper bannerMapper = sqlSession.getMapper(BannerMapper.class);
		int result = bannerMapper.checkGotHeart(m_id);
		
		return result;
	}

	@Override
	public int insertGotHeartService(String m_id) {
		BannerMapper bannerMapper = sqlSession.getMapper(BannerMapper.class);
		int result = bannerMapper.insertGotHeart(m_id);
		
		return result;
	}

	@Override
	public int updateGotHeartService(String m_id) {
		BannerMapper bannerMapper = sqlSession.getMapper(BannerMapper.class);
		int result = bannerMapper.updateGotHeart(m_id);
		
		return result;
	}
	
	
}
