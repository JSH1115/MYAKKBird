<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마이악어새 계정찾기</title>
	<!-- favicon 적용 -->
	<link type="image/x-icon" rel="icon" href="./resources/image/akk_favicon.png">
	<!-- favicon 적용 -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<!-- alert창 API 시작 -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<!-- alert창 API 끝 -->
	<!-- search_pw.css style 파일 -->
	<link rel="stylesheet" type="text/css" href="./resources/css/join/search_pw.css">
	<!-- search_pw.css style 파일 -->
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
<!-- footer zone -->
<jsp:include page="../footer_container.jsp">
	<jsp:param value="" name=""/>
</jsp:include> 
<!-- footer zone -->
</body>
<!-- search_pw.js 파일 -->
<script type="text/javascript" src="./resources/js/join/search_pw.js"></script>
<!-- search_pw.js 파일 -->
</html>