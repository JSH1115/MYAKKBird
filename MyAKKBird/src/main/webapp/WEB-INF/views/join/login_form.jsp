<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마이악어새 로그인</title>
	<!-- favicon 적용 -->
	<link type="image/x-icon" rel="icon" href="./resources/image/akk_favicon.png">
	<!-- favicon 적용 -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<!-- alert창 API 시작 -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<!-- alert창 API 끝 -->
	<!-- login_form.css style 파일 -->
	<link rel="stylesheet" type="text/css" href="resources/css/join/login_form.css">
	<!-- login_form.css style 파일 -->
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
<!-- footer zone -->
<jsp:include page="../footer_container.jsp">
	<jsp:param value="" name=""/>
</jsp:include> 
<!-- footer zone -->
</body>
<!-- login_form.js 파일 -->
<script type="text/javascript" src="./resources/js/join/login_form.js"></script>
<!-- login_form.js 파일 -->
</html>	