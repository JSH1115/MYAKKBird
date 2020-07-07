package com.bit.myakkbird.mainpoint;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.myakkbird.mypage.BoardVO;

@Controller
public class MainPointController {
	
	@Autowired
	private MainPointService mainPointService;
	
	@RequestMapping(value="/SearchTest.ak")
	public String searchTest() {
		
		return "mainpoint/searchTest";
	}
	
	@RequestMapping(value="/searchProcess.ak")
	public String searchProcess(String b_address_road, Model model) {
		
		ArrayList<MasterVO> masterList = mainPointService.selectBoardService(b_address_road);
		model.addAttribute("masterList", masterList);
		model.addAttribute("b_address_road", b_address_road);
		
		return "mainpoint/searchScreen";
	}
	
	@RequestMapping(value="/searchDetail.ak")
	public String searchDetail() {
		
		return "mainpoint/searchDetail";
	}
	
}
