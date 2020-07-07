  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bit.myakkbird.mainpoint.*" %>
<%
	ArrayList<MasterVO> boardList = (ArrayList<MasterVO>)request.getAttribute("boardList");
	String m_id = (String)request.getAttribute("m_id");
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
	<title>마이 악어새</title>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<!-- 시간 설정 API 시작 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
	<!-- 시간 설정 API 끝 -->
	<!-- jquery 모달 API 시작 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
	<!-- jquery 모달 API 끝 -->
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
			width: 50px; 
			height: 50px;
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
			margin-top: 20px;
		}
		
		.post_subject {
			font-size: 14.5px;
		}
		
		.post_center span {
			margin-left: 20px;
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
			margin-left: 36px;
			margin-top: -24px;
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
		}
		
		.modal_myPhoto {
			width: 50px; 
			height: 50px;
			margin-top: 25px;
			margin-left: 25px;
			border-radius: 25px;
			border: 1px solid #d3d3d3;
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
		
		.div_plus {
			margin: 0 auto;
			width: 600px;
			height: 20px;
			background-color: white;
		}
		
	</style>
</head>
<body>
	<div id="boardList_div_id" class="boardList_div">
		<div class="boardList_div_text">
			<span>게시글 보기</span>
		</div>
		<div id="board_count" class="board_count_div">
			<b id="count_b">총 게시글 <%=boardCount %>개</b>
		</div>
		<ul id="boardList">
			<%
				for(int i = 0; i < boardList.size(); i++) {
			%>
			<li id="list_id" data-no=<%=i+1 %>>
				<div class="post" id="post_id">
					<div class="post_main">
						<span class="post_no">no.<%=boardList.get(i).getB_num() %></span>
						<img class="post_photo" src="./resources/image/crocodile_profile.png"><br>
						<span class="photo_span">0명 지원</span>
					</div>
					<div class="post_center">
						<span class="post_subject"><b><%=boardList.get(i).getB_subject() %></b></span><b class="b_cate"><%=boardList.get(i).getB_category() %><img class="post_img" src="./resources/image/<%=boardList.get(i).getImg() %>"></b><br>
						<span><b>신청여부</b> <%=boardList.get(i).getB_apply() %></span><br>
						<span><b>청소시작</b> <%=boardList.get(i).getB_start() %></span><br>
						<span><b>지번주소</b> <%=boardList.get(i).getB_address_road() %></span><span class="span_date"><b>조회</b> <%=boardList.get(i).getB_readcount() %> </span><br>
						<span><b>희망시급</b> <%=boardList.get(i).getB_money() %>원</span><span class="span_date"><b>작성</b> <%=boardList.get(i).getB_date() %> </span><br>
					</div>
					<div class="hr_div">
						<hr class="post_hr">
					</div>
					<div class="post_bottom">
						<ul id="check_ul">
							<li id="check_li">
								<a href="./searchDetail.ak?b_num=<%=boardList.get(i).getB_num() %>" id="a_btn">신청내역보기</a>
							</li>
							<li id="check_li">
								<a href="#modal_id" rel="modal:open" class="detail_btn" id="a_btn" value="<%=boardList.get(i).getB_num() %>">게시글 보기</a>
							</li>
							<li id="check_li">
								<a href="./boardUpdate.ak?b_num=<%=boardList.get(i).getB_num() %>" id="a_btn">게시글 수정</a>
							</li>
							<li id="check_li">
								<a id="a_btn_delete" class="delete_a<%=boardList.get(i).getB_num() %>" onclick="delete_icon(<%=boardList.get(i).getB_num() %>)">게시글 삭제</a>
								<div id="delete_id<%=boardList.get(i).getB_num() %>" class="delete_list">
								</div>
							</li>
						</ul>
					</div>
				</div>
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
</body>
<div id="modal_id" class="modal">
	<div id="modal_content" class="modal_content_div">
	</div>
</div>
<script type="text/javascript">
var boardCount = <%=boardCount %>;
var totalCount;
var m_id = '<%=m_id %>';
var b_num;
var d_b_num;

var img_d = '';
var category_d = '';
var apply = '';

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

function apply_list(item) {
	if(item.b_apply === "N") {
		apply = '매칭 대기중';
	} else if(item.b_apply === "Y") {
		apply = '매칭 완료';
	}
}

$(document).ready(function(){
	
	var startNo;
	
	if(boardCount === 0) {
		$('#board_count').empty();
	}
	
	$(document).on("click",'.detail_btn',function() {
		b_num = $(this).attr('value');
		$(this).modal({
	        fadeDuration: 250
	    });
		
		$('body').css("overflow-y", "scroll");
		$('.delete_list').empty();
		
		$.ajax({
			url : '/myakkbird/cb_detail.ak?m_id='+m_id+'&b_num='+b_num+'',
			type : 'GET',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8', 
			success: function(data) {
				var modal = '';
				var type = '';
				var gender = '';
				$('#modal_content').empty();
				
				if(data.m_type === "C") {
					type = '악어';
				} 
				
				if(data.m_gender === "M") {
					gender = '남자';
				} else if(data.m_gender === "W") {
					gender = '여자';
				}
				
				modal += '<div class="modal_top">'
				modal += '    <span class="modal_d_no">no.'+data.b_num+'</span><br>'
				modal += '    <b class="modal_d_sub">'+data.b_subject+'</b>'
				modal += '</div>'
				modal += '<div class="modal_profile">'
				modal += '    <div class="modal_p_left">'
				modal += '        <img class="modal_myPhoto" src="./resources/image/crocodile_profile.png">'
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
				modal += '</div>'
				modal += '<div modal_btn_div>'
				modal += '    <a class="modal_btn" href="./searchDetail.ak?b_num='+data.b_num+'">자세히 보러 가기</a>'
				modal += '</div>'
				
				$('#modal_content').append(modal);
			}
		});
	});

	let isEnd = false;	
	
	$(function(){
		
		$(window).scroll(function () {
			var scrollHeight = $(window).scrollTop() + $(window).height(); 
			var documentHeight = $(document).height();
			
			if(scrollHeight >= documentHeight) {
				appendDocument();
			}
		})
		
	})
	
	var appendDocument = function() {
		
		if(isEnd == true){
	           return;
	    }
		
		startNo = $("#boardList #list_id").last().data("no") || 0;
		
		$.ajax({
			url : '/myakkbird/cb_infinite.ak?m_id='+m_id+'&startNo='+startNo+'',
			type : 'GET',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				var length = data.length;
				 
	            if( length < 5 ){
	            	isEnd = true;
	            } 
	            
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
					
					category_list(item);
					apply_list(item);
					
					totalCount = (index+startNo+1);
					
					output += '<li id="list_id" data-no='+totalCount+'>'
					output += '    <div class="post" id="post_id">'
					output += '	       <div class="post_main">'
					output += '            <span class="post_no">no.'+item.b_num+'</span>'
					output += '            <img class="post_photo" src="./resources/image/crocodile_profile.png"><br>'
					output += '            <span class="photo_span">0명 지원</span>'
					output += '        </div>'
					output += '            <div class="post_center">'
					output += '                <span class="post_subject"><b>'+item.b_subject+'</b></span><b class="b_cate">'+category_d+'<img class="post_img" src="./resources/image/'+img_d+'"></b><br>'
					output += '                <span><b>신청여부</b> '+apply+'</span><br>'
					output += '                <span><b>청소시작</b> '+moment(item.b_start).format("YYYY-MM-DD")+'</span><br>'
					output += '                <span><b>지번주소</b> '+item.b_address_road+'</span><span class="span_date"><b>조회</b> '+item.b_readcount+'</span><br>'
					output += '                <span><b>희망시급</b> '+item.b_money+'원</span><span class="span_date"><b>작성</b> '+moment(item.b_date).format("YYYY-MM-DD")+'</span><br>'
					output += '        </div>'
					output += '        <div class="hr_div">'
					output += '            <hr class="post_hr">'
					output += '        </div>'
					output += '        <div class="post_bottom">'
					output += '            <ul id="check_ul">'
					output += '                <li id="check_li">'
					output += '                    <a href="./searchDetail.ak?b_num='+item.b_num+'" id="a_btn">신청내역보기</a>'
					output += '                </li>'
					output += '                <li id="check_li">'
					output += '                    <a href="#modal_id" rel="modal:open" class="detail_btn" id="a_btn" value="'+item.b_num+'">게시글 보기</a>'
					output += '                </li>'
					output += '                <li id="check_li">'
					output += '                    <a href="#" id="a_btn">게시글 수정</a>'
					output += '                </li>'
					output += '                <li id="check_li">'
					output += '                    <a id="a_btn_delete" class="delete_a'+item.b_num+'" onclick="delete_icon('+item.b_num+')">게시글 삭제</a>'
					output += '                    <div id="delete_id'+item.b_num+'" class="delete_list">'
					output += '     	           </div>'
					output += '                </li>'
					output += '            </ul>'
					output += '        </div>'
					output += '    </div>'
					output += '</li>'
					
					$('#boardList').append(output);
					
					var count = '';
					count += '<b id="count_b">총 게시글 '+totalCount+'개</b>'
					
					$('#board_count').html(count);
				})
			},
			error:function(){
		        alert("ajax통신 실패!!!");
		    }
		});
		event.preventDefault();
	}
	
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
	
});

