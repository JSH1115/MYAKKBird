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

	@Override
	public int checkMemberService(String m_id) {
		WishMapper wishMapper = sqlSession.getMapper(WishMapper.class);
		int result = wishMapper.checkMember(m_id);
		
		return result;
	}

	@Override
	public int checkWorkerService(String m_id) {
		WishMapper wishMapper = sqlSession.getMapper(WishMapper.class);
		int result = wishMapper.checkWorker(m_id);
		
		return result;
	}

	@Override
	public int checkLikeReService(int b_num, String m_id) {
		WishMapper wishMapper = sqlSession.getMapper(WishMapper.class);
		int result = wishMapper.checkLikeRe(b_num, m_id);
		
		return result;
	}

	@Override
	public int insertLikeService(int b_num, String m_id) {
		WishMapper wishMapper = sqlSession.getMapper(WishMapper.class);
		int result = wishMapper.insertLike(b_num, m_id);
		
		return result;
	}

	@Override
	public int deleteLikeService(int b_num, String m_id) {
		WishMapper wishMapper = sqlSession.getMapper(WishMapper.class);
		int result = wishMapper.deleteLike(b_num, m_id);
		
		return result;
	}
	
}
