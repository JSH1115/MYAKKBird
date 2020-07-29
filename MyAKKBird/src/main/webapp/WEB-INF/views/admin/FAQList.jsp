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
	<title>마이악어새 FAQ 리스트</title>
	<!-- favicon 적용 -->
	<link type="image/x-icon" rel="icon" href="./resources/image/akk_favicon.png">
	<!-- favicon 적용 -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<!-- 시간 설정 API 시작 -->
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
  	<!-- 시간 설정 API 끝 -->
  	<!-- FAQList.css style 파일 -->
  	<link rel="stylesheet" type="text/css" href="./resources/css/admin/FAQList.css">
  	<!-- FAQList.css style 파일 -->
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
	<!-- 관리자만 보이는 곳 -->
	<div class="admin_zone">
	</div>
	<!-- 관리자만 보이는 곳 -->
	<div class="faq_table_div">
		<table>
			<%
				if(faqList.isEmpty()) {
			%>
				<!-- 게시글이 없으면... -->
				<tr align="center">
					<th>
						<b id="no_list">FAQ게시글이 없습니다...</b>
					</th>
				</tr>
				<!-- 게시글이 없으면... -->
			<%
				} else {
					for(int i = 0; i < faqList.size(); i++) {
					
			%>
				<!-- 게시글이 있으면... -->
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
				<!-- 게시글이 있으면... -->
			<%
					}
				}
			%>
		</table>
	</div>
</div>
<!-- footer zone -->
<jsp:include page="../footer_container.jsp">
	<jsp:param value="" name=""/>
</jsp:include> 
<!-- footer zone -->
</body>
<script>
var m_id = '<%=m_id %>';          //현재 아이디
var listcount = <%=listcount %>;  //FAQ 개수
</script>
<!-- FAQList.js 파일 -->
<script type="text/javascript" src="./resources/js/admin/FAQList.js"></script>
<!-- FAQList.js 파일 -->
</html>