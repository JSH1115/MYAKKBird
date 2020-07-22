package com.bit.myakkbird.admin;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	
	// ========================================================================
	
	//호준님 (신고, 매칭)
	@RequestMapping(value="/matchingList.ak")
	public String matchingList(Model model,
			@ModelAttribute("MasterVO") MasterVO masterVO) {
		
		int listcount = adminService.matchCountService(masterVO);
		System.out.println(listcount);
		masterVO.setTotalCount(listcount);
		model.addAttribute("pageVO", masterVO);
		
		ArrayList<MasterVO> matchList = 
				adminService.matchListService(masterVO);
		model.addAttribute("resultList", matchList);
		
		
		return "admin/matchingList";
	}

	@RequestMapping(value="/DangerList.ak")
	public String DangerList(Model model,
			@ModelAttribute("MasterVO") MasterVO masterVO) {
		
		int listcount = adminService.dangerCountService(masterVO);
		System.out.println(listcount);
		masterVO.setTotalCount(listcount);
		model.addAttribute("pageVO", masterVO);
		
		ArrayList<MasterVO> dangerList = 
				adminService.dangerListService(masterVO);
		model.addAttribute("resultList", dangerList);
		
			
		
		return "admin/DangerList";
	}

	@RequestMapping(value="/danger_OK.ak")
	public String dangerOK(Model model,
			@RequestBody String d_id) throws Exception{

		adminService.dangerOKService(d_id);
		
		model.addAttribute("res","OK");
		
		return "admin/DangerList";
	}

	@RequestMapping(value="/danger_NO.ak")
	public Map<String, Object> dangerNO(Model model,
			@RequestBody String d_id) throws Exception{
		Map<String, Object> retVal = new HashMap<String, Object>();
		

		try{
			adminService.dangerNOService(d_id);
			retVal.put("res", "OK");
		}
		catch (Exception e)
		{
			retVal.put("res", "FAIL");
        	retVal.put("message", "Failure");
		}
		
		return retVal;
	}
	
}