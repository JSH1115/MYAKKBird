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
	@font-face {
		font-family: "NotoSansKR-Bold";
		src:url('fonts/NotoSansKR-Bold.otf');
	}
	
	@font-face {
		font-family: "NotoSansKR-Thin";
		src:url('fonts/NotoSansKR-Thin.otf');
	}
	
	@font-face {
		font-family: "NotoSansKR-Black";
		src:url('fonts/NotoSansKR-Black.otf');
	}
	
	@font-face {
		font-family: "NotoSansKR-Light";
		src:url('fonts/NotoSansKR-Light.otf');
	}
	
	@font-face {
		font-family: "NotoSansKR-Medium";
		src:url('fonts/NotoSansKR-Medium.otf');
	}
	
	@font-face {
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
	
	a:hover {
		text-decoration: none;
	}
	
	label {
		margin-left: -10px;
		cursor: pointer;
	}
	/* 전체 적용 */
	
	.login-box {
		margin-top: 40px;
	}
	
	.login_btn{
	 	width: 300px;
		height: 50px;
	 	border-radius: 4px;
		border: 0px;
		background-color: #37b04b;
		color: white;
		font-size: 15px;
		margin-top: -10px;
		font-family: "NotoSansKR-Black";
		cursor: pointer;
	}
	
	.input_id {
		margin-top: 10px;
		border-radius: 4px;
		width:300px; 
		height:50px;
		border: 1px solid rgb(195, 195, 195);
	}
	
	.input_pass {
		border-radius: 4px;
		margin-top: 10px;
		border: 1px solid rgb(195, 195, 195);
		width:300px; 
		height:50px;
		margin-bottom: 10px;
	}
	
	#find_btn {
		font-family: "NotoSansKR-Bold";
		text-decoration: underline;
		color: #888888;
		font-size: 15px;
	}
	
	#join_btn {
		font-family: "NotoSansKR-Bold";
		line-height: 3;
		color: #313131;
		text-decoration: none;
		font-size: 15px;
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
<div class="login-box">
	<br>
	<br>
	<br>
	<center>
		<form name="loginform" action="./login.ak" method="post">
			<h2>로그인</h2>
				<div class="form-group">
					<input type="text" class="input_id" name="m_id"  placeholder="  아이디를 입력해주세요.">
				</div>
				<div class="form-group">
					<input type="password" class="input_pass" name="m_password"  placeholder="  비밀번호를 입력해주세요.">
				</div>
				<label>
					<input type="checkbox" name="useCookie">&nbsp;<b>로그인유지</b>
				</label>
				<br>
				<br>
				<input type="button" class="login_btn" value="로그인" onclick="check_input()">
				<br>
				<br>
				<div>
					<a id="find_btn" href='./searchSelect.ak'>로그인 정보를 잊으셨나요?</a><br>
					<a id="join_btn" href='./joinselect.ak'>회원가입</a>&nbsp;
				</div>
		</form>
	</center>
</div>
</body>
<script>
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
</script>
</html>