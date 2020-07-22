package com.bit.myakkbird.mainpoint;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.myakkbird.mypage.BoardVO;

@Controller
public class MainPointController {
	
	@Autowired
	private MainPointService mainPointService;
	
	// 검색 창 이동
	@RequestMapping(value="/searchProcess.ak")
	public String searchProcess(HttpSession session, String b_address_road, Model model) {
		
		String m_id = (String)session.getAttribute("m_id");
		
		ArrayList<MasterVO> masterList = mainPointService.selectBoardService(b_address_road);
		
		model.addAttribute("masterList", masterList);
		model.addAttribute("b_address_road", b_address_road);
		model.addAttribute("m_id", m_id);
		
		return "mainpoint/searchScreen";
	}
	
	// 가이드 이동
	@RequestMapping(value="/guide.ak")
	public String guide() {
		
		return "mainpoint/guide";
	}
	
}
