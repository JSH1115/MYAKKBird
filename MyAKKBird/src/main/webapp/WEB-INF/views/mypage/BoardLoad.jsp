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
	<title>마이악어새 게시글 불러오기</title>
	<!-- favicon 적용 -->
	<link type="image/x-icon" rel="icon" href="./resources/image/akk_favicon.png">
	<!-- favicon 적용 -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<!-- 시간 설정 API 시작 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
	<!-- 시간 설정 API 끝 -->
	<!-- alert창 API 시작 -->
	<script src="resources/js/sweetAlert_J.js"></script>
	<!-- alert창 API 끝 -->
	<!-- BoardLoad.css style 파일 -->
	<link rel="stylesheet" type="text/css" href="./resources/css/mypage/BoardLoad.css">
	<!-- BoardLoad.css style 파일 -->
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
			<span>게시글 보기</span>
		</div>
		<!-- 게시물 개수 -->
		<div id="board_count" class="board_count_div">
			<b id="count_b"></b>
			<a id="search_a"><svg class="search_icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="black" width="35px" height="35px"><path d="M0 0h24v24H0z" fill="none"/><path d="M6 10c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm12 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm-6 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"/></svg></a>
		</div>
		<!-- 게시물 개수 -->
		<!-- 게시물 검색 -->
		<div class="board_search">
			<form name="search_form_name" id="search_form" method="post">
				<input type="hidden" name="m_id" value="<%=m_id %>">
				<!-- 조건 검색 창 -->
				<div class="search_1_div">
					<b>* 조건검색</b>
					<input type="radio" id="choice1" name="choice" value="ND">
					<label for="choice1"><div class="c1"></div></label>
					<input type="radio" id="choice2" name="choice" value="MM">
					<label for="choice2"><div class="c2"></div></label>
					<input type="radio" id="choice3" name="choice" value="MS">
					<label for="choice3"><div class="c3"></div></label>
				</div>
				<div class="search_2_div">
					<b>* 매칭여부</b>
					<input type="radio" id="apply_id_y" name="b_apply" value="Y">
					<label for="apply_id_y"><div class="a1"></div></label>
					<input type="radio" id="apply_id_n" name="b_apply" value="N">
					<label for="apply_id_n"><div class="a2"></div></label>
				</div>
				<!-- 조건 검색 창 -->
				<div class="search_btn">
					<input type="button" class="s_btn" id="s_btn_id" value="검색"><input type="reset" class="r_btn" value="초기화">
				</div>
			</form>
		</div>
		<!-- 게시물 검색 -->
		<!-- 게시물 출력 -->
		<ul id="boardList">
		</ul>
		<!-- 게시물 출력 -->
		<div class="div_plus"></div>
		<div id="end">
		</div>
	</div>
	<!-- 데이터 없을시 -->
	<div id="noDataZone">
	</div>
	<!-- 데이터 없을시 -->
	<!-- top 버튼 -->
	<div class="Top_div">
		<button class="top">Top</button>
	</div>
	<!-- top 버튼 -->
</body>
<script >
//전역 변수
var m_id = '<%=m_id %>';           // 현재 아이디
//전역 변수
</script>
<!-- BoardLoad.js 파일 -->
<script src="./resources/js/mypage/BoardLoad.js"></script>
<!-- BoardLoad.js 파일 -->
</html>