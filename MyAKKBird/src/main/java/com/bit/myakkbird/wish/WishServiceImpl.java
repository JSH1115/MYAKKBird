package com.bit.myakkbird.wish;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.mapper.WishMapper;

@Service
public class WishServiceImpl implements WishService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int checkLikeService(int b_num, String m_id) {
		WishMapper wishMapper = sqlSession.getMapper(WishMapper.class);
		int result = wishMapper.checkLike(b_num, m_id);
		
		return result;
	}
	
}
