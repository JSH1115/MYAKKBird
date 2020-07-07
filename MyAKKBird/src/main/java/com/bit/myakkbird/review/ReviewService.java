package com.bit.myakkbird.review;

import java.util.HashMap;
import java.util.List;

public interface ReviewService {
	
	public List<ReviewVO> getReviewList(String r_id);			//해당아이디에 달린모든 리뷰정보조회
	public double getAvgStar(String r_id);						//해당회원의 총 별☆점 평균 구하기
	public int hasWritten(HashMap<String, String> hashmap);		//회원에게 달린 총 리뷰개수 구하기
	public void writeReview(ReviewVO reviewVO);					//회원에 대한 리뷰작성하기
	public ReviewVO getReview(int r_num);						//특정리뷰(리뷰번호) 정보 조회
	public void modifyReview(ReviewVO reviewVO);				//리뷰수정
	public void deleteReview(int r_num);						//리뷰삭제
	
}
