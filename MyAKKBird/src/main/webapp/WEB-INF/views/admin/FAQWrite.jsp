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
	<title>마이악어새 관리자 FAQ 쓰기</title>
	<!-- favicon 적용 -->
	<link type="image/x-icon" rel="icon" href="./resources/image/akk_favicon.png">
	<!-- favicon 적용 -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<!-- FAQWrite.css style 파일 -->
	<link rel="stylesheet" type="text/css" href="./resources/css/admin/FAQWrite.css">
	<!-- FAQWrite.css style 파일 -->
</head>
<body>
<!-- header zone -->
<jsp:include page="../header_container.jsp">
	<jsp:param value="m_id" name="m_id"/>
</jsp:include>
<!-- header zone -->
<div class="faq_write_div">
	<div class="back_list" onclick="location.href='./FAQList.ak'">
		<svg id="back_icon" viewBox="0 0 24 24" style="display: inline-block; color: rgba(0, 0, 0, 0.87); fill: black; height: 24px; width: 24px; user-select: none; transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms;"><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path></svg>
	</div>
	<div class="faq_write_header">
		<h2>FAQ 작성</h2>
	</div>
	<hr>
	<form method="post" action="./FAQInsertProcess.ak"  onsubmit="return check_form()">
		<input type="hidden" name="m_id" value="<%=m_id %>">
		<div class="faq_write_content">
			<table>
				<tr>
					<th><div class="faq_sub_div">FAQ 제목</div></th>
					<td><input type="text" name="f_sub" id="faq_subject" placeholder="FAQ 제목을 입력해주세요."></td>
				</tr>
				<tr>
					<th><div class="faq_c_s_div">FAQ 내용</div></th>
					<td>
						<div class="faq_c_div">
							<textarea name="f_content" id="faq_content" placeholder="FAQ 내용을 입력해주세요."></textarea>
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
							<input type="submit" id="sub_btn" value="FAQ 등록">
							<input type="reset" id="reset_btn" value="초기화">
						</div>
					</td>
				</tr>
			</table>
		</div>
	</form>
</div>
<!-- footer zone -->
<jsp:include page="../footer_container.jsp">
	<jsp:param value="" name=""/>
</jsp:include>	
<!-- footer zone -->
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
</body>
</html>