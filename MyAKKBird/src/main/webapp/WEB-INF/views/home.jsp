
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<%
	/* String id = (String)session.getAttribute("id");
	if(id == null){
		out.println("<script> location.href='loginform.ak' </script>");
	} */
	
	//String id = "rain_1208";
%>
<!DOCTYPE html>
<html>
<head>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<style>

#header_container {
	height:80px;
	width:100%;
	border-bottom:1px solid gray;
	display:flex;
	flex-direction: row;
	justify-content:space-around;
}
.header_item{
	vertical-align: middle;
}
.logo{
	width: 300px;
	flex-shrink:0;}
	
.header_empty{
	flex-grow:1;}
	
.header_btn{
	width: 200px;
	font-size:14px;
	flex-shrink:0;
	padding: 5px;
	margin: 30px 2px;
	text-align:center;
	color:white;
	border-radius:8px;
	line-height:25px;
	display:flex;
	flex-direction: row;
	}
	
#header_btn_1{
	margin:5px; 
	padding:10px; 
	border-radius:5px;
	background: #89df8f;
	text-decoration: none;
	color:white;
	box-shadow: 2px 2px 2px gray}
	
#header_btn_2{
	margin:5px; 
	padding: 10px; 
	border-radius:5px;
	background: #37b04b;
	text-decoration: none;
	color:white;
	box-shadow: 2px 2px 2px gray}

#bodycontainer{
	 display:flex;
	 }

#slide_img{
	width:100%;
	height: 400px;
}

#total_count{
	width:100%;
	height: 70px;
	background-color: #89df8f;
	color: white;
	font-weight: bold;
	display:flex;
	justify-content: center;
	line-height:80px;}
	
#search{
	margin:50px 0;
	width:100%;
	height:400px;
	display:flex;
	flex-direction:column;
	align-items: center;}

.search_space{
	margin:20px 0;
	display:flex;
	flex-direction:row;}

.search_space input{
	height:50px;
	width:400px;
	border: solid 2px #89df8f;
	border-radius: 4px; 
	text-align: center;
	line-height: 70px;
}
	
.search_category ul{
	margin:100px 0;
	padding:0;}

.search_category li{
	display:inline;
	list-style:none;
	margin:10px 10px;
	padding:10px 10px;}
	
#hot_reviews{
	width:100%;
	height:400px;
	background-color: #89df8f;
	color: white;
	text-align: center;
	line-height: 70px;
	font-size: 24px;
	font-weight: bold;
}
	
#hot_reviews ul{
	margin: 10px 0;
	padding: 0;
	display: flex;
	flex-direction: row;
	justify-content: center;}
	
.review{
	width:150px;
	height:150px; 
	display:inline;
	list-style:none;
	margin: 20px;
	padding: 5px 20px; 
	background-color: white;}

.more{
	width:70px;
	background-color: #37b04b;
	font-weight: normal;
}

#faq{
	width:100%;
	height:250px;
	text-align:center;
	line-height: 70px;
	font-weight: bold;}
	
#faq ul{
	margin: 100px 0;
	padding:0;
}

#faq li{
	display:inline;
	list-style: none;
	margin:10px 0; 
	padding:10px 5px;
}

#footer_container{
	background-color: lightgray;
	width:100%;
	height:200px;}


</style>


<title>Home</title>
</head>

<body>
	<div id="header_container">
		<img src="resources/image/fullLogo.png" class="logo">
		<div class="header_empty"></div>	
		<div class="header_member_img">프로필<br><span class="material-icons">
done_outline
</span> </div>
		<c:if test="${m_id == null}">
			<ul class="header_btn">
				<li><a href="joinselect.ak" id="header_btn_1">회원가입</a></li>
				<li><a href="loginform.ak" id="header_btn_2">로그인 </a></li>
			</ul>
		</c:if>

		<c:if test="${m_id != null}">
			<div>${m_id }님 환영합니다.</div>
			<ul class="header_btn">
				<li><a href="mypage_menu.ak?id=${m_id }" id="header_btn_1">마이페이지</a></li>
				<li><a href="logOut.ak" id="header_btn_2">로그아웃 </a></li>
			</ul>
		</c:if>
	</div>
	
	<div id="body_container">
		<div id="slide_img"> 슬라이드 이미지</div>
		<div id="total_count">현재까지 고객님들이 올린 게시물 수 &emsp; n 건</div>
		<div id="search">
			<h3>청소를 원하는 분이 기다리고 있습니다!</h3>
			<div class="search_space">
				<input type="text" placeholder="주소를 입력해주세요">
			</div>
			<div class="search_category"> 
				<ul>
					<li>역삼</li>
					<li>서초</li>
					<li>압구정</li>
					<li>논현</li>
					<li>삼성</li>
				</ul>
			</div>
		</div>
		<div id="hot_reviews">실시간 마이악어새 후기
			<ul>
				<li class="review">1</li>
				<li class="review">2</li>
				<li class="review">3</li>
			</ul>
			<span class="more"> 더보기</span>
		</div>
		<div id="faq">
			<h3>우리 사이트가 궁금하신가요?</h3> 
			<ul>
				<li>믿을 수 있나요?</li>
				<li>매칭은 어떻게 되나요?</li>
				<li>이용권이 궁금해요!</li>				
			</ul>
		</div>
	</div>
	
	<div id="footer_container">
	여기는 footer영역입니다
	</div>
</body>
</html>
