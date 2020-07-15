<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page import="com.bit.myakkbird.mainpoint.*" %>
<%@page import="java.util.ArrayList"%>
<% 
 	MasterVO applyBoardVO = (MasterVO)request.getAttribute("applyBoardVO");
	MasterVO empProfileVO = (MasterVO)request.getAttribute("empProfileVO");
	ArrayList<MasterVO> empReviewList = (ArrayList<MasterVO>)request.getAttribute("empReviewList");
	
	System.out.println("===============디테일 s========================");
	System.out.println(applyBoardVO.getB_num()+applyBoardVO.getB_subject()); 
	System.out.println(empProfileVO.getR_star()+empProfileVO.getM_email());
	System.out.println("===============디테일 E========================");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=empProfileVO.getM_name() %>
	<% for(int i=0; i< empReviewList.size(); i++) { %>
		<div><%=empReviewList.get(i).getM_id() %><br><%=empReviewList.get(i).getR_content() %></div>	
	<%}%>
</body>
</html>
© 2020 GitHub, Inc.