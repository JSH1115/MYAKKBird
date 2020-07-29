function check_input() {
	var str, i, ch;
	// 아이디 체크 ----> 
	if (document.loginform.m_id.value == "")
	{
		Swal.fire({
			  html: 
		        '<b id="alert_id_txt">아이디를 입력하세요!</b>',
			  timer: 1500,
			  confirmButtonColor: '#37B04B',
			  confirmButtonText:
				  '<div class="go_btn">확인</div>'
		})
		document.loginform.m_id.focus();
		return;
	}
	else
	{
		str = document.loginform.m_id.value;
		
		for (i=0; i<str.length; i++)
		{
			ch = str.substring(i, i+1);
			if (!((ch >= "0" && ch <= "9") || (ch >= "a" && ch <= "z") 
					|| (ch >= "A" && ch <= "Z")))
			{
				Swal.fire({
					  html: 
				        '<b id="alert_id_txt">특수문자가 포함되어있습니다!</b><br>' +
				        '<b id="alert_id_txt2">다시 입력해주세요.</b>',
					  timer: 1500,
					  confirmButtonColor: '#37B04B',
					  confirmButtonText:
						  '<div class="go_btn">확인</div>'
				})
				document.loginform.m_id.focus();
				return;
			}
		}
	} // 아이디 체크 <------
	
	// 패스워드 체크 ------>
	if (document.loginform.m_password.value == "")
	{
		Swal.fire({
			  html: 
		        '<b id="alert_id_txt">비밀번호를 입력하세요!</b>',
			  timer: 1500,
			  confirmButtonColor: '#37B04B',
			  confirmButtonText:
				  '<div class="go_btn">확인</div>'
		})
		document.loginform.m_password.focus();
		return;
	}
	loginform.submit();
}