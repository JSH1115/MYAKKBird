function check_form() {
	
	if($("#faq_subject").val() == "") { 
		alert("FAQ 제목을 입력하세요!"); 
		$("#faq_subject").focus(); 
		return false; 
	}
	if($("#faq_content").val() == "") { 
		alert("FAQ 내용을 입력하세요!"); 
		$("#faq_content").focus(); 
		return false; 
	}
	
	if($("#faq_password").val() == "") { 
		alert("비밀번호를 입력하세요!"); 
		$("#faq_password").focus(); 
		return false; 
	}
	
}