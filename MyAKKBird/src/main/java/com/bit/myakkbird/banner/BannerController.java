package com.bit.myakkbird.banner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bit.myakkbird.member.MemberService;

@RestController
public class BannerController {

	@Autowired
	private BannerService bannerService;
	
	@RequestMapping(value="/check_hgot.ak", produces="application/json;charset=UTF-8")
	public int checkGotHeart(String m_id) {
		
		int result = bannerService.checkGotHeartService(m_id);
		
		if(result == 1) {
			System.out.println("이벤트 하트를 받은 회원");
		} else {
			System.out.println("이벤트 하트 받지 않은 회원");
		}
		
		return result;
	}
	
	@RequestMapping(value="/heart_got.ak", produces="application/json;charset=UTF-8")
	public int gotHeart(String m_id) {
		
		int result = bannerService.insertGotHeartService(m_id);
		
		return result;
	}
	
	@RequestMapping(value="/heart_success.ak", produces="application/json;charset=UTF-8")
	public int gotHeartSuccess(String m_id) {
		
		int success = bannerService.updateGotHeartService(m_id);
		
		return success;
	}
}
