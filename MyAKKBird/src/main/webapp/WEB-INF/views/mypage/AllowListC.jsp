<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bit.myakkbird.mainpoint.*" %>
<%
	ArrayList<MasterVO> boardList = (ArrayList<MasterVO>)request.getAttribute("boardList");
	String m_id = (String)session.getAttribute("m_id");
	String m_type = (String)request.getAttribute("m_type");
	
	int boardCount = boardList.size();
	
	for(int i = 0; i < boardList.size(); i++) {
		
		if(boardList.get(i).getB_category().equals("A")) {
			boardList.get(i).setImg("vacuum.png");
			boardList.get(i).setB_category("정기청소");
		} else if(boardList.get(i).getB_category().equals("B")) {
			boardList.get(i).setImg("cleaning-tools.png");
			boardList.get(i).setB_category("특수조건청소");
		} else if(boardList.get(i).getB_category().equals("C")) {
			boardList.get(i).setImg("kitchen.png");
			boardList.get(i).setB_category("입주청소");
		} else if(boardList.get(i).getB_category().equals("D")) {
			boardList.get(i).setImg("maid.png");
			boardList.get(i).setB_category("상주청소");
		} else if(boardList.get(i).getB_category().equals("E")) {
			boardList.get(i).setImg("apartment.png");
			boardList.get(i).setB_category("빌딩청소");
		} else if(boardList.get(i).getB_category().equals("F")) {
			boardList.get(i).setImg("coronavirus.png");
			boardList.get(i).setB_category("방역");
		}
		
		if(boardList.get(i).getB_apply().equals("N")) {
			boardList.get(i).setB_apply("매칭 대기중");
		} else if(boardList.get(i).getB_apply().equals("Y")) {
			boardList.get(i).setB_apply("매칭 완료");
		}
		
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이악어새</title>
	<!-- favicon 적용 -->
	<link type="image/x-icon" rel="icon" href="./resources/image/akk_favicon.png">
	<!-- favicon 적용 -->
	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script> 
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<!-- 시간 설정 API 시작 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
	<!-- 시간 설정 API 끝 -->
	<!-- jquery 모달 API 시작 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
	<!-- jquery 모달 API 끝 -->
	
<style type="text/css">
	@media only screen and (min-width:860px) {
		._1POqd, ._1IykZ {background-color: #fff;min-height: 100vh}
		._1POqd {max-width: 600px;margin: 50px auto 0}
	}
	.fMmkw {overflow: hidden; width: 636px; margin-left: -19px;}
	._191Jn {position: relative;display: -ms-flexbox;display: flex;-ms-flex-pack: center;justify-content: center;-ms-flex-wrap: nowrap;flex-wrap: nowrap}
	._3kQHk {width: calc(50% - 28px) !important;height: 50px !important}
</style>

<style>
		html, body {
		 	width: 100%;
		 	height: auto;
		 	margin: 0 auto;
		 	padding: 0;
		}
		
		ul li {
			list-style: none;
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
		
		.board_count_div {
			margin-top: 10px;
			width: 600px;
			height: 10px;
		}
		
		.board_count_div b {
			margin-right: 24px;
			font-size: 14px;
			float: right;
		}
		
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
			width: 100px; 
			height: 100px;
			margin-left: 35px;
			margin-top: 7px;
			border-radius: 25px;
			border: 1px solid #d3d3d3;
		}
		
		.photo_span {
			margin-left: 36px;
			font-size: 12px;
			color: #37B04B;
			padding: 3px;
		}
		
		.post_center {
			width: 450px;
			height: 70px;
			font-size: 13px;
			float: right;
			margin-top: 15px;
		}
		.post_center_bottom{
			font-size: 13px;
			float: right;
			margin-top: 84px;
		}
		
		.post_subject {
			font-size: 17.5px;
		}
		
		.post_subject_b{
			margin-left: -28px;
		}
		
		.post_center span {
			margin-left: 84px;
		}
		
		.b_cate {
			float:right;
			margin-top: 1px;
			margin-left: -15px;
		}
		
		.post_img {
			width: 23px; 
			height: 23px;
			margin-right: 30px;
			margin-top: -4px;
			float: right;
		}
		
		.span_date1 {
			position: absolute;
   			margin-left: 380px;
   			margin-top: 34px;
		}
		.span_date2 {
			position: absolute;
   			margin-left: 326px;
   			margin-top: 34px;
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
			margin-left: 36px;
			margin-top: -24px;
		}
		
		.post_icons1{
			position: absolute;
   	 		margin-left: 55px;
    		margin-top: 10px;
		}
		
		.post_icons2{
			position: absolute;
   	 		margin-left: 55px;
    		margin-top: 25px;
		}
		.post_icons3{
			position: absolute;
   	 		margin-left: 55px;
    		margin-top: 35px;
		}
		.post_icons4{
			position: absolute;
   	 		margin-left: 55px;
    		margin-top: 45px;
		}
		.post_icons1_txt{
			position: absolute;
   	 		margin-left: 58px;
    		margin-top: 20px;
		}
		
		.post_icons2_txt{
			position: absolute;
   	 		margin-left: 55px;
    		margin-top: 30px;
		}
		.post_icons3_txt{
			position: absolute;
   	 		margin-left: 55px;
    		margin-top: 40px;
		}
		.post_icons4_txt{
			position: absolute;
   	 		margin-left: 55px;
    		margin-top: 50px;
		}
		
		#check_li {
			padding: 10px;
			float: left;
		}
		
		#a_btn, #a_btn_delete { 
		 	text-decoration: none;
		 	font-size: 12px;
		 	background-color: white;
			border: 0.5px solid #37B04B;
			border-radius: 5px;
			color: #37B04B;
			padding: 5px;
			cursor: pointer;
		} 
		 
		#a_btn:hover, #a_btn_delete:hover {
			color: white;
			background-color: #37B04B;
			font-weight: bold;
			text-decoration: none;
			cursor: pointer;
		}
		
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
			background-color: #89DF8F;
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
			margin-top: 6px;
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
		    margin-top: -41.6px;
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
		
		.cancel_div {
			margin-top: 3px;
			margin-left: 70px;
			cursor: pointer;
		}
		
		.delete_icon {
			float: right;
			margin-top: -9px;
			cursor: pointer;
		}
		
		.delete_txt {
			font-size: 12px; 
			font-weight: bold; 
			margin-top: -1px; 
			margin-right: 27px;
			float:right; 
			cursor: pointer;
		}
		
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
  			margin-left: 1000px;
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
			margin: -41px auto;
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
			height: 20px;
			background-color: white;
		}
		
	</style>

<script type="text/javascript">
	$(document).ready(function () {
		/* 왼쪽액션바 하얗게 (선택) */
		$('#_3kQHk_left').css({"border-width": "2px", "border-style": "solid", "border-color": "rgb(238, 238, 238) rgb(238, 238, 238) white", "border-image": "initial", "box-sizing": "border-box", display: "inline-block", "font-family": "&quot;Noto Sans KR&quot", "-webkit-tap-highlight-color": "rgba(0, 0, 0, 0)", cursor: "pointer", "text-decoration": "none", margin: "0px 10px -2px", padding: "0px", outline: "none", "font-size": "inherit", "font-weight": "inherit", position: "relative", "z-index": "1", height: "36px", "line-height": "36px", "min-width": "88px", color: "rgba(0, 0, 0, 0.87)", transition: "all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms", "border-radius": "18px 18px 0px 0px", "user-select": "none", overflow: "hidden", "background-color": "white", "text-align": "center", width: "50%"});
		/* 선택글자:진하게 비선택:연하게 */
		$('._3kQHk_right_span').css({color: "#9E9E9E", "font-weight":"none"});
		$('._3kQHk_left_span').css({color: "#353535", "font-weight":"600"});
	});
</script>

</head>

<jsp:include page="../header_container.jsp"></jsp:include>
<body>
	<div id="app">
		<div class="_1IykZ">
			<div class="_1POqd">
			<div>
				<!-- 내 구직현황 -->
				<div style="color: rgba(0, 0, 0, 0.87); background-color: white; transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; box-sizing: border-box; font-family: &quot;Noto Sans KR&quot;, sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-shadow: none; border-radius: 0px; position: relative; z-index: 1100; width: 100%; display: flex; padding-left: 24px; padding-right: 24px; margin-bottom: 20px;">
					<div style="margin-top: 8px; margin-right: 8px; margin-left: -16px;">
						<button onclick="javascript:history.back();" tabindex="0" type="button" style="border: 10px; box-sizing: border-box; display: inline-block; font-family: &quot;Noto Sans KR&quot;, sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); cursor: pointer; text-decoration: none; margin: 0px; padding: 12px; outline: none; font-size: 0px; font-weight: inherit; position: relative; z-index: 1; overflow: visible; transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; width: 48px; height: 48px; background: none;">
							<div>
								<svg viewBox="0 0 24 24" style="display: inline-block; color: rgba(0, 0, 0, 0.87); fill: black; height: 24px; width: 24px; user-select: none; transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms;">
									<path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path>
								</svg>
							</div>
						</button>
					</div>
					<div style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; margin: 0px; padding-top: 0px; letter-spacing: 0px; font-size: 24px; font-weight: 400; color: rgb(255, 255, 255); height: 64px; line-height: 64px; flex: 1 1 0%;">
						<div style="color: rgb(67, 67, 67); font-size: 25px; font-weight: 500; vertical-align: top; text-align: center; display: block; position: absolute; width: 200px; left: calc(50% - 100px); margin-left: -36px;"> 
							<%if(m_type.equals("E")){ %>
								<%=m_id %>악어새님의 구직 현황
							<%}else if(m_type.equals("C")){ %>
								<%=m_id %>악어님의 매칭 현황
							<%} %> 
						</div>
					</div>
				</div>
				
				<!-- 내가 지원한 / 내게 신청한 -->
				<div class="fMmkw">
					<div class="_191Jn">
						<button id="_3kQHk_left " class="_3kQHk" onclick="tabBtn_left()" type="button" style="border-width: 2px; border-style: solid; border-color: rgb(238, 238, 238) rgb(238, 238, 238) white; border-image: initial; box-sizing: border-box; display: inline-block; font-family: &quot;Noto Sans KR&quot;, sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); cursor: pointer; text-decoration: none; margin: 0px 10px -2px; padding: 0px; outline: none; font-size: inherit; font-weight: inherit; position: relative; z-index: 1; height: 36px; line-height: 36px; min-width: 88px; color: rgba(0, 0, 0, 0.87); transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; border-radius: 18px 18px 0px 0px; user-select: none; overflow: hidden; background-color: white; text-align: center; width: 50%;">
							<div>
								<span style="height: 100%; width: 100%; position: absolute; top: 0px; left: 0px; overflow: hidden; pointer-events: none;"></span>
								<span style="position: relative; padding-left: 16px; padding-right: 16px; vertical-align: top; letter-spacing: 0px; text-transform: uppercase; font-weight: 400; font-size: 17px;">
									<span class="_3kQHk_left_span">매칭 완료 게시물</span>
								</span>
							</div>
						</button>
						<%if(m_type.equals("C")){ %>
						<button id="_3kQHk_right" class="_3kQHk" onclick="location='allowListCright.ak'" tabindex="0" type="button" style="border-top: 2px solid rgb(238, 238, 238); border-right: 2px solid rgb(238, 238, 238); border-bottom: none; border-left: 2px solid rgb(238, 238, 238); border-image: initial; box-sizing: border-box; display: inline-block; font-family: &quot;Noto Sans KR&quot;, sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); cursor: pointer; text-decoration: none; margin: 0px 10px -2px; padding: 0px; outline: none; font-size: inherit; font-weight: inherit; position: relative; z-index: 1; height: 36px; line-height: 36px; min-width: 88px; color: rgba(0, 0, 0, 0.87); transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; border-radius: 18px 18px 0px 0px; user-select: none; overflow: hidden; background-color: rgb(238, 238, 238); text-align: center; width: 50%;">
							<div>
								<span style="height: 100%; width: 100%; position: absolute; top: 0px; left: 0px; overflow: hidden; pointer-events: none;"></span>
								<span style="position: relative; padding-left: 16px; padding-right: 16px; vertical-align: top; letter-spacing: 0px; text-transform: uppercase; font-weight: 400; font-size: 17px; color: rgb(158, 158, 158);">
									<span class="_3kQHk_right_span">신청 받은 게시물</span>
								</span>
							</div>
						<%}else{ %>
						<button id="_3kQHk_right" class="_3kQHk" onclick="location='allowListEright.ak'" tabindex="0" type="button" style="border-top: 2px solid rgb(238, 238, 238); border-right: 2px solid rgb(238, 238, 238); border-bottom: none; border-left: 2px solid rgb(238, 238, 238); border-image: initial; box-sizing: border-box; display: inline-block; font-family: &quot;Noto Sans KR&quot;, sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); cursor: pointer; text-decoration: none; margin: 0px 10px -2px; padding: 0px; outline: none; font-size: inherit; font-weight: inherit; position: relative; z-index: 1; height: 36px; line-height: 36px; min-width: 88px; color: rgba(0, 0, 0, 0.87); transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; border-radius: 18px 18px 0px 0px; user-select: none; overflow: hidden; background-color: rgb(238, 238, 238); text-align: center; width: 50%;">
							<div>
								<span style="height: 100%; width: 100%; position: absolute; top: 0px; left: 0px; overflow: hidden; pointer-events: none;"></span>
								<span style="position: relative; padding-left: 16px; padding-right: 16px; vertical-align: top; letter-spacing: 0px; text-transform: uppercase; font-weight: 400; font-size: 17px; color: rgb(158, 158, 158);">
									<span class="_3kQHk_right_span">신청 한 게시물</span>
								</span>
							</div>
						<%} %>
							
						</button>
					</div>
					<hr	style="border-top-color: rgb(238, 238, 238); border-right-color: rgb(238, 238, 238); border-bottom: 2px none; border-left-color: rgb(238, 238, 238); border-top-width: 2px; border-right-width: 2px; border-left-width: 2px; margin: -2px 0px 0px; position: absolute; width: 100%; z-index: -1;">
				</div>
				
				<div style="display: block;">
					<div style="padding: 8px 0px;">
						<div>
							<span tabindex="0" style="border: 10px; box-sizing: border-box; display: block; font-family: &quot;Noto Sans KR&quot;, sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); cursor: pointer; text-decoration: none; margin: 0px; padding: 0px; outline: none; font-size: 16px; font-weight: inherit; position: relative; z-index: 1; color: rgba(0, 0, 0, 0.87); line-height: 16px; transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; background: none;"><div>
								<!-- 게시물 리스트 -->
								<div id="boardList_div_id" class="boardList_div">
									<div id="board_count" class="board_count_div">
										<b id="count_b">총 게시글 <%=boardCount %>개</b>
									</div>
									<ul id="boardList">
										<%
											for(int i = 0; i < boardList.size(); i++) {
										%>
										<li id="list_id" data-no=<%=i+1 %>>
											<%if(m_type.equals("C")){ %>
											<div class="post" id="post_id" onclick="postlink('<%=boardList.get(i).getM_id()%>','<%=boardList.get(i).getE_id()%>',<%=boardList.get(i).getB_num()%>)">
											<%}else{ %>
											<div class="post" id="post_id" onclick="postlinkE('<%=boardList.get(i).getM_id()%>',<%=boardList.get(i).getB_num()%>)">
											<%} %>
												<div class="post_main">
													<span class="post_no">no.<%=boardList.get(i).getB_num() %></span>
													<%
														if(boardList.get(i).getM_photo() == null) {
													%>
															<img class="post_photo" src="./resources/image/crocodile_profile.png"><br>
													<%
														} else {
													%>
															<img class="post_photo" src="/myakkbird/myakkbirdUpload/<%=boardList.get(i).getM_photo()%>">
													<%
														}
													%>
												</div>
												<div class="post_center">
													<span class="post_subject"><b class="post_subject_b"><%=boardList.get(i).getB_subject() %></b></span><b class="b_cate"><%=boardList.get(i).getB_category() %><img class="post_img" src="./resources/image/<%=boardList.get(i).getImg() %>"></b><br>
													
													<svg class="post_icons1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#37B04B" width="21px" height="35px"><path d="M0 0h24v24H0z" fill="none"/><path d="M18 24h-6.55c-1.08 0-2.14-.45-2.89-1.23l-7.3-7.61 2.07-1.83c.62-.55 1.53-.66 2.26-.27L8 14.34V4.79c0-1.38 1.12-2.5 2.5-2.5.17 0 .34.02.51.05.09-1.3 1.17-2.33 2.49-2.33.86 0 1.61.43 2.06 1.09.29-.12.61-.18.94-.18 1.38 0 2.5 1.12 2.5 2.5v.28c.16-.03.33-.05.5-.05 1.38 0 2.5 1.12 2.5 2.5V20c0 2.21-1.79 4-4 4zM4.14 15.28l5.86 6.1c.38.39.9.62 1.44.62H18c1.1 0 2-.9 2-2V6.15c0-.28-.22-.5-.5-.5s-.5.22-.5.5V12h-2V3.42c0-.28-.22-.5-.5-.5s-.5.22-.5.5V12h-2V2.51c0-.28-.22-.5-.5-.5s-.5.22-.5.5V12h-2V4.79c0-.28-.22-.5-.5-.5s-.5.23-.5.5v12.87l-5.35-2.83-.51.45z"/></svg>
													<span class="post_icons1_txt"><b>신청여부</b> <%=boardList.get(i).getB_apply() %></span><br>
												
													<svg class="post_icons2" xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 24 24" viewBox="0 0 24 24" fill="#37B04B" width="24px" height="24px"><g><rect fill="none" height="24" width="24"/></g><g><g><path d="M16,11h-1V3c0-1.1-0.9-2-2-2h-2C9.9,1,9,1.9,9,3v8H8c-2.76,0-5,2.24-5,5v7h18v-7C21,13.24,18.76,11,16,11z M11,3h2v8h-2V3 z M19,21h-2v-3c0-0.55-0.45-1-1-1s-1,0.45-1,1v3h-2v-3c0-0.55-0.45-1-1-1s-1,0.45-1,1v3H9v-3c0-0.55-0.45-1-1-1s-1,0.45-1,1v3H5 v-5c0-1.65,1.35-3,3-3h8c1.65,0,3,1.35,3,3V21z"/></g></g></svg>
													<span class="post_icons2_txt"><b>청소시작</b> <%=boardList.get(i).getB_start() %></span><br>
													
													<svg class="post_icons3" xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24"><path d="M0 0h24v24H0V0z" fill="none"/><path fill="#37B04B" d="M12 2C8.13 2 5 5.13 5 9c0 4.17 4.42 9.92 6.24 12.11.4.48 1.13.48 1.53 0C14.58 18.92 19 13.17 19 9c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"/></svg>
													<span class="post_icons3_txt"><b>지번주소</b> <%=boardList.get(i).getB_address_road() %></span><br>
													
													<svg class="post_icons4" xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24"><path d="M0 0h24v24H0V0z" fill="none"/><path fill="#37B04B" d="M11 17h2v-1h1c.55 0 1-.45 1-1v-3c0-.55-.45-1-1-1h-3v-1h4V8h-2V7h-2v1h-1c-.55 0-1 .45-1 1v3c0 .55.45 1 1 1h3v1H9v2h2v1zm9-13H4c-1.11 0-1.99.89-1.99 2L2 18c0 1.11.89 2 2 2h16c1.11 0 2-.89 2-2V6c0-1.11-.89-2-2-2zm0 14H4V6h16v12z"/></svg>
													<span class="post_icons4_txt"><b>희망시급</b> <%=boardList.get(i).getB_money() %>원</span><br>
													
												</div>
												<div class="post_center_bottom">
													<span class="span_date1"><b>조회</b> <%=boardList.get(i).getB_readcount() %> </span><br>
													<span class="span_date2"><b>작성</b> <%=boardList.get(i).getB_date() %> </span><br>
												</div>
											</div><!-- </a> -->
										</li>
										<%
											}
										%>
									</ul>
										<%
											if(boardCount == boardList.size()) {
										%>
												<div class="div_plus"></div>
										<%
											} 
										%>
								</div>
								<div id="end">
								</div>
								<%
									if(boardList.size() == 0) {
								%>
								<div id="noDataZone">
									<div class="noData_div">
										<div class="noData_txt">
											<b class="noData_b">등록된 게시글이 없습니다...</b><br>
									        <div class="noData_a">
												<a href="./BoardWrite.ak"><svg class="go_b_img" xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 24 24" viewBox="0 0 24 24" fill="#37b04b" width="48px" height="48px"><g><rect fill="none" height="24" width="24"/><rect fill="none" height="24" width="24"/></g><g><g/><g><path d="M18,12c-0.55,0-1,0.45-1,1v5.22c0,0.55-0.45,1-1,1H6c-0.55,0-1-0.45-1-1V8c0-0.55,0.45-1,1-1h5c0.55,0,1-0.45,1-1 c0-0.55-0.45-1-1-1H5C3.9,5,3,5.9,3,7v12c0,1.1,0.9,2,2,2h12c1.1,0,2-0.9,2-2v-6C19,12.45,18.55,12,18,12z"/><path d="M21.02,5H19V2.98C19,2.44,18.56,2,18.02,2h-0.03C17.44,2,17,2.44,17,2.98V5h-2.01C14.45,5,14.01,5.44,14,5.98 c0,0.01,0,0.02,0,0.03C14,6.56,14.44,7,14.99,7H17v2.01c0,0.54,0.44,0.99,0.99,0.98c0.01,0,0.02,0,0.03,0 c0.54,0,0.98-0.44,0.98-0.98V7h2.02C21.56,7,22,6.56,22,6.02V5.98C22,5.44,21.56,5,21.02,5z"/><path d="M14,9H8c-0.55,0-1,0.45-1,1c0,0.55,0.45,1,1,1h6c0.55,0,1-0.45,1-1C15,9.45,14.55,9,14,9z"/><path d="M14,12H8c-0.55,0-1,0.45-1,1c0,0.55,0.45,1,1,1h6c0.55,0,1-0.45,1-1C15,12.45,14.55,12,14,12z"/><path d="M14,15H8c-0.55,0-1,0.45-1,1c0,0.55,0.45,1,1,1h6c0.55,0,1-0.45,1-1C15,15.45,14.55,15,14,15z"/></g></g></svg>
													<span class="go_B_t">게시글 등록하러 가기</span>
												</a>
											</div>
										</div>
									</div>
								</div>
								<%
									}
								%>
								<div class="Top_div">
									<button class="top">Top</button>
								</div>
								
								<!-- 게시물 리스트 -->
							</span>
						</div>
					</div>
				</div>
			</div>
			</div>
		</div>
	</div>
</body>
<div id="modal_id" class="modal">
	<div id="modal_content" class="modal_content_div">
	</div>
</div>
<script type="text/javascript">
//게시물 클릭시 매칭된 회원정보 보러가는 페이지링크(고객)
function postlink(m_id, e_id, b_num){
	location.href="acceptDetail.ak?m_id="+m_id+"&e_id="+e_id+"&b_num="+b_num;
}
//게시물 클릭시 매칭된 회원정보 보러가는 페이지링크(근로자)
function postlinkE(m_id, b_num){
	location.href="acceptDetailE.ak?m_id="+m_id+"&b_num="+b_num;
}
//전역 변수
var boardCount = <%=boardCount %>; // 게시글 개수
var totalCount;                    // 총 게시글 개수
var m_id = '<%=m_id %>';           // 현재 아이디
var b_num;                         // 게시글 번호
var img_d = '';                    // 카테고리 이미지
var category_d = '';               // 카테고리 텍스트
var apply = '';                    // 매칭 여부
//전역 변수
// 카테고리, 이미지 설정
function category_list(item) {
	if(item.b_category === "A") {
		img_d = 'vacuum.png';
		category_d = '정기청소';
	} else if(item.b_category === "B") {
		img_d = 'cleaning-tools.png';
		category_d = '특수조건청소';
	} else if(item.b_category === "C") {
		img_d = 'kitchen.png';
		category_d = '입주청소(이사청소)';
	} else if(item.b_category === "D") {
		img_d = 'maid.png';
		category_d = '상주청소';
	} else if(item.b_category === "E") {
		img_d = 'apartment.png';
		category_d = '빌딩청소';
	} else if(item.b_category === "F") {
		img_d = 'coronavirus.png';
		category_d = '방역';
	}
}
// 매칭 여부
function apply_list(item) {
	if(item.b_apply === "N") {
		apply = '매칭 대기중';
	} else if(item.b_apply === "Y") {
		apply = '매칭 완료';
	}
}
$(document).ready(function(){
	
	scroll_top();
	
	// 게시글 개수가 0일 경우
	if(boardCount === 0) {
		$('#board_count').empty();
	}
	
	$(function(){
		
		$(window).scroll(function () {
			var scrollHeight = $(window).scrollTop() + $(window).height(); 
			var documentHeight = $(document).height();
			var m_type = '<%=m_type%>';
			
			if(scrollHeight >= documentHeight) {
				if(m_type == "C"){
					appendDocument();				
				}else if(m_type == "E"){
					appendDocumentE();
				}
			}
		})
		
	})
	
	var startNo;
	
	// 무한 스크롤(고객)
	function appendDocument() {
		
		startNo = $("#boardList #list_id").last().data("no") || 0;
		
		$.ajax({
			url : '/myakkbird/acceptList_infinite.ak?m_id='+m_id+'&startNo='+startNo+'',
			type : 'GET',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
	            
 	            var end_div = '';
				
				end_div += '<div class="end_title">'
				end_div += '	<div class="end_txt">'
				end_div += '        <div>'
				end_div += '            <svg class="end_icon" xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 24 24" viewBox="0 0 24 24" fill="#424242;" width="48px" height="48px"><g><rect fill="none" height="24" width="24"/></g><g><g><path d="M15.5,14h-0.79l-0.28-0.27C15.41,12.59,16,11.11,16,9.5C16,5.91,13.09,3,9.5,3C6.08,3,3.28,5.64,3.03,9h2.02 C5.3,6.75,7.18,5,9.5,5C11.99,5,14,7.01,14,9.5S11.99,14,9.5,14c-0.17,0-0.33-0.03-0.5-0.05v2.02C9.17,15.99,9.33,16,9.5,16 c1.61,0,3.09-0.59,4.23-1.57L14,14.71v0.79l5,4.99L20.49,19L15.5,14z"/><polygon points="6.47,10.82 4,13.29 1.53,10.82 0.82,11.53 3.29,14 0.82,16.47 1.53,17.18 4,14.71 6.47,17.18 7.18,16.47 4.71,14 7.18,11.53"/></g></g></svg>'
				end_div += '        </div>'
				end_div += '        <b>게시글이 없어요..!</b>'
				end_div += '	</div>'
				end_div += '</div>'
				
			    $(window).scroll(function() {
			        if($(window).scrollTop() == $(document).height() - $(window).height()) {
			        	$('#end').html(end_div);
			        }
			    });
				
				$.each(data, function(index, item){
					var output = '';
					var photo = '';
					
					category_list(item);
					apply_list(item);
					
					totalCount = (index+startNo+1);
					
					if(item.m_photo === null) {
						photo = 'crocodile_profile.png';
					} else {
						photo = item.m_photo;
					}
					
					output += '<li id="list_id" data-no='+totalCount+'>'
					output += '    <div class="post" id="post_id" onclick="postlink(`'+item.m_id+'`,`'+item.e_id+'`,'+item.b_num+')">'
					output += '	       <div class="post_main">'
					output += '            <span class="post_no">no.'+item.b_num+'</span>'
					output += '            <img class="post_photo" src="/myakkbird/myakkbirdUpload/'+photo+'"><br>'
					output += '        </div>'
					output += '        <div class="post_center">'
					output += '                <span class="post_subject"><b class="post_subject_b">'+item.b_subject+'</b></span><b class="b_cate">'+category_d+'<img class="post_img" src="./resources/image/'+img_d+'"></b><br>'
					output += '                <svg class="post_icons1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#37B04B" width="21px" height="35px"><path d="M0 0h24v24H0z" fill="none"/><path d="M18 24h-6.55c-1.08 0-2.14-.45-2.89-1.23l-7.3-7.61 2.07-1.83c.62-.55 1.53-.66 2.26-.27L8 14.34V4.79c0-1.38 1.12-2.5 2.5-2.5.17 0 .34.02.51.05.09-1.3 1.17-2.33 2.49-2.33.86 0 1.61.43 2.06 1.09.29-.12.61-.18.94-.18 1.38 0 2.5 1.12 2.5 2.5v.28c.16-.03.33-.05.5-.05 1.38 0 2.5 1.12 2.5 2.5V20c0 2.21-1.79 4-4 4zM4.14 15.28l5.86 6.1c.38.39.9.62 1.44.62H18c1.1 0 2-.9 2-2V6.15c0-.28-.22-.5-.5-.5s-.5.22-.5.5V12h-2V3.42c0-.28-.22-.5-.5-.5s-.5.22-.5.5V12h-2V2.51c0-.28-.22-.5-.5-.5s-.5.22-.5.5V12h-2V4.79c0-.28-.22-.5-.5-.5s-.5.23-.5.5v12.87l-5.35-2.83-.51.45z"/></svg>'
					output += '                <span class="post_icons1_txt"><b>신청여부</b> '+apply+'</span><br>'
					output += '                <svg class="post_icons2" xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 24 24" viewBox="0 0 24 24" fill="#37B04B" width="24px" height="24px"><g><rect fill="none" height="24" width="24"/></g><g><g><path d="M16,11h-1V3c0-1.1-0.9-2-2-2h-2C9.9,1,9,1.9,9,3v8H8c-2.76,0-5,2.24-5,5v7h18v-7C21,13.24,18.76,11,16,11z M11,3h2v8h-2V3 z M19,21h-2v-3c0-0.55-0.45-1-1-1s-1,0.45-1,1v3h-2v-3c0-0.55-0.45-1-1-1s-1,0.45-1,1v3H9v-3c0-0.55-0.45-1-1-1s-1,0.45-1,1v3H5 v-5c0-1.65,1.35-3,3-3h8c1.65,0,3,1.35,3,3V21z"/></g></g></svg>'
					output += '                <span class="post_icons2_txt"><b>청소시작</b> '+moment(item.b_start).format("YYYY-MM-DD")+'</span><br>'
					output += '                <svg class="post_icons3" xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24"><path d="M0 0h24v24H0V0z" fill="none"/><path fill="#37B04B" d="M12 2C8.13 2 5 5.13 5 9c0 4.17 4.42 9.92 6.24 12.11.4.48 1.13.48 1.53 0C14.58 18.92 19 13.17 19 9c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"/></svg>'
					output += '                <span class="post_icons3_txt"><b>지번주소</b> '+item.b_address_road+'</span><br>'
					output += '                <svg class="post_icons4" xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24"><path d="M0 0h24v24H0V0z" fill="none"/><path fill="#37B04B" d="M11 17h2v-1h1c.55 0 1-.45 1-1v-3c0-.55-.45-1-1-1h-3v-1h4V8h-2V7h-2v1h-1c-.55 0-1 .45-1 1v3c0 .55.45 1 1 1h3v1H9v2h2v1zm9-13H4c-1.11 0-1.99.89-1.99 2L2 18c0 1.11.89 2 2 2h16c1.11 0 2-.89 2-2V6c0-1.11-.89-2-2-2zm0 14H4V6h16v12z"/></svg>'
					output += '                <span class="post_icons4_txt"><b>희망시급</b> '+item.b_money+'원</span><br>'
					output += '        </div>'
					output += '        <div class="post_center_bottom">'
					output += '				   <span class="span_date1"><b>조회</b> '+item.b_readcount+'</span><br>'
					output += '				   <span class="span_date2"><b>작성</b> '+moment(item.b_date).format("YYYY-MM-DD")+'</span>'
					output += '        </div>'
					output += '    </div>'
					output += '</li>'
					
					$('#boardList').append(output);
					
					var count = '';
					count += '<b id="count_b">총 게시글 '+totalCount+'개</b>'
					
					$('#board_count').html(count);
				}) 
			},
			error:function(request,status,error){		
		        //alert("무한스크롤 에러")
				//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    },
		});
		event.preventDefault();
	}
	
	var startNo2;
	// 무한 스크롤(근로자)
	function appendDocumentE() {
		
		startNo2 = $("#boardList #list_id").last().data("no") || 0;
		
		$.ajax({
			url : '/myakkbird/acceptListE_infinite.ak?m_id='+m_id+'&startNo='+startNo2+'',
			type : 'GET',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
	            
 	            var end_div = '';
				
				end_div += '<div class="end_title">'
				end_div += '	<div class="end_txt">'
				end_div += '        <div>'
				end_div += '            <svg class="end_icon" xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 24 24" viewBox="0 0 24 24" fill="#424242;" width="48px" height="48px"><g><rect fill="none" height="24" width="24"/></g><g><g><path d="M15.5,14h-0.79l-0.28-0.27C15.41,12.59,16,11.11,16,9.5C16,5.91,13.09,3,9.5,3C6.08,3,3.28,5.64,3.03,9h2.02 C5.3,6.75,7.18,5,9.5,5C11.99,5,14,7.01,14,9.5S11.99,14,9.5,14c-0.17,0-0.33-0.03-0.5-0.05v2.02C9.17,15.99,9.33,16,9.5,16 c1.61,0,3.09-0.59,4.23-1.57L14,14.71v0.79l5,4.99L20.49,19L15.5,14z"/><polygon points="6.47,10.82 4,13.29 1.53,10.82 0.82,11.53 3.29,14 0.82,16.47 1.53,17.18 4,14.71 6.47,17.18 7.18,16.47 4.71,14 7.18,11.53"/></g></g></svg>'
				end_div += '        </div>'
				end_div += '        <b>게시글이 없어요..!</b>'
				end_div += '	</div>'
				end_div += '</div>'
				
			    $(window).scroll(function() {
			        if($(window).scrollTop() == $(document).height() - $(window).height()) {
			        	$('#end').html(end_div);
			        }
			    });
				
				$.each(data, function(index, item){
					var output = '';
					var photo = '';
					
					category_list(item);
					apply_list(item);
					
					totalCount = (index+startNo2+1);
					
					if(item.m_photo === null) {
						photo = 'crocodile_profile.png';
					} else {
						photo = item.m_photo;
					}
					
					output += '<li id="list_id" data-no='+totalCount+'>'
					output += '    <div class="post" id="post_id" onclick="postlinkE(`'+item.m_id+'`,'+item.b_num+')">'	
					output += '	       <div class="post_main">'
					output += '            <span class="post_no">no.'+item.b_num+'</span>'
					output += '            <img class="post_photo" src="/myakkbird/myakkbirdUpload/'+photo+'"><br>'
					output += '            <span class="photo_span">0명 지원</span>'
					output += '        </div>'
					output += '        <div class="post_center">'
					output += '                <span class="post_subject"><b class="post_subject_b">'+item.b_subject+'</b></span><b class="b_cate">'+category_d+'<img class="post_img" src="./resources/image/'+img_d+'"></b><br>'
					output += '                <svg class="post_icons1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#37B04B" width="21px" height="35px"><path d="M0 0h24v24H0z" fill="none"/><path d="M18 24h-6.55c-1.08 0-2.14-.45-2.89-1.23l-7.3-7.61 2.07-1.83c.62-.55 1.53-.66 2.26-.27L8 14.34V4.79c0-1.38 1.12-2.5 2.5-2.5.17 0 .34.02.51.05.09-1.3 1.17-2.33 2.49-2.33.86 0 1.61.43 2.06 1.09.29-.12.61-.18.94-.18 1.38 0 2.5 1.12 2.5 2.5v.28c.16-.03.33-.05.5-.05 1.38 0 2.5 1.12 2.5 2.5V20c0 2.21-1.79 4-4 4zM4.14 15.28l5.86 6.1c.38.39.9.62 1.44.62H18c1.1 0 2-.9 2-2V6.15c0-.28-.22-.5-.5-.5s-.5.22-.5.5V12h-2V3.42c0-.28-.22-.5-.5-.5s-.5.22-.5.5V12h-2V2.51c0-.28-.22-.5-.5-.5s-.5.22-.5.5V12h-2V4.79c0-.28-.22-.5-.5-.5s-.5.23-.5.5v12.87l-5.35-2.83-.51.45z"/></svg>'
					output += '                <span class="post_icons1_txt"><b>신청여부</b> '+apply+'</span><br>'
					output += '                <svg class="post_icons2" xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 24 24" viewBox="0 0 24 24" fill="#37B04B" width="24px" height="24px"><g><rect fill="none" height="24" width="24"/></g><g><g><path d="M16,11h-1V3c0-1.1-0.9-2-2-2h-2C9.9,1,9,1.9,9,3v8H8c-2.76,0-5,2.24-5,5v7h18v-7C21,13.24,18.76,11,16,11z M11,3h2v8h-2V3 z M19,21h-2v-3c0-0.55-0.45-1-1-1s-1,0.45-1,1v3h-2v-3c0-0.55-0.45-1-1-1s-1,0.45-1,1v3H9v-3c0-0.55-0.45-1-1-1s-1,0.45-1,1v3H5 v-5c0-1.65,1.35-3,3-3h8c1.65,0,3,1.35,3,3V21z"/></g></g></svg>'
					output += '                <span class="post_icons2_txt"><b>청소시작</b> '+moment(item.b_start).format("YYYY-MM-DD")+'</span><br>'
					output += '                <svg class="post_icons3" xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24"><path d="M0 0h24v24H0V0z" fill="none"/><path fill="#37B04B" d="M12 2C8.13 2 5 5.13 5 9c0 4.17 4.42 9.92 6.24 12.11.4.48 1.13.48 1.53 0C14.58 18.92 19 13.17 19 9c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"/></svg>'
					output += '                <span class="post_icons3_txt"><b>지번주소</b> '+item.b_address_road+'</span><br>'
					output += '                <svg class="post_icons4" xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24"><path d="M0 0h24v24H0V0z" fill="none"/><path fill="#37B04B" d="M11 17h2v-1h1c.55 0 1-.45 1-1v-3c0-.55-.45-1-1-1h-3v-1h4V8h-2V7h-2v1h-1c-.55 0-1 .45-1 1v3c0 .55.45 1 1 1h3v1H9v2h2v1zm9-13H4c-1.11 0-1.99.89-1.99 2L2 18c0 1.11.89 2 2 2h16c1.11 0 2-.89 2-2V6c0-1.11-.89-2-2-2zm0 14H4V6h16v12z"/></svg>'
					output += '                <span class="post_icons4_txt"><b>희망시급</b> '+item.b_money+'원</span><br>'
					output += '        </div>'
					output += '        <div class="post_center_bottom">'
					output += '				   <span class="span_date1"><b>조회</b> '+item.b_readcount+'</span><br>'
					output += '				   <span class="span_date2"><b>작성</b> '+moment(item.b_date).format("YYYY-MM-DD")+'</span>'
					output += '        </div>'
					output += '    </div>'
					output += '</li>'
					
					$('#boardList').append(output);
					
					var count = '';
					count += '<b id="count_b">총 게시글 '+totalCount+'개</b>'
					
					$('#board_count').html(count);
				}) 
			},
			error:function(request,status,error){		
		        //alert("무한스크롤 에러")
				//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    },
		});
		event.preventDefault();
	}
	
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