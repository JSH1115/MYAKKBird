<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.bit.myakkbird.admin.*" %>
<%
	String m_id = (String)request.getAttribute("m_id");
	FAQVO faqVO = (FAQVO)request.getAttribute("faqVO");
	System.out.println("현재 아이디 : " + m_id);
	System.out.println("현재 FAQ 번호 : " + faqVO.getF_num());
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마이악어새</title>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
			width: 500px;
			margin: 0 auto;
			margin-left: -50px;
		}
		
		table th {
			width: 100px;
		}
		
		table td {	
			width: 400px;
		}
		
		input[type="text"] {
			width: 350px;
			height: 30px;
		}
		
		hr {
			border: solid 0.1px #d3d3d3;
		}
		/* 전체 적용 */
	
		.faq_write_div {
			width: 600px;
			margin: 0 auto;
			text-align: center;
		}
		
		.back_list {
			cursor: pointer;
		}
		
		#back_icon {
			float: left;
		}
		
		#back_txt {
			float: left;
			margin-top: 4px;
		}
	
		.faq_write_header {
			width: 600px;
			height: 30px;
			margin: 0 auto;
			margin-bottom: 30px;
			text-align: center;
		}
		
		.faq_write_content {
			width: 500px;
			height: auto;
			margin: 30px auto;
			text-align: center;
		}
		
		.faq_sub_div {
			margin-left: 15px;
		}
		
		.faq_c_s_div {
			margin-left: 15px;
			margin-top: 30px;
			margin-bottom: 30px;
		}
		
		.faq_c_div {
			margin-top: 30px;
			margin-bottom: 30px;
		}
		
		#faq_content {
			width: 350px;
			height: 250px;
		}
		
		.faq_p_s_div {
			margin-left: 15px;
			margin-bottom: 30px;
		}
		
		#faq_password {
			margin-bottom: 30px;
		}
		
		.faq_write_footer {
			width: 600px;
			height: auto;
			margin: 30px auto;
			text-align: center;
		}
		
		#sub_btn {
			font-size: 15px;
			background-color: #37B04B;
			color: white;
			border: 0;
			padding: 8px;
			border-radius: 5px;
			cursor: pointer;
		}
		
		#reset_btn {
			font-size: 15px;
			background-color: #37B04B;
			color: white;
			border: 0;
			padding: 8px;
			border-radius: 5px;
			cursor: pointer;
		}
	</style>
	<script>
		function check_form() {
			
			if($("#faq_subject").val() == "") { 
				alert("FAQ 제목을 입력하세요!"); 
				$("#faq_subject").focus(); 
				return false; 
			}
			if($("#faq_content").val() == "") { 
				alert("FAQ 내용을 입력하세요!"); 
				$("#faq_content").focus(); 
				return false; 
			}
			
			if($("#faq_password").val() == "") { 
				alert("비밀번호를 입력하세요!"); 
				$("#faq_password").focus(); 
				return false; 
			}
			
		}
	</script>
</head>
<body>
	<!-- header zone -->
	<jsp:include page="../header_container.jsp">
		<jsp:param value="m_id" name="m_id"/>
	</jsp:include>
	<!-- header zone -->
	<div class="faq_write_div">
		<div class="back_list" onclick="location.href='./FAQList.ak'">
			<svg id="back_icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="black" width="30px" height="30px"><path d="M0 0h24v24H0z" fill="none"/><path d="M15.41 7.41L14 6l-6 6 6 6 1.41-1.41L10.83 12z"/></svg>
			<b id="back_txt">돌아가기</b>
		</div>
		<div class="faq_write_header">
			<h2>FAQ <%=faqVO.getF_num() %>번 게시글 수정</h2>
		</div>
		<hr>
		<form method="post" action="./FAQUpdateProcess.ak"  onsubmit="return check_form()">
			<input type="hidden" name="m_id" value="<%=m_id %>">
			<input type="hidden" name="f_num" value="<%=faqVO.getF_num() %>">
			<div class="faq_write_content">
				<table>
					<tr>
						<th><div class="faq_sub_div">FAQ 제목</div></th>
						<td><input type="text" name="f_sub" id="faq_subject" value="<%=faqVO.getF_sub() %>" placeholder="FAQ 제목을 입력해주세요."></td>
					</tr>
					<tr>
						<th><div class="faq_c_s_div">FAQ 내용</div></th>
						<td>
							<div class="faq_c_div">
								<textarea name="f_content" id="faq_content" placeholder="FAQ 내용을 입력해주세요."><%=faqVO.getF_content() %></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<th><div class="faq_p_s_div">*비밀번호</div></th>
						<td>
							<input type="text" name="m_password" id="faq_password" placeholder="관리자님 비밀번호를 입력해주세요.">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<hr>	
							<div class="faq_write_footer">
								<input type="submit" id="sub_btn" value="FAQ 수정">
								<input type="reset" id="reset_btn" value="초기화">
							</div>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</body>
</html>