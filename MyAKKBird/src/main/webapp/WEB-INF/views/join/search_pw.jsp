<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- alert창 API 시작 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<!-- alert창 API 끝 -->
	<title>마이악어새</title>
	<style>
	@font-face{
		font-family: "NotoSansKR-Bold";
		src:url('fonts/NotoSansKR-Bold.otf');
	}
	
	@font-face{
		font-family: "NotoSansKR-Thin";
		src:url('fonts/NotoSansKR-Thin.otf');
	}
	
	@font-face{
		font-family: "NotoSansKR-Black";
		src:url('fonts/NotoSansKR-Black.otf');
	}
	
	@font-face{
		font-family: "NotoSansKR-Light";
		src:url('fonts/NotoSansKR-Light.otf');
	}
	
	@font-face{
		font-family: "NotoSansKR-Medium";
		src:url('fonts/NotoSansKR-Medium.otf');
	}
	
	@font-face{
		font-family: "NotoSansKR-Regular";
		src:url('fonts/NotoSansKR-Regular.otf');
	}
	
	/* 전체 적용 */
	body {
		margin: 0 auto;
		padding: 0;
		background-color: #F6F6F6;
		font-family: "NotoSansKR-Regular";
	}
	
	h2 {
		font-family: "NotoSansKR-Bold";
	}
	
	input {
		font-family: "NotoSansKR-Medium";
	}
	
	input:focus {outline:none;}
	/* 전체 적용 */
	
	.find_pass_box {
		margin-top: 130px;
		margin-bottom: 155px;
	}
	
	.find_pass_div1 {
		margin-top: -35px;
		margin-bottom: 40px;
	}
	
	.find_pass_div1 b {
		font-size: 16px;
	}
	
	.find_pass_div1 span {
		font-size: 14px;
	}
	
	.input_name {
		margin-top: -20px;
		border-radius: 4px;
		width:300px; 
		height:50px;
		border: 1px solid rgb(195, 195, 195);
	}
	
	.input_id {
		border-radius: 4px;
		margin-top: 10px;
		border: 1px solid rgb(195, 195, 195);
		width:300px; 
		height:50px;
	}
	
	.input_email {
		border-radius: 4px;
		margin-top: 10px;
		border: 1px solid rgb(195, 195, 195);
		width:300px; 
		height:50px;
	}
	
	.find_btn {
		width: 300px;
		height: 50px;
	 	border-radius: 4px;
		border: 0px;
		background-color: #37b04b;
		color: white;
		font-size: 15px;
		margin-top: 20px;
		font-family: "NotoSansKR-Black";
		cursor: pointer;
	}
	
	#alert_id_txt {
		font-size: 18px;
	}
	
	#alert_id_txt2 {
		font-size: 15px;
	}
	
	.go_btn {
		font-family: "NotoSansKR-Medium";
	}
	</style>
</head>
<body>
<!-- header zone -->
<jsp:include page="../header_container.jsp">
	<jsp:param value="m_id" name="m_id"/>
</jsp:include> 
<!-- header zone -->
<div class="find_pass_box">
	<center>
		<h2>비밀번호 찾기</h2><br>
		<div class="find_pass_div1">
			<b>비밀번호를 잊어버리셨나요?</b><br>
			<span>정보를 입력하시면, 비밀번호를 알려드립니다.</span>
		</div>
		<form action="./findPw.ak"  method="post" onsubmit="return check_input()">
			<input type="text" name="m_name" class="input_name" placeholder="  이름를 입력해주세요."><br>
			<input type="text" name="m_id" class="input_id" placeholder="  아이디를 입력해주세요."><br>
			<input type="text" name="m_email" class="input_email" placeholder="  이메일를 입력해주세요."><br>
			<input type="submit" value="비밀번호 찾기" class="find_btn" onclick="check_input()">
		</form>
	</center>
</div>
<jsp:include page="../footer_container.jsp">
	<jsp:param value="" name=""/>
</jsp:include> 
</body>
<script>
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
	
</script>
</html>