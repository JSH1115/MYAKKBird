package com.bit.myakkbird;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class HomeController {
	
	@RequestMapping(value = "/home.ak")
	public String homemenu() {

		return "home";
	}
	
}
