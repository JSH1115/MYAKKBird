package com.bit.myakkbird.member;

import java.io.IOException;
import java.io.PrintWriter;


import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;




@Controller
public class MailController {
	
	@Autowired
	JavaMailSender mailSender;//메일 서비스를 사용하기 위해 의존성을 주입함
	
	//mailSending 코드
	@RequestMapping(value = "/auth.ak")
	public ModelAndView mailSending(HttpServletRequest request,String e_mail, HttpServletResponse response) throws IOException {
		Random r = new Random();
		int num = r.nextInt(999999);//이메일로 받는 인증코드 부분(난수)
		
		String setfrom = "ccomajun@naver.com";
		String tomail = request.getParameter("m_email");// 받는사람 이메일
		String title = "MyAkkbird 회원가입 인증 이메일 입니다."; //제목
		String content = System.getProperty("line.separator")
				+"안녕하세요 회원님 MyAkkbird를 찾아주셔서 감사합니다."
				+System.getProperty("line.separator")
				+"인증번호는"+num+"입니다."
				+System.getProperty("line.separator")
				+"받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다.";//내용
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper =
					new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom(setfrom);//보내는사람 . 생략하면 정상작동을 안함.
			messageHelper.setTo(tomail);//받는사람 이메일
			messageHelper.setSubject(title);//메일제목은 생략이 가능
			messageHelper.setText(content);//메일 내용
			
			mailSender.send(message);
		}catch(Exception e) {
			System.out.println(e);
		}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("./join/mail_injeung");
		mv.addObject("num", num);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
		writer.flush();
		
		return mv;
	}
}