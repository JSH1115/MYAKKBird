package com.bit.myakkbird.accept;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class AcceptController {
	
	@Autowired
	AcceptService acceptService;
	
	//수락한 내역(고객)
	@RequestMapping(value="/allowListC.ak")
	public String AllowListC() {
		
		return "mypage/AllowListC";
	}
	
	//수락한 내역(근로자)
	@RequestMapping(value="/allowListE.ak")
	public String AllowListE() {
		
		return "mypage/AllowListE";
	}
	
	//매칭 요청하기
	@RequestMapping(value="/apply_match.ak", produces="application/json;charset=UTF-8")
	@ResponseBody
	private int applyInsert(AcceptVO acceptVO)throws Exception{
		
		return acceptService.applyInsert(acceptVO);
	}
}
