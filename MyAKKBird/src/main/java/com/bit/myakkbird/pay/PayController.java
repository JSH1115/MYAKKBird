package com.bit.myakkbird.pay;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.myakkbird.member.MemberVO;


@Controller
public class PayController {
	
	@Autowired
	private PayService payService; 
	
	@RequestMapping(value = "/paysuccess.ak", method= {RequestMethod.POST,RequestMethod.GET}, produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> paySuccess(@RequestBody HashMap<String, Object> params)
	{
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		try{
			payService.insertPay(params);
			retVal.put("res", "OK");
			payService.updateHeart(params);
		}
		catch (Exception e)
		{
			retVal.put("res", "FAIL");
        	retVal.put("message", "Failure");
		}
        
		return retVal;
	}
	
	@RequestMapping(value="/payList.ak")
	public String payList(HttpSession session, Model model, 
			@RequestParam(value="page", required=false, 
			defaultValue="1") int page) {
		
		String m_id = (String)session.getAttribute("m_id");
		MemberVO memberVO = payService.checkMemberService(m_id);
		
		int limit = 10;
		
		int startrow = (page-1)*10+1;
		int endrow = startrow+limit-1;
		
		int listCount = payService.payListCountService(m_id);
		ArrayList<PayVO> payList = 
				payService.payListService(m_id, startrow, endrow);
		
		int maxpage = (int)((double)listCount/limit+0.95); 
   		int startpage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   		int endpage = maxpage;
   		
   		if (endpage>startpage+10-1) endpage=startpage+10-1;
   		
   		model.addAttribute("memberVO", memberVO);
		model.addAttribute("page", page);
		model.addAttribute("listCount", listCount);
		model.addAttribute("payList", payList);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
	
		return "pay/payList";
	}
}
