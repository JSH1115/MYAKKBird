<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
	
	a {
		display:inline-block;
	}
	
	a:hover {
		text-decoration: none;
	}
	/* 전체 적용 */
	
	.find_box {
		margin-top: 130px;
	}
	
	.find_div1 {
		margin-top: -15px;
	}
	
	#search_txt1 {
		font-size: 15px;
	}
	
	.find_id_btn {
		margin-top: 15px;
		width: 300px;
		height: 50px;
		background-color: #37B04B;
		color: white;
		font-size: 15px;
		font-family: "NotoSansKR-Black";
		border-radius: 4px;
		text-decoration: none;
	}
	
	.find_id_btn:hover {
		color: white;
	}
	.find_div2 {
		margin-top: 15px;
	}
	
	.find_pass_btn {
		margin-top: 15px;
		width:300px; 
		height:50px;
		color: #37B04B;
		font-size: 15px;
		font-family: "NotoSansKR-Black";
		border: 1px solid #37B04B;
		border-radius: 4px;
		background-color: white;
		text-decoration: none;
	}
	
	.find_pass_btn:hover {
		color: #37B04B;
	}
	
</style>
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
</body>
</html>