function delete_icon(b_num) {
	
	var output = '';
	
	output += '<div class="dia'+b_num+'">'
	output += '    <div class="dialog">'
	output += '	       <div class="cancel_div">'
	output += '            <a class="cancel'+b_num+'">'
	output += '                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#212121;" width="15px" height="15px"><path d="M0 0h24v24H0z" fill="none"/><path d="M14.59 8L12 10.59 9.41 8 8 9.41 10.59 12 8 14.59 9.41 16 12 13.41 14.59 16 16 14.59 13.41 12 16 9.41 14.59 8zM12 2C6.47 2 2 6.47 2 12s4.47 10 10 10 10-4.47 10-10S17.53 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8z"/></svg>'
	output += '            </a>'
	output += '        </div>'
	output += '        <a class="deleteB'+b_num+'">'
	output += '            <span class="delete_txt">삭제</span>'
	output += '            <svg class="delete_icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#212121;" width="30px" height="30px"><path d="M0 0h24v24H0z" fill="none"/><path d="M6 19c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V7H6v12zM19 4h-3.5l-1-1h-5l-1 1H5v2h14V4z"/></svg>'
	output += '        </a>'
	output += '    </div>'
	output += '</div>'
	
	$('#delete_id'+b_num).html(output);
	
	$(document).on("click", '.cancel'+b_num, function() {
		$('.dia'+b_num).empty();
	});
	
	$(document).on("click", '.deleteB'+b_num, function() {
		
		$.ajax({
			url : '/myakkbird/board_delete.ak?b_num='+b_num+'',
			type : 'GET',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				$('.dia'+b_num).empty();
				
				location.reload();
				
			},
			error:function(){
		        alert("ajax통신 실패!!!");
		    }
		})
		
	});

}
</script>
</html>