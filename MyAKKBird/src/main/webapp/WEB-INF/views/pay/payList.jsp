<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.bit.myakkbird.pay.*" %>
<%
	ArrayList<PayVO> payList = (ArrayList<PayVO>)request.getAttribute("payList");
	int listCount = ((Integer)request.getAttribute("listCount")).intValue();
	int nowpage = ((Integer)request.getAttribute("page")).intValue();
	int maxpage = ((Integer)request.getAttribute("maxpage")).intValue();
	int startpage = ((Integer)request.getAttribute("startpage")).intValue();
	int endpage = ((Integer)request.getAttribute("endpage")).intValue();
	// 날짜 포맷
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
	String payDay = null;
	// 금액 포맷
	String pay = null;
		
	for(int i = 0; i < payList.size(); i++) {
		if(payList.get(i).getP_pg().equals("K")) {
			payList.get(i).setP_pg("카카오페이");
		}
		payDay = dateFormat.format(payList.get(i).getP_date());
		pay = String.format("%,d", payList.get(i).getP_price());
	}
	
	System.out.println("결제한 내역 수 : " + listCount);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마이악어새</title>
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
		
		/* 전체 적용 */
		body {
			margin: 0;
			padding: 0;
			font-family: "NotoSansKR-Regular";
		}
		
		table {
			width: 800px;
			border-collapse: collapse;
		}
		
		thead th {
			height: 41px;
			background-color: #37B04B;
			color: white;
			font-family: "NotoSansKR-Medium";
		}
		
		tbody #data_tr {
			height: 60px;
			border-bottom: 1px solid rgb(195, 195, 195);
			font-family: "NotoSansKR-Regular";
		}
		
		tbody #no_data_tr {
			height: 60px;
			font-family: "NotoSansKR-Regular";
		}
		
		/* 전체 적용 */
		
		.pay_history_div {
			width: 1000px;
			height: 850px;
			margin: 60px auto;
		}
		
		.title_zone {
			width: 800px;
			height: 35px;
			margin: 0 auto;
			text-align: center;
		}
		
		.list_zone {
			width: 800px;
			height: 30px;
			margin: 5px auto;
		}
		
		#list_count {
			float: right;
		}
		
		.no_data_div {
			
		}
		
		.pay_list_div {
			width: 800px;
			height: auto;
			margin: 30px auto;
		}
		
		.num_zone {
			width: 800px;
			margin: 20px auto;
			text-align: center;
		}
	</style>
</head>
<body>
<!-- header zone -->
<jsp:include page="../header_container.jsp">
	<jsp:param value="m_id" name="m_id"/>
</jsp:include> 
<!-- header zone -->
<div class="pay_history_div">
	<div class="title_zone">
		<h2>하트 구매내역</h2>
	</div>
	<div class="list_zone">
		<b id="list_count">결제 총 내역 <%=listCount %>번</b>
	</div>
	<div class="pay_list_div">
		<table>
			<thead>
				<tr align="center">
					<th>번호</th>
					<th>아이디</th>
					<th>금액</th>
					<th>결제 방식</th>
					<th>결제 날짜</th>
				</tr>
			</thead>
			<tbody>
				<%
					if(payList.size() == 0) {
				%>
					<tr id="no_data_tr" align="center">
						<td colspan="5">
							<div class="no_data_div">결제 내역이 없습니다...</div>
						</td>
					</tr>
				<%		
					} else {
						int num = listCount - ((nowpage - 1) * 10);
						for(int i = 0; i < payList.size(); i++) {
				%>
						<tr id="data_tr" align="center">
							<td>
								<div><%=num %></div>
							</td>
							<td>
								<div><%=payList.get(i).getM_id() %></div>
							</td>
							<td>
								<div><%=pay %>원</div>
							</td>
							<td>
								<div><b><%=payList.get(i).getP_pg() %></b></div>
							</td>
							<td>
								<div><%=payDay %></div>
							</td>
						</tr>
				<%
						num--;
						}
					}
				%>
			</tbody>
		</table>
	</div>
	<div class="num_zone">
		<%
			if(payList.size() == 0) {
		%>		
			<div></div>
		<%
			} else {
		%>
			<div>
				<%if(nowpage <= 1) { %>
					<span>&lt;</span>
				<%} else {%>
					<a href="./payList.ak?page=<%=nowpage-1%>">&lt;</a>
				<%} %>
				
				<%for(int i = startpage; i <= endpage; i++) { 
					if(i == nowpage) {%>
					<span><%=i %></span>
					<%} else {%>
					<a href="./payList.ak?page=<%=i %>">[<%=i %>]</a>
					<%} %>
				<%} %>
				
				<%if(nowpage >= maxpage){ %>
				<span>&gt;</span>
				<%} else {%>
				<a href="./payList.ak?page=<%=nowpage+1%>">&gt;</a>
				<%} %>
			</div>
		<%
			}
		%>
	</div>
</div>	
</body>
</html>