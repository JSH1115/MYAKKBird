package com.bit.myakkbird.danger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.myakkbird.mypage.BoardVO;

@Controller
public class DangerController {
	
	@Autowired
	private DangerService dangerService;
	
	//게시글 신고하기입력(form)
	@RequestMapping(value="/insertBoardDanger.ak")
	public String insertBoardDanger(Model model,int b_num, DangerVO dangerVO) throws Exception{
		
		BoardVO vo = dangerService.getname(b_num);
		model.addAttribute("name_vo", vo);
		
		model.addAttribute("b_num", b_num);
		
		return "mypage/BoardDanger";
	}
	
	//게시글 신고하기
	@RequestMapping(value="/insertBoardDangerAction.ak")
	public String insertBoardDangerAction(Model model,int b_num, DangerVO dangerVO) throws Exception{
		
		model.addAttribute("b_num", b_num);
		dangerVO.setB_num(b_num);
		dangerService.insertBoardDanger(dangerVO);
		
		return "redirect:/BoardDetail.ak?b_num="+b_num;
	}
}
