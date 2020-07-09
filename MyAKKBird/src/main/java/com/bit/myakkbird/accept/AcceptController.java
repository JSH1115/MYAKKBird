package com.bit.myakkbird.accept;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class AcceptController {
	
	@Autowired
	AcceptService acceptService;
	
	//수락한 내역
	@RequestMapping(value="/allowList.ak")
	public String AllowList() {
		
		return "mypage/AllowList";
	}
	
	//매칭 요청전 신청내역 체크
	@RequestMapping(value="/apply_match_chk.ak", produces="application/json;charset=UTF-8")
	@ResponseBody
	private int applyInsertChk(AcceptVO acceptVO, HttpSession session)throws Exception{
		
		//지원자 수 구하기
		AcceptVO apply_chk = acceptService.applyChk(acceptVO);
		
		String abc = Integer.toString(apply_chk.getApply_chk());
		session.setAttribute("apply_chk",abc);
		
		System.out.println(apply_chk.getApply_chk()+"지원횟수");
		System.out.println(abc+"이거야");
		
		return apply_chk.getApply_chk();
	}
	
	//매칭 요청하기
	@RequestMapping(value="/apply_match.ak", produces="application/json;charset=UTF-8")
	@ResponseBody
	private int applyInsert(AcceptVO acceptVO)throws Exception{
		
		return acceptService.applyInsert(acceptVO);
	}
}
