package com.bit.myakkbird.review;

import java.util.HashMap;
import java.util.List;

public interface ReviewService {
	
	public List<ReviewVO> getReviewList(String r_id);			//해당아이디에 달린모든 리뷰정보조회
	public double getAvgStar(String r_id);						//해당회원의 총 별☆점 평균 구하기
	public int hasWritten(HashMap<String, Object> hashmap);		//회원에게 달린 총 리뷰개수 구하기 (X) -> 리뷰 작성한 적 있는 회원인지 확인
	public void writeReview(ReviewVO reviewVO);					//회원에 대한 리뷰작성하기
	public ReviewVO getReview(int r_num);						//특정리뷰(리뷰번호) 정보 조회
	public void modifyReview(ReviewVO reviewVO);				//리뷰수정
	public void deleteReview(int r_num);						//리뷰삭제
	public void deleteLiketo(int r_num);						//리뷰삭제시 해당 리뷰의 좋아요 데이터도 삭제
	public List<ReviewVO> latestReviews();						//메인에 뿌려줄 최신리뷰 불러오기
	public void likeReview(HashMap<String, Object>hashmap);		//리뷰 좋아요
	public void updateR_like(int r_num);						//r_like + 1
	public int like_check(HashMap<String, Object> hashmap);		//해당 사용자가 해당 리뷰 좋아요 눌렀는지 확인
	public void unlikeReview(HashMap<String,Object> hashmap);	//리뷰 좋아요 취소
	public void updateR_unlike(int r_num);						//r_like - 1
	public List<ReviewVO> orderbyStar(String id);				//리뷰평점순 조회
	public List<ReviewVO> orderbyLike(String id);				//리뷰좋아요순 조회
	
}
