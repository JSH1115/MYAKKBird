<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<style>
		/* 전체 적용 */	
		html, body {
		 	width: 100%;
		 	height: auto;
		 	margin: 0 auto;
		 	padding: 0;
		}
		
		ul li {
			list-style: none;
		}
		/* 전체 적용 */	
		
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
		
		/* 게시글 style */
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
			border: 1px solid #37B04B;
    		border-radius: 15px;
    		font-size: 10px;
    		padding: 5px;
    		box-shadow: -1px -1px 7px -3px #d3d3d3,
		                1px 1px 7px -3px #d3d3d3;
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
		
		.favorites {
			float: right;
			margin-right: 33px;
			cursor: pointer;
		}
		/* 게시글 style */
		
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
	</style>
</head>
<body>
	<div id="boardList_div_id" class="boardList_div">
		<div class="boardList_div_text">
			<span>찜한 게시글</span>
		</div>
		<!-- 게시물 개수 -->
		<div id="board_count" class="board_count_div">
			<b id="count_b"></b>
		</div>
		<!-- 게시물 개수 -->
		<!-- 게시물 출력 -->
		<ul id="data_insert">
		</ul>
		<!-- 게시물 출력 -->
		<div class="div_plus"></div>
		<div id="end">
		</div>
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
var m_id = '<%=m_id %>'; //현재 아이디
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

//게시글 출력
function list_index(index, item, startNo) {
	var output = '';
	var hot_b = '';
	var photo = '';
	
	// 조회 수 체크
	if(item.b_readcount > 800) {
		hot_b = '<b class="hot_b">인기 게시글</b>';
	} else if(item.b_readcount > 400) {
		hot_b = '<b class="hot_b">관심 게시글</b>';
	}
	
	// 성별 체크
	if(item.m_gender === 'M') {
		gender = '남';
	} else if(item.m_gender === 'W') {
		gender = '여';
	}
	
	// 프로필 사진 체크
	if(item.m_photo === null) {
		photo = 'crocodile_profile.png';
	} else {
		photo = item.m_photo;
	}
	
	// 게시글 작성 날짜 포맷
	var board_day = moment(item.b_date).format("M월 D일 작성");
	
	output += '<li data-no='+(index+startNo+1)+'>'
	output += '<div class="post" id="post_id'+item.b_num+'">'
	output += '    <div class="post_top">'
	output += '        <strong>'+item.b_subject+'</strong>'
  	output += '            <span class="post_top_span">'+category_d+''	
  	output += '                <img class="post_top_img" src="./resources/image/'+img_d+'">'
  	output += '            </span>'
  	output += '	       <hr class="post_hr">'
  	output += '    </div>'
  	output += '    <div class="post_img">'
  	output += '        <img class="profile" src="/myakkbird/myakkbirdUpload/'+photo+'">'
  	output += '        <div class="readcount_zone">'+hot_b+'</div>'
  	output += '    </div>'
  	output += '    <div class="post_right">'
  	output += '        <b class="post_r_sub">'+item.m_name.substr(0, 1)+'O'+item.m_name.substr(2, 3)+'</b>'
  	output += '        <span class="post_r_span">'+gender+'</span>'
  	output += '        <a class="favorites" id="f_id'+item.b_num+'" onclick="check_member('+item.b_num+')"></a><br>'
  	output += '        <span class="post_r_span">'+item.b_address_road+'</span><br>'
  	output += '        <span class="post_r_span">'+item.m_age+'세 | </span>'
  	output += '        <span class="post_r_span">희망시급 '+item.b_money+'원</span><br>'
  	output += '        <span class="post_r_span">'+moment(item.b_start).format("M월 D일")+' 청소시작</span>'
  	output += '        <span class="post_r_id"><b>ID </b>'+item.m_id+'</span><br>'
  	output += '        <a class="post_r_detail" href="./BoardDetail.ak?b_num='+item.b_num+'&e_id='+se_id+'">자세히보기</a>'
  	output += '        <span class="time_zone">'+board_day+'</span><br>'
  	output += '    </div>'
  	output += '</div>'
  	output += '</li>'
  	
  	$('#data_insert').append(output);
  	
};

$(document).ready(function(){
	
	onload();
	
	function onload() {
		
		$.ajax({
			url: '/myakkbird/like_boardList.ak?m_id='+m_id+'',
			type : 'GET',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				
			},
			error:function(){
		        alert("ajax통신 실패!!!");
		    }
		});
	}
});

</script>
</html>