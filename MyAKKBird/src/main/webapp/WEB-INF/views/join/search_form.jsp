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
	<!-- search_form.css style 파일 -->
	<link rel="stylesheet" type="text/css" href="./resources/css/join/search_form.css">
	<!-- search_form.css style 파일 -->
</head>
<body>
<!-- header zone -->
<jsp:include page="../header_container.jsp">
	<jsp:param value="m_id" name="m_id"/>
</jsp:include> 
<!-- header zone -->
<center>
	<div class="find_box">
		<h2>계정찾기</h2>
		<div class="find_div1"><span id="search_txt1">※조회하려는 정보를 선택해 주세요.</span></div>
			<a href="./searchingId.ak" class="find_id_btn">
				<div class="find_div2">아이디 찾기</div>
			</a><br>
			<a href="./searchingPw.ak" class="find_pass_btn">
				<div class="find_div2">비밀번호 찾기</div>
			</a>
		</div>
	</div>
</center>
<!-- footer zone -->
<jsp:include page="../footer_container.jsp">
	<jsp:param value="" name=""/>
</jsp:include> 
<!-- footer zone -->
</body>
</html>