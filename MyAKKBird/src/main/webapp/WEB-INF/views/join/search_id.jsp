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
	<!-- search_id.css style 파일 -->
	<link rel="stylesheet" type="text/css" href="./resources/css/join/search_id.css">
	<!-- search_id.css style 파일 -->
</head>
<body>
<!-- header zone -->
<jsp:include page="../header_container.jsp">
	<jsp:param value="m_id" name="m_id"/>
</jsp:include> 
<!-- header zone -->
<div class="find_id_box">
	<center>
		<h2>아이디 찾기</h2><br>
		<div class="find_id_div1">
			<b>아이디를 잊어버리셨나요?</b><br>
			<span>정보를 입력하시면, 아이디를 알려드립니다.</span>
		</div>
		<form action="./findId.ak"  method="post" onsubmit="return check_input()">
			<input type="text" name="m_name" class="input_name" placeholder="  이름을 입력해주세요."><br>
			<input type="text" name="m_email" class="input_email" placeholder="  이메일를 입력해주세요."><br>
			<input type="submit" value="아이디 찾기" class="find_btn" onclick="check_input()">
		</form>
	</center>
</div>
<!-- footer zone -->
<jsp:include page="../footer_container.jsp">
	<jsp:param value="" name=""/>
</jsp:include> 
<!-- footer zone -->
</body>
<!-- search_id.js 파일 -->
<script type="text/javascript" src="./resources/js/join/search_id.js"></script>
<!-- search_id.js 파일 -->
</html>