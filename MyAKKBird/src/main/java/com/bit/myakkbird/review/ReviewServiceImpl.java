package com.bit.myakkbird.review;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.mapper.ReviewMapper;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ReviewVO> getReviewList(String r_id) {		//해당아이디에 달린모든 리뷰정보조회
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		List<ReviewVO> review_list = reviewMapper.getReviewList(r_id);
		return review_list;
	}

	@Override
	public double getAvgStar(String r_id) {		//해당회원의 총 별☆점 평균 구하기
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		double avgStar = reviewMapper.getAvgStar(r_id);
		return avgStar;
	}

	@Override
	public int hasWritten(HashMap<String, String> hashmap) {		//회원에게 달린 총 리뷰개수 구하기
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		int hasWritten = reviewMapper.hasWritten(hashmap);
		return hasWritten;
	}

	@Override
	public void writeReview(ReviewVO reviewVO) {		//회원에 대한 리뷰작성하기
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		reviewMapper.writeReview(reviewVO);
	}

	@Override
	public ReviewVO getReview(int r_num) {		//특정리뷰(리뷰번호) 정보 조회
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		ReviewVO reviewVO = reviewMapper.getReview(r_num);
		return reviewVO;
	}

	@Override
	public void modifyReview(ReviewVO reviewVO) {		//리뷰수정
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		reviewMapper.modifyReview(reviewVO);
		return;
	}

	@Override
	public void deleteReview(int r_num) {		//리뷰삭제
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		reviewMapper.deleteReview(r_num);
	}

}
