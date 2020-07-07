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
	
	
	// �빐�떦 id�쓽 �쉶�썝type�뿉 �뵲�씪 �떎瑜� 留덉씠�럹�씠吏� 硫붾돱濡� �씠�룞
	@RequestMapping("/mypage_menu.ak")
	public String mypage_menu(String id, Model model, HttpSession session) throws Exception {
		session.setAttribute("id", id);
		String m_type = memberService.mypage_menu(id); // ���엯 援ы븯湲�
		model.addAttribute("m_type", m_type);

		return "member/mypage_menu";
	}
	
	// parameter濡� 諛쏆� id�쓽 �봽濡쒗븘李쎌쑝濡� �씠�룞
		@RequestMapping("/profile.ak")
		public String profile(String id, Model model, HttpSession session) throws Exception {
			// �빐�떦 id�뿉 ���븳 紐⑤뱺 �젙蹂�
			MemberVO memberVO = memberService.profile(id);
			// �빐�떦 id�뿉 ���븳 由щ럭
			List<ReviewVO> reviewList = reviewService.getReviewList(id);
			
			if (reviewList.size() > 0) {
				String avgStar = String.format("%.1f", reviewService.getAvgStar(id)); // 珥� �룊�젏
				model.addAttribute("avgStar", avgStar);
			}
			model.addAttribute("memberVO", memberVO);
			model.addAttribute("reviewList", reviewList);
			
		
			// 由щ럭�옉�꽦 踰꾪듉�쓣 �쐞�븳 �빐�떦 id�� 留ㅼ묶�맂 �쟻 �엳�뒗 id 李얘린
			if (memberVO.getM_type().equals("C")) {
				String matchedPpl = acceptService.isMatched(id);
				model.addAttribute("matchedPpl", matchedPpl);
				
				// �쁽�옱 �궗�슜�옄媛� 由щ럭 �옉�꽦�븳 �쟻 �엳�뒗吏� 泥댄겕�븯湲� (�븳�궗�엺�떦 �븳踰덈쭔 �옉�꽦媛��뒫�븯�룄濡�) 
				String m_id = (String) session.getAttribute("id");
				HashMap<String, String> hashmap = new HashMap<String, String>();
				hashmap.put("r_id", id);
				hashmap.put("m_id", m_id);
				int hasWritten = reviewService.hasWritten(hashmap);
				model.addAttribute("hasWritten", hasWritten);			
			} else if (memberVO.getM_type().equals("E")){
				System.out.println("�뿬湲� �뜑 �빐�빞�뤌");
				
				//�뿬湲곗꽌遺��꽣 >>> 07.03 議곗듅二�.
				String matchedPpl = acceptService.isMatched(id);
				model.addAttribute("matchedPpl", matchedPpl);
				// �쁽�옱 �궗�슜�옄媛� 由щ럭 �옉�꽦�븳 �쟻 �엳�뒗吏� 泥댄겕�븯湲� (�븳�궗�엺�떦 �븳踰덈쭔 �옉�꽦媛��뒫�븯�룄濡�) 
				String m_id = (String) session.getAttribute("id");
				HashMap<String, String> hashmap = new HashMap<String, String>();
				hashmap.put("r_id", id);
				hashmap.put("m_id", m_id);
				int hasWritten = reviewService.hasWritten(hashmap);
				model.addAttribute("hasWritten", hasWritten);
				//<<�뿬湲곌퉴吏� �뿉�윭�븣留� �엫�떆濡� 吏묒뼱 �꽔�뼱�몦 肄붾뱶 
			}

			return "member/mypage_profile3";
		}
		
		// �봽濡쒗븘 �닔�젙 (ajax)
		@RequestMapping(value = "modifyProfileProcess.ak", produces = "application/json;charset=UTF-8")
		@ResponseBody
		public Map<String, Object> modifyProfile(MemberVO memberVO, MultipartHttpServletRequest request, Model model,
				HttpSession session) throws Exception {

			// ajax �궗吏꾪뙆�씪 諛쏆븘�삤湲�
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

		// �봽濡쒗븘 �닔�젙�옉�뾽
		memberService.modifyProfile(memberVO);
		
		// 由щ럭 遺덈윭�삤湲�
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
		
		// �닔�젙�맂 �봽濡쒗븘 諛쏄린 (ajax)
		@RequestMapping(value = "/getProfile.ak", produces = "application/json;charset=UTF-8")
		@ResponseBody
		public MemberVO getProfile(HttpSession session, Model model) {
			String id = (String) session.getAttribute("id");
			MemberVO memberVO = memberService.profile(id);

			return memberVO;
		}

		// 由щ럭 �옉�꽦
		@RequestMapping("/writeReview3.ak")
		public String writeReview(MultipartHttpServletRequest request, ReviewVO reviewVO) throws Exception {				
			List<MultipartFile> fileList = request.getFiles("file1");
			MultipartFile a = fileList.get(0);
			System.out.println("a.isEmpty() : " + a.isEmpty()); // true (�뙆�씪 �꽑�깮 X�씤 寃쎌슦) 
			
			if(!(a.isEmpty())) { // 泥⑤��뙆�씪 鍮꾩뼱�엳吏� �븡�쑝硫�(= 泥⑤��뙆�씪 �엳�쑝硫�)
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
			}else { // a.isEmpty()媛� true (泥⑤��뙆�씪 �뾾�쑝硫�)
				reviewVO.setR_up_file("");
			}
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			String today = sdf.format(date);reviewVO.setR_date(today);
			
			String r_id = reviewVO.getR_id();
			
			reviewService.writeReview(reviewVO);
		
			return "redirect:/profile.ak?id="+ r_id;

	}
		
		// 由щ럭 �닔�젙 紐⑤떖李쎌쓣 �쐞�븳 �썝�옒 媛� 遺덈윭�삤湲�
		@RequestMapping(value = "modifyReview.ak", method=RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public ReviewVO getReview(@RequestParam(value="r_num") int r_num, Model model) {
			ReviewVO reviewVO = reviewService.getReview(r_num);
			return reviewVO;
		}
		
		// 由щ럭 �닔�젙�옉�뾽
		@RequestMapping("/modifyReviewProcess.ak")
		public String modifyReview(ReviewVO reviewVO) {
			reviewService.modifyReview(reviewVO);
			ReviewVO vo = reviewService.getReview(reviewVO.getR_num());
			
			return "redirect:profile.ak?id="+ vo.getR_id();
		}
		
		// 由щ럭 �궘�젣
		@RequestMapping("/deleteReview.ak")
		public String deleteReview(int r_num) {
			ReviewVO vo = reviewService.getReview(r_num);
			reviewService.deleteReview(r_num);
			
			return "redirect:profile.ak?id="+ vo.getR_id();
		}
		
		//-------------------------------------------------------------------------------------//
		
		//�쉶�썝媛��엯
		@RequestMapping(value = "/joininput.ak") 
		public String insertMember(MemberVO memberVO, HttpServletResponse response) throws Exception { 
			String cs = "C";
			String wk = "E";
			System.out.println("vo.getFile()=" + memberVO.getFile());
			if(memberVO.getFile() == null) {
				if(memberVO.getM_type()== cs) {
				
					String dfimg = "./resources/image/crocodile_logo.png";
					memberVO.setM_photo(dfimg);
				}else if(memberVO.getM_type() == wk) {
					String dfimg = "./resources/image/bird_logo.png";
					memberVO.setM_photo(dfimg);
					
				}
			
			}else {
			MultipartFile mf = memberVO.getFile();
			String uploadPath = "C:\\Project156\\myakkbirdUpload\\";
			System.out.println("mf=" + mf);
			String originalFileExtension = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
			String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
			//吏��젙�븳 二쇱냼�뿉 �뙆�씪 ���옣    
	        if(mf.getSize() != 0) {            
	            //mf.transferTo(new File(uploadPath+"/"+mf.getOriginalFilename()));     
	        	mf.transferTo(new File(uploadPath+storedFileName)); //�삁�쇅泥섎━ 湲곕뒫
	        }
			memberVO.setM_photo(storedFileName);

			}
		
			
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
		
		//濡쒓렇�씤
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
		
		
		//濡쒓렇�븘�썐
		@RequestMapping(value = "/logOut.ak")
		public String logOut(HttpServletRequest req) {
			
			HttpSession session = req.getSession();
			session.invalidate();
			
			return "home";
		}
		
		//濡쒓렇�씤�뼇�떇	
		@RequestMapping(value = "/loginform.ak", method = RequestMethod.GET)
		public String loginForm() {

			return "/join/login_form";
		}
		
		//�쉶�썝媛��엯 : 怨좉컼 or 洹쇰줈�옄 �꽑�깮李�
		@RequestMapping(value = "/joinselect.ak", method = RequestMethod.GET)
		public String joinSelect() {

			return "/join/join_select";
		}
		
		//�쉶�썝媛��엯 �엯�젰李� (怨좉컼)
		@RequestMapping(value = "/joinformcs.ak", method = RequestMethod.GET)
		public String joinFormCs() {

			return "/join/join_form_cs";
		}
		
		//�쉶�썝媛��엯 �엯�젰李� (洹쇰줈�옄)
		@RequestMapping(value = "/joinformwk.ak", method = RequestMethod.GET)
		public String joinFormWk() {

			return "/join/join_form_wk";
		}
		
		//泥��냼移댄뀒怨좊━ �꽑�깮 李�(怨좉컼)
		@RequestMapping(value = "/joinformcscate.ak", method = RequestMethod.GET)
		public String joinFormCSCate() {

			return "/join/join_form_cs_category";
		}
		
		//泥��냼移댄뀒怨좊━ �꽑�깮 李�(洹쇰줈�옄)
		@RequestMapping(value = "/joinformwkcate.ak", method = RequestMethod.GET)
		public String joinFormWkCate() {

			return "/join/join_form_wk_category";
		}
		
		//寃곗젣(移댁뭅�삤�럹�씠)
		@RequestMapping(value = "/pay.ak", method = RequestMethod.GET)
		public String payPage(MemberVO memberVO , Model model,HttpSession session, HttpServletResponse response) throws Exception{
			String m_id = (String)session.getAttribute("m_id");
		
			memberVO.setM_id(m_id);
		
			MemberVO vo = memberService.heartCheck(memberVO);
			model.addAttribute("memberVO", vo);
		
			return "/pay/paypage";
			
		}
		
}