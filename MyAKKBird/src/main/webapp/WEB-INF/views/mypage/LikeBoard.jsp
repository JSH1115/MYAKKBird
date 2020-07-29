<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String m_id = (String)request.getAttribute("m_id");
	System.out.println("현재 아이디 : " + m_id);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마이악어새 찜 목록</title>
	<!-- favicon 적용 -->
	<link type="image/x-icon" rel="icon" href="./resources/image/akk_favicon.png">
	<!-- favicon 적용 -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<!-- 시간 설정 API 시작 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
	<!-- 시간 설정 API 끝 -->
	<!-- alert창 API 시작 -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<!-- alert창 API 끝 -->
	<!-- LikeBoard.css style 파일 -->
	<link rel="stylesheet" type="text/css" href="./resources/css/mypage/LikeBoard.css">
	<!-- LikeBoard.css style 파일 -->
</head>
<body>
	<!-- header zone -->
	<jsp:include page="../header_container.jsp">
		<jsp:param value="m_id" name="m_id"/>
	</jsp:include>
	<!-- header zone -->
	<div id="boardList_div_id" class="boardList_div">
		<div class="addClass">
			<svg id="back_btn" viewBox="0 0 24 24" style="display: inline-block; color: rgba(0, 0, 0, 0.87); fill: black; height: 24px; width: 24px; user-select: none; transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms;"><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path></svg>
		</div>
		<div class="boardList_div_text">
			<span>찜한 게시글</span>
		</div>
		<!-- 게시물 개수 -->
		<div id="board_count" class="board_count_div">
			<b id="count_b"></b>
			<a href="./searchProcess.ak?b_address_road=" id="go_mainPoint">찜 더하러 가기 ></a>
		</div>
		<!-- 게시물 개수 -->
		<!-- 게시물 출력 -->
		<ul id="data_insert">
		</ul>
		<!-- 게시물 출력 -->
		<div class="div_plus"></div>
		<!-- 게시글 없을 경우 -->
		<div id="end">
		</div>
		<!-- 게시글 없을 경우 -->
	</div>
	<div id="noLikeZone">
	</div>
	<!-- top 버튼 -->
	<div class="Top_div">
		<button class="top">Top</button>
	</div>
	<!-- top 버튼 -->
</body>
<script>
//전역 변수
var se_id = '<%=m_id %>'; //현재 아이디
//전역 변수
</script>
<!-- LikeBoard.js 파일 -->
<script src="./resources/js/mypage/LikeBoard.js"></script>
<!-- LikeBoard.js 파일 -->
</html>