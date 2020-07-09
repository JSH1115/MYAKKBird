package com.bit.myakkbird.member;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bit.myakkbird.accept.AcceptService;
import com.bit.myakkbird.review.ReviewService;
import com.bit.myakkbird.review.ReviewVO;


@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private AcceptService acceptService;
	@Autowired
	private ReviewService reviewService;
	
	
	// 해당 id의 회원type에 따라 다른 마이페이지 메뉴로 이동
	@RequestMapping("/mypage_menu.ak")
	public String mypage_menu(String id, Model model, HttpSession session) throws Exception {
		session.setAttribute("id", id);
		String m_type = memberService.mypage_menu(id); // 타입 구하기
		model.addAttribute("m_type", m_type);

		return "member/mypage_menu";
	}
	
	// parameter로 받은 id의 프로필창으로 이동
	@RequestMapping("/profile.ak")
	public String profile(String id, Model model, HttpSession session) throws Exception {
		// 해당 id에 대한 모든 정보
		MemberVO memberVO = memberService.profile(id);
		// 해당 id에 대한 리뷰
		List<ReviewVO> reviewList = reviewService.getReviewList(id);
		
		if (reviewList.size() > 0) {
			String avgStar = String.format("%.1f", reviewService.getAvgStar(id)); // 총 평점
			model.addAttribute("avgStar", avgStar);
		}
		model.addAttribute("memberVO", memberVO);
		model.addAttribute("reviewList", reviewList);
		
	
		// 리뷰작성 버튼을 위한 해당 id와 매칭된 적 있는 id 찾기
		if (memberVO.getM_type().equals("C")) {
			String matchedPpl = acceptService.isMatched(id);
			model.addAttribute("matchedPpl", matchedPpl);
			
			// 현재 사용자가 리뷰 작성한 적 있는지 체크하기 (한사람당 한번만 작성가능하도록) 
			String m_id = (String) session.getAttribute("id");
			HashMap<String, String> hashmap = new HashMap<String, String>();
			hashmap.put("r_id", id);
			hashmap.put("m_id", m_id);
			int hasWritten = reviewService.hasWritten(hashmap);
			model.addAttribute("hasWritten", hasWritten);			
		} else if (memberVO.getM_type().equals("E")){
			System.out.println("여기 더 해야돼");
			
			//여기서부터 >>> 07.03 조승주.
			String matchedPpl = acceptService.isMatched(id);
			model.addAttribute("matchedPpl", matchedPpl);
			// 현재 사용자가 리뷰 작성한 적 있는지 체크하기 (한사람당 한번만 작성가능하도록) 
			String m_id = (String) session.getAttribute("id");
			HashMap<String, String> hashmap = new HashMap<String, String>();
			hashmap.put("r_id", id);
			hashmap.put("m_id", m_id);
			int hasWritten = reviewService.hasWritten(hashmap);
			model.addAttribute("hasWritten", hasWritten);
			//<<여기까지 에러때매 임시로 집어 넣어둔 코드 
		}

		return "member/mypage_profile3";
	}
		
		// 프로필 수정 (ajax)
		@RequestMapping(value = "modifyProfileProcess.ak", produces = "application/json;charset=UTF-8")
		@ResponseBody
		public Map<String, Object> modifyProfile(MemberVO memberVO, MultipartHttpServletRequest request, Model model,
				HttpSession session) throws Exception {

			// ajax 사진파일 받아오기
			String uploadPath = "C:\\Project156\\myakkbirdUpload\\";
			List<MultipartFile> fileList = request.getFiles("file");
			MultipartFile mf = fileList.get(0);
			if (mf.getSize() != 0) {
				String originalFileExtension = mf.getOriginalFilename()
						.substring(mf.getOriginalFilename().lastIndexOf("."));
				String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
				mf.transferTo(new File(uploadPath + storedFileName));
				memberVO.setM_photo(storedFileName);
			} else {
				memberVO.setM_photo(memberVO.getM_photo());
			}

		// 프로필 수정작업
		memberService.modifyProfile(memberVO);
		
		// 리뷰 불러오기
		String id = (String) session.getAttribute("id");
		List<ReviewVO> reviewList = reviewService.getReviewList(id);
		if (reviewList.size() > 0) {
			String avgStar = String.format("%.1f", reviewService.getAvgStar(id));
			model.addAttribute("avgStar", avgStar);
		}
		model.addAttribute("reviewList", reviewList);

		Map<String, Object> retVal = new HashMap<String, Object>();
		retVal.put("res", "OK");

		return retVal;
		}
		
		// 수정된 프로필 받기 (ajax)
		@RequestMapping(value = "/getProfile.ak", produces = "application/json;charset=UTF-8")
		@ResponseBody
		public MemberVO getProfile(HttpSession session, Model model) {
			String id = (String) session.getAttribute("id");
			MemberVO memberVO = memberService.profile(id);

			return memberVO;
		}

		// 리뷰 작성
		@RequestMapping("/writeReview3.ak")
		public String writeReview(MultipartHttpServletRequest request, ReviewVO reviewVO) throws Exception {				
			List<MultipartFile> fileList = request.getFiles("file1");
			MultipartFile a = fileList.get(0);
			System.out.println("a.isEmpty() : " + a.isEmpty()); // true (파일 선택 X인 경우) 
			
			if(!(a.isEmpty())) { // 첨부파일 비어있지 않으면(= 첨부파일 있으면)
				String uploadPath = "C:\\Project156\\myakkbirdUpload\\";
				StringBuilder allFiles = new StringBuilder("");
				for (MultipartFile mf : fileList) {
					String originalFileExtension = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
					String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
					mf.transferTo(new File(uploadPath + storedFileName));
					allFiles.append(storedFileName).append(",");
				}
				String af = (allFiles.deleteCharAt(allFiles.length() - 1)).toString();
				reviewVO.setR_up_file(af);
			}else { // a.isEmpty()가 true (첨부파일 없으면)
				reviewVO.setR_up_file("");
			}
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			String today = sdf.format(date);reviewVO.setR_date(today);
			
			String r_id = reviewVO.getR_id();
			
			reviewService.writeReview(reviewVO);
		
			return "redirect:/profile.ak?id="+ r_id;

	}
		
		// 리뷰 수정 모달창을 위한 원래 값 불러오기
		@RequestMapping(value = "modifyReview.ak", method=RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public ReviewVO getReview(@RequestParam(value="r_num") int r_num, Model model) {
			ReviewVO reviewVO = reviewService.getReview(r_num);
			return reviewVO;
		}
		
		// 리뷰 수정작업
		@RequestMapping("/modifyReviewProcess.ak")
		public String modifyReview(ReviewVO reviewVO) {
			reviewService.modifyReview(reviewVO);
			ReviewVO vo = reviewService.getReview(reviewVO.getR_num());
			
			return "redirect:profile.ak?id="+ vo.getR_id();
		}
		
		// 리뷰 삭제
		@RequestMapping("/deleteReview.ak")
		public String deleteReview(int r_num) {
			ReviewVO vo = reviewService.getReview(r_num);
			reviewService.deleteReview(r_num);
			
			return "redirect:profile.ak?id="+ vo.getR_id();
		}
		
		//-------------------------------------------------------------------------------------//
		
		//회원가입
		@RequestMapping(value = "/joininput.ak") 
		public String insertMember(MemberVO memberVO, HttpServletResponse response) 
			throws Exception { 
			String cs = "C";
			String wk = "E";

			MultipartFile mf = memberVO.getFile();

			String uploadPath = "C:\\Project156\\myakkbirdUpload\\";
			System.out.println(memberVO.getM_type());
			//지정한 위치에 파일 저장        
	        if(mf.getSize() != 0) {// 첨부된 파일이 있을때            
	            //mf.transferTo(new File(uploadPath+"/"+mf.getOriginalFilename()));   
				String originalFileExtension = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
				String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
	        	mf.transferTo(new File(uploadPath+storedFileName)); // 예외처리 기능 필요함.
	        	memberVO.setOrg_file(mf.getOriginalFilename());
	        	memberVO.setM_photo(storedFileName);
	        } else { // 첨부된 파일이 없을때
		
				if(memberVO.getM_type().equals(cs)) {
					String m_photo = "";
					memberVO.setM_photo(m_photo);
				} else if(memberVO.getM_type().equals(wk)) {
					String m_photo = "";
					memberVO.setM_photo(m_photo);
				}
			}
	        System.out.println(memberVO.getM_photo());
			
			int res = memberService.insertMember(memberVO);
		
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			if (res != 0)
			{
				writer.write("<script>alert('회원 가입 성공!!');"
						+ "location.href='./home.ak';</script>");
			}
			else
			{
				writer.write("<script>alert('회원 가입 실패!!');"
						+ "location.href='./join/joinselect.ak';</script>");
			}
			return null;
		}
		
		//로그인
		@RequestMapping(value = "/login.ak", method = RequestMethod.POST)
		public String userCheck(MemberVO memberVO, HttpSession session, 
				HttpServletResponse response) throws Exception { 
			if ( session.getAttribute("login") !=null ){
	            // 기존에 login이란 세션 값이 존재한다면
	            session.removeAttribute("login");// 기존값을 제거해 준다.
	        }
			MemberVO vo = memberService.userCheck(memberVO);
			
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter writer = response.getWriter();
			if (vo != null)
			{
				session.setAttribute("m_id",memberVO.getM_id());
				session.setAttribute("login", vo);
				// 1. 로그인이 성공하면, 그 다음으로 로그인 폼에서 쿠키가 체크된 상태로 로그인 요청이 왔는지를 확인한다.
	            if ( memberVO.isUseCookie() ){// dto 클래스 안에 useCookie 항목에 폼에서 넘어온 쿠키사용 여부(true/false)가 들어있을 것임
	                // 쿠키 사용한다는게 체크되어 있으면...
	                // 쿠키를 생성하고 현재 로그인되어 있을 때 생성되었던 세션의 id를 쿠키에 저장한다.
	                Cookie cookie =new Cookie("loginCookie", session.getId());
	                // 쿠키를 찾을 경로를 컨텍스트 경로로 변경해 주고...
	                cookie.setPath("/");
	                int amount =60 *60 *24 *7;
	                cookie.setMaxAge(amount);// 단위는 (초)임으로 7일정도로 유효시간을 설정해 준다.
	                // 쿠키를 적용해 준다.
	                response.addCookie(cookie);
	             // currentTimeMills()가 1/1000초 단위임으로 1000곱해서 더해야함
	                Date sessionLimit =new Date(System.currentTimeMillis() + (1000*amount));
	                // 현재 세션 id와 유효시간을 사용자 테이블에 저장한다.
	                memberService.keepLogin(memberVO.getM_id(), session.getId(), sessionLimit);

	            }

				writer.write("<script>location.href='./home.ak';</script>");
			}
			else 
			{
				writer.write("<script>alert('로그인 실패!!');location.href='./loginform.ak';</script>");
			}
			return null;
		}
		
		
		//로그아웃
		@RequestMapping(value = "/logOut.ak")
		public String logOut(HttpServletRequest req) {
			
			HttpSession session = req.getSession();
			session.invalidate();
			
			return "home";
		}
		
		//로그인양식	
		@RequestMapping(value = "/loginform.ak", method = RequestMethod.GET)
		public String loginForm() {

			return "/join/login_form";
		}
		
		//회원가입 : 고객 or 근로자 선택창
		@RequestMapping(value = "/joinselect.ak", method = RequestMethod.GET)
		public String joinSelect() {

			return "/join/join_select";
		}
		
		//회원가입 입력창 (고객)
		@RequestMapping(value = "/joinformcs.ak", method = RequestMethod.GET)
		public String joinFormCs() {

			return "/join/join_form_cs";
		}
		
		//회원가입 입력창 (근로자)
		@RequestMapping(value = "/joinformwk.ak", method = RequestMethod.GET)
		public String joinFormWk() {

			return "/join/join_form_wk";
		}
		
		//청소카테고리 선택 창(고객)
		@RequestMapping(value = "/joinformcscate.ak", method = RequestMethod.GET)
		public String joinFormCSCate() {

			return "/join/join_form_cs_category";
		}
		
		//청소카테고리 선택 창(근로자)
		@RequestMapping(value = "/joinformwkcate.ak", method = RequestMethod.GET)
		public String joinFormWkCate() {

			return "/join/join_form_wk_category";
		}
		
		//결제(카카오페이)
		@RequestMapping(value = "/pay.ak", method = RequestMethod.GET)
		public String payPage(MemberVO memberVO , Model model,HttpSession session, HttpServletResponse response) throws Exception{
			String m_id = (String)session.getAttribute("m_id");
		
			memberVO.setM_id(m_id);
		
			MemberVO vo = memberService.heartCheck(memberVO);
			model.addAttribute("memberVO", vo);
		
			return "/pay/paypage";
			
		}
		
}