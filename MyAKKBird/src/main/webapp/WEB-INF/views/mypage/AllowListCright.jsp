<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bit.myakkbird.mainpoint.*" %>
<%
	ArrayList<MasterVO> boardList = (ArrayList<MasterVO>)request.getAttribute("boardList");
	ArrayList<MasterVO> applyEmpCntList = (ArrayList<MasterVO>)request.getAttribute("applyEmpCntList");
	String m_type = (String)request.getAttribute("m_type");
	String m_id = (String)session.getAttribute("m_id");
	
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
	
	//System.out.println("현재 세션 아이디 : " + m_id);
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
		.photo_span {
			margin-left: 56px;
			margin-top: 2px;
			position: absolute;
			font-size: 11px;
			border: 1px solid #37B04B;
    		border-radius: 15px;
    		background-color: #37B04B; 
			color: white;
			padding: 4px;
    		box-shadow: -1px -1px 7px -3px #d3d3d3,
		                1px 1px 7px -3px #d3d3d3;
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
		
		#denied_post{
			backdrop-filter: blur(2px);
		    background-color: #F2CB61;
		    opacity: 0.1;
		}
		.denied_area{
			position: absolute;
		    margin-top: -160px;
		    margin-left: 200px;
		    font-family: "NotoSansKR-Bold",serif;
		}
		.denied_svg{
			width: 100px;
		    height: 100px;
		    float: left;
		    position: absolute;
		    margin-top: -16px;
		    margin-left: -178px;
		}
		.denied_text1{
			float: left;
		    position: absolute;
		    margin-left: -53px;
		    margin-top: 17px;
		    width: 400px;
		    font-size: 25px;
		}
		.denied_text2{
			position: absolute;
		    width: 400px;
		    margin-top: 55px;
		    margin-left: -20px;
		    color: #353535;
		}
	</style>

<script type="text/javascript">
	$(document).ready(function () {
		/* 오른쪽액션바 하얗게 (선택) */
		$('#_3kQHk_right').css({"border-width": "2px","border-style": "solid","border-color": "rgb(238, 238, 238) rgb(238, 238, 238) white","border-image": "initial","box-sizing": "border-box",display: "inline-block","font-family": "Noto Sans KR","-webkit-tap-highlight-color": "rgba(0, 0, 0, 0)",cursor: "pointer","text-decoration": "none",margin: "0px 10px -2px",padding: "0px",outline: "none","font-size": "inherit","font-weight": "inherit",position: "relative","z-index": "1",height: "36px","line-height": "36px","min-width": "88px",color: "rgba(0, 0, 0, 0.87)",transition: "all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms","border-radius": "18px 18px 0px 0px","user-select": "none",overflow: "hidden","background-color": "white","text-align": "center",width: "50%" });
		/* 왼쪽액션바 어둡게 */
		$('#_3kQHk_left').css({"border-top": "2px solid rgb(238, 238, 238)","border-right": "2px solid rgb(238, 238, 238)","border-bottom": "none","border-left": "2px solid rgb(238, 238, 238)","border-image": "initial","box-sizing": "border-box",display: "inline-block","font-family": "Noto Sans KR","-webkit-tap-highlight-color": "rgba(0, 0, 0, 0)",cursor: "pointer","text-decoration": "none",margin: "0px 10px -2px",padding: "0px",outline: "none","font-size": "inherit","font-weight": "inherit",position: "relative","z-index": "1",height: "36px","line-height": "36px","min-width": "88px",color: "rgba(0, 0, 0, 0.87)",transition: "all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms","border-radius": "18px 18px 0px 0px","user-select": "none",overflow: "hidden","background-color": "pink","text-align": "center",width: "50%"});
		/* 선택글자:진하게 비선택:연하게 */
		$('._3kQHk_left_span').css({color: "#9E9E9E", "font-weight":"none"});
		$('._3kQHk_right_span').css({color: "#353535", "font-weight":"600"});
		
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
						<%if(m_type.equals("C")){ %>
						<button id="_3kQHk_left " class="_3kQHk" onclick="location='allowListC.ak'" type="button" style="border-width: 2px; border-style: solid; border-color: rgb(238, 238, 238) rgb(238, 238, 238) white; border-image: initial; box-sizing: border-box; display: inline-block; font-family: &quot;Noto Sans KR&quot;, sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); cursor: pointer; text-decoration: none; margin: 0px 10px -2px; padding: 0px; outline: none; font-size: inherit; position: relative; z-index: 1; height: 36px; line-height: 36px; min-width: 88px; transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; border-radius: 18px 18px 0px 0px; user-select: none; overflow: hidden; background-color: #EEEEEE; text-align: center; width: 50%;">
						<%}else{ %>
						<button id="_3kQHk_left " class="_3kQHk" onclick="location='allowListE.ak'" type="button" style="border-width: 2px; border-style: solid; border-color: rgb(238, 238, 238) rgb(238, 238, 238) white; border-image: initial; box-sizing: border-box; display: inline-block; font-family: &quot;Noto Sans KR&quot;, sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); cursor: pointer; text-decoration: none; margin: 0px 10px -2px; padding: 0px; outline: none; font-size: inherit; position: relative; z-index: 1; height: 36px; line-height: 36px; min-width: 88px; transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; border-radius: 18px 18px 0px 0px; user-select: none; overflow: hidden; background-color: #EEEEEE; text-align: center; width: 50%;">
						<%} %>
							<div>
								<span style="height: 100%; width: 100%; position: absolute; top: 0px; left: 0px; overflow: hidden; pointer-events: none;"></span>
								<span style="position: relative; padding-left: 16px; padding-right: 16px; vertical-align: top; letter-spacing: 0px; text-transform: uppercase; font-weight: 400; font-size: 17px;">
									<span class="_3kQHk_left_span">매칭 완료 게시물</span>
								</span>
							</div>
						</button>
						<button id="_3kQHk_right" class="_3kQHk" tabindex="0" type="button" style="border-top: 2px solid rgb(238, 238, 238); border-right: 2px solid rgb(238, 238, 238); border-bottom: none; border-left: 2px solid rgb(238, 238, 238); border-image: initial; box-sizing: border-box; display: inline-block; font-family: &quot;Noto Sans KR&quot;, sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); cursor: pointer; text-decoration: none; margin: 0px 10px -2px; padding: 0px; outline: none; font-size: inherit; position: relative; z-index: 1; height: 36px; line-height: 36px; min-width: 88px; transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; border-radius: 18px 18px 0px 0px; user-select: none; overflow: hidden; background-color: white; text-align: center; width: 50%;">
							<div>
								<span style="height: 100%; width: 100%; position: absolute; top: 0px; left: 0px; overflow: hidden; pointer-events: none;"></span>
								<span style="position: relative; padding-left: 16px; padding-right: 16px; vertical-align: top; letter-spacing: 0px; text-transform: uppercase; font-weight: 400; font-size: 17px; color: rgb(158, 158, 158);">
									<%if(m_type.equals("C")){ %>
									<span class="_3kQHk_right_span">신청 받은 게시물</span>
									<%}else{ %>
									<span class="_3kQHk_right_span">신청 한 게시물</span>
									<%} %>
								</span>
							</div>
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
												if(boardList.get(i).getA_apply() == null){
													boardList.get(i).setA_apply("비어있음");
												}
										%>
										<li id="list_id" data-no=<%=i+1 %>>
											<%if(m_type.equals("C")){ %>
												<div class="post" id="post_id" onclick="postlink('<%=boardList.get(i).getM_id()%>',<%=boardList.get(i).getB_num()%>)">
											<%}else{ %>
												<%if(boardList.get(i).getA_apply().equals("N")){ %>
												<div class="post" id="denied_post" onclick="postlinkE(<%=boardList.get(i).getB_num()%>,'<%=m_id%>')">
												<%}else {%>
												<div class="post" id="post_id" onclick="postlinkE(<%=boardList.get(i).getB_num()%>,'<%=m_id%>')">
												<%} %>
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
													<span class="photo_span"><%=applyEmpCntList.get(i).getApplyEmp_chk() %>명 지원</span>
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
											</div>
												<!-- 거절된 게시물 -->
												<%if(boardList.get(i).getA_apply().equals("N")){ %>
												<div class="denied_area">
													<svg class="denied_svg" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve"> <path style="fill:#498A68;" d="M350.708,370.576c-5.729,0-11.077-3.606-13.024-9.332l-7.157-21.043 c-2.446-7.194,1.403-15.008,8.597-17.454c7.191-2.445,15.009,1.402,17.454,8.597l7.156,21.041 c2.447,7.194-1.402,15.008-8.596,17.455C353.671,370.339,352.176,370.576,350.708,370.576z"/> <path style="fill:#5CB38E;" d="M264.436,376.011c-60.834,20.522-130.843,44.138-193.133,28.706 c-10.659-2.641-10.149-17.875,0.63-19.978c42.415-8.273,73.021-30.105,86.816-53.398L264.436,376.011z"/><g> <path style="fill:#498A68;" d="M216.364,458.418c-0.545,0-1.093-0.021-1.646-0.064c-11.655-0.896-20.377-11.071-19.48-22.726 c0.813-10.577-0.058-45.854-1.576-53.666c-3.483-10.487,1.725-22.022,12.107-26.253c10.828-4.41,23.177,0.79,27.588,11.614 c5.707,14.007,4.348,68.163,4.087,71.551C236.591,449.977,227.316,458.418,216.364,458.418z M194.145,383.273 c0.003,0.008,0.007,0.016,0.01,0.024C194.152,383.289,194.148,383.281,194.145,383.273z"/> <path style="fill:#498A68;" d="M293.126,458.418c-0.545,0-1.093-0.021-1.646-0.064c-11.655-0.896-20.377-11.071-19.48-22.726 c0.813-10.577-0.059-45.854-1.577-53.666c-3.483-10.487,1.725-22.023,12.107-26.253c10.826-4.412,23.177,0.789,27.588,11.614 c5.707,14.007,4.349,68.163,4.088,71.551C313.353,449.977,304.078,458.418,293.126,458.418z M270.907,383.273 c0.003,0.008,0.007,0.016,0.01,0.024C270.914,383.289,270.91,383.281,270.907,383.273z"/> </g> <path style="opacity:0.1;enable-background:new ;" d="M314.534,419.26c-0.017-17.991-0.793-43.047-4.415-51.936 c-4.41-10.825-16.762-16.026-27.588-11.614c-10.382,4.231-15.591,15.766-12.107,26.253c1.217,6.264,2.018,30.179,1.869,44.867 C288.633,425.756,302.634,423.258,314.534,419.26z"/> <path style="opacity:0.1;enable-background:new ;" d="M205.769,355.709c-10.382,4.231-15.591,15.765-12.107,26.253 c1.061,5.46,1.805,24.328,1.88,38.811c12.008,3.473,26.006,5.555,42.19,6.326c0.196-17.59-0.187-49.496-4.375-59.776 C228.947,356.499,216.598,351.299,205.769,355.709z"/> <path style="opacity:0.1;enable-background:new ;" d="M158.749,331.34c-5.064,8.551-12.402,16.902-21.75,24.46 c2.388,14.466,7.335,28.286,17.499,40.178c2.722,3.185,5.733,6.111,9.035,8.795c34.533-6.384,68.981-17.995,100.903-28.763 L158.749,331.34z"/> <path style="fill:#5CB38E;" d="M349.261,321.113c0,49.413-6.712,85.168-96.634,85.168s-96.634-35.755-96.634-85.168 s43.264-89.47,96.634-89.47C305.996,231.643,349.261,271.7,349.261,321.113z"/> <path style="fill:#9BDFC1;" d="M349.261,321.113c0-0.394-0.011-0.785-0.016-1.178c-20.127-5.165-60.051-6.668-87.832,22.857 c-20.245,21.515-23.175,44.733-21.003,63.249c3.892,0.158,7.961,0.239,12.217,0.239 C342.549,406.281,349.261,370.526,349.261,321.113z"/> <path style="opacity:0.05;enable-background:new ;" d="M234.281,233.26c-44.595,7.936-78.289,44.248-78.289,87.853 c0,45.754,5.766,79.793,78.006,84.584C193.889,364.985,201.647,280.925,234.281,233.26z"/> <path style="fill:#5CB38E;" d="M341.327,102.788L341.327,102.788c-16.501-24.954-44.422-39.964-74.339-39.964h-36.775 c-52.283,0-94.667,42.384-94.667,94.667v43.524c0,46.923,38.039,84.962,84.962,84.962H415.45c35.151,0,63.647-28.496,63.647-63.647 v-29.621c0-35.152-28.496-63.647-63.647-63.647h-25.254C370.531,129.061,352.175,119.193,341.327,102.788z"/><g style="opacity:0.1;"> <circle cx="186.97" cy="221.699" r="6.515"/> <circle cx="233.29" cy="231.639" r="6.515"/> <circle cx="206.78" cy="253.869" r="6.515"/> </g> <path style="opacity:0.05;enable-background:new ;" d="M209.183,65.173c-42.16,9.564-73.636,47.264-73.636,92.318v43.524 c0,46.923,38.039,84.963,84.962,84.963h51.555C196.982,242.292,184.255,122.206,209.183,65.173z"/> <path style="fill:#498A68;" d="M243.334,371.165c-7.598,0-13.758-6.16-13.758-13.758v-22.226c0-7.598,6.16-13.758,13.758-13.758 s13.758,6.16,13.758,13.758v22.226C257.092,365.005,250.932,371.165,243.334,371.165z"/><g> <path style="fill:#A3E3FF;" d="M73.183,194.8c-3.111,15.099-16.48,26.452-32.5,26.452c-18.326,0-33.183-14.856-33.183-33.183 c0-142.853,210.208-178.962,217.302-74.072c-2.179-0.927-4.576-1.442-7.093-1.442c-2.359,0-4.605,0.464-6.673,1.284 C163.616,65.173,91.879,88.378,73.183,194.8z"/> <path style="fill:#A3E3FF;" d="M279.194,113.997c2.179-0.927,4.576-1.442,7.093-1.442c2.359,0,4.605,0.464,6.672,1.284 c35.233-36.159,83.885-32.627,114.236,15.222h8.255c35.151,0,63.647,28.496,63.647,63.647v24.554 c10.361-5.614,17.397-16.582,17.397-29.194C496.496,45.216,286.288,9.107,279.194,113.997z"/> </g> <path style="fill:#495059;" d="M402.967,248.978c6.562,0,14.577,2.223,21.333,4.631c7.842,2.795,16.117-3.382,15.553-11.688 c-1.632-24.025-17.886-40.638-36.886-40.638s-35.254,16.613-36.886,40.638c-0.564,8.306,7.711,14.482,15.553,11.688 C388.39,251.201,396.405,248.978,402.967,248.978z"/><g> <path style="fill:#A3E3FF;" d="M453.698,329.368c0,14.029,11.372,25.401,25.401,25.401s25.401-11.372,25.401-25.401 c0-29.509-21.892-48.242-32.735-46.038C458.807,285.963,453.698,307.659,453.698,329.368z"/> <path style="fill:#A3E3FF;" d="M64.565,289.359c2.186,13.857-7.275,26.863-21.132,29.049s-26.863-7.275-29.049-21.132 c-4.599-29.148,14.107-51.064,25.161-50.577C52.755,247.281,61.182,267.915,64.565,289.359z"/> </g> <path d="M486.599,222.331v-0.922c10.824-7.562,17.397-19.947,17.397-33.339c0-52.088-25.908-85.319-47.641-104.024 c-26.626-22.916-61.63-36.725-96.039-37.887c-24.092-0.808-44.56,4.681-59.757,15.192c-10.763-3.997-22.034-6.026-33.571-6.026 h-36.774c-10.02,0-19.889,1.452-29.394,4.304c-14.897-9.383-34.4-14.236-57.141-13.471C109.271,47.32,74.266,61.129,47.64,84.045 C25.908,102.75,0,135.981,0,188.069c0,22.433,18.25,40.683,40.683,40.683c19.215,0,35.973-13.642,39.845-32.438 c0.015-0.072,0.028-0.144,0.041-0.216c12.963-73.79,48.178-92.189,62.717-96.674c1.162-0.359,2.33-0.669,3.501-0.945 c-12.179,17.122-18.741,37.532-18.741,59.012v43.524c0,20.911,7.178,41.403,20.211,57.703c4.169,5.214,8.893,9.932,14.042,14.103 c-9.055,14.65-13.807,31.202-13.807,48.292c0,3.955,0.037,7.935,0.167,11.904c-15.482,21.289-44.476,37.789-78.161,44.36 c-8.409,1.64-14.203,8.487-14.418,17.038c-0.213,8.474,5.18,15.539,13.42,17.581c13.967,3.46,28.735,5.201,44.679,5.201 c21.98,0,46.205-3.319,73.627-9.986c0.333,11.479,0.333,22.905-0.046,27.842c-0.587,7.634,1.833,15.04,6.816,20.854 s11.932,9.339,19.566,9.926c0.738,0.057,1.485,0.086,2.222,0.086c14.872,0,27.417-11.627,28.558-26.468 c0.13-1.69,0.449-12.608,0.32-25.755c2.411,0.055,4.868,0.086,7.384,0.086c4.175,0,8.203-0.076,12.09-0.227 c0.171,9.305,0.107,17.586-0.194,21.499c-0.587,7.634,1.833,15.04,6.817,20.854c4.983,5.814,11.932,9.339,19.566,9.926 c0.738,0.057,1.485,0.086,2.222,0.086c9.629,0,18.559-4.805,23.89-12.852c2.287-3.454,1.342-8.107-2.111-10.395 c-3.452-2.287-8.107-1.342-10.395,2.111c-2.742,4.138-7.449,6.478-12.456,6.094c-3.639-0.28-6.952-1.96-9.327-4.732 c-2.375-2.771-3.53-6.302-3.25-9.942c0.387-5.036,0.396-14.606,0.22-23.686c10.208-1.047,19.248-2.753,27.207-5.143 c0.073,3.382,0.116,6.915,0.127,10.585c0.013,4.134,3.368,7.477,7.499,7.477h0.023c4.142-0.013,7.49-3.381,7.477-7.523 c-0.018-5.813-0.112-11.312-0.28-16.413c7.525-3.853,13.689-8.638,18.614-14.4c2.522-2.951,4.652-6.098,6.462-9.397 c1.274,0.238,2.57,0.373,3.88,0.373c2.326,0,4.629-0.382,6.845-1.136c5.376-1.828,9.718-5.64,12.227-10.734 s2.884-10.86,1.055-16.236l-7.156-21.04c-1.318-3.878-3.767-7.261-6.944-9.782c-0.186-8.777-1.618-17.368-4.27-25.67h62.987 C454.683,293.478,486.599,261.561,486.599,222.331z M355.194,350.569l1.439,4.231c0.538,1.582,0.428,3.279-0.311,4.779 c-0.732,1.488-1.998,2.601-3.563,3.144C353.83,358.777,354.615,354.71,355.194,350.569z M359.81,61.15 c30.598,1.033,63.032,13.842,86.76,34.264c19.355,16.657,42.426,46.254,42.426,92.655c0,3.805-0.851,7.477-2.397,10.807v-6.167 c0-39.231-31.917-71.147-71.147-71.147h-4.221c-15.647-22.933-36.539-36.791-59.205-39.147c-21.507-2.233-43.096,5.928-61.23,23.041 c-0.915-0.161-1.841-0.274-2.779-0.336C295.395,71.387,328.986,60.105,359.81,61.15z M392.404,121.561h-2.206 c-17.198,0-33.129-8.564-42.615-22.91c-0.348-0.526-0.722-1.04-1.082-1.561c1.325,0.036,2.65,0.107,3.973,0.244 C365.815,98.929,380.356,107.41,392.404,121.561z M138.864,85.09c-36.275,11.192-62.897,50.661-73.048,108.296 c-2.482,11.807-13.036,20.366-25.133,20.366C26.521,213.752,15,202.231,15,188.069c0-46.401,23.071-75.998,42.426-92.655 c23.728-20.422,56.162-33.231,86.76-34.264c1.283-0.043,2.57-0.065,3.86-0.065c29.723,0,60.879,11.7,67.946,44.034 c-0.944,0.062-1.877,0.175-2.798,0.338C191.174,84.67,164.308,77.239,138.864,85.09z M73.107,397.436 c-1.384-0.343-2.068-1.232-2.033-2.644c0.021-0.843,0.348-2.313,2.294-2.692c30.974-6.042,58.568-19.952,77.171-38.398 c2.073,12.32,6.196,23.861,14.347,33.398c2.506,2.932,5.336,5.608,8.499,8.041C133.588,403.739,101.372,404.439,73.107,397.436z M229.967,438.299c-0.571,7.431-7.126,13.164-14.674,12.578c-3.639-0.28-6.952-1.96-9.327-4.732c-2.376-2.771-3.53-6.302-3.25-9.942 c0.433-5.63,0.409-16.902,0.132-27.583c8.078,2.067,17.181,3.5,27.385,4.321C230.384,426.232,230.052,437.148,229.967,438.299z M236.027,278.478c-4.142,0-7.5,3.358-7.5,7.5s3.358,7.5,7.5,7.5h100.524c3.451,8.843,5.21,18.115,5.21,27.635 c0,25.477-2.141,43.772-12.798,56.241c-4.29,5.02-9.967,9.118-17.176,12.337c-0.456,0.146-0.892,0.332-1.305,0.558 c-9.953,4.194-22.701,6.796-38.592,7.905c-0.033,0.001-0.065-0.003-0.098-0.002c-0.226,0.007-0.448,0.028-0.669,0.055 c-5.755,0.382-11.909,0.575-18.497,0.575c-4.981,0-9.719-0.108-14.222-0.326c-0.221-0.023-0.445-0.034-0.671-0.037 c-16.052-0.819-29.082-3.052-39.418-6.786c-0.373-0.185-0.765-0.334-1.169-0.456c-0.399-0.191-0.817-0.343-1.246-0.461 c-8.374-3.358-14.85-7.791-19.61-13.361c-7.901-9.245-12.798-21.877-12.798-56.241c0-14.043,3.863-27.669,11.209-39.799 c7.576,4.334,15.752,7.609,24.275,9.642c0.585,0.14,1.17,0.207,1.747,0.207c3.392,0,6.467-2.317,7.289-5.761 c0.961-4.029-1.526-8.075-5.555-9.036c-9.128-2.178-17.528-5.909-24.973-10.857c-0.183-0.163-0.375-0.32-0.577-0.467 c-0.344-0.251-0.705-0.46-1.073-0.645c-20.134-14.145-32.788-37.458-32.788-63.381v-43.524c0-22.475,8.43-43.571,23.787-59.81 c11.189,1.688,22.235,6.891,32.323,15.352c-2.496,2.947-2.358,7.363,0.423,10.142c2.929,2.928,7.678,2.927,10.606-0.003 c0.984-0.984,2.128-1.748,3.371-2.275c0.121-0.043,0.241-0.088,0.36-0.138c1.195-0.456,2.473-0.703,3.79-0.703 c1.422,0,2.801,0.277,4.076,0.806c0.023,0.01,0.046,0.023,0.069,0.033c1.246,0.527,2.391,1.292,3.376,2.278 c1.464,1.466,3.384,2.198,5.305,2.198c1.918,0,3.837-0.732,5.302-2.195c2.93-2.928,2.931-7.677,0.003-10.606 c-1.221-1.221-2.544-2.304-3.949-3.241c-1.781-14.884-7.602-27.625-16.714-37.699c4.941-0.859,9.964-1.304,15.037-1.304h36.774 c7.015,0,13.911,0.896,20.618,2.652c-8.425,9.852-13.799,22.13-15.501,36.352c-1.405,0.937-2.728,2.019-3.948,3.241 c-2.928,2.93-2.927,7.679,0.003,10.606c2.929,2.928,7.678,2.927,10.606-0.003c2.009-2.01,4.68-3.117,7.521-3.117 c1.319,0,2.598,0.248,3.794,0.705c0.117,0.049,0.236,0.093,0.355,0.136c1.244,0.527,2.389,1.292,3.373,2.276 c1.464,1.466,3.384,2.198,5.305,2.198c1.918,0,3.837-0.732,5.302-2.195c2.779-2.777,2.918-7.191,0.426-10.138 c7.738-6.494,16.051-11.088,24.58-13.632c2.034,2.413,3.933,4.925,5.65,7.521c12.271,18.557,32.879,29.636,55.127,29.636h16.99 c0.005,0,0.01,0.001,0.016,0.001c0.005,0,0.009-0.001,0.014-0.001h8.233c30.96,0,56.147,25.188,56.147,56.147v24.525 c0,0.019,0,0.038,0,0.058v5.04c0,30.959-25.188,56.147-56.147,56.147H236.027V278.478z M491.367,283.121 c-7.117-5.816-14.807-8.419-21.096-7.141c-21.727,4.415-24.073,38.807-24.073,53.388c0,18.142,14.759,32.901,32.901,32.901 S512,347.51,512,329.369C512,310.969,504.287,293.68,491.367,283.121z M479.099,347.269c-9.871,0-17.901-8.03-17.901-17.901 c0-23.791,6.067-37.471,12.06-38.689c0.082-0.016,0.191-0.026,0.328-0.026c1.138,0,4.143,0.694,8.29,4.082 c7.311,5.976,15.124,18.213,15.124,34.634C497,339.239,488.97,347.269,479.099,347.269z M71.974,288.191 C71.974,288.19,71.974,288.19,71.974,288.191c-6.821-43.236-24.72-48.66-32.099-48.984c-6.414-0.279-13.602,3.486-19.725,10.34 C9.033,261.99,4.108,280.269,6.976,298.445c1.369,8.681,6.037,16.309,13.144,21.478c5.685,4.136,12.387,6.303,19.284,6.303 c1.725,0,3.461-0.136,5.198-0.41C62.521,322.99,74.801,306.111,71.974,288.191z M42.264,311c-4.721,0.745-9.453-0.394-13.32-3.207 s-6.407-6.963-7.152-11.686c-2.559-16.221,3.252-29.525,9.543-36.567c3.926-4.395,6.996-5.35,7.836-5.35 c0.015,0,0.03,0.001,0.043,0.001c6.11,0.269,14.235,12.836,17.942,36.336l0,0C58.695,300.278,52.014,309.462,42.264,311z M223.654,327.153c-1.047,2.566-1.578,5.267-1.578,8.027v22.226c0,11.722,9.536,21.258,21.258,21.258s21.258-9.536,21.258-21.258 V335.18c0-2.761-0.531-5.462-1.578-8.027c-1.565-3.836-5.943-5.675-9.778-4.111c-3.835,1.565-5.676,5.943-4.111,9.778 c0.31,0.758,0.466,1.552,0.466,2.36v22.226c0,3.451-2.807,6.258-6.258,6.258s-6.258-2.807-6.258-6.258V335.18 c0-0.808,0.157-1.603,0.466-2.36c1.565-3.835-0.276-8.213-4.111-9.778C229.599,321.477,225.219,323.317,223.654,327.153z M423.615,168.822c3.598,0,6.515-2.917,6.515-6.515c0-3.598-2.917-6.515-6.515-6.515c-3.598,0-6.515,2.917-6.515,6.515 C417.1,165.905,420.017,168.822,423.615,168.822z M439.803,257.872c5.152-3.901,7.968-10.054,7.533-16.459 c-1.844-27.153-20.919-47.63-44.369-47.63s-42.525,20.477-44.369,47.63c-0.435,6.405,2.381,12.558,7.533,16.459 c3.404,2.578,7.476,3.915,11.597,3.914c2.157,0,4.328-0.366,6.423-1.113c7.702-2.745,14.208-4.195,18.816-4.195 s11.114,1.451,18.816,4.195C427.879,262.846,434.616,261.799,439.803,257.872z M379.116,246.544c-1.9,0.679-3.381-0.215-3.929-0.63 c-0.661-0.501-1.75-1.618-1.623-3.484c1.324-19.496,13.69-33.646,29.403-33.646s28.079,14.15,29.403,33.646 c0.127,1.866-0.962,2.984-1.623,3.484c-0.548,0.415-2.029,1.308-3.929,0.63c-9.433-3.361-17.457-5.065-23.851-5.065 C396.573,241.478,388.548,243.182,379.116,246.544z M382.095,168.822c3.598,0,6.515-2.917,6.515-6.515 c0-3.598-2.917-6.515-6.515-6.515c-3.598,0-6.515,2.917-6.515,6.515C375.58,165.905,378.497,168.822,382.095,168.822z"/><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g></svg></svg>
													<div class="denied_text1">악어님이 다른 인연을 원해요.</div>
													<div class="denied_text2">아쉽지만, 다음기회에 만나요!</div>	
												</div>
												<%}else{ %>
												<%} %>
												<!-- 거절된 게시물 -->
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
//게시물 클릭시 해당 게시물에 신청한 근로자 리스트(프로필정보) 보러가기
function postlink(m_id, b_num){
	location.href="applyDetail.ak?m_id="+m_id+"&b_num="+b_num;
}
//게시물 클릭시 해당 게시물 (디테일) 페이지로 이동 (근로자가 클릭 시)
function postlinkE(b_num, m_id){
	location.href="BoardDetail.ak?b_num="+b_num+"&e_id="+m_id;
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
	
	// 무한 스크롤(내가 쓴 게시글) 고객
	function appendDocument() {
		
		startNo = $("#boardList #list_id").last().data("no") || 0;
		
		$.ajax({
			url : '/myakkbird/applyList_infinite.ak?m_id='+m_id+'&startNo='+startNo+'',
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
					
					var b_num = item.b_num;
					apply_conunt(b_num);
					
					var m_type = '<%=m_type%>';
					
					output += '<li id="list_id" data-no='+totalCount+'>'
					output += '    <div class="post" id="post_id" onclick="postlink(`'+item.m_id+'`,'+item.b_num+')">'					
					output += '	       <div class="post_main">'
					output += '            <span class="post_no">no.'+item.b_num+'</span>'
					output += '            <img class="post_photo" src="/myakkbird/myakkbirdUpload/'+photo+'"><br>'
					output += '            <span class="photo_span" id="count'+item.b_num+'"></span>'
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
		    },
		});
		event.preventDefault();
	}
	
	var startNo2;
	
	// 무한 스크롤(내가 지원한 게시글) 근로자
	function appendDocumentE() {
		
		startNo2 = $("#boardList #list_id").last().data("no") || 0;
		
		$.ajax({
			url : '/myakkbird/applyList_infiniteE.ak?m_id='+m_id+'&startNo='+startNo2+'',
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
					
					var b_num = item.b_num;
					apply_conunt(b_num);
					
					output += '<li id="list_id" data-no='+totalCount+'>'
					
					if(item.a_apply == null){
						item.a_apply = "M";
					}
					
					if(item.a_apply == "N"){
					output += '    <div class="post" id="denied_post" onclick="postlinkE('+item.b_num+',`'+m_id+'`)">'
					}else{
					output += '    <div class="post" id="post_id" onclick="postlinkE('+item.b_num+',`'+m_id+'`)">'
					}
					output += '	       <div class="post_main">'
					output += '            <span class="post_no">no.'+item.b_num+'</span>'
					output += '            <img class="post_photo" src="/myakkbird/myakkbirdUpload/'+photo+'"><br>'
					output += '            <span class="photo_span" id="count'+item.b_num+'"></span>'
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
					if(item.a_apply == "N"){
					output += '	   <div class="denied_area">'
					output += '	   		<svg class="denied_svg" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve"> <path style="fill:#498A68;" d="M350.708,370.576c-5.729,0-11.077-3.606-13.024-9.332l-7.157-21.043 c-2.446-7.194,1.403-15.008,8.597-17.454c7.191-2.445,15.009,1.402,17.454,8.597l7.156,21.041 c2.447,7.194-1.402,15.008-8.596,17.455C353.671,370.339,352.176,370.576,350.708,370.576z"/> <path style="fill:#5CB38E;" d="M264.436,376.011c-60.834,20.522-130.843,44.138-193.133,28.706 c-10.659-2.641-10.149-17.875,0.63-19.978c42.415-8.273,73.021-30.105,86.816-53.398L264.436,376.011z"/><g> <path style="fill:#498A68;" d="M216.364,458.418c-0.545,0-1.093-0.021-1.646-0.064c-11.655-0.896-20.377-11.071-19.48-22.726 c0.813-10.577-0.058-45.854-1.576-53.666c-3.483-10.487,1.725-22.022,12.107-26.253c10.828-4.41,23.177,0.79,27.588,11.614 c5.707,14.007,4.348,68.163,4.087,71.551C236.591,449.977,227.316,458.418,216.364,458.418z M194.145,383.273 c0.003,0.008,0.007,0.016,0.01,0.024C194.152,383.289,194.148,383.281,194.145,383.273z"/> <path style="fill:#498A68;" d="M293.126,458.418c-0.545,0-1.093-0.021-1.646-0.064c-11.655-0.896-20.377-11.071-19.48-22.726 c0.813-10.577-0.059-45.854-1.577-53.666c-3.483-10.487,1.725-22.023,12.107-26.253c10.826-4.412,23.177,0.789,27.588,11.614 c5.707,14.007,4.349,68.163,4.088,71.551C313.353,449.977,304.078,458.418,293.126,458.418z M270.907,383.273 c0.003,0.008,0.007,0.016,0.01,0.024C270.914,383.289,270.91,383.281,270.907,383.273z"/> </g> <path style="opacity:0.1;enable-background:new ;" d="M314.534,419.26c-0.017-17.991-0.793-43.047-4.415-51.936 c-4.41-10.825-16.762-16.026-27.588-11.614c-10.382,4.231-15.591,15.766-12.107,26.253c1.217,6.264,2.018,30.179,1.869,44.867 C288.633,425.756,302.634,423.258,314.534,419.26z"/> <path style="opacity:0.1;enable-background:new ;" d="M205.769,355.709c-10.382,4.231-15.591,15.765-12.107,26.253 c1.061,5.46,1.805,24.328,1.88,38.811c12.008,3.473,26.006,5.555,42.19,6.326c0.196-17.59-0.187-49.496-4.375-59.776 C228.947,356.499,216.598,351.299,205.769,355.709z"/> <path style="opacity:0.1;enable-background:new ;" d="M158.749,331.34c-5.064,8.551-12.402,16.902-21.75,24.46 c2.388,14.466,7.335,28.286,17.499,40.178c2.722,3.185,5.733,6.111,9.035,8.795c34.533-6.384,68.981-17.995,100.903-28.763 L158.749,331.34z"/> <path style="fill:#5CB38E;" d="M349.261,321.113c0,49.413-6.712,85.168-96.634,85.168s-96.634-35.755-96.634-85.168 s43.264-89.47,96.634-89.47C305.996,231.643,349.261,271.7,349.261,321.113z"/> <path style="fill:#9BDFC1;" d="M349.261,321.113c0-0.394-0.011-0.785-0.016-1.178c-20.127-5.165-60.051-6.668-87.832,22.857 c-20.245,21.515-23.175,44.733-21.003,63.249c3.892,0.158,7.961,0.239,12.217,0.239 C342.549,406.281,349.261,370.526,349.261,321.113z"/> <path style="opacity:0.05;enable-background:new ;" d="M234.281,233.26c-44.595,7.936-78.289,44.248-78.289,87.853 c0,45.754,5.766,79.793,78.006,84.584C193.889,364.985,201.647,280.925,234.281,233.26z"/> <path style="fill:#5CB38E;" d="M341.327,102.788L341.327,102.788c-16.501-24.954-44.422-39.964-74.339-39.964h-36.775 c-52.283,0-94.667,42.384-94.667,94.667v43.524c0,46.923,38.039,84.962,84.962,84.962H415.45c35.151,0,63.647-28.496,63.647-63.647 v-29.621c0-35.152-28.496-63.647-63.647-63.647h-25.254C370.531,129.061,352.175,119.193,341.327,102.788z"/><g style="opacity:0.1;"> <circle cx="186.97" cy="221.699" r="6.515"/> <circle cx="233.29" cy="231.639" r="6.515"/> <circle cx="206.78" cy="253.869" r="6.515"/> </g> <path style="opacity:0.05;enable-background:new ;" d="M209.183,65.173c-42.16,9.564-73.636,47.264-73.636,92.318v43.524 c0,46.923,38.039,84.963,84.962,84.963h51.555C196.982,242.292,184.255,122.206,209.183,65.173z"/> <path style="fill:#498A68;" d="M243.334,371.165c-7.598,0-13.758-6.16-13.758-13.758v-22.226c0-7.598,6.16-13.758,13.758-13.758 s13.758,6.16,13.758,13.758v22.226C257.092,365.005,250.932,371.165,243.334,371.165z"/><g> <path style="fill:#A3E3FF;" d="M73.183,194.8c-3.111,15.099-16.48,26.452-32.5,26.452c-18.326,0-33.183-14.856-33.183-33.183 c0-142.853,210.208-178.962,217.302-74.072c-2.179-0.927-4.576-1.442-7.093-1.442c-2.359,0-4.605,0.464-6.673,1.284 C163.616,65.173,91.879,88.378,73.183,194.8z"/> <path style="fill:#A3E3FF;" d="M279.194,113.997c2.179-0.927,4.576-1.442,7.093-1.442c2.359,0,4.605,0.464,6.672,1.284 c35.233-36.159,83.885-32.627,114.236,15.222h8.255c35.151,0,63.647,28.496,63.647,63.647v24.554 c10.361-5.614,17.397-16.582,17.397-29.194C496.496,45.216,286.288,9.107,279.194,113.997z"/> </g> <path style="fill:#495059;" d="M402.967,248.978c6.562,0,14.577,2.223,21.333,4.631c7.842,2.795,16.117-3.382,15.553-11.688 c-1.632-24.025-17.886-40.638-36.886-40.638s-35.254,16.613-36.886,40.638c-0.564,8.306,7.711,14.482,15.553,11.688 C388.39,251.201,396.405,248.978,402.967,248.978z"/><g> <path style="fill:#A3E3FF;" d="M453.698,329.368c0,14.029,11.372,25.401,25.401,25.401s25.401-11.372,25.401-25.401 c0-29.509-21.892-48.242-32.735-46.038C458.807,285.963,453.698,307.659,453.698,329.368z"/> <path style="fill:#A3E3FF;" d="M64.565,289.359c2.186,13.857-7.275,26.863-21.132,29.049s-26.863-7.275-29.049-21.132 c-4.599-29.148,14.107-51.064,25.161-50.577C52.755,247.281,61.182,267.915,64.565,289.359z"/> </g> <path d="M486.599,222.331v-0.922c10.824-7.562,17.397-19.947,17.397-33.339c0-52.088-25.908-85.319-47.641-104.024 c-26.626-22.916-61.63-36.725-96.039-37.887c-24.092-0.808-44.56,4.681-59.757,15.192c-10.763-3.997-22.034-6.026-33.571-6.026 h-36.774c-10.02,0-19.889,1.452-29.394,4.304c-14.897-9.383-34.4-14.236-57.141-13.471C109.271,47.32,74.266,61.129,47.64,84.045 C25.908,102.75,0,135.981,0,188.069c0,22.433,18.25,40.683,40.683,40.683c19.215,0,35.973-13.642,39.845-32.438 c0.015-0.072,0.028-0.144,0.041-0.216c12.963-73.79,48.178-92.189,62.717-96.674c1.162-0.359,2.33-0.669,3.501-0.945 c-12.179,17.122-18.741,37.532-18.741,59.012v43.524c0,20.911,7.178,41.403,20.211,57.703c4.169,5.214,8.893,9.932,14.042,14.103 c-9.055,14.65-13.807,31.202-13.807,48.292c0,3.955,0.037,7.935,0.167,11.904c-15.482,21.289-44.476,37.789-78.161,44.36 c-8.409,1.64-14.203,8.487-14.418,17.038c-0.213,8.474,5.18,15.539,13.42,17.581c13.967,3.46,28.735,5.201,44.679,5.201 c21.98,0,46.205-3.319,73.627-9.986c0.333,11.479,0.333,22.905-0.046,27.842c-0.587,7.634,1.833,15.04,6.816,20.854 s11.932,9.339,19.566,9.926c0.738,0.057,1.485,0.086,2.222,0.086c14.872,0,27.417-11.627,28.558-26.468 c0.13-1.69,0.449-12.608,0.32-25.755c2.411,0.055,4.868,0.086,7.384,0.086c4.175,0,8.203-0.076,12.09-0.227 c0.171,9.305,0.107,17.586-0.194,21.499c-0.587,7.634,1.833,15.04,6.817,20.854c4.983,5.814,11.932,9.339,19.566,9.926 c0.738,0.057,1.485,0.086,2.222,0.086c9.629,0,18.559-4.805,23.89-12.852c2.287-3.454,1.342-8.107-2.111-10.395 c-3.452-2.287-8.107-1.342-10.395,2.111c-2.742,4.138-7.449,6.478-12.456,6.094c-3.639-0.28-6.952-1.96-9.327-4.732 c-2.375-2.771-3.53-6.302-3.25-9.942c0.387-5.036,0.396-14.606,0.22-23.686c10.208-1.047,19.248-2.753,27.207-5.143 c0.073,3.382,0.116,6.915,0.127,10.585c0.013,4.134,3.368,7.477,7.499,7.477h0.023c4.142-0.013,7.49-3.381,7.477-7.523 c-0.018-5.813-0.112-11.312-0.28-16.413c7.525-3.853,13.689-8.638,18.614-14.4c2.522-2.951,4.652-6.098,6.462-9.397 c1.274,0.238,2.57,0.373,3.88,0.373c2.326,0,4.629-0.382,6.845-1.136c5.376-1.828,9.718-5.64,12.227-10.734 s2.884-10.86,1.055-16.236l-7.156-21.04c-1.318-3.878-3.767-7.261-6.944-9.782c-0.186-8.777-1.618-17.368-4.27-25.67h62.987 C454.683,293.478,486.599,261.561,486.599,222.331z M355.194,350.569l1.439,4.231c0.538,1.582,0.428,3.279-0.311,4.779 c-0.732,1.488-1.998,2.601-3.563,3.144C353.83,358.777,354.615,354.71,355.194,350.569z M359.81,61.15 c30.598,1.033,63.032,13.842,86.76,34.264c19.355,16.657,42.426,46.254,42.426,92.655c0,3.805-0.851,7.477-2.397,10.807v-6.167 c0-39.231-31.917-71.147-71.147-71.147h-4.221c-15.647-22.933-36.539-36.791-59.205-39.147c-21.507-2.233-43.096,5.928-61.23,23.041 c-0.915-0.161-1.841-0.274-2.779-0.336C295.395,71.387,328.986,60.105,359.81,61.15z M392.404,121.561h-2.206 c-17.198,0-33.129-8.564-42.615-22.91c-0.348-0.526-0.722-1.04-1.082-1.561c1.325,0.036,2.65,0.107,3.973,0.244 C365.815,98.929,380.356,107.41,392.404,121.561z M138.864,85.09c-36.275,11.192-62.897,50.661-73.048,108.296 c-2.482,11.807-13.036,20.366-25.133,20.366C26.521,213.752,15,202.231,15,188.069c0-46.401,23.071-75.998,42.426-92.655 c23.728-20.422,56.162-33.231,86.76-34.264c1.283-0.043,2.57-0.065,3.86-0.065c29.723,0,60.879,11.7,67.946,44.034 c-0.944,0.062-1.877,0.175-2.798,0.338C191.174,84.67,164.308,77.239,138.864,85.09z M73.107,397.436 c-1.384-0.343-2.068-1.232-2.033-2.644c0.021-0.843,0.348-2.313,2.294-2.692c30.974-6.042,58.568-19.952,77.171-38.398 c2.073,12.32,6.196,23.861,14.347,33.398c2.506,2.932,5.336,5.608,8.499,8.041C133.588,403.739,101.372,404.439,73.107,397.436z M229.967,438.299c-0.571,7.431-7.126,13.164-14.674,12.578c-3.639-0.28-6.952-1.96-9.327-4.732c-2.376-2.771-3.53-6.302-3.25-9.942 c0.433-5.63,0.409-16.902,0.132-27.583c8.078,2.067,17.181,3.5,27.385,4.321C230.384,426.232,230.052,437.148,229.967,438.299z M236.027,278.478c-4.142,0-7.5,3.358-7.5,7.5s3.358,7.5,7.5,7.5h100.524c3.451,8.843,5.21,18.115,5.21,27.635 c0,25.477-2.141,43.772-12.798,56.241c-4.29,5.02-9.967,9.118-17.176,12.337c-0.456,0.146-0.892,0.332-1.305,0.558 c-9.953,4.194-22.701,6.796-38.592,7.905c-0.033,0.001-0.065-0.003-0.098-0.002c-0.226,0.007-0.448,0.028-0.669,0.055 c-5.755,0.382-11.909,0.575-18.497,0.575c-4.981,0-9.719-0.108-14.222-0.326c-0.221-0.023-0.445-0.034-0.671-0.037 c-16.052-0.819-29.082-3.052-39.418-6.786c-0.373-0.185-0.765-0.334-1.169-0.456c-0.399-0.191-0.817-0.343-1.246-0.461 c-8.374-3.358-14.85-7.791-19.61-13.361c-7.901-9.245-12.798-21.877-12.798-56.241c0-14.043,3.863-27.669,11.209-39.799 c7.576,4.334,15.752,7.609,24.275,9.642c0.585,0.14,1.17,0.207,1.747,0.207c3.392,0,6.467-2.317,7.289-5.761 c0.961-4.029-1.526-8.075-5.555-9.036c-9.128-2.178-17.528-5.909-24.973-10.857c-0.183-0.163-0.375-0.32-0.577-0.467 c-0.344-0.251-0.705-0.46-1.073-0.645c-20.134-14.145-32.788-37.458-32.788-63.381v-43.524c0-22.475,8.43-43.571,23.787-59.81 c11.189,1.688,22.235,6.891,32.323,15.352c-2.496,2.947-2.358,7.363,0.423,10.142c2.929,2.928,7.678,2.927,10.606-0.003 c0.984-0.984,2.128-1.748,3.371-2.275c0.121-0.043,0.241-0.088,0.36-0.138c1.195-0.456,2.473-0.703,3.79-0.703 c1.422,0,2.801,0.277,4.076,0.806c0.023,0.01,0.046,0.023,0.069,0.033c1.246,0.527,2.391,1.292,3.376,2.278 c1.464,1.466,3.384,2.198,5.305,2.198c1.918,0,3.837-0.732,5.302-2.195c2.93-2.928,2.931-7.677,0.003-10.606 c-1.221-1.221-2.544-2.304-3.949-3.241c-1.781-14.884-7.602-27.625-16.714-37.699c4.941-0.859,9.964-1.304,15.037-1.304h36.774 c7.015,0,13.911,0.896,20.618,2.652c-8.425,9.852-13.799,22.13-15.501,36.352c-1.405,0.937-2.728,2.019-3.948,3.241 c-2.928,2.93-2.927,7.679,0.003,10.606c2.929,2.928,7.678,2.927,10.606-0.003c2.009-2.01,4.68-3.117,7.521-3.117 c1.319,0,2.598,0.248,3.794,0.705c0.117,0.049,0.236,0.093,0.355,0.136c1.244,0.527,2.389,1.292,3.373,2.276 c1.464,1.466,3.384,2.198,5.305,2.198c1.918,0,3.837-0.732,5.302-2.195c2.779-2.777,2.918-7.191,0.426-10.138 c7.738-6.494,16.051-11.088,24.58-13.632c2.034,2.413,3.933,4.925,5.65,7.521c12.271,18.557,32.879,29.636,55.127,29.636h16.99 c0.005,0,0.01,0.001,0.016,0.001c0.005,0,0.009-0.001,0.014-0.001h8.233c30.96,0,56.147,25.188,56.147,56.147v24.525 c0,0.019,0,0.038,0,0.058v5.04c0,30.959-25.188,56.147-56.147,56.147H236.027V278.478z M491.367,283.121 c-7.117-5.816-14.807-8.419-21.096-7.141c-21.727,4.415-24.073,38.807-24.073,53.388c0,18.142,14.759,32.901,32.901,32.901 S512,347.51,512,329.369C512,310.969,504.287,293.68,491.367,283.121z M479.099,347.269c-9.871,0-17.901-8.03-17.901-17.901 c0-23.791,6.067-37.471,12.06-38.689c0.082-0.016,0.191-0.026,0.328-0.026c1.138,0,4.143,0.694,8.29,4.082 c7.311,5.976,15.124,18.213,15.124,34.634C497,339.239,488.97,347.269,479.099,347.269z M71.974,288.191 C71.974,288.19,71.974,288.19,71.974,288.191c-6.821-43.236-24.72-48.66-32.099-48.984c-6.414-0.279-13.602,3.486-19.725,10.34 C9.033,261.99,4.108,280.269,6.976,298.445c1.369,8.681,6.037,16.309,13.144,21.478c5.685,4.136,12.387,6.303,19.284,6.303 c1.725,0,3.461-0.136,5.198-0.41C62.521,322.99,74.801,306.111,71.974,288.191z M42.264,311c-4.721,0.745-9.453-0.394-13.32-3.207 s-6.407-6.963-7.152-11.686c-2.559-16.221,3.252-29.525,9.543-36.567c3.926-4.395,6.996-5.35,7.836-5.35 c0.015,0,0.03,0.001,0.043,0.001c6.11,0.269,14.235,12.836,17.942,36.336l0,0C58.695,300.278,52.014,309.462,42.264,311z M223.654,327.153c-1.047,2.566-1.578,5.267-1.578,8.027v22.226c0,11.722,9.536,21.258,21.258,21.258s21.258-9.536,21.258-21.258 V335.18c0-2.761-0.531-5.462-1.578-8.027c-1.565-3.836-5.943-5.675-9.778-4.111c-3.835,1.565-5.676,5.943-4.111,9.778 c0.31,0.758,0.466,1.552,0.466,2.36v22.226c0,3.451-2.807,6.258-6.258,6.258s-6.258-2.807-6.258-6.258V335.18 c0-0.808,0.157-1.603,0.466-2.36c1.565-3.835-0.276-8.213-4.111-9.778C229.599,321.477,225.219,323.317,223.654,327.153z M423.615,168.822c3.598,0,6.515-2.917,6.515-6.515c0-3.598-2.917-6.515-6.515-6.515c-3.598,0-6.515,2.917-6.515,6.515 C417.1,165.905,420.017,168.822,423.615,168.822z M439.803,257.872c5.152-3.901,7.968-10.054,7.533-16.459 c-1.844-27.153-20.919-47.63-44.369-47.63s-42.525,20.477-44.369,47.63c-0.435,6.405,2.381,12.558,7.533,16.459 c3.404,2.578,7.476,3.915,11.597,3.914c2.157,0,4.328-0.366,6.423-1.113c7.702-2.745,14.208-4.195,18.816-4.195 s11.114,1.451,18.816,4.195C427.879,262.846,434.616,261.799,439.803,257.872z M379.116,246.544c-1.9,0.679-3.381-0.215-3.929-0.63 c-0.661-0.501-1.75-1.618-1.623-3.484c1.324-19.496,13.69-33.646,29.403-33.646s28.079,14.15,29.403,33.646 c0.127,1.866-0.962,2.984-1.623,3.484c-0.548,0.415-2.029,1.308-3.929,0.63c-9.433-3.361-17.457-5.065-23.851-5.065 C396.573,241.478,388.548,243.182,379.116,246.544z M382.095,168.822c3.598,0,6.515-2.917,6.515-6.515 c0-3.598-2.917-6.515-6.515-6.515c-3.598,0-6.515,2.917-6.515,6.515C375.58,165.905,378.497,168.822,382.095,168.822z"/><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g></svg></svg>'	
					output += '	   		<div class="denied_text1">악어님이 다른 인연을 원해요.</div>'
					output += '	   		<div class="denied_text2">아쉽지만, 다음기회에 만나요!</div>'
					output += '    </div>'
					}else{
						
					}
					output += '</li>'
					
					$('#boardList').append(output);
					
					var count = '';
					count += '<b id="count_b">총 게시글 '+totalCount+'개</b>'
					
					$('#board_count').html(count);
				}) 
			},
			error:function(request,status,error){		
		    },
		});
		event.preventDefault();
	}
	
});
//게시글 지원 인원 카운트
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