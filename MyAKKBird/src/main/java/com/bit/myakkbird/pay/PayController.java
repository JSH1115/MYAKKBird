package com.bit.myakkbird.pay;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


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
}
