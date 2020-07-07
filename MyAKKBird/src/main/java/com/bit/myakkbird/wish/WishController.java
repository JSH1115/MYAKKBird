package com.bit.myakkbird.wish;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class WishController {
	
	@Autowired
	private WishService wishService;
	
	@RequestMapping(value="/check_like.ak", produces="application/json;charset=UTF-8")
	public int checkLike(int b_num, String m_id) {
		
		int result = wishService.checkLikeService(b_num, m_id);
		
		return result;
		
	}

}
