package com.bit.myakkbird.admin;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.myakkbird.mainpoint.MasterVO;
import com.bit.myakkbird.member.MemberVO;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="/memberList.ak")
	public String memberList(Model model,
			@ModelAttribute("MasterVO") MasterVO masterVO) {
		
		int listcount = adminService.memberCountService(masterVO);
		masterVO.setTotalCount(listcount);
		model.addAttribute("pageVO", masterVO);
		
		ArrayList<MasterVO> memberList = 
				adminService.memberListService(masterVO);
		model.addAttribute("resultList", memberList);
		
		return "admin/memberList";
	}
	
}