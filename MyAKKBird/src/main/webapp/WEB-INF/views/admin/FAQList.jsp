<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.bit.myakkbird.admin.*" %>
<%@ page import="com.bit.myakkbird.mainpoint.*" %>
<%
	String m_id = (String)request.getAttribute("m_id");	
	ArrayList<FAQVO> faqList = (ArrayList<FAQVO>)request.getAttribute("faqList");
	int listcount = ((Integer)request.getAttribute("listcount")).intValue();
	
	System.out.println("현재 아이디 : " + m_id);
	System.out.println("FAQ 게시글 개수 : " + listcount);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마이악어새</title>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<!-- 시간 설정 API 시작 -->
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
  	<!-- 시간 설정 API 끝 -->
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
		body {
			margin: 0 auto;
			font-family: "NotoSansKR-Regular";
		}
		
		a {
			text-decoration: none;
		}
		
		table {
			width: 600px;
			margin: 0 auto;
			border-collapse: collapse;
		}
		
		table td {
			border-bottom: 1px solid #E6E6E6;
		}
		/* 전체 적용 */
		
		.addClass {
			width: 600px;
			height: 10px;
			margin: 0 auto;
		}
		
		/* FAQ 게시글 출력 */
		.faq_div {
			width: 1000px;
			height: 1000px;
			margin: 0 auto;
		}
		
		.faq_header {
			width: 600px;
			height: 45px;
			margin: 0 auto;
			text-align: center;
		}
		
		.admin_zone {
			width: 600px;
			height: 35px;
			margin: 0 auto;
		}
		
		#faq_count {
			float: left;
			margin-top: 5px;
			margin-left: 20px;
		}
		 
		#faq_w_move {
			float: right;
			margin-right: 17px;
			background-color: #37B04B; 
			color: white;
			padding: 8px;
			border-radius: 5px;
			cursor: pointer;
			font-size: 12px;
		}
		
		.faq_table_div {
			width: 600px;
			height: auto;
			margin: 0 auto;
		}
		
		#no_list {
			font-size: 15px;
		}
		
		#faq_v_move {
			height: 55px;
			cursor: pointer;
			-webkit-transition-duration: 0.4s; 
			transition-duration: 0.4s
		}
		
		#faq_v_move:hover {
			height: 55px;
			background-color: #f5f5f5;
			cursor: pointer;
		}
		
		#f_sub_id {
			font-size: 17px;
			margin-left: 20px;
			margin-top: 7px;
			float: left;
		}
		
		#f_sub_point {
			float: right;
			margin-top: 5px;
			margin-right: 10px;
		}
		
		.td_display {
			display: none;
		}
		
		.content_detail {
			width: 600px;
			height: auto;
		}
		/* FAQ 게시글 출력 */
		
		/* FAQ 자세히보기 */
		#d_b_txt {
			float: left;
			margin-left: 20px;
			font-size: 17px;
		}
		
		#p_txt {
			text-align : center;
			font-size: 17px;
		}
		
		#span_d_txt {
			float: right;
			font-size: 12px;
			margin-right: 15px;
		}
		
		.f_content_zone {
			width: 580px;
			height: auto;
			margin: 0 auto;
		}
		
		.work_div {
			width: 600px;
			height: 50px;
			margin-top: 5px;
			text-align: center;
		}
		
		#work_btn {
			background-color: #37B04B;
			color: white;
			padding: 6px;
			font-size: 12px;
			border-radius: 3px;
			cursor: pointer;
		}
		/* FAQ 자세히보기 */
	</style>
</head>
<body>
	<!-- header zone -->
	<jsp:include page="../header_container.jsp">
		<jsp:param value="m_id" name="m_id"/>
	</jsp:include>
	<!-- header zone -->
	<div class="faq_div">
		<div class="addClass">
		</div>
		<div class="faq_header">
			<h2>마이악어새 FAQ</h2>
		</div>
		<div class="admin_zone">
		</div>
		<div class="faq_table_div">
			<table>
				<%
					if(faqList.isEmpty()) {
				%>
					<tr align="center">
						<th>
							<b id="no_list">FAQ게시글이 없습니다...</b>
						</th>
					</tr>
				<%
					} else {
						for(int i = 0; i < faqList.size(); i++) {
						
				%>
					<tr id="faq_v_move" onclick="detail_view(<%=faqList.get(i).getF_num()%>)">
						<td>
							<b id="f_sub_id"><%=i+1 %>. <%=faqList.get(i).getF_sub() %></b>
							<span id="f_sub_point"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="black" width="30px" height="30px"><path d="M0 0h24v24H0z" fill="none"/><path d="M16.59 8.59L12 13.17 7.41 8.59 6 10l6 6 6-6z"/></svg></span>
						</td>
						
					</tr>
					<tr>
						<td class="td_display" id="f_c_div<%=faqList.get(i).getF_num()%>">
							<div class="content_detail" id="cd_id<%=faqList.get(i).getF_num()%>">
							</div>
						</td>
					</tr>
				<%
						}
					}
				%>
			</table>
		</div>
	</div>
</body>
<script type="text/javascript">
var m_id = '<%=m_id %>';          //현재 아이디
var m_type;                       //회원 타입
var listcount = <%=listcount %>;  //FAQ 개수
$(document).ready(function() {
	
	if(m_id != null) {
		memberCheck();
	}
	
});
// 회원 체크
function memberCheck() {
	
	$.ajax({
		url: '/myakkbird/faqMemberCheck.ak?m_id='+m_id+'',
		type: 'GET',
		dataType : "json",
		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		success: function(data) {
			var output = '';
			m_type = data.m_type;
			
			if(m_type === 'M') {
				output += '<b id="faq_count">총 FAQ게시글 '+listcount+'개</b>'
				output += '<a href="FAQWrite.ak" id="faq_w_move">FAQ 작성</a>'
				
				$('.admin_zone').html(output);
			}
		}
	});
}
// FAQ 자세히 보기
function detail_view(f_num) {
	$('#f_c_div'+f_num).toggle();
	
	$.ajax({
		url: '/myakkbird/faq_detail.ak?f_num='+f_num+'',
		type: 'GET',
		dataType : "json",
		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		success: function(data) {
			var output = '';
			var f_board_day = moment(data.f_date).format("YYYY.M.D");
			
			output += '<div class="f_content_zone">'
			output += '    <b id="d_b_txt">답변 : </b>'
			output += '    <p id="p_txt">&nbsp;'+data.f_content+'</p><br>'
			output += '    <span id="span_d_txt">'+f_board_day+'</span><br>'
			output += '</div>'
			
			if(m_type === 'M') {
				output += '<div class="work_div">'
				output += '    <a href="./faq_update.ak?f_num='+f_num+'" id="work_btn">수정</a>'
				output += '    <a href="./faq_delete.ak?f_num='+f_num+'" id="work_btn">삭제</a>'
				output += '</div>'
			}
			
			$('#cd_id'+f_num).html(output);
		}
	});
}
</script>
</html>