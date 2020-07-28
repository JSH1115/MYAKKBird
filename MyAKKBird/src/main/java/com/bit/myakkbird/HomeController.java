package com.bit.myakkbird;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.myakkbird.mainpoint.MainPointService;
import com.bit.myakkbird.review.ReviewService;
import com.bit.myakkbird.review.ReviewVO;
import com.bit.myakkbird.search.SearchService;


@Controller
public class HomeController {
	
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private MainPointService mainPointService;
	
	@RequestMapping(value = "/home.ak")
	public String homemenu(Model model) {
		
		//총 게시물 받아오기
		int totalBoardCount = mainPointService.totalBoardCount();
		model.addAttribute("totalBoardCount", totalBoardCount);
		
		//총 지원 건수 받아오기
		int countAccept = mainPointService.countAccept();
		model.addAttribute("countAccept",countAccept);
		
		//리뷰 리스트 받아오기
		List<ReviewVO> reviewList = reviewService.latestReviews();
		model.addAttribute("reviewList", reviewList);
		
		return "home";
	}
	
}