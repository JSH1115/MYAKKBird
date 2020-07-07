package com.bit.myakkbird.accept;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AcceptController {
	
	//수락한 내역
	@RequestMapping(value="/allowList.ak")
	public String AllowList() {
		
		return "mypage/AllowList";
	}
}
