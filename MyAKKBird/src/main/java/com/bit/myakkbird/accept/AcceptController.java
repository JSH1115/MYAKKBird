package com.bit.myakkbird.accept;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.myakkbird.mainpoint.MasterVO;
import com.bit.myakkbird.member.MemberService;


@Controller
public class AcceptController {
	
	@Autowired
	AcceptService acceptService;
	@Autowired
	private MemberService memberService;
	
	//수락한 게시물내역불러오기(고객) 5개미리 불러오기
	@RequestMapping(value="/allowListC.ak")
	public String AllowListC(HttpSession session, Model model) {
		
		String m_id = (String)session.getAttribute("m_id");
		ArrayList<MasterVO> boardList = acceptService.clientAcceptList(m_id);
		model.addAttribute("boardList",boardList);
		
		// 멤버 타입 구하기
		String m_type = memberService.mypage_menu(m_id); 
		model.addAttribute("m_type", m_type);

		return "mypage/AllowListC";
	}
	
	//매칭완료 게시물내역불러오기(근로자) 5개미리 불러오기
	@RequestMapping(value="/allowListE.ak")
	public String AllowListE(HttpSession session, Model model) {
		String m_id = (String)session.getAttribute("m_id");
		ArrayList<MasterVO> boardList = acceptService.empMachingList(m_id);
		model.addAttribute("boardList",boardList);
		
		// 멤버 타입 구하기
		String m_type = memberService.mypage_menu(m_id); 
		model.addAttribute("m_type", m_type);
		
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
	
	//매칭완료 게시물내역불러오기(근로자) 무한스크롤
	@ResponseBody
	@RequestMapping(value="/acceptListE_infinite.ak", produces="application/json;charset=UTF-8")
	public ArrayList<MasterVO> empMachingListInfinite(String m_id, int startNo) throws Exception {
		//System.out.println("근로자 무한스크롤 매칭완료"+m_id+startNo);
		if((acceptService.empMachingListInfinite(m_id, startNo)).size() == 0) {
			System.out.println("사이즈0");
			return null;
		}else {
			ArrayList<MasterVO> empMachingListInfinite = acceptService.empMachingListInfinite(m_id, startNo);
			//System.out.println(empMachingListInfinite.get(0).getB_num());
			return empMachingListInfinite;
		}
	}
	
	//신청 받은 게시물내역불러오기(고객) 5개미리 불러오기
	@RequestMapping(value="/allowListCright.ak")
	public String AllowListCright(HttpSession session, Model model) {
		
		String m_id = (String)session.getAttribute("m_id");
		
		ArrayList<MasterVO> boardList = acceptService.clientApplyList(m_id);
		model.addAttribute("boardList",boardList);
		
		// 멤버 타입 구하기
		String m_type = memberService.mypage_menu(m_id); 
		model.addAttribute("m_type", m_type);
		
		//게시글 당 지원자 수 카운트
		ArrayList<MasterVO> applyEmpCntList = new ArrayList<MasterVO>(boardList.size());
		for(int i=0; i<boardList.size(); i++) {
			int boardNum = boardList.get(i).getB_num();
			applyEmpCntList.add(i, acceptService.applyEmpCntList(boardNum));
		}
		model.addAttribute("applyEmpCntList",applyEmpCntList);
		
		System.out.println("신청받은 게시물내역"+m_id+boardList.size()+applyEmpCntList.size()+m_type);
		return "mypage/AllowListCright";
	}
	
	//신청 한 게시물내역불러오기(근로자) 5개미리 불러오기
	@RequestMapping(value="/allowListEright.ak")
	public String AllowListEright(HttpSession session, Model model) {
		
		String m_id = (String)session.getAttribute("m_id");
		
		ArrayList<MasterVO> boardList = acceptService.workerApplyList(m_id);
		model.addAttribute("boardList",boardList);
		
		// 멤버 타입 구하기
		String m_type = memberService.mypage_menu(m_id); 
		model.addAttribute("m_type", m_type);
		
		//게시글 당 지원자 수 카운트
		ArrayList<MasterVO> applyEmpCntList = new ArrayList<MasterVO>(boardList.size());
		for(int i=0; i<boardList.size(); i++) {
			int boardNum = boardList.get(i).getB_num();
			applyEmpCntList.add(i, acceptService.applyEmpCntList(boardNum));
		}
		model.addAttribute("applyEmpCntList",applyEmpCntList);
		
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
	
	//신청 한 게시물내역불러오기(근로자) 무한스크롤
	@ResponseBody    
	@RequestMapping(value="/applyList_infiniteE.ak", produces="application/json;charset=UTF-8")
	public ArrayList<MasterVO> applyListInfiniteE(String m_id, int startNo) throws Exception {
		
		if(( acceptService.applyListInfiniteE(m_id, startNo)).size() == 0) {
			return null;
		}else {
			ArrayList<MasterVO> apply_infinite_listE = acceptService.applyListInfiniteE(m_id, startNo);
			return apply_infinite_listE;	
		}
	}
	
	//매칭 요청하기(근로자가 신청)
	@RequestMapping(value="/apply_match.ak", produces="application/json;charset=UTF-8")
	@ResponseBody
	private int applyInsert(AcceptVO acceptVO, HttpSession session)throws Exception{	
		//근로자 하트 차감시키기
		String login_id = (String)session.getAttribute("m_id");
		int res = acceptService.heartMinus(login_id);
		
		return acceptService.applyInsert(acceptVO);
	}
	
	//수락한 내역(고객): 근로자프로필보기
	@RequestMapping(value="/acceptDetail.ak", produces="application/json;charset=UTF-8")
	public String AcceptDetail(String m_id, String e_id, int b_num, Model model) {
		//System.out.println("매칭연락처보기 m_id:"+m_id+"  e_id:"+e_id+"  b_num"+b_num);
		
		//매칭상태 다음페이지에 넘겨주기
		String a_apply = "Y";
		model.addAttribute("a_apply",a_apply);
		
		//게시글 정보 불러오기
		MasterVO BoardVO = acceptService.acceptBoardList(m_id, b_num);
		model.addAttribute("BoardVO",BoardVO);
		
		//매칭회원 프로필정보 불러오기
		MasterVO empProfileVO = acceptService.empProfile(e_id);
		model.addAttribute("empProfileVO",empProfileVO);
		
		//매칭회원 리뷰정보 불러오기
		ArrayList<MasterVO> empReviewList = acceptService.applyEmpReview(e_id);
		model.addAttribute("empReviewList",empReviewList);
		
		return "mypage/EmpReviewProfile";
	}
	
	//매칭된 내역(근로자): 고객회원 프로필보기
	@RequestMapping(value="/acceptDetailE.ak", produces="application/json;charset=UTF-8")
	public String AcceptDetailE(String m_id, int b_num, Model model) {
		
		//매칭상태 다음페이지에 넘겨주기
		String a_apply = "Y";
		model.addAttribute("a_apply",a_apply);
		
		//게시글 정보 불러오기
		MasterVO BoardVO = acceptService.acceptBoardList(m_id, b_num);
		model.addAttribute("BoardVO",BoardVO);
		
		//매칭된 고객(악어) 프로필정보 불러오기
		MasterVO empProfileVO = acceptService.empProfile(m_id);
		model.addAttribute("empProfileVO",empProfileVO);
		
		//매칭회원 리뷰정보 불러오기
		ArrayList<MasterVO> empReviewList = acceptService.applyEmpReview(m_id);
		model.addAttribute("empReviewList",empReviewList);
		
		return "mypage/EmpReviewProfile";
	}
	
	//신청받은 게시물 클릭 >> 해당 게시물에 신청한 근로자 리스트(프로필정보) 가져오기
	@RequestMapping(value="/applyDetail.ak", produces="application/json;charset=UTF-8")
	public String ApplyDetail(String m_id,int b_num, Model model) {
		//System.out.println("신청한 회원목록보기 m_id:"+m_id+"  b_num"+b_num);
		
		//게시글 정보 불러오기
		MasterVO applyBoardVO = acceptService.acceptBoardList(m_id, b_num);
		model.addAttribute("applyBoardVO",applyBoardVO);
		
		//신청한근로자 프로필정보 불러오기
		ArrayList<MasterVO> applyEmpProfile = acceptService.applyEmpProfile(b_num);
		model.addAttribute("applyEmpProfile",applyEmpProfile);
		
		//신청한근로자의 a_apply(수락여부)불러오기
		ArrayList<MasterVO> applyStateList = new ArrayList<MasterVO>(applyEmpProfile.size());
		
		for(int i=0; i<applyEmpProfile.size(); i++) {
			String apply_id = applyEmpProfile.get(i).getM_id();
			applyStateList.add(i, acceptService.applyStateList(apply_id, b_num));
			
			//System.out.println(applyStateList.get(i).getE_id()+applyStateList.get(i).getA_apply());
		}
		model.addAttribute("applyStateList",applyStateList);
		
				
		return "mypage/ApplyDetail";
	}
	
	//근로자클릭 시 근로자 프로필 & 리뷰 & 게시물 정보 가져오기
	@RequestMapping(value="/empReviewProfile.ak", produces="application/json;charset=UTF-8")
	public String EmpReviewProfile(String r_id,int b_num, String m_id, Model model) {
		
		//매칭상태 다음페이지에 넘겨주기
		String a_apply = "N";
		model.addAttribute("a_apply",a_apply);
		
		//게시글 정보 불러오기
		MasterVO BoardVO = acceptService.acceptBoardList(m_id, b_num);
		model.addAttribute("BoardVO",BoardVO);
		
		//프로필정보 불러오기
		MasterVO empProfileVO = acceptService.empProfile(r_id);
		model.addAttribute("empProfileVO",empProfileVO);
		
		//리뷰정보 불러오기
		ArrayList<MasterVO> empReviewList = acceptService.applyEmpReview(r_id);
		model.addAttribute("empReviewList",empReviewList);
		

		return "mypage/EmpReviewProfile";
	}
	
	//매칭요청 수락하기
	@RequestMapping(value="/accept_match.ak", produces="application/json;charset=UTF-8")
	public String AcceptMatching(int b_num, int a_num, HttpSession session) {
		acceptService.acceptMatchingA(a_num); //ACCEPT 테이블 a_apply 컬럼을 Y로 변경
		acceptService.acceotMatchingB(b_num); //BOARD 테이블 b_apply 컬럼을 Y로 변경
		
		//고객 하트 차감시키기
		String login_id = (String)session.getAttribute("m_id");
		int res = acceptService.heartMinus(login_id);
	
		return "forward:/allowListC.ak";
	}
	
	
	//매칭요청 거절하기
	@RequestMapping(value="/denied_match.ak", produces="application/json;charset=UTF-8")
	@ResponseBody
	public int DeniedMatching(int a_num) {
		int result = acceptService.deniedMatchingA(a_num); //ACCEPT 테이블 a_apply 컬럼을 N으로 변경
		
		return result;
	}
	
}