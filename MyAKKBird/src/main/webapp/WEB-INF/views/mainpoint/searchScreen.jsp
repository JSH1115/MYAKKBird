<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bit.myakkbird.mainpoint.*" %>
<%
	String addr = (String)request.getAttribute("b_address_road");
	System.out.println(addr);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마이 악어새</title>
  	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  	<!-- 시간 설정 API 시작 -->
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
  	<!-- 시간 설정 API 끝 -->
  	<!-- alert창 API 시작 -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<!-- alert창 API 끝 -->
	<style>
		 /* 전체 적용 시작 */
		html, body {
		 	width: 100%;
		 	height: auto;
		 	margin: 0 auto;
		 	padding: 0;
		 	font-family: "NotoSansKR";
		}
		 
		body {
		 	background-color: #E6E6E6;
		}
		 
		a { 
		 	color: #37B04B;
		 	text-decoration: none;
		} 
		 
		a:hover {
			color: #268F38;
			text-decoration: none;
		}
		
		ul li {
			list-style: none;
		}
		
		/* 전체 적용 끝 */
		 
		/* 지도 스타일 꾸미기 시작 */
		.map_wrap {
			position:relative;
			overflow:hidden;
			width:550px;
			height:800px;
			box-shadow: -3px -3px 7px -3px #d3d3d3,
		                3px 3px 7px -3px #d3d3d3;
		}
		
		#map {
			width:550px;
			height:800px;
			position:relative;
			overflow:hidden;
			border-radius:10px;
		}
		
		.bAddr {
			padding:25px;
			text-overflow:ellipsis;
			overflow:hidden;
			z-index:999;
			white-space: nowrap;
		}
		
		.bAddr span {
			font-size: 13px;
			color: #696969;
		}
		
		.bAddr a {
			font-size: 13px;
		}
		/* 지도 스타일 꾸미기 끝 */
		
		/* 자동완성 시작 */
		.ui-autocomplete {
			width: 100px;
		    max-height: 200px;
		    overflow-y: 100px;
		    overflow-x: hidden;
		    font-size: 14px;
	    }
	    
	   	* html .ui-autocomplete {
	   		height: 200px;
	   	}
	   	/* 자동완성 끝 */
	   	
		.screen_Top {
			width: 1100px;
			height: 320px;
			margin: 25px auto;
			border:1px solid #d3d3d3; 
			background-color: white;
			border-radius: 10px;
			box-shadow: -3px -3px 7px -3px #d3d3d3,
		                3px 3px 7px -3px #d3d3d3;
		}
		
		.screen_Top_text {
			margin-top: 20px;
		}
		
		.screen_t_sub {
			font-size: 23px; 
			margin-left: 77px; 
			color: #212121;
		}
		
		.screen_t_sub strong {
			color: #37B04B;
		}
		
		.screen_t_sub2 {
			 font-size: 18px; 
			 margin-left: 77px; 
			 color: #424242;
		}
		
		.screen_Top_form {
			margin-top: 10px;
		}
		
		.search_form_text {
			float: left; 
			width: 35%; 
			height: 150px;
		}
		
		.search_f_sub {
			 padding-left: 110px; 
			 padding-top: 15px; 
			 margin-left: 78px; 
			 color: #212121;
		}
		
		.search_form_check {
			float: right; 
			width: 65%; 
			height: 150px;
		}
		
		.search_fc_sub {
			padding-left: 323px; 
			color: #212121;
		}
		
		.search_input {
			width: 300px;
			height: 40px;
		}
		
		.search_form_check input {
			margin-top: 15px;
		}
		
		.search_form_check ul li {
			list-style-type: none;
			display: inline;
			padding-left: 20px;
		}
		
		.search_form_text input {
			margin-top: 5px;
			background-image: url("./resources/image/search_icon.png");
			background-size: 30px 30px;
			background-repeat: no-repeat;
			border: 1px solid #808080;
			border-radius: 3px;
			padding-right: 42px;
			background-position: center right;
  			background-position: center right 10px, center right 38px;
		}
		
		.search_form_text input:focus {
			outline-color: #268F38;
		}
		
		input[type="checkbox"] { display:none; }
		
		input[type="checkbox"] + label .b_category1 { 
			cursor: pointer; 
			width: 50px;
			height: 50px;
			margin-left: 48px;
			background: url("./resources/image/vacuum.png");
			background-repeat: no-repeat;
			background-size: 50px 50px;
		}

		input[type="checkbox"]:checked + label .b_category1 { 
			width: 50px;
			height: 50px;
			background: url("./resources/image/vacuum_check1.png");
			background-repeat: no-repeat;
			background-size: 50px 50px;
		}
		
		input[type="checkbox"] + label .b_category2 { 
			cursor: pointer; 
			width: 50px;
			height: 50px;
			margin-left: 40px;
			background: url("./resources/image/cleaning-tools.png");
			background-repeat: no-repeat;
			background-size: 50px 50px;
		}

		input[type="checkbox"]:checked + label .b_category2 { 
			width: 50px;
			height: 50px;
			background: url("./resources/image/cleaning-tools_check.png");
			background-repeat: no-repeat;
			background-size: 50px 50px;
		}
		
		input[type="checkbox"] + label .b_category3 { 
			cursor: pointer; 
			width: 50px;
			height: 50px;
			margin-left: 37px;
			background: url("./resources/image/kitchen.png");
			background-repeat: no-repeat;
			background-size: 50px 50px;
		}

		input[type="checkbox"]:checked + label .b_category3 { 
			width: 50px;
			height: 50px;
			background: url("./resources/image/kitchen_check.png");
			background-repeat: no-repeat;
			background-size: 50px 50px;
		}
		
		input[type="checkbox"] + label .b_category4 { 
			cursor: pointer; 
			width: 50px;
			height: 50px;
			margin-left: 40px;
			background: url("./resources/image/maid.png");
			background-repeat: no-repeat;
			background-size: 50px 50px;
		}

		input[type="checkbox"]:checked + label .b_category4 { 
			width: 50px;
			height: 50px;
			background: url("./resources/image/maid_check.png");
			background-repeat: no-repeat;
			background-size: 50px 50px;
		}
		
		input[type="checkbox"] + label .b_category5 { 
			cursor: pointer; 
			width: 50px;
			height: 50px;
			margin-left: 36px;
			background: url("./resources/image/apartment.png");
			background-repeat: no-repeat;
			background-size: 50px 50px;
		}

		input[type="checkbox"]:checked + label .b_category5 { 
			width: 50px;
			height: 50px;
			background: url("./resources/image/apartment_check.png");
			background-repeat: no-repeat;
			background-size: 50px 50px;
		}
		
		input[type="checkbox"] + label .b_category6 { 
			cursor: pointer; 
			width: 50px;
			height: 50px;
			margin-left: 37px;
			background: url("./resources/image/coronavirus.png");
			background-repeat: no-repeat;
			background-size: 50px 50px;
		}

		input[type="checkbox"]:checked + label .b_category6 { 
			width: 50px;
			height: 50px;
			background: url("./resources/image/coronavirus_check.png");
			background-repeat: no-repeat;
			background-size: 50px 50px;
		}
		
		.search_Top_btn {
			margin-top: -110px;
			width: 100%;
			height: 35px;
			clear: both;
		}
		
		.search_button {
			width: 70%;
			height: 35px;
			border-top: 1px solid #d3d3d3;
			border-left: 0;
			border-right: 0;
			border-bottom: 0;
			border-bottom-left-radius: 10px;
			margin-top: 18px;
			background-color: white;
			font-weight: bold;
			cursor: pointer; 
			color: #212121;
		}
		
		.reset_button {
			width: 30%;
			height: 35px;
			border-top: 1px solid #d3d3d3;
			border-left: 1px solid #d3d3d3;
			border-right: 0;
			border-bottom: 0;
			border-bottom-right-radius: 10px;
			margin-top: 18px;
			background-color: white;
			cursor: pointer; 
			color: #424242;
		}
		
		.search_button:focus, .reset_button:focus {
			outline:none;
		}
		
		.search_button:hover, .reset_button:hover {
			background-color: #f1f3f5;
			border: 1px solid #d3d3d3;
		}
		
		.screen_middle {
			width: 1100px;
			height: 30px;
			margin: -20px auto;
		}
		
		#list_count {
			margin-left: 1010px;
			font-size: 13px;
		}
		
		.screen_main {
			width: 1100px;
			height: auto;
			margin: 20px auto;
		}
		
		.screen_left {
			width: 550px;
			height: auto;
			float: left;
		}
		
		.screen_right {
			width: 550px;
			height: auto;
			float: right;
		}
		
		.chk_list {
			width: 100%;
			height: 80px;
			padding-left: 50px;
			margin-top: 20px;
			margin-left: -5px;
		}
		
		.chk_text {
			width: 100%;
			height: 50px;
			margin-top: -10px;
			margin-left: 25px;
		}
		
		.chk_text b {
			cursor: pointer; 
			border: 1px solid #37B04B;
			padding: 5px;
			border-radius: 15px;
			font-size: 14px;
			background-color: white;
		}
		
		.chk_text b:hover {
			background-color: #37B04B;
			color: white;
		}
		
		.input_div {
			width: 100%;
			margin-top: 10px;
			margin-left: 80px;
		}
		
		.input_div span {
			margin-left: 3px; 
			color: #424242;
		}
		
		.choice_div {
			width: 100%;
			height: 60px;
			margin-top: 20px;
			margin-left: 31px;
		}
		
		.choice_div ul li {
			display: inline-block;		
			padding-left: 1px;	
		}
		
		input[type="radio"] { display:none; }
		
		input[type="radio"] + label .c1 { 
			cursor: pointer; 
			width: 80px;
			height: 30px;
			background: url("./resources/image/radio_s.png");
			background-repeat: no-repeat;
			background-size: 80px 30px;
		}

		input[type="radio"]:checked + label .c1 { 
			cursor: pointer;
			width: 80px;
			height: 30px;
			background: url("./resources/image/radio_c_s.png");
			background-repeat: no-repeat;
			background-size: 80px 30px;
		}
		
		input[type="radio"] + label .c2 { 
			cursor: pointer; 
			width: 115px;
			height: 30px;
			background: url("./resources/image/radio_m.png");
			background-repeat: no-repeat;
			background-size: 115px 30px;
		}

		input[type="radio"]:checked + label .c2 { 
			cursor: pointer;
			width: 115px;
			height: 30px;
			background: url("./resources/image/radio_c_m.png");
			background-repeat: no-repeat;
			background-size: 115px 30px;
		}
		
		input[type="radio"] + label .c3 { 
			cursor: pointer; 
			width: 115px;
			height: 30px;
			background: url("./resources/image/radio_d.png");
			background-repeat: no-repeat;
			background-size: 115px 30px;
		}

		input[type="radio"]:checked + label .c3 { 
			cursor: pointer;
			width: 115px;
			height: 30px;
			background: url("./resources/image/radio_c_d.png");
			background-repeat: no-repeat;
			background-size: 115px 30px;
		}
		
		.post {
			width:520px; 
			height:200px; 
			border:1px solid #d3d3d3; 
			border-radius: 10px;
			margin-left:-10px;
			margin-bottom:15px;
			background-color: white;
			box-shadow: -3px -3px 7px -3px #d3d3d3,
		                3px 3px 7px -3px #d3d3d3;
		}
		
		.post_top {
			text-align: left; 
			width: 100%;  
			font-size: 17.5px; 
			margin-top: 10px;
		}
		
		.post_top strong {
			padding-left: 20px;
		}
		
		.post_top_span {
			float: right; 
			font-size: 15px;
			margin-top: 3px;
		}
		
		.post_top_img {
			width:25px; 
			height:25px;
			float: right; 
			margin-top: -3px;
			margin-right: 17px;
		}
		
		.post_hr {
			margin-top: 10px; 
			background-color: #d3d3d3;
		}
		
		.post_img {
			float:left; 
			width:15%; 
			height: 100px;
			margin-left: 35px; 
			margin-top: 10px;
		}
		
		.profile {
    		width:60px;
    		height:60px;
    		border: 1px solid #d3d3d3;
    		border-radius: 30px; 
		} 
		
		.readcount_zone {
			margin-top: 5px;
		}
		
		.hot_b {
			color: white;
			background-color: #37B04B;
    		border-radius: 15px;
    		font-size: 10px;
    		padding: 5px;
		}
		
		.post_right {
			float:right;
			width:75%; 
			margin-top: -3px; 
			margin-left: 10px;
		}
		
		.post_r_sub {
			font-size: 17px;
		}
		
		.post_r_span {
			font-size: 14px;
		}
		
		.post_r_id {
			font-size: 13px; 
			float: right; 
			margin-right:32px; 
			margin-top:2px;
		}
		
		.post_r_id b {
			color: black; 
			font-size: 13px;
		}
		
		.post_r_detail {
			z-index: 999; 
			position: absolute; 
			font-size: 14px;
		}
		
		.time_zone {
			float: right; 
			margin-right: 30px; 
			margin-top: -2px; 
			font-size: 13px;
		}
		
		.no_post {
			width:520px; 
			height:200px; 
			border:1px solid #d3d3d3;  
			border-radius: 10px;
			margin-left:-10px;
			margin-bottom:15px;
			text-align: center;
			background-color: white;
		}
		
		.Advertising {
			width:520px; 
			height:150px;
			margin-left:-10px;
			margin-bottom:15px;
			background-color: white;
			border-radius: 10px;
			background-image: url("./resources/image/advr_s.png");
			background-repeat: no-repeat;
			background-size: 520px 150px;
		}
		
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
  			box-shadow: -3px -3px 20px -3px #d3d3d3,
		                3px 3px 20px -3px #d3d3d3;
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
		
		.scroll-fixed {
    		position: fixed;
    		top: 0px;
		}
		
		.end_title {
			margin: 0 auto;
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
	</style>
</head>
<body>
	<div class="screen_Top" style="float: none;">
		<div class="screen_Top_text">
			<b class="screen_t_sub"><strong>악어</strong>를 찾고 싶은 지역,</b><br>
			<span class="screen_t_sub2">위치와 청소 종류를  찾아 검색하세요.</span><br>
		</div>
		<hr>
		<div class="screen_Top_form">
			<form name="search_form_name" id="search_form" method="post">
				<div class="search_form_text">
					<b class="search_f_sub">청소 지역</b><br>
					<div class="input_div">
						<span>* 지번 주소로 검색</span>
						<input type="text" class="search_input" name="b_address_road" id="autoText"
						       placeholder="  주소를 입력해주세요."/>
					</div>
					<div class="choice_div">
						<ul>
							<li>
								<input type="radio" class="choice" id="choice1" name="choice" value="ND">
								<label for="choice1"><div class="c1"></div></label>
							</li>
							<li>
								<input type="radio" class="choice" id="choice2" name="choice" value="MM">
								<label for="choice2"><div class="c2"></div></label>
							</li>
							<li>
								<input type="radio" class="choice" id="choice3" name="choice" value="MS">
								<label for="choice3"><div class="c3"></div></label>
							</li>
						</ul>
					</div>
				</div>
				<div class="search_form_check" >
				<b class="search_fc_sub">청소 종류</b><br>
					<div class="chk_list">
						<input type="checkbox" name="b_category" id="b_category_id1" onclick="oneCheckbox(this);" value="A">
						<label for="b_category_id1">
							<div class="b_category1">
							</div>
						</label>
						<input type="checkbox" name="b_category" id="b_category_id2" onclick="oneCheckbox(this);" value="B">
						<label for="b_category_id2">
							<div class="b_category2">
							</div>
						</label>
						<input type="checkbox" name="b_category" id="b_category_id3" onclick="oneCheckbox(this);" value="C">
						<label for="b_category_id3">
							<div class="b_category3">
							</div>
						</label>
						<input type="checkbox" name="b_category" id="b_category_id4" onclick="oneCheckbox(this);" value="D">
						<label for="b_category_id4">
							<div class="b_category4">
							</div>
						</label>
						<input type="checkbox" name="b_category" id="b_category_id5" onclick="oneCheckbox(this);" value="E">
						<label for="b_category_id5">
							<div class="b_category5">
							</div>
						</label>
						<input type="checkbox" name="b_category" id="b_category_id6" onclick="oneCheckbox(this);" value="F">
						<label for="b_category_id6">
							<div class="b_category6">
							</div>
						</label>
					</div>
					<div class="chk_text">
						<ul>
							<li>
								<label for="b_category_id1">
									<b>정기청소</b>
								</label>
							</li>
							<li>
								<label for="b_category_id2">
									<b>특수청소</b>
								</label>
							</li>
							<li>
								<label for="b_category_id3">
									<b>입주청소</b>
								</label>
							</li>
							<li>
								<label for="b_category_id4">
									<b>상주청소</b>
								</label>
							</li>
							<li>
								<label for="b_category_id5">
									<b>빌딩청소</b>
								</label>
							</li>
							<li>
								<label for="b_category_id6">
									<b>방역청소</b>
								</label>
							</li>
						</ul>
					</div>
				</div>
				<div class="search_Top_btn">
					<!-- 편집 금지 -->
					<input type="button" class="search_button" value="악어 검색" id="search_data"><input type="reset" class="reset_button" value="&orarr; 필터 초기화">
					<!-- 편집 금지 -->
				</div>
			</form>
		</div>
	</div>
	<div class="screen_middle">
	</div>
	<div class="screen_main">
		<div class="screen_left">
			<div class="map_wrap" id="map_div">
				<!-- 지도 생성 -->
			    <div id="map"></div> 
			    <!-- 지도 생성 -->
			</div>
		</div>
		<div class="screen_right" id="screen_data">
			<ul id="data_insert">
			
			</ul>
			<div id="end">
			</div>
		</div>
	</div>
	<div class="Top_div">
		<button class="top">Top</button>
	</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3cbd93568d5ed61c52a1851035124ae3&libraries=services"></script>
<script>

var isEmpty = function(val) {
	if(val === "" || val === null || val === undefined 
		||(val !== null && typeof val === "object" && !Object.keys(val).length)
		) {
		return true
	} else {
		return false
	}
};

function timer() {
	let timerInterval
	Swal.fire({
	  title: '악어를 검색중입니다! ',
	  html: '조금만 기달려주세요.',
	  timer: 500,
	  timerProgressBar: true,
	  onBeforeOpen: () => {
	    Swal.showLoading()
	    timerInterval = setInterval(() => {
	      const content = Swal.getContent()
	      if (content) {
	        const b = content.querySelector('b')
	        if (b) {
	          b.textContent = Swal.getTimerLeft()
	        }
	      }
	    }, 100)
	  },
	  onClose: () => {
	    clearInterval(timerInterval)
	  }
	}).then((result) => {
	  if (result.dismiss === Swal.DismissReason.timer) {
	    console.log('I was closed by the timer')
	  }
	})
}

function noDataOut() {
	$('#data_insert').empty();
	$('#list_count').empty();
	$('#end').empty();
	
	var output = '';
	output += '<li>'
	output += '<div class="no_post"><br><br><br>'
	output += '    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 30 30" fill="black" width="40px" height="40px"><path d="M0 0h24v24H0z" fill="none"/><path d="M3 13h2v-2H3v2zm0 4h2v-2H3v2zm0-8h2V7H3v2zm4 4h14v-2H7v2zm0 4h14v-2H7v2zM7 7v2h14V7H7z"/></svg>'
	output += '    <b style="font-size:20px; margin-top:20px;">검색 결과가 없습니다...</b><br>'
	output += '    <span style="font-size:15px;">다시 검색해주세요!</span>'
	output += '</div>'
	output += '</li>'
	$('#autoText').focus();
	$('#data_insert').append(output);
}

var img_d = '';
var category_d = '';

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

var mapContainer;
var map;
var mapTypeControl;
var zoomControl;

function newMap() {
	
	mapContainer = document.getElementById('map'), 
	mapOption = {
		center: new kakao.maps.LatLng(37.505287, 127.023993), 
		level: 7 
	};  
	
	map = new kakao.maps.Map(mapContainer, mapOption); 
	
	mapTypeControl = new kakao.maps.MapTypeControl();
	
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
	zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
}

function addmarker(index, listData) {
	var geocoder = new kakao.maps.services.Geocoder();
	
	geocoder.addressSearch(listData[index].addr, function(result, status) {
		
      		if (status === kakao.maps.services.Status.OK) {

      			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
      			
      			var imageSrc = './resources/image/crocodile_profile_marker.png',   
      			imageSize = new kakao.maps.Size(35, 35);
      			  
      			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
      			
      			var marker = new kakao.maps.Marker({
				   	map: map,
				    position: coords,
				    image: markerImage 
				});
      			
      			var iwContent = '';
				    iwContent += '<div class="bAddr">'
				    iwContent += '  <b>'+listData[index].name.substr(0, 1)+'O'+listData[index].name.substr(2, 3)+'</b>'
				    iwContent += '  <span>'+listData[index].gender+'</span><br>'
				    iwContent += '	<span>'+result[0].address_name+'</span><br>'
				    iwContent += '	<span>'+listData[index].category+'</span><br>'
				    iwContent += '  <span>시급 '+listData[index].money+'원</span><br>'
				    iwContent += '	<a href="./searchDetail.ak?b_num='+listData[index].num+'">자세히보기</a>'
				    iwContent += '</div>'; 
			    
			    var infowindow = new kakao.maps.InfoWindow({
			       	content : iwContent,
			        removable : true
			    });
			            
			    kakao.maps.event.addListener(marker, 'click', function() {
			    	infowindow.open(map, marker);
			    });
		
      			map.setCenter(coords);
      			        
    		} 
	});
}

function list_index(index, item, startNo) {
	var output = '';
	var hot_b = '';
	var gender = '';
	
	if(item.b_readcount > 800) {
		hot_b = '<b class="hot_b">인기 게시글</b>';
	} else if(item.b_readcount > 400) {
		hot_b = '<b class="hot_b">관심 게시글</b>';
	}
	
	var board_day = moment(item.b_date).format("M월 D일 작성");
	
	output += '<li data-no='+(index+startNo+1)+' class="list_li">'
	output += '<div class="post" id="post_id">'
	output += '    <div class="post_top">'
	output += '        <strong>'+item.b_subject+'</strong>'
  	output += '            <span class="post_top_span">'+category_d+''	
  	output += '                <img class="post_top_img" src="./resources/image/'+img_d+'">'
  	output += '            </span>'
  	output += '	       <hr class="post_hr">'
  	output += '    </div>'
  	output += '    <div class="post_img">'
  	output += '        <img class="profile" src="./resources/image/crocodile_profile.png">'
  	output += '        <div class="readcount_zone">'+hot_b+'</div>'
  	output += '    </div>'
  	output += '    <div class="post_right">'
  	output += '        <b class="post_r_sub">'+item.m_name.substr(0, 1)+'O'+item.m_name.substr(2, 3)+'</b>'
  	output += '        <span class="post_r_span">'+item.m_gender+'</span><br>'
  	output += '        <span class="post_r_span">'+item.b_address_road+'</span><br>'
  	output += '        <span class="post_r_span">'+item.m_age+'세 | </span>'
  	output += '        <span class="post_r_span">희망시급 '+item.b_money+'원</span><br>'
  	output += '        <span class="post_r_span">'+moment(item.b_start).format("M월 D일")+' 청소시작</span>'
  	output += '        <span class="post_r_id"><b>ID </b>'+item.m_id+'</span><br>'
  	output += '        <a class="post_r_detail" href="./searchDetail.ak?b_num='+item.b_num+'">자세히보기</a>'
  	output += '        <span class="time_zone">'+board_day+'</span><br>'
  	output += '    </div>'
  	output += '</div>'
  	output += '</li>'
  	
  	$('#data_insert').append(output);
  	
}

function count_txt(index, startNo) {
	var listCount = '';
	var listNum = (index+startNo+1);
		
	listCount += '<b id="list_count">'
	listCount += '    총 악어 '+listNum+'마리'	  
	listCount += '</b>'
		
	$('.screen_middle').html(listCount);
}

function advr_list() {
	var advr = '';
	
	advr += '<li>'
	advr += '	<div class="Advertising">'
	advr += '	</div>'
	advr += '</li>'
	$('#data_insert').append(advr);
}

function end_title() {
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

function scroll_Map() {
	var scrollOffset = $('#map_div').offset();
	
	$(window).scroll(function() {
    	if ($(document).scrollTop() > scrollOffset.top) {
    		$('#map_div').addClass('scroll-fixed');
        }
        else {
        	$('#map_div').removeClass('scroll-fixed');
        }
	});
}


$(document).ready(function(){
	
	timer();
	
	var addr = '<%=addr %>';
	
	newMap();
	scroll_Map();
	
	onload();
	
	function onload() {
		
		$.ajax({
			url: '/myakkbird/board_search.ak?b_address_road='+addr+'',
			type: 'GET',
			dataType: "json",
			contentType: 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				
				if(isEmpty(data)) {
					noDataOut();
				}
				
				$.each(data, function(index, item){
					var startNo = 0;
					
					if(index == 2) {
						advr_list();
					} 
					
				    category_list(item);
				    list_index(index, item, startNo);
					count_txt(index, startNo);
					
				    var listData = new Array();
				   	var data = new Object();
				    
			       	data.num = item.b_num;
			       	data.name = item.m_name;
			       	data.gender = item.m_gender;
			       	data.addr = item.b_address_road;
			       	data.category = category_d;
			       	data.money = item.b_money;
			       	
			       	listData.push(data);  
			       	
			       	for(var i = 0; i < listData.length; i++) {
			       		addmarker(i, listData);
			       	}
				  	
				 })
				 
				 $(window).scroll(function () {
						var scrollHeight = $(window).scrollTop() + $(window).height(); 
						var documentHeight = $(document).height();
						
						if(scrollHeight >= documentHeight) {
							appendDocument();
						}
				 });
			},
			error:function(){
		        alert("ajax통신 실패!!!");
		    }
		});
		event.preventDefault();
	}
	
	function appendDocument() {
		
		var startNo = $("#data_insert li").last().data("no") || 0;
		$.ajax({
			url : '/myakkbird/board_Infinite.ak?b_address_road='+addr+'&startNo='+startNo+'',
			type : 'GET',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
	             
	             if(data != null) {
		             end_title();
	             }
	             
				 $.each(data, function(index, item){
					
				    category_list(item);
				    list_index(index, item, startNo);
				    count_txt(index, startNo);
				   	
				    var listData = new Array();
				   	var data = new Object();
				    
			       	data.num = item.b_num;
			       	data.name = item.m_name;
			       	data.gender = item.m_gender;
			       	data.addr = item.b_address_road;
			       	data.category = category_d;
			       	data.money = item.b_money;
			       	
			       	listData.push(data);  
			       	
			       	for(var i = 0; i < listData.length; i++) {
			       		addmarker(i, listData);
			       	}
				    
				 })
			},
			error:function(){
		        alert("ajax통신 실패!!!");
		    }
		});
		event.preventDefault();
	}
});
	
