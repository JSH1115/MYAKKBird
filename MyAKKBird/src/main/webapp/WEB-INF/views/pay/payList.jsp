<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.bit.myakkbird.pay.*" %>
<%
	String m_id = (String)session.getAttribute("m_id");
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
	DecimalFormat decimalFormat = new DecimalFormat("###,###,###,###");
	String pay = null;
	
	for(int i = 0; i < payList.size(); i++) {
		if(payList.get(i).getP_pg().equals("K")) {
			payList.get(i).setP_pg("카카오페이");
		}
		payDay = dateFormat.format(payList.get(i).getP_date());
		payList.get(i).setPay_date(payDay);
		pay = decimalFormat.format(payList.get(i).getP_price());
		payList.get(i).setPay_info(pay);
		
		if(payList.get(i).getP_price() == 10000) {
			payList.get(i).setHeart_info("하트 50개");
		} else if(payList.get(i).getP_price() == 5000) {
			payList.get(i).setHeart_info("하트 25개");
		} else if(payList.get(i).getP_price() == 1000){
			payList.get(i).setHeart_info("하트 5개");
		}
	}
	
	System.out.println("현재 아이디 : " + m_id);
	System.out.println("결제한 내역 수 : " + listCount);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마이악어새 결제 리스트</title>
	<script src="http://code.jquery.com/jquery-1.12.4.min.js" ></script>
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
		
		h2 {
			font-size: 25px;
		}
		
		a {
			text-decoration: none;
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
			text-align: center;
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
			height: 800px;
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
		
		.pay_list_div {
			width: 800px;
			height: auto;
			margin: 10px auto;
		}
		
		#heart_icon {
		    margin-left: -28px;
		    margin-top: -1px;
		    float: left;
		}
		
		#p_txt {
			color: #37B04B;
			float: left;
   			margin-left: 120px;
		}
		
		.num_zone {
			width: 800px;
			margin: 0 auto;
			text-align: center;
		}
		
		/* 부트스트랩 페이징 style */
		.pagination {
			display: inline-block;
			padding-left: 0;
			margin: 20px 0;
			border-radius: 4px
		}
		
		.pagination>li {
			display: inline
		}
		
		.pagination>li>a, .pagination>li>span {
			position: relative;
			float: left;
			padding: 6px 12px;
			margin-left: -1px;
			line-height: 1.42857143;
			color: #37B04B;
			text-decoration: none;
			background-color: #fff;
			border: 1px solid #ddd
		}
		
		.pagination>li:first-child>a, .pagination>li:first-child>span {
			margin-left: 0;
			border-top-left-radius: 4px;
			border-bottom-left-radius: 4px
		}
		
		.pagination>li:last-child>a, .pagination>li:last-child>span {
			border-top-right-radius: 4px;
			border-bottom-right-radius: 4px
		}
		
		.pagination>li>a:focus, .pagination>li>a:hover, .pagination>li>span:focus,
			.pagination>li>span:hover {
			color: #37B04B;
			background-color: #eee;
			border-color: #ddd
		}
		
		.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover,
			.pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover
		{
			z-index: 2;
			color: #fff;
			cursor: pointer;
			background-color: #37B04B;
			border-color: #37B04B;
		}
		
		.pagination>.disabled>a, .pagination>.disabled>a:focus, .pagination>.disabled>a:hover,
			.pagination>.disabled>span, .pagination>.disabled>span:focus,
			.pagination>.disabled>span:hover {
			color: #777;
			cursor: not-allowed;
			background-color: #fff;
			border-color: #ddd
		}
		/* 부트스트랩 페이징 style */
		
		#back_btn {
			cursor: pointer;
    		position: absolute;
    		margin-left: -400px;
    		margin-top: 5px;
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
		<svg id="back_btn" viewBox="0 0 24 24" style="display: inline-block; color: rgba(0, 0, 0, 0.87); fill: black; height: 24px; width: 24px; user-select: none; transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms;"><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path></svg>
		<h2><%=m_id %>님 하트 구매내역</h2>
	</div>
	<div class="list_zone">
		<%
			if(payList.size() == 0) {
		%>
		<%
			} else {
		%>
			<b id="list_count">결제 총 내역 <%=listCount %>번</b>
		<%
			}
		%>
	</div>
	<div class="pay_list_div">
		<table>
			<thead>
				<tr align="center">
					<th>번호</th>
					<th>결제 정보</th>
					<th>결제 방식</th>
					<th>결제 금액</th>
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
							<td style="width: 10%">
								<div><%=num %></div>
							</td>
							<td style="width: 35%">
								<div>
									<b id="p_txt">
										<svg id="heart_icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#37B04B" width="23px" height="23px"><path d="M0 0h24v24H0z" fill="none"/><path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/></svg>
										<%=payList.get(i).getHeart_info() %>
									</b>
								</div>
							</td>
							<td style="width: 20%">
								<div><b><%=payList.get(i).getP_pg() %></b></div>
							</td>
							<td style="width: 20%">
								<div><%=payList.get(i).getPay_info() %>원</div>
							</td>
							<td style="width: 25%">
								<div><%=payList.get(i).getPay_date() %></div>
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
				<ul class="pagination">
					<%if(nowpage <= 1) { %>
						<li>
							<span class="page-item">&lt;</span>
						</li>
					<%} else {%>
						<li>
							<a href="./payList.ak?page=<%=nowpage-1%>" class="page-item">&lt;</a>
						</li>
					<%} %>
					
					<%for(int i = startpage; i <= endpage; i++) { 
						if(i == nowpage) {%>
						<li class="active">
							<span><%=i %></span>
						</li>
						<%} else {%>
						<li>
							<a href="./payList.ak?page=<%=i %>" class="page-item"><%=i %></a>
						</li>
						<%} %>
					<%} %>
					
					<%if(nowpage >= maxpage){ %>
					<li>
						<span class="page-item">&gt;</span>
					</li>
					<%} else {%>
					<li>
						<a href="./payList.ak?page=<%=nowpage+1%>" class="page-item">&gt;</a>
					</li>
					<%} %>
				</ul>
			</div>
		<%
			}
		%>
	</div>
</div>
<jsp:include page="../footer_container.jsp">
	<jsp:param value="" name=""/>
</jsp:include>	
</body>
<script>
$('#back_btn').click(function() {
	window.history.back();
});
</script>
</html>