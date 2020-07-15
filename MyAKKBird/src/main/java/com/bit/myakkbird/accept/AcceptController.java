package com.bit.myakkbird.accept;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.myakkbird.mainpoint.MasterVO;


@Controller
public class AcceptController {
	
	@Autowired
	AcceptService acceptService;
	
	//수락한 게시물내역불러오기(고객) 5개미리 불러오기
	@RequestMapping(value="/allowListC.ak")
	public String AllowListC(HttpSession session, Model model) {
		
		String m_id = (String)session.getAttribute("m_id");
		ArrayList<MasterVO> boardList = acceptService.clientAcceptList(m_id);
		model.addAttribute("boardList",boardList);

		return "mypage/AllowListC";
	}
	
	//수락한 게시물내역불러오기(고객) 무한스크롤
	@ResponseBody
	@RequestMapping(value="/acceptList_infinite.ak", produces="application/json;charset=UTF-8")
	public ArrayList<MasterVO> acceptListInfinite(String m_id, int startNo) throws Exception {
		
		if((acceptService.acceptListInfinite(m_id, startNo)).size() == 0) {
			//System.out.println("무스사이즈 null");
		}else {
		ArrayList<MasterVO> accept_infinite_list = acceptService.acceptListInfinite(m_id, startNo);
		
		return accept_infinite_list;
		}
		return null;
	}
	
	//신청 받은 게시물내역불러오기(고객) 5개미리 불러오기
	@RequestMapping(value="/allowListCright.ak")
	public String AllowListCright(HttpSession session, Model model) {
		
		String m_id = (String)session.getAttribute("m_id");
		
		ArrayList<MasterVO> boardList = acceptService.clientApplyList(m_id);
		model.addAttribute("boardList",boardList);
		
		return "mypage/AllowListCright";
	}
	
	//신청 받은 게시물내역불러오기(고객) 무한스크롤
	@ResponseBody
	@RequestMapping(value="/applyList_infinite.ak", produces="application/json;charset=UTF-8")
	public ArrayList<MasterVO> applyListInfinite(String m_id, int startNo) throws Exception {
		
		if(( acceptService.applyListInfinite(m_id, startNo)).size() == 0) {
		}else {
			ArrayList<MasterVO> apply_infinite_list = acceptService.applyListInfinite(m_id, startNo);
			return apply_infinite_list;	
		}
		return null;
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
	
	//수락한 내역(고객): 근로자프로필보기
	@RequestMapping(value="/acceptDetail.ak", produces="application/json;charset=UTF-8")
	public String AcceptDetail(String m_id, String e_id, int b_num, Model model) {
		System.out.println("매칭연락처보기 m_id:"+m_id+"  e_id:"+e_id+"  b_num"+b_num);
		
		//게시글 정보 불러오기
		MasterVO acceptBoardVO = acceptService.acceptBoardList(m_id, b_num);
		model.addAttribute("acceptBoardVO",acceptBoardVO);
		
		//매칭회원 프로필정보 불러오기
		MasterVO empProfileVO = acceptService.empProfile(e_id);
		model.addAttribute("empProfileVO",empProfileVO);
		
		//매칭회원 리뷰정보 불러오기
		ArrayList<MasterVO> empReviewList = acceptService.applyEmpReview(e_id);
		model.addAttribute("empReviewList",empReviewList);
		
		System.out.println(empProfileVO.getM_id()+empProfileVO.getM_phone()+empProfileVO.getR_id());
		return "mypage/AcceptDetail";
	}
	
	//신청받은 게시물 클릭 >> 해당 게시물에 신청한 근로자 리스트(프로필정보) 가져오기
	@RequestMapping(value="/applyDetail.ak", produces="application/json;charset=UTF-8")
	public String ApplyDetail(String m_id,int b_num, Model model) {
		System.out.println("신청한 회원목록보기 m_id:"+m_id+"  b_num"+b_num);
		
		//게시글 정보 불러오기
		MasterVO applyBoardVO = acceptService.acceptBoardList(m_id, b_num);
		model.addAttribute("applyBoardVO",applyBoardVO);
		
		//신청한근로자 프로필정보 불러오기
		ArrayList<MasterVO> applyEmpProfile = acceptService.applyEmpProfile(b_num);
		model.addAttribute("applyEmpProfile",applyEmpProfile);
				
		return "mypage/ApplyDetail";
	}
	
	//근로자클릭 시 근로자 프로필 & 리뷰 & 게시물 정보 가져오기
	@RequestMapping(value="/empReviewProfile.ak", produces="application/json;charset=UTF-8")
	public String EmpReviewProfile(String r_id,int b_num, String m_id, Model model) {
		
		//게시글 정보 불러오기
		MasterVO applyBoardVO = acceptService.acceptBoardList(m_id, b_num);
		model.addAttribute("applyBoardVO",applyBoardVO);
		
		//프로필정보 불러오기
		MasterVO empProfileVO = acceptService.empProfile(r_id);
		model.addAttribute("empProfileVO",empProfileVO);
		
		//리뷰정보 불러오기
		ArrayList<MasterVO> empReviewList = acceptService.applyEmpReview(r_id);
		model.addAttribute("empReviewList",empReviewList);
		

		return "mypage/EmpReviewProfile";
	}
}