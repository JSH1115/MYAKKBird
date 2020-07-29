function check_input() {
	if($(".input_name").val() == "") { 
		
		Swal.fire({
			  html: 
		        '<b id="alert_id_txt">이름을 입력하세요!</b>',
			  timer: 1500,
			  confirmButtonColor: '#37B04B',
			  confirmButtonText:
			    '확인'
		})
		
		$(".input_name").focus(); 
		return false; 
	}
	
	var chk = /^[a-zA-Z0-9- ]*$/; 
	var m_id = $(".input_id").val();
	
	if($(".input_id").val() == "") { 
		
		Swal.fire({
			  html: 
		        '<b id="alert_id_txt">아이디를 입력하세요!</b>',
			  timer: 1500,
			  confirmButtonColor: '#37B04B',
			  confirmButtonText:
				'<div class="go_btn">확인</div>'
		})
		$(".input_id").focus(); 
		return false; 
		
	} 
	
	if(chk.test(m_id) == false) {
		
		Swal.fire({
			  html: 
				  '<b id="alert_id_txt">특수문자가 포함되어있습니다!</b><br>' +
			      '<b id="alert_id_txt2">다시 입력해주세요.</b>',
			  timer: 1500,
			  confirmButtonColor: '#37B04B',
			  confirmButtonText:
				  '<div class="go_btn">확인</div>'
		})
		
		$(".input_id").focus(); 
		return false; 
		
	}
	
	if($(".input_email").val() == "") { 
		
		Swal.fire({
			  html: 
		        '<b id="alert_id_txt">이메일을 입력하세요!</b>',
			  timer: 1500,
			  confirmButtonColor: '#37B04B',
			  confirmButtonText:
				  '<div class="go_btn">확인</div>'
		})
		
		$(".input_email").focus(); 
		return false; 
	}
	
}
