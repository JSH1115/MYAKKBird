package com.bit.myakkbird;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.myakkbird.review.ReviewService;
import com.bit.myakkbird.review.ReviewVO;


@Controller
public class HomeController {
	
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping(value = "/home.ak")
	public String homemenu(Model model) {
		List<ReviewVO> reviewList = reviewService.latestReviews();
//		if (reviewList != null) {
//			for (int i=0; i < reviewList.size(); i++) {
//				ReviewVO reviewVO = reviewList.get(i);
//				reviewVO.getR_content();
//			}
//		}
		model.addAttribute("reviewList", reviewList);
		return "home";
	}
	
}