$(document).ready(function(){	
	
	$(document).on('click', '#search_data', function(event){
		var params = $('#search_form').serialize();
		
		timer();
		
       	$(window).unbind();
       	scroll_top();
       	
		$.ajax({
			url : '/myakkbird/search_data.ak',
			type : 'POST',
			data : params,
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8', 
			success: function(data) {
				$('#data_insert').empty();
				$('#map').empty();
				
				if(isEmpty(data)) {
					noDataOut();
				} 
				
				newMap();
				scroll_Map();
		       	
			    $.each(data, function(index, item){
			    	var startNo = 0;
			    	
			    	if(index == 2) {
						advr_list();
					} 
			    	
			    	category_list(item);
				    list_index(index, item, startNo);
				    count_txt(index, startNo);
				    
			       	var listData = new Array();
			       	
			       	var data = new Object();
	
			       	data.num = item.b_num;
			       	data.name = item.m_name;
			       	data.gender = item.m_gender;
			       	data.addr = item.b_address_road;
			       	data.category = category_d;
			       	data.money = item.b_money;
			       	
			       	listData.push(data);  
			       	
			       	for(var i = 0; i < listData.length; i++) {
			       		addmarker(i, listData);
			       	}
			       	
			    });
			    
		    	$(window).scroll(function () {
					var scrollHeight = $(window).scrollTop() + $(window).height(); 
					var documentHeight = $(document).height();
					
					if(scrollHeight >= documentHeight) {
						appendDocument2(params);
					}
					
			 	});
			    
			},
			error:function(){
		        alert("ajax통신 실패!!!");
		    }
		});
		event.preventDefault();
	});
	
	function appendDocument2(params) {
		
		var startNo = $("#data_insert li").last().data("no");
		$.ajax({
			url : '/myakkbird/search_data2.ak?startNo='+startNo+'',
			type : 'POST',
			data : params,
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8', 
			success: function(data) {
				
				if(data != null) {
		             end_title();
	            }
				
				$.each(data, function(index, item){
					
				    category_list(item);
				    list_index(index, item, startNo);
				    count_txt(index, startNo);
				    
				    var listData = new Array();
				   	var data = new Object();
				    
			       	data.num = item.b_num;
			       	data.name = item.m_name;
			       	data.gender = item.m_gender;
			       	data.addr = item.b_address_road;
			       	data.category = category_d;
			       	data.money = item.b_money;
			       	
			       	listData.push(data);  
			       	
			       	for(var i = 0; i < listData.length; i++) {
			       		addmarker(i, listData);
			       	}
				    
				 })
			},
		});
		event.preventDefault();
	}
	
});
	
	function selectData(){
		var availableTags = [];
		
		$.ajax({
	        url:'/myakkbird/autoText.ak',
	        type:'POST',
	        dataType : "json", // 서버에서 보내줄 데이터 타입
	        contentType : 'application/x-www-form-urlencoded; charset=utf-8',
	        success:function(data){
	        	$.each(data, function(index, item){
	        		availableTags.push(item.b_address_road);
	        		
	        		$("#autoText").autocomplete({
	        			source: availableTags,
	        			minLength: 1
	        		});
	       	  	});
	    	},
	    	error:function(){
	        alert("ajax통신 실패!!!");
	    	}
		}); 
	}
	
	function oneCheckbox(check){
		var obj = document.getElementsByName("b_category");
	    for(var i=0; i<obj.length; i++){
	    	if(obj[i] != check){
	        	obj[i].checked = false;
	        }
	    }
	}
	
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
	
	$(document).ready(function(){ 
		
		selectData();
		scroll_top();
	
	});
	
</script>
</body>
</html>