function check_input() {
	if($(".input_name").val() == "") { 
		
		Swal.fire({
			  html: 
		        '<b id="alert_id_txt">이름을 입력하세요!</b>',
			  timer: 1500,
			  confirmButtonColor: '#37B04B',
			  confirmButtonText:
				  '<div class="go_btn">확인</div>'
		})
		
		$(".input_name").focus(); 
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