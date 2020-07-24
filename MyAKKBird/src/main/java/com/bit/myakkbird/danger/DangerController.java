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
	public String insertBoardDangerAction(Model model,int b_num,String e_id, DangerVO dangerVO) throws Exception{
		
		model.addAttribute("b_num", b_num);
		dangerVO.setB_num(b_num);
		dangerVO.setM_id(e_id);
		dangerService.insertBoardDanger(dangerVO);
		
		return "redirect:/BoardDetail.ak?b_num="+b_num+"&e_id="+e_id;
	}
	
	//댓글 신고하기입력(form)
	@RequestMapping(value="/insertCommentDanger.ak")
	public String insertCommentDanger(Model model,int c_num, DangerVO dangerVO) throws Exception{
		
		BoardVO vo = dangerService.getnameComm(c_num);
		model.addAttribute("name_vo", vo);
		model.addAttribute("c_num", c_num);
		
		return "mypage/CommentsDanger";
	}
	
	//댓글 신고하기
	@RequestMapping(value="/insertCommentDangerAction.ak")
	public String insertCommentDangerAction(Model model,int c_num, DangerVO dangerVO) throws Exception{
		
		System.out.println("신고하기 액션"+c_num);
		model.addAttribute("c_num", c_num);
		dangerVO.setC_num(c_num);
		dangerService.insertCommentsDanger(dangerVO);
		
		return "redirect:/home.ak";
	}
}