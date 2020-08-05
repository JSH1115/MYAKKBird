package com.bit.myakkbird.admin;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.myakkbird.mainpoint.MasterVO;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	// 회원관리, FAQ관리
	@RequestMapping(value="/memberList.ak")
	public String memberList(HttpSession session, Model model, 
			@ModelAttribute("MasterVO") MasterVO masterVO) {
		
		String id = (String)session.getAttribute("m_id");
		MasterVO profile_M = adminService.adminProfileService(id);
		
		int listcount = adminService.memberCountService(masterVO);
		masterVO.setTotalCount(listcount);
		
		ArrayList<MasterVO> memberList = 
				adminService.memberListService(masterVO);
		
		model.addAttribute("pageVO", masterVO);
		model.addAttribute("listcount", listcount);
		model.addAttribute("profile_M", profile_M);
		model.addAttribute("resultList", memberList);
		
		return "admin/memberList";
	}
	
	@RequestMapping(value="/type_C.ak")
	@ResponseBody
	public int typeCCount() {
		
		int result = adminService.typeCCountService();
		
		return result;
	}
	
	@RequestMapping(value="/type_E.ak")
	@ResponseBody
	public int typeECount() {
		
		int result = adminService.typeECountService();
		
		return result;
	}
	
	@RequestMapping(value="/status_N.ak")
	@ResponseBody
	public int statusNCount() {
		
		int result = adminService.statusNCountService();
		
		return result;
	}
	
	@RequestMapping(value="/status_Y.ak")
	@ResponseBody
	public int statusYCount() {
		
		int result = adminService.statusYCountService();
		
		return result;
	}
	
	@RequestMapping(value="/top_addr.ak")
	@ResponseBody
	public ArrayList<MasterVO> topAddr() {
		
		ArrayList<MasterVO> addrList = adminService.topAddrService();
		
		return addrList;
	}
	
	@RequestMapping(value="/m_detail.ak")
	@ResponseBody
	public MasterVO memberDetail(String m_id) {
		
		MasterVO masterVO = adminService.detailMemberService(m_id);
		
		return masterVO;
	}
	
	@RequestMapping(value="/updateStatus_Y.ak")
	@ResponseBody
	public int updateStatusY(String m_id) {
		
		int result = adminService.updateYStatusService(m_id);
		
		return result;
	}
	
	@RequestMapping(value="/updateStatus_N.ak")
	@ResponseBody
	public int updateStatusN(String m_id) {
		
		int result = adminService.updateNStatusService(m_id);
		
		return result;
	}
	
	@RequestMapping(value="/FAQList.ak")
	public String FAQList(HttpSession session, Model model, MasterVO masterVO) {
		
		String id = (String)session.getAttribute("m_id");
		
		int listcount = adminService.faqCountService();
		ArrayList<FAQVO> faqList = adminService.faqListService();
		
		model.addAttribute("m_id", id);
		model.addAttribute("listcount", listcount);
		model.addAttribute("faqList", faqList);
		
		return "admin/FAQList";
		
	}
	
	@RequestMapping(value="/faqMemberCheck.ak")
	@ResponseBody
	public MasterVO memberCheck(String m_id) {
		
		MasterVO masterVO = adminService.faqMemberCheckService(m_id);
		
		return masterVO;
	}
	
	@RequestMapping(value="/FAQWrite.ak")
	public String FAQWrite(HttpSession session, Model model) {
		String id = (String)session.getAttribute("m_id");
		
		model.addAttribute("m_id", id);
		
		return "admin/FAQWrite";
	}
	
	@RequestMapping(value="/FAQInsertProcess.ak")
	public String FAQInsert(HttpServletResponse response, String m_id, 
			String m_password, FAQVO faqVO) throws Exception {
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		int result = adminService.adminCheckService(m_id, m_password);
		
		if(result == 1) {
			adminService.faqInsertService(faqVO);
			System.out.println("FAQ 추가 완료!");
			
			return "redirect:/FAQList.ak";
		} else {
			writer.write("<script>alert('비밀번호를 틀렸습니다!');"
					+ "location.href='./FAQWrite.ak';</script>");
		}
		
		return null;
	}
	
	@RequestMapping(value="/faq_detail.ak")
	@ResponseBody
	public FAQVO FAQDetail(int f_num) {
		FAQVO faqVO = adminService.faqDetailService(f_num);
		
		return faqVO;
	}
	
	@RequestMapping(value="/faq_update.ak")
	public String FAQUpdateCall(HttpSession session, Model model, 
			int f_num) {
		String id = (String)session.getAttribute("m_id");
		FAQVO faqVO = adminService.faqDetailService(f_num);
		
		model.addAttribute("m_id", id);
		model.addAttribute("faqVO", faqVO);
		
		return "admin/FAQUpdate";
	}
	
	@RequestMapping(value="/FAQUpdateProcess.ak")
	public String FAQUpdate(HttpServletResponse response, String m_id, 
			String m_password, FAQVO faqVO) throws Exception {
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		int result = adminService.adminCheckService(m_id, m_password);
		
		if(result == 1) {
			adminService.faqUpdateService(faqVO);
			System.out.println("FAQ 수정 완료!");
			
			return "redirect:/FAQList.ak";
		} else {
			writer.write("<script>alert('비밀번호를 틀렸습니다!');"
					+ "location.href='./FAQList.ak';</script>");
		}
		
		return null;
	}
	
	@RequestMapping(value="/faq_delete.ak")
	public String FAQDelete(int f_num) {
		adminService.faqDeleteService(f_num);
		
		return "redirect:/FAQList.ak";
	}
	
	
	// ========================================================================
	
	//호준님 (신고, 매칭)
	@RequestMapping(value="/matchingList.ak")
	public String matchingList(HttpSession session,Model model,
			@ModelAttribute("MasterVO") MasterVO masterVO) {
		
		System.out.println(masterVO.getA_applyValue());

		
		
		String id = (String)session.getAttribute("m_id");
		MasterVO profile_M = adminService.adminProfileService(id);

		int listcount = adminService.matchCountService(masterVO);
		System.out.println(listcount);
		masterVO.setTotalCount(listcount);
		
		ArrayList<MasterVO> matchList = 
				adminService.matchListService(masterVO);
		model.addAttribute("pageVO", masterVO);
		model.addAttribute("resultList", matchList);
		model.addAttribute("listcount", listcount);
		model.addAttribute("profile_M", profile_M);
	
		
		
		
		return "admin/matchingList";
	}

	@RequestMapping(value="/DangerList.ak")
	public String DangerList(HttpSession session,Model model,
			@ModelAttribute("MasterVO") MasterVO masterVO) {
		
		String id = (String)session.getAttribute("m_id");
		MasterVO profile_M = adminService.adminProfileService(id);
		
		int listcount = adminService.dangerCountService(masterVO);

		masterVO.setTotalCount(listcount);
		
		ArrayList<MasterVO> dangerList = 
				adminService.dangerListService(masterVO);
		
		
		model.addAttribute("pageVO", masterVO);
		model.addAttribute("resultList", dangerList);
		model.addAttribute("listcount", listcount);
		model.addAttribute("profile_M", profile_M);
		
		return "admin/DangerList";
	}

	@RequestMapping(value="/danger_OK.ak")
	public String dangerOK(Model model,
			@RequestBody String d_num) throws Exception{

		adminService.dangerOKService(d_num);
		
		model.addAttribute("res","OK");
		
		return "admin/DangerList";
	}

	@RequestMapping(value="/danger_NO.ak")
	public Map<String, Object> dangerNO(Model model,
			@RequestBody String d_num) throws Exception{
		Map<String, Object> retVal = new HashMap<String, Object>();
		

		try{
			adminService.dangerNOService(d_num);
			retVal.put("res", "OK");
		}
		catch (Exception e)
		{
			retVal.put("res", "FAIL");
        	retVal.put("message", "Failure");
		}
		
		return retVal;
	}

	
	
	@RequestMapping(value="/dStatus_D.ak")
	@ResponseBody
	public int dStatusDCount() {
		
		int result = adminService.dStatusDCountService();
		
		return result;
	}
	@RequestMapping(value="/dStatus_O.ak")
	@ResponseBody
	public int dStatusOCount() {
		
		int result = adminService.dStatusOCountService();
		
		return result;
	}
	@RequestMapping(value="/dStatus_X.ak")
	@ResponseBody
	public int dStatusXCount() {
		
		int result = adminService.dStatusXCountService();
		
		return result;
	}
	
	@RequestMapping(value="/danger_A.ak")
	@ResponseBody
	public int dangerACount() {
		
		int result = adminService.dangerACountService();
		
		return result;
	}
	
	@RequestMapping(value="/danger_B.ak")
	@ResponseBody
	public int dangerBCount() {
		
		int result = adminService.dangerBCountService();
		
		return result;
	}
	
	@RequestMapping(value="/danger_C.ak")
	@ResponseBody
	public int dangerCCount() {
		
		int result = adminService.dangerCCountService();
		
		return result;
	}
	
	@RequestMapping(value="/danger_D.ak")
	@ResponseBody
	public int dangerDCount() {
		
		int result = adminService.dangerDCountService();
		
		return result;
	}
	
	@RequestMapping(value="/danger_E.ak")
	@ResponseBody
	public int dangerECount() {
		
		int result = adminService.dangerECountService();
		
		return result;
	}
	@RequestMapping(value="/accept_D.ak")
	@ResponseBody
	public int accpetDCount() {
		
		int result = adminService.acceptDCountService();
		
		return result;
	}
	@RequestMapping(value="/accept_Y.ak")
	@ResponseBody
	public int accpetYCount() {
		
		int result = adminService.acceptYCountService();
		
		return result;
	}
	@RequestMapping(value="/accept_N.ak")
	@ResponseBody
	public int accpetNCount() {
		
		int result = adminService.acceptNCountService();
		
		return result;
	}
	
	@RequestMapping(value="/top_addr_match.ak")
	@ResponseBody
	public ArrayList<MasterVO> topAddrMatch() {
		
		ArrayList<MasterVO> addrList = adminService.topAddrMatchService();
		
		return addrList;
	}

}