package com.bit.myakkbird.review;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.mapper.MemberMapper;
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
	public int hasWritten(HashMap<String, Object> hashmap) {		//회원에게 달린 총 리뷰개수 구하기 (X) -> 리뷰 작성한 적 있는 회원인지 확인
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
	
	@Override
	public void deleteLiketo(int r_num) {
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		reviewMapper.deleteLiketo(r_num);
	}

	@Override
	public List<ReviewVO> latestReviews() { // 메인에 뿌려줄 최신 리뷰 불러오기
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		List<ReviewVO> list = reviewMapper.latestReviews();
		return list;
	}

	@Override
	public void likeReview(HashMap<String, Object> hashmap) { //리뷰 좋아요
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		reviewMapper.likeReview(hashmap);
		return;
		
	}

	@Override
	public void updateR_like(int r_num) { //r_like + 1
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		reviewMapper.updateR_like(r_num);
		return;		
	}

	@Override
	public int like_check(HashMap<String, Object> hashmap) { //해당 사용자가 해당 리뷰 좋아요 눌렀는지 확인
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		int res = reviewMapper.like_check(hashmap);
		return res;
	}

	@Override
	public void unlikeReview(HashMap<String, Object> hashmap) { //리뷰 좋아요 취소
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		reviewMapper.unlikeReview(hashmap);
		
	}

	@Override
	public void updateR_unlike(int r_num) { //r_like - 1
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		reviewMapper.updateR_unlike(r_num);
	}

	@Override
	public List<ReviewVO> orderbyStar(String id) { //리뷰평점순 조회
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		List<ReviewVO> list = reviewMapper.orderbyStar(id);
		return list;
	}

	@Override
	public List<ReviewVO> orderbyLike(String id) { //리뷰좋아요순 조회
		ReviewMapper reviewMapper = sqlSession.getMapper(ReviewMapper.class);
		List<ReviewVO> list = reviewMapper.orderbyLike(id);
		return list;
	}


	



}