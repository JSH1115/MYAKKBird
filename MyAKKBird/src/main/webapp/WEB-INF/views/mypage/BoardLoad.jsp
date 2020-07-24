<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bit.myakkbird.mainpoint.*" %>
<%
	String m_id = (String)request.getAttribute("m_id");
	System.out.println("현재 아이디 : " + m_id);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마이 악어새</title>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<!-- 시간 설정 API 시작 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
	<!-- 시간 설정 API 끝 -->
	<!-- jquery 모달 API 시작 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
	<link rel="stylesheet" href="resources/css/jquery_modal.css" />
	<!-- jquery 모달 API 끝 -->
	<style>
		/* font 적용 */
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
		/* font 적용 */
		
		/* 전체 적용 */	
		html, body {
		 	width: 100%;
		 	height: auto;
		 	margin: 0 auto;
		 	padding: 0;
		 	font-family: "NotoSansKR-Regular";
		}
		
		ul li {
			list-style: none;
		}
		/* 전체 적용 */	
		
		.addClass {
			width: 600px;
			height: 35px;
			margin: 0 auto;
		}
		
		.boardList_div {
			margin: 0 auto;
			padding: 0;
			width: 600px;
			height: auto;
			background-color: #E6E6E6;
		}
		
		.boardList_div_text {
			text-align: center;
			font-size: 20px;
			font-weight: bold;
		}
		
		/* 게시글 개수 style */
		.board_count_div {
			margin-top: 10px;
			width: 600px;
			height: 15px;
		}
		
		#count_b {
			font-size: 14px;
			margin-left: 26px;
			float: left;
		}
		/* 게시글 개수 style */
		
		/* 조건 검색 style */
		#search_a {
			float: right;
			margin-right: 20px;
			margin-top: -5px;
			cursor: pointer;
		}
		
		.board_search {
			display: none;
			width: 140px;
			height: 250px;
			position: absolute;
			margin-top: 5px;
			margin-left: 550px; 
			border: 0.1px solid #d3d3d3; 
			border-radius: 5px;
			background-color: white;
			box-shadow: -3px -3px 7px -3px #d3d3d3,
		                3px 3px 7px -3px #d3d3d3;
		}
		
		.board_search ul li {
			display: inline;
		}
		
		.board_search b {
			margin-left: 15px;
			font-size: 14px;
		}
		
		.search_1_div {
			height: 100px;
			margin-top: 10px;
		}
		
		.search_2_div {
			height: 90px;
			margin-top: 10px;
		}
		
		.search_btn {
			text-align: center;
		}
		
		.s_btn {
			background-color: #37B04B;
			border: 0;
			color: white;
			border-radius: 2px;
			font-size: 12px;
			cursor: pointer;
			font-family: "NotoSansKR-Regular";
		}
		
		.r_btn {
			background-color: #37B04B;
			border: 0;
			color: white;
			border-radius: 2px;
			margin-left: 5px;
			font-size: 12px;
			cursor: pointer;
			font-family: "NotoSansKR-Regular";
		}
		
		input:focus {outline:none;}
		
		.s_btn:hover, .r_btn:hover {
			font-weight: bold;
		}
		
		input[type="radio"] { display:none; }
		
		input[type="radio"] + label .c1 { 
			cursor: pointer; 
			width: 70px;
			height: 25px;
			margin-top: 10px;
			margin-left: 15px;
			background: url("./resources/image/radio_s.png");
			background-repeat: no-repeat;
			background-size: 70px 25px;
		}
		input[type="radio"]:checked + label .c1 { 
			width: 70px;
			height: 25px;
			background: url("./resources/image/radio_c_s.png");
			background-repeat: no-repeat;
			background-size: 70px 25px;
		}
		
		input[type="radio"] + label .c2 { 
			cursor: pointer; 
			width: 100px;
			height: 25px;
			margin-left: 15px;
			background: url("./resources/image/radio_m.png");
			background-repeat: no-repeat;
			background-size: 100px 25px;
		}
		input[type="radio"]:checked + label .c2 { 
			width: 100px;
			height: 25px;
			background: url("./resources/image/radio_c_m.png");
			background-repeat: no-repeat;
			background-size: 100px 25px;
		}
		
		input[type="radio"] + label .c3 { 
			cursor: pointer; 
			width: 100px;
			height: 25px;
			margin-left: 15px;
			background: url("./resources/image/radio_d.png");
			background-repeat: no-repeat;
			background-size: 100px 25px;
		}
		input[type="radio"]:checked + label .c3 { 
			width: 100px;
			height: 25px;
			background: url("./resources/image/radio_c_d.png");
			background-repeat: no-repeat;
			background-size: 100px 25px;
		}
		
		input[type="radio"] + label .a1 { 
			cursor: pointer; 
			width: 100px;
			height: 25px;
			margin-top: 10px;
			margin-left: 15px;
			background: url("./resources/image/radio_match.png");
			background-repeat: no-repeat;
			background-size: 100px 25px;
		}
		input[type="radio"]:checked + label .a1 { 
			width: 100px;
			height: 25px;
			background: url("./resources/image/radio_c_match.png");
			background-repeat: no-repeat;
			background-size: 100px 25px;
		}
		
		input[type="radio"] + label .a2 { 
			cursor: pointer; 
			width: 100px;
			height: 25px;
			margin-left: 15px;
			background: url("./resources/image/radio_nomatch.png");
			background-repeat: no-repeat;
			background-size: 100px 25px;
		}
		input[type="radio"]:checked + label .a2 { 
			width: 100px;
			height: 25px;
			background: url("./resources/image/radio_c_nomatch.png");
			background-repeat: no-repeat;
			background-size: 100px 25px;
		}
		/* 조건 검색 style */
		
		/* 게시글 style */
		.post {
			margin: 18px auto;
			margin-left: -15px;
			width: 550px;
			height: 180px;
			border: 0.1px solid #d3d3d3; 
			border-radius: 5px;
			background-color: white;
			box-shadow: -3px -3px 7px -3px #d3d3d3,
		                3px 3px 7px -3px #d3d3d3;
		}
		
		.post_main {
			width: 100px;
			height: 70px;
			float: left;
		}
		
		.post_no {
			font-size: 11px;
			margin-left: 10px;
		}
		
		.post_photo {
			width: 50px; 
			height: 50px;
			margin-left: 35px;
			margin-top: 7px;
			border-radius: 25px;
			border: 1px solid #d3d3d3;
		}
		
		.photo_span {
			margin-left: 36px;
			font-size: 11px;
			border: 1px solid #37B04B;
    		border-radius: 15px;
    		background-color: #37B04B; 
			color: white;
			padding: 4px;
    		box-shadow: -1px -1px 7px -3px #d3d3d3,
		                1px 1px 7px -3px #d3d3d3;
		}
		
		.post_center {
			width: 450px;
			height: 100px;
			font-size: 13px;
			float: right;
			margin-top: 13px;
		}
		
		.post_subject {
			font-size: 14.5px;
			margin-top: -6px;
		}
		
		.post_subject b {
			line-height: 25px;
		}
		
		.post_center span {
			margin-left: 20px;
			line-height: 18px;
		}
		
		.b_cate {
			float:right;
			margin-top: 5px;
			margin-left: -15px;
		}
		
		.post_img {
			width: 23px; 
			height: 23px;
			margin-right: 30px;
			margin-top: -4px;
			float: right;
		}
		
		.span_date {
			float:right;
			margin-right: 30px;
		}
		
		.hr_div {
			width: 550px;
			height: 30px;
			margin-top: 125px;
		}
		
		.post_hr {
			width: 95%;
			height: 0.1px;
			border: solid 0.1px #d3d3d3;
			margin-top: 125px;
		}
		
		.post_bottom {
			width: 550px;
			height: 60px;
			text-align: center;
			margin-left: 48px;
			margin-top: -24px;
		}
		
		#check_li {
			padding: 10px;
			float: left;
		}
		
		#a_btn, .delete_a { 
		 	text-decoration: none;
		 	font-size: 12px;
		 	background-color: white;
			border: 0.5px solid #37B04B;
			border-radius: 5px;
			color: #37B04B;
			padding: 5px;
			cursor: pointer;
		} 
		 
		#a_btn:hover, .delete_a:hover {
			color: white;
			background-color: #37B04B;
			font-weight: bold;
			text-decoration: none;
			cursor: pointer;
		}
		/* 게시글 style */
		
		/* 모달 style */
		.modal {
			width: 500px;
			height: 650px;
		}
		
		.modal_content_div {
			width: 500px;
			height: 500px;
		}
		
		.modal_top {
			width: 450px;
			height: 60px;
			margin-left: -5px;
			border-radius: 10px;
			text-align: center;
		}
		
		.modal_d_no {
			float: left;
			font-size: 13.5px;
		}
		
		.modal_d_sub {
			font-size: 18px;
		}
		
		.modal_profile {
			width: 360px;
			height: 100px;
			margin-left: 38px;
			margin-top: 3px;
			border: 0.5px solid #E6E6E6;
			border-radius: 3px;
			box-shadow: -1px -1px 7px -3px #d3d3d3,
		                1px 1px 7px -3px #d3d3d3;
		}
		
		.modal_p_left {
			width: 100px;
			height: 100px;
			float: left;
			border-right: 0.5px solid #E6E6E6;
		}
		
		.modal_myPhoto {
			width: 50px; 
			height: 50px;
			margin-top: 25px;
			margin-left: 25px;
			border-radius: 25px;
			border: 1px solid #d3d3d3;
			background-color: white;
		}
		
		.modal_p_right {
			width: 246px;
			height: 90px;
			margin-top: 1px;
			float: right;
			font-size: 12.5px;
		}
		
		.modal_txt_right {
			margin-right: 10px;
			float: right;
		}
		
		.modal_txt_heart {
			margin-right: 10px;
			float: right;
		}
		
		.modal_center {
			width: 360px;
			height: 350px;
			margin-top: 20px;
			margin-left: 38px;
			border: 0.5px solid #E6E6E6;
			border-radius: 3px;
			box-shadow: -1px -1px 7px -3px #d3d3d3,
		                1px 1px 7px -3px #d3d3d3;
			clear: both;
		}
		
		.modal_c_top {
			width: 360px;
			height: 80px;
			font-size: 13px;
			margin-top: 15px;
			margin-left: 15px;
		}
		
		.modal_c_top b {
			line-height: 18px;
		}
		
		.modal_cate_txt{
			float: right;
			margin-right: 3px;
		}
		
		.modal_cate_img {
			float: right;
			width: 25px;
			height: 25px;
			margin-top: -3px;
			margin-right: 30px;
		}
		
		.modal_c_center {
			width: 360px;
			height: 200px;
			font-size: 13px;
			margin-top: 14px;
			margin-left: 15px;
		}
		
		.modal_cc_content {
			width: 330px;
			height: 200px;
			border-radius: 5px;
			margin-top: -5px;
			background-color: #E6E6E6;
		}
		
		.modal_cc_content p {
			width: 330px;
			height: 200px;
			text-align: justify;
			overflow: auto;
		}
		
		.modal_btn {
			display: block;
			width: 346px;
			margin-top: 20px;
			margin-left: 38px;
			border-radius: 3px;
			background-color: #37B04B;
			color: white;
			text-align: center;
			text-decoration: none;
			padding: 8px;
		}
		
		.modal_btn:hover {
			font-weight: bold;
			color: white;
		}
		/* 모달 style */
		
		/* 게시물 등록하러가기 style */
		#noDataZone {
			margin: 0 auto;
			width: 600px;
			height: auto;
		}
		
		.noData_div {
			margin: 15px auto;
			width: 550px;
			height: 180px;
			background-color: white;
			text-align: center;
		}
		
		.noData_txt {
			width: 550px;
			height: 120px;
			margin-top: 60px;
		}
		
		.noData_b {
			font-size: 21px;
		}
		
		.noData_a {
			margin-top: 15px;
			margin-left: 85px;
			width: 300px;
		}
		
		.noData_a a {
			color: #37B04B;
			text-decoration: none;
		}
		
		.noData_a a:hover {
			color: #268F38;
			font-weight: bold;
			text-decoration: none;
		}
		
		.go_b_img {
			margin-left: 80px;
			float:left;
		}
		
		.go_B_t {
			margin-top: 15px;
			float:left;
		}
		/* 게시물 등록하러가기 style */
		
		/* 삭제 다이얼로그 style */
		.delete_list {
			display: none;
		}
		
		.dialog {
		    width: 100px;
		    height: 60px;
		    background-color: white;
		    border: 1px solid #d3d3d3;
		    border-radius: 3px;
		    position: absolute;
		    margin-top: 15px;
		    margin-left: -25px;
		    box-shadow: -3px -3px 7px -3px #d3d3d3,
		                3px 3px 7px -3px #d3d3d3;
		}
		.dialog:after,
		.dialog:before {
		    content: '';
		    display: block;
		    position: absolute;
		    left: 100%;
		    width: 0;
		    height: 0;
		    border-style: solid;
		}
		
		.dialog:after {
		    margin-top: -17.6px;
		    margin-left: -30px;
		    border-color: transparent transparent white transparent ;
		    border-width: 9px;
		}
		
		.dialog:before {
		    margin-top: -19.6px;
		    margin-left: -31px;
		    border-color: transparent transparent #d3d3d3 transparent;
		    border-width: 10px;
		}
		
		.delete_icon {
			float: right;
			margin-top: 13px;
			cursor: pointer;
		}
		
		.delete_txt {
			font-size: 12px; 
			font-weight: bold; 
			margin-top: 20px; 
			margin-right: 27px;
			float:right; 
			cursor: pointer;
		}
		/* 삭제 다이얼로그 style */
		
		/* Top 스크롤 버튼 style */
		.top {
  			position: fixed;
  			bottom: 70px;
  			display: none;
  			border-radius: 50px;
  			width: 50px;
  			height: 50px;
  			color: white;
  			background-color: #37B04B;
  			border: 0;
  			text-decoration: none;
  			margin-left: 1800px;
  			box-shadow: -3px -3px 7px -3px #d3d3d3,
		                3px 3px 7px -3px #d3d3d3;
		}
		
		.top:hover {
			background-color: #268F38;
			font-weight: bold;
			cursor: pointer;
		}
		
		.top:focus {
			border: 0;
			outline: none;
		}
		
		.Top_div {
			clear: both;
		}
		/* Top 스크롤 버튼 style */
		
		/* 데이터 없을 시 출력 style */
		.end_title {
			margin: -20px auto;
			padding: 0;
			width: 600px;
			height: 100px;
			background-color: #E6E6E6;
		}
		
		.end_txt {
			margin-top: 10px;
			text-align: center;
		}
		
		.end_icon {
			margin-top: 10px;
		}
		/* 데이터 없을 시 출력 style */
		
		/* 기타 style */
		.div_plus {
			margin: 0 auto;
			width: 600px;
			height: 5px;
			background-color: #E6E6E6;
		}
		/* 기타 style */
	</style>
</head>
<body>
	<jsp:include page="../header_container.jsp">
		<jsp:param value="m_id" name="m_id"/>
	</jsp:include>
	<div id="boardList_div_id" class="boardList_div">
		<div class="addClass">
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
<!-- modal -->
<div id="modal_id" class="modal">
	<div id="modal_content" class="modal_content_div">
	</div>
</div>
<!-- modal -->
<script type="text/javascript">
//전역 변수
var m_id = '<%=m_id %>';           // 현재 아이디
var b_num;                         // 게시글 번호
var img_d = '';                    // 카테고리 이미지
var category_d = '';               // 카테고리 텍스트
//전역 변수
// 데이터 체크
var isEmpty = function(val) {
	if(val === "" || val === null || val === undefined 
		||(val !== null && typeof val === "object" && !Object.keys(val).length)
		) {
		return true
	} else {
		return false
	}
};
// 내가 쓴 게시글이 없을 경우 
function noData() {
	$('#count_b').empty();
	
	var output = '';
	
	output += '<div class="noData_div">'
	output += '    <div class="noData_txt">'
	output += '        <b class="noData_b">등록된 게시글이 없습니다...</b><br>'
	output += '        <div class="noData_a">'
	output += '            <a href="./BoardWrite.ak"><svg class="go_b_img" xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 24 24" viewBox="0 0 24 24" fill="#37b04b" width="48px" height="48px"><g><rect fill="none" height="24" width="24"/><rect fill="none" height="24" width="24"/></g><g><g/><g><path d="M18,12c-0.55,0-1,0.45-1,1v5.22c0,0.55-0.45,1-1,1H6c-0.55,0-1-0.45-1-1V8c0-0.55,0.45-1,1-1h5c0.55,0,1-0.45,1-1 c0-0.55-0.45-1-1-1H5C3.9,5,3,5.9,3,7v12c0,1.1,0.9,2,2,2h12c1.1,0,2-0.9,2-2v-6C19,12.45,18.55,12,18,12z"/><path d="M21.02,5H19V2.98C19,2.44,18.56,2,18.02,2h-0.03C17.44,2,17,2.44,17,2.98V5h-2.01C14.45,5,14.01,5.44,14,5.98 c0,0.01,0,0.02,0,0.03C14,6.56,14.44,7,14.99,7H17v2.01c0,0.54,0.44,0.99,0.99,0.98c0.01,0,0.02,0,0.03,0 c0.54,0,0.98-0.44,0.98-0.98V7h2.02C21.56,7,22,6.56,22,6.02V5.98C22,5.44,21.56,5,21.02,5z"/><path d="M14,9H8c-0.55,0-1,0.45-1,1c0,0.55,0.45,1,1,1h6c0.55,0,1-0.45,1-1C15,9.45,14.55,9,14,9z"/><path d="M14,12H8c-0.55,0-1,0.45-1,1c0,0.55,0.45,1,1,1h6c0.55,0,1-0.45,1-1C15,12.45,14.55,12,14,12z"/><path d="M14,15H8c-0.55,0-1,0.45-1,1c0,0.55,0.45,1,1,1h6c0.55,0,1-0.45,1-1C15,15.45,14.55,15,14,15z"/></g></g></svg>'
	output += '                <span class="go_B_t">게시글 등록하러 가기</span>'
	output += '            </a>'
	output += '        </div>'
	output += '    </div>'
	output += '</div>'
	
	$('#noDataZone').html(output);
}
// 카테고리, 이미지 설정
function category_list(item) {
	if(item.b_category === "A") {
		img_d = 'vacuum.png';
		category_d = '정기청소';
	} else if(item.b_category === "B") {
		img_d = 'cleaning-tools.png';
		category_d = '특수청소';
	} else if(item.b_category === "C") {
		img_d = 'kitchen.png';
		category_d = '입주청소';
	} else if(item.b_category === "D") {
		img_d = 'maid.png';
		category_d = '상주청소';
	} else if(item.b_category === "E") {
		img_d = 'apartment.png';
		category_d = '빌딩청소';
	} else if(item.b_category === "F") {
		img_d = 'coronavirus.png';
		category_d = '방역청소';
	}
}
// 게시글 개수
function board_count(index, startNo) {
	var count = '';
	var listNum = (index+startNo+1);
	
	count += '총 게시글 '+listNum+'개'
	
	$('#count_b').html(count);
}
// 게시글 출력 
function board_list(index, item, startNo) {
	var output = '';
	var apply = '';                 
	
	if(item.b_apply === "N") {
		apply = '매칭 대기중';
	} else if(item.b_apply === "Y") {
		apply = '<b style="color:red;">매칭 완료</b>';
	}
	
	var startDay = moment(item.b_start).format("YY년 M월 D일");
	var writeDay = moment(item.b_date).format("YY년 M월 D일");
	
	var b_num = item.b_num;
	apply_conunt(b_num);
	
	output += '<li id="list_id" data-no='+(index+startNo+1)+'>'
	output += '    <div class="post" id="post_id">'
	output += '	       <div class="post_main">'
	output += '            <span class="post_no">no.'+item.b_num+'</span>'
	output += '            <img class="post_photo" src="/myakkbird/myakkbirdUpload/'+item.m_photo+'"><br>'
	output += '            <span class="photo_span" id="count'+item.b_num+'"></span>'
	output += '        </div>'
	output += '        <div class="post_center">'
	output += '            <span class="post_subject"><b>'+item.b_subject+'</b></span><b class="b_cate">'+category_d+'<img class="post_img" src="./resources/image/'+img_d+'"></b><br>'
	output += '            <span><b>신청여부</b> '+apply+'</span><br>'
	output += '            <span><b>청소시작</b> '+startDay+'</span><br>'
	output += '            <span><b>지번주소</b> '+item.b_address_road+'</span><span class="span_date"><b>조회</b> '+item.b_readcount+'</span><br>'
	output += '            <span><b>희망시급</b> '+item.b_money+'원</span><span class="span_date"><b>작성</b> '+writeDay+'</span><br>'
	output += '        </div>'
	output += '        <div class="hr_div">'
	output += '            <hr class="post_hr">'
	output += '        </div>'
	output += '        <div class="post_bottom">'
	output += '            <ul id="check_ul">'
	output += '                <li id="check_li">'
	output += '                    <a href="./allowListC.ak" id="a_btn">신청내역보기</a>'
	output += '                </li>'
	output += '                <li id="check_li">'
	output += '                    <a href="#modal_id" rel="modal:open" class="detail_btn" id="a_btn" value="'+item.b_num+'">게시글 보기</a>'
	output += '                </li>'
	output += '                <li id="check_li">'
	output += '                    <a href="./boardUpdate.ak?b_num='+item.b_num+'" id="a_btn">게시글 수정</a>'
	output += '                </li>'
	output += '                <li id="check_li">'
	output += '                    <a id="a_btn_delete'+item.b_num+'" class="delete_a">게시글 삭제</a>'
	output += '                    <div id="delete_id'+item.b_num+'" class="delete_list">'
	output += '                        <div id="dia'+item.b_num+'">'
	output += '                            <div class="dialog">'
	output += '                                <a id="deleteB'+item.b_num+'">'
	output += '                                    <span class="delete_txt">삭제</span>'
	output += '                                    <svg class="delete_icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#212121;" width="30px" height="30px"><path d="M0 0h24v24H0z" fill="none"/><path d="M6 19c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V7H6v12zM19 4h-3.5l-1-1h-5l-1 1H5v2h14V4z"/></svg>'
	output += '                                </a>'
	output += '                            </div>'
	output += '                        </div>'
	output += '     	           </div>'
	output += '                </li>'
	output += '            </ul>'
	output += '        </div>'
	output += '    </div>'
	output += '</li>'
	
	$('#boardList').append(output);
	
	delete_board(item);
}
// 게시글 삭제
function delete_board(item) {
	
	// 게시글 삭제 버튼 클릭
	$('#a_btn_delete'+item.b_num).on('click', function() {
		
		$('#delete_id'+item.b_num).toggle();
	});
	
	// 게시글 삭제
	$(document).on("click", '#deleteB'+item.b_num, function() {
		
		$.ajax({
			url : '/myakkbird/board_delete.ak?b_num='+item.b_num+'',
			type : 'GET',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				
				location.reload();
				
			},
			error:function(){
		        alert("ajax통신 실패!!!");
		    }
		})
		
	});
}
// 게시글 지원 인원 카운트
function apply_conunt(b_num) {
	
	$.ajax({
		url: '/myakkbird/chk_applyCount.ak?b_num='+b_num+'',
		type : 'GET',
		dataType : "json",
		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		success: function(data) {
			var count = data+'명 지원'
			
			$('#count'+b_num).html(count);
		},
		error:function(){
	        alert("ajax통신 실패!!!");
	    }
	});
	
}
// 무한 스크롤 후 데이터 없을시
function end_board() {
	var end_div = '';
	
	end_div += '<div class="end_title">'
	end_div += '	<div class="end_txt">'
	end_div += '        <div>'
	end_div += '            <svg class="end_icon" xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 24 24" viewBox="0 0 24 24" fill="#424242;" width="48px" height="48px"><g><rect fill="none" height="24" width="24"/></g><g><g><path d="M15.5,14h-0.79l-0.28-0.27C15.41,12.59,16,11.11,16,9.5C16,5.91,13.09,3,9.5,3C6.08,3,3.28,5.64,3.03,9h2.02 C5.3,6.75,7.18,5,9.5,5C11.99,5,14,7.01,14,9.5S11.99,14,9.5,14c-0.17,0-0.33-0.03-0.5-0.05v2.02C9.17,15.99,9.33,16,9.5,16 c1.61,0,3.09-0.59,4.23-1.57L14,14.71v0.79l5,4.99L20.49,19L15.5,14z"/><polygon points="6.47,10.82 4,13.29 1.53,10.82 0.82,11.53 3.29,14 0.82,16.47 1.53,17.18 4,14.71 6.47,17.18 7.18,16.47 4.71,14 7.18,11.53"/></g></g></svg>'
	end_div += '        </div>'
	end_div += '        <b>게시글이 없어요..!</b>'
	end_div += '	</div>'
	end_div += '</div>'
	
	$('#end').html(end_div);
}
// 조건 검색 창 보이기, 숨기기
$('#search_a').on('click', function() {
	$('.board_search').toggle();
});
// 조건 검색 클릭 후 게시물 5개 출력
$(document).on('click', '#s_btn_id', function(event){
	var params = $('#search_form').serialize();
	
	$(window).unbind();
	scroll_top();
	
	$.ajax({
		url: '/myakkbird/cb_sload.ak',
		type : 'POST',
		data : params,
		dataType : "json",
		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		success: function(data) {
			$('#boardList').empty();
			$('#end').empty();
			$('#noDataZone').empty();
			
			if(isEmpty(data)) {
				noData();
			}
			
			$.each(data, function(index, item){
				var startNo = 0;
				
				category_list(item);
				board_list(index, item, startNo);
				board_count(index, startNo);
			})
			
			$(window).scroll(function () {
				var scrollHeight = $(window).scrollTop() + $(window).height(); 
				var documentHeight = $(document).height();
		
				if(scrollHeight >= documentHeight) {
					appendDocument2(params);
				}
			})
		},
		error:function(){
	        alert("ajax통신 실패!!!");
	    }
	});
});
function appendDocument2(params) {
	
	var startNo = $("#boardList #list_id").last().data("no") || 0;
	$.ajax({
		url : '/myakkbird/cb_sinfinite.ak?startNo='+startNo+'',
		type : 'POST',
		data : params,
		dataType : "json",
		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		success: function(data) {
            
			if(isEmpty(data)) {
				end_board();
			}
			
			$.each(data, function(index, item){
				
				category_list(item);
				board_list(index, item, startNo);
				board_count(index, startNo);
				
			})
		},
		error:function(){
	        alert("ajax통신 실패!!!");
	    }
	});
	event.preventDefault();
}
$(document).ready(function(){
	
	scroll_top();
	onload();
	
	// 내가 쓴 게시글 5개 출력
	function onload() {
		
		$.ajax({
			url: '/myakkbird/cb_load.ak?m_id='+m_id+'',
			type : 'GET',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				
				if(isEmpty(data)) {
					noData();
				}
				
				$.each(data, function(index, item){
					var startNo = 0;
					
					category_list(item);
					board_list(index, item, startNo);
					board_count(index, startNo);
				})
				
				$(window).scroll(function () {
					var scrollHeight = $(window).scrollTop() + $(window).height(); 
					var documentHeight = $(document).height();
			
					if(scrollHeight >= documentHeight) {
						appendDocument();
					}
				})
			},
			error:function(){
		        alert("ajax통신 실패!!!");
		    }
		});
	}
	
	// 무한 스크롤(내가 쓴 게시글)
	function appendDocument() {
		
		var startNo = $("#boardList #list_id").last().data("no") || 0;
		
		$.ajax({
			url : '/myakkbird/cb_infinite.ak?m_id='+m_id+'&startNo='+startNo+'',
			type : 'GET',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
	            
				if(isEmpty(data)) {
					end_board();
				}
				
				$.each(data, function(index, item){
					
					category_list(item);
					board_list(index, item, startNo);
					board_count(index, startNo);
					
				})
			},
			error:function(){
		        alert("ajax통신 실패!!!");
		    }
		});
		event.preventDefault();
	}
	
});
// 게시글 자세히 보기
$(document).on("click",'.detail_btn',function() {
	b_num = $(this).attr('value');
	
	$('body').css("overflow-y", "scroll");
	$('.board_search').hide();
	$('.delete_list').hide();
	
	$.ajax({
		url : '/myakkbird/cb_detail.ak?m_id='+m_id+'&b_num='+b_num+'',
		type : 'GET',
		dataType : "json",
		contentType : 'application/x-www-form-urlencoded; charset=utf-8', 
		success: function(data) {
			var modal = '';
			var type = '';
			var gender = '';
			var photo = '';
			
			$('#modal_content').empty();
			
			if(data.m_type === "C") {
				type = '고객';
			} 
			
			if(data.m_gender === "M") {
				gender = '남자';
			} else if(data.m_gender === "W") {
				gender = '여자';
			}
			
			var start_day = moment(data.b_start).format("YY년 M월 D일");
			var end_day = moment(data.b_end).format("YY년 M월 D일");
			var write_day = moment(data.b_date).format("YY년 M월 D일 작성");
			
			category_list(data);
			
			modal += '<div class="modal_top">'
			modal += '    <span class="modal_d_no">no.'+data.b_num+'</span><br>'
			modal += '    <b class="modal_d_sub">'+data.b_subject+'</b>'
			modal += '</div>'
			modal += '<div class="modal_profile">'
			modal += '    <div class="modal_p_left">'
			modal += '        <img class="modal_myPhoto" src="/myakkbird/myakkbirdUpload/'+data.m_photo+'">'
			modal += '    </div>'
			modal += '    <div class="modal_p_right">'
			modal += '        <span><b>이름</b> '+data.m_name+'</span><span class="modal_txt_right"><b>회원유형</b> '+type+'</span><br>'
			modal += '        <span><b>성별</b> '+gender+'</span><span class="modal_txt_heart"><b>하트개수</b> '+data.m_heart+'개</span><br>'
			modal += '        <span><b>나이</b> '+data.m_age+'세</span><br>'
			modal += '        <span><b>이메일</b> '+data.m_email+'</span><br>'
			modal += '        <span><b>휴대전화</b> '+data.m_phone+'</span><br>'
			modal += '    </div>'
			modal += '</div>'
			modal += '<div class="modal_center">'
			modal += '    <div class="modal_c_top">'
			modal += '        <b>주소(지번)</b><span> '+data.b_address_road+'</span>'
			modal += '        <img class="modal_cate_img" src="./resources/image/'+img_d+'"><span class="modal_cate_txt">'+category_d+'</span><br>'
			modal += '        <b>주소(상세)</b><span> '+data.b_address_detail+'</span><br>'
			modal += '        <b>청소시작날짜</b><span> '+start_day+'</span><br>'
			modal += '        <b>청소종료날짜</b><span> '+end_day+'</span><br>'
			modal += '        <b>시급</b><span> '+data.b_money+'원</span>'
			modal += '    </div>'
			modal += '    <div class="modal_c_center">'
			modal += '        <b>상세내용</b>'
			modal += '        <div class="modal_cc_content">'
			modal += '            <p>'+data.b_content+'</p>'
			modal += '        </div>'
			modal += '    </div>'
			modal += '</div>'
			modal += '<div modal_btn_div>'
			modal += '    <a class="modal_btn" href="./BoardDetail.ak?b_num='+data.b_num+'&e_id='+m_id+'">자세히 보러 가기</a>'
			modal += '</div>'
			
			$('#modal_content').append(modal);
		},
		error:function(){
	        alert("ajax통신 실패!!!");
	    }
	});
});
//스크롤 Top 기능
function scroll_top() {
	$(window).scroll(function() {
		if($( this).scrollTop() > 200 ) {
			$('.top').fadeIn();
		} else {
			$('.top').fadeOut();
		}
	});
	
	$('.top').click(function() {
		$('html, body').animate({ scrollTop : 0 }, 400);
		return false;
	});
};
</script>
</html>