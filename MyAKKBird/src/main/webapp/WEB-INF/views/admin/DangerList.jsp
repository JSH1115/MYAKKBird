<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="com.bit.myakkbird.mainpoint.*" %>

<%
	MasterVO profile_M = (MasterVO)request.getAttribute("profile_M");
	int listcount = ((Integer)request.getAttribute("listcount")).intValue();
	String gender;
	
	if(profile_M.getM_gender().equals("M")) {
		gender = "남자";
	} else {
		gender = "여자";
	}
	
	System.out.println("현재 운영자 ID : " + profile_M.getM_id());
	System.out.println("현재 운영자 타입 : " + profile_M.getM_type());
	System.out.println("현재 총 회원 수 : " + listcount + "명");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마이악어새 관리자 신고목록</title>
	<!-- favicon 적용 -->
	<link type="image/x-icon" rel="icon" href="./resources/image/akk_favicon.png">
	<!-- favicon 적용 -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<!-- 부트스트랩  -->
	<link rel="stylesheet" type="text/css" href="resources/css/bootstrap_min.css">
	<link rel="stylesheet" type="text/css" href="resources/css/bootstrap_thememin.css">
  	<!-- 부트스트랩 -->
	<!-- alert창 API 시작 -->
	<script src="resources/js/sweetAlert_admin.js"></script>
	<!-- alert창 API 끝 -->
	<!-- chart API 시작 -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
	<!-- chart API 끝 -->
	<style>
	
	
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
		
		label {
			font-weight: normal;	
			cursor: pointer;
		}
		
		ul li {
			list-style: none;
		}
		
		table {
			width: 1000px;
			margin: 0 auto;
		}
		
		table thead th {
			text-align: center;
			font-size: 15px; 
			background-color: #37B04B;
			color: white;
		}
		table td {
			height:62px;
		}
		/* 전체 적용 */
		
		.addClass {
		    margin: 0 auto;
		    width: 1000px;
		    height: 30px;
		}
		
		.titleClass {
			margin: 0 auto;
		    width: 1000px;
		    height: 60px;
		    font-family: "NotoSansKR-Bold";
		    text-align: center;
		}
		
		.top_div {
			margin: 0 auto;
			width: 1000px;
			height: 400px;
			margin-bottom: -50px;
		}
		
		/* 운영자 profile style */
		.left_zone {
			float: left;
			width: 420px;
			height: 300px;
		}
		
		.admin_zone {
			float: left;
			width: 420px;
			height: 170px;
			border: 1px solid #d3d3d3;
			box-shadow: -3px -3px 7px -3px #d3d3d3,
		                3px 3px 7px -3px #d3d3d3;
			border-radius: 5px;
		}
		
		.admin_profile {
			float: left;
			width: 30%;
			height: 180px;
		}
		
		.admin_img {
			width: 80px;
			height: 80px;
			border-radius: 40px;
			border: 1px solid #d3d3d3;
			margin-left: 35px;
			margin-top: 25px;
		}
		
		.admin_txt {
			color: white;
			font-size: 15px;
			background-color: #37B04B;
			padding: 6px;
			border-radius: 10px;
			margin-top: 5px;
			margin-left: 40px;
			float: left;
		}
		
		.admin_post {
			float: right;
			width: 68%;
			height: 300px;
		}
		
		.wel_txt {
			float: left;
			font-size: 17px;
			margin-top: 15px;
			margin-left: 13px;
		}
		
		#p_w_txt {
			color: #37B04B;
		}
		
		.a_post_detail {
			margin-top: 6px;
		}
		
		.p_txt {
			float: left;
			margin-left: 12px;
			font-size: 14px;
		}
		/* 운영자 profile style */
		/* 통계 style */
		.stats_zone {
			float: right;
			width: 550px;
			height: 300px;
			border: 1px solid #d3d3d3;
			box-shadow: -3px -3px 7px -3px #d3d3d3,
		                3px 3px 7px -3px #d3d3d3;
			border-radius: 5px;
		}
		
		.stats_left {
			width: 260px;
			height: 300px;
			float: left;
		}
		
		.stats_right {
			width: 280px;
			height: 300px;
			float: right;
		}
		
		#chart_txt {
			margin-left: 44px;
			margin-top: 12px;
			font-size: 18px;
			float: left;
		}
		
		.stats_chart {
			width: 250px;
			height: 250px;
			position: absolute;
		}
		
		#myChart {
			
			margin-top: 18px;
			position: absolute;
		}
		
		#if_m {
			   float: left;
    		margin-top: 230px;
    		margin-left: 60px;
		}
		
		.stats_info {
			width: 280px;
			height: 115px;
			margin-top: 12px;
		}
		
		#info_txt {
			font-size: 15.5px;
		}
		
		.stats_interval {
			margin-top: 5px;
		}
		
		.stats_img {
			width: 26px;
			height: 26px;
			margin-left: 6px;
		}
		
		.stats_info b {
			font-size: 14px;
		}
		
		.stats_info span {
			font-size: 14px;
		}
		
		.m_status_info {
			width: 280px;
			height: 50px;
			margin-top:80px;
		}
		
		.m_status_interval {
			margin-top: 5px;
			margin-left: 6px;
			font-size: 15px;
		}
		
		.m_status_img {
			float: left;
		}
		
		.m_status_img2 {
			float: left;
			margin-left: 5px;
		}
		
		.m_status_txt {
			float: left;
			margin-top: 2px;
			margin-left: 5px;
		}
		
		.m_status_txt2 {
			float: left;
			margin-top: 2px;
		}
		
		.m_addr_info {
			width: 280px;
			height: 50px;
			margin-top: 10px;
		}
		
		.m_addr_interval {
			margin-top: 5px;
			margin-left: -23px;
		}
		/* 통계 style */
		
		/* 검색 기능 style */
		.search_div {
			border: 1px solid #d3d3d3;
			box-shadow: -3px -3px 7px -3px #d3d3d3,
		                3px 3px 7px -3px #d3d3d3;
			border-radius: 5px;
			width: 420px;
			height: 110px;
			float: left;
			margin-top: 20px;
		}
		
		.check_zone {
			width: 450px;
			height: 30px;
			float: left;
			margin-top: 10px;
			margin-left: 10px;
		}
		
		.check_zone2 {
			width: 400px;
			margin-top: -5px;
		}
		
		#listCounut {
			float: right;
			margin-top: 1.5px;
		}
		
		.search_zone {
			width: 315px;
			height: 30px;
			float: left;
			margin-top: 20px;
			margin-left: 20px;
		}
		
		#searchS {
			height: 30px;
			margin-left: -5px;
		}
		
		#searchI {
			width: 220px;
			height: 30px;
			float: right;
			margin-left: 10px;
			position: absolute;
		}
		
		#s_btn {
			background-color: #37B04B;
			color: white;
			width: 60px;
			height: 30px;
			border: 0;
			border-radius: 3px;
			float: right;
			position: absolute;
			margin-left: 240px;
		}
		/* 검색 기능 style */
		
		/* 게시글 출력 */
		.member_zone {
			width: 1000px;
			height: auto;
			margin: -20px auto;
			margin-top: 80px;
		}
		
		.no_zone {
			text-align: center;
			font-size: 17px;
			margin-top: 12px;
		}
		
		.profile_img {
			width:45px; 
			height:45px;
			border-radius: 22.5px;
			border: 1px solid #d3d3d3;
		}
		
		#num_zone {
			width: 1000px;
			height: 150px;
			margin: -5px auto;
			text-align: center;
		}
		
		#member_list {
			cursor: pointer;
		}
		
		.t_div {
			margin-top:12px;
		}
		/* 게시글 출력 */
		
		.swal2-modal .swal2-content {
			text-align:center;
		}
		/* 모달 개인 정보 style */
		.m_header {
			width: 300px;
			height: 120px;
			margin-top: 10px;
		}
		
		.m_photo {
			float: left;
			width: 100px;
			height: 100px;
		}
		
		.m_img {
			width:50px; 
			height:50px;
			border-radius: 25px;
			border: 1px solid #d3d3d3;
			margin-top: 20px;
			margin-left: 40px;
		}
		
		.m_type_div {
			text-align: center;
			margin-top: 8px;
			margin-left: 30px;
		}
		
		.m_t_zone {
			background-color: #37B04B;
			color: white;
			padding: 6px;
			border-radius: 15px;
			font-size: 12px;
		}
		
		.m_profile {
			float: right;
			width: 200px;
			height: 120px;
			line-height: 1.5;
			font-size: 13px;
		}
		
		.m_p_b {
			float: left;
			margin-left: 15px;
		}
		
		.m_p_span {
			margin-left: 4px;
		}
		
		.m_content {
			width: 300px;
			height: 170px;
			margin-top: 5px;
			line-height: 1.7;
			font-size: 13px;
			text-align: center;
		}
		
		.cate_img {
			width: 20px;
			height: 20px;
		}
		
		.m_category_div {
			width: 240px;
			height: 80px;
			margin: 0 auto;
			text-align: center;
		} 
		
		#m_btn_txt {
			font-size: 13px;
		}
		
		/* 모달 개인 정보 style */
		
		/* best 주소 출력 style */
		.best_img {
		
			float: left;
			margin-left: -8px;
		}
		
		.23best_txt {
			float: left;
			margin-left: 20px;
		}
		/* best 주소 출력 style */
	</style>
</head>
<body>
		<jsp:include page="../header_container.jsp">
			<jsp:param value="m_id" name="m_id"/>
		</jsp:include> 

	<form name="frm">
    <input type="hidden" name="pageNo" /><!-- //페이지 번호 -->
    <input type="hidden" name="searchFiled" value="${pageVO.searchFiled }" /><!-- //검색조건 -->
    <input type="hidden" name="searchValue" value="${pageVO.searchValue }" /><!-- //검색어 -->
    <input type="hidden" name="d_statusFiled" value="d_status" /><!-- //검색어 -->
    <input type="hidden" name="d_statusValue" value="${pageVO.d_statusValue }" /><!-- //검색어 -->
	<input type="hidden" name="d_typeFiled" value="d_type" /><!-- //검색어 -->
    <input type="hidden" name="d_typeValue" value="${pageVO.d_typeValue }" /><!-- //검색어 -->
    		<div class="top_div">
    		<div class="addClass">
			</div>
			<div class="titleClass">
				<h3>마이악어새 신고목록</h3>
			</div>
    		<div class="left_zone">
    			<div class="admin_zone">
	    			<div class="admin_profile">
	    				<img class="admin_img" src="./resources/image/admin_profile.png">
	    				<b class="admin_txt">MASTER</b>
	    			</div>
	    			<div class="admin_post">
	    				<b class="wel_txt">WELCOME! 마이<span id="p_w_txt">악어</span>새 운영자님</b><br><br>
	    				<div class="a_post_detail">
		    				<b class="p_txt">이름 : </b>&nbsp;&nbsp;<span><%=profile_M.getM_name() %></span><br>
		    				<b class="p_txt">나이 : </b>&nbsp;&nbsp;<span><%=profile_M.getM_age() %>살</span><br>
		    				<b class="p_txt">성별 : </b>&nbsp;&nbsp;<span><%=gender %></span><br>
		    				<b class="p_txt">이메일 : </b>&nbsp;&nbsp;<span><%=profile_M.getM_email() %></span><br>
		    				<b class="p_txt">전화번호 :</b>&nbsp;&nbsp;<span><%=profile_M.getM_phone() %></span><br>
	    				</div>
	    			</div>
    			</div>
    	<div class="search_div">
   					<div class="check_zone">
   						<b>* 신고유형</b>&nbsp;
	    				<input type="radio" name="d_type" id="d_type_A" value="A">
	    				<label for="d_type_A">허위정보</label>&nbsp;
	    				<input type="radio" name="d_type" id="d_type_B" value="B">
	    				<label for="d_type_B">음란성</label>
	    				<input type="radio" name="d_type" id="d_type_C" value="C">
	    				<label for="d_type_C">도배/홍보</label>
	    				<input type="radio" name="d_type" id="d_type_D" value="D">
	    				<label for="d_type_D">규정위반</label>
	    				<input type="radio" name="d_type" id="d_type_E" value="E">
	    				<label for="d_type_E">기타</label><br>
	    				<div class="check_zone2">
	    				<b>* 처리상황</b>&nbsp;
	    				<input type="radio" name="d_status" id="d_status_D" value="D">
	    				<label for="d_status_D">확인중</label>&nbsp;
	    				<input type="radio" name="d_status" id="d_status_O" value="O">
	    				<label for="d_status_O">완료</label>&nbsp;
	    				<input type="radio" name="d_status" id="d_status_X" value="X">
	    				<label for="d_status_X">취소</label>
	    				<b id="listCounut">검색된 신고 <%=listcount %>건</b><br>
	    				</div>
	    				
   					</div>
	    			<div class="search_zone">
				        <select id="searchS">
				            <option value="d_id">피신고자ID</option>
				            <option value="m_id">신고자ID</option>
				            <option value="d_date">신고 날짜</option>
				        </select>
				        <input type="button" id="s_btn" value="검색" onclick="fn_search();"/>
				        <input type="text" id="searchI"/>
	    			</div>
	    		</div>
    		</div>
    		<div class="stats_zone">
    			<div class="stats_left">
    				<b id="chart_txt" >- 마이악어새 신고 분포 -</b><br>
    				<div class="stats_chart">
	    				<canvas id="myChart"></canvas>
	    			</div>
	    			<span id="if_m"></span>
    			</div>
    			<div class="stats_right">
    				<div class="stats_info">
    					<b id="info_txt">* 마이악어새 신고 수</b>
    					<div class="stats_interval">
		    				
		    				&nbsp;<b>허위정보  : </b>&nbsp;<span id="a_num"></span>건<br>
	    				</div>
	    				<div class="stats_interval">
		    				
		    				&nbsp;<b>음란성  : </b>&nbsp;<span id="b_num"></span>건<br>
	    				</div>
	    				<div class="stats_interval">
		    				
		    				&nbsp;<b>도배/홍보 : </b>&nbsp;<span id="c_num"></span>건<br>
	    				</div>
	    				<div class="stats_interval">
		    				
		    				&nbsp;<b>규정위반 : </b>&nbsp;<span id="d_num"></span>건<br>
	    				</div>
	    				<div class="stats_interval">
		    				
		    				&nbsp;<b>기타: </b>&nbsp;<span id="e_num"></span>건<br>
	    				</div>
	    				<div class="stats_interval">
		    				
		    				&nbsp;<b>총 신고 수 : </b>&nbsp;<span id="all_num"></span>건<br>
	    				</div>
    				</div>
    				<div class="m_status_info">
    					<b id="info_txt">* 신고 상황</b>
    					<div class="m_status_interval">
							<b class="m_status_txt">대기 : &nbsp;</b><span id="dd_num" class="m_status_txt2"></span><span class="m_status_txt2">건</span>
    						<b class="m_status_txt">완료 : &nbsp;</b><span id="do_num" class="m_status_txt2"></span><span class="m_status_txt2">건</span>
    						<b class="m_status_txt">취소 : &nbsp;</b><span id="dx_num" class="m_status_txt2"></span><span class="m_status_txt2">건</span>
    					</div>
    				</div>
    				
    			</div>
    		</div>
    	</div>
	<div class="member_zone">
	        <table class="table table-hover">
	            <thead>
	                <tr>
	                	<th>신고 날짜</th>
	                    <th>구분</th>
	                    <th>신고자 ID</th>
	                    <th>피신고자 ID</th>
	                    <th>신고 게시물&댓글</th>
	                    <th>신고 내용</th>
	                    <th>처리 여부</th>
	                </tr>
	            </thead>
	            <tbody>
	            	<c:choose>
	            		<c:when test="${empty resultList}">
		            		<tr>
	            				<td colspan="9">검색내역이 없습니다. 다시 검색해주세요!</td>
	        				</tr>
        				</c:when>
	            		<c:otherwise>
			            	<c:forEach items="${resultList}" var="resutList">
				                <tr id="member_list"  align="center">
				                	<td ><div class="t_div"><span>${resutList.d_date}</span></div></td>
				                	<c:choose>
				                    	<c:when test="${resutList.d_type eq 'A'}">
				                  				<td><div class="t_div"><span>허위정보</span></div></td>
				                    	</c:when>
				                    	<c:when test="${resutList.d_type eq 'B'}">
				                  				<td><div class="t_div"><span>음란성</span></div></td>
				                    	</c:when>
				                    	<c:when test="${resutList.d_type eq 'C'}">
				                  				<td><div class="t_div"><span>도배/홍보</span></div></td>
				                    	</c:when>
				                    	<c:when test="${resutList.d_type eq 'D'}">
				                  				<td><div class="t_div"><span>규정위반</span></div></td>
				                    	</c:when>
				                    	<c:when test="${resutList.d_type eq 'E'}">
				                  				<td><div class="t_div"><span>기타</span></div></td>
				                    	</c:when>
				                    </c:choose>
				                    <td onclick="detail_member('${resutList.m_id}');"><div class="t_div"><span>${resutList.m_id}</span></div></td>
				                    <td onclick="detail_member('${resutList.d_id}');"><div class="t_div"><span>${resutList.d_id}</span></div></td>
				                    
				                    <c:choose>
				                   		<c:when test="${resutList.bnum ne null}">
				                  			<td><div class="t_div"><span><a href="./BoardDetail.ak?b_num=${resutList.bnum}&e_id=${m_id}">${resutList.c_content}</a></span></div></td>
				                    	</c:when>
				                    	<c:when test="${resutList.b_num ne null}">
				                    		<td><div class="t_div"><span><a href="./BoardDetail.ak?b_num=${resutList.b_num}&e_id=${m_id}">${resutList.b_subject}</a></span></div></td>
				                    	</c:when>
				                    </c:choose>
				                    
				                    
				                    
				                    <td><div class="t_div"><span>${resutList.d_con}</span></div></td>
				                    
				                	<c:choose>
				                    	<c:when test="${resutList.d_status eq 'D'}">
				                  				<td onclick="danger_status('${resutList.d_id}','${resutList.d_num}');"><div class="t_div"><span>대기중</span></div></td>
				                    	</c:when>
				                    	<c:when test="${resutList.d_status eq 'O'}">
				                  				<td onclick="danger_status('${resutList.d_id}','${resutList.d_num}');"><div class="t_div"><span>완료</span></div></td>
				                    	</c:when>
				                    	<c:when test="${resutList.d_status eq 'X'}">
				                  				<td onclick="danger_status('${resutList.d_id}','${resutList.d_num}');"><div class="t_div"><span>취소</span></div></td>
				                    	</c:when>
				                    </c:choose>
				                </tr>
			            	</c:forEach>
	            		</c:otherwise>
	            	</c:choose>
	            </tbody>
	        </table>
        </div>
  <c:choose>
	    	<c:when test="${empty resultList}">
	    		<div class="container" id="num_zone">
	    		</div>
	    	</c:when>
	    	<c:otherwise>
		    	<div class="container" id="num_zone">
		        	<ul class="pagination">
				    	<c:if test="${pageVO.pageNo != 0}">
					        <c:if test="${pageVO.pageNo > pageVO.pageBlock}">
					            <li class="page-item">
					            	<a href="javascript:fn_movePage(${pageVO.firstPageNo})">&lt;&lt;</a>
					            </li>
					       </c:if>
					       <c:if test="${pageVO.pageNo != 1}">
					           <li class="page-item">
					               <a href="javascript:fn_movePage(${pageVO.prevPageNo})">&lt;</a>
					           </li>
					        </c:if>
					        <c:if test="${pageVO.pageNo == 1}">
					           <li class="page-item">
					               <a>&lt;</a>
					           </li>
					        </c:if>
					            <c:forEach var="i" begin="${pageVO.startPageNo}" end="${pageVO.endPageNo}" step="1">
					                <c:choose>
					                    <c:when test="${i eq pageVO.pageNo}">
					                        <li class="active">
					                        	<a href="javascript:fn_movePage(${i})">${i}</a>
					                        </li>
					                    </c:when>
					                    <c:otherwise>
					                        <li class="page-item">
					                        	<a href="javascript:fn_movePage(${i})">${i}</a>
					                        </li>
					                    </c:otherwise>
					                </c:choose>
					            </c:forEach>
					        <c:if test="${pageVO.pageNo == pageVO.finalPageNo }">
					            <li class="page-item">
					            	<a>&gt;</a>
					            </li>
					        </c:if>
					        <c:if test="${pageVO.pageNo != pageVO.finalPageNo }">
					            <li class="page-item">
					            	<a href="javascript:fn_movePage(${pageVO.nextPageNo})">&gt;</a>
					            </li>
					        </c:if>
					        <c:if test="${pageVO.endPageNo < pageVO.finalPageNo }">
					            <li class="page-item">
					            	<a href="javascript:fn_movePage(${pageVO.finalPageNo})">&gt;&gt;</a>
					            </li>
					        </c:if>
				    	</c:if>
			    	</ul>	
	        	</div>
	    	</c:otherwise>
	    </c:choose>
    </form>
    <jsp:include page="../footer_container.jsp">
		<jsp:param value="" name=""/>
	</jsp:include> 
</body>
<script type="text/javascript">
//엔터키 검색 막기
$('input[type="text"]').keydown(function() {
    if (event.keyCode === 13) {
        event.preventDefault();
    };
});
//페이지 이동
function fn_movePage(val){
   jQuery("input[name=pageNo]").val(val);
   jQuery("form[name=frm]").attr("method", "post");
   jQuery("form[name=frm]").attr("action","").submit();
}
//검색 버튼
function fn_search(){
    if( jQuery("#searchS").val() == "" ){
        return;
    }else{
        jQuery("input[name=searchFiled]").val(jQuery("#searchS").val());
    }
    
    var searchValue = jQuery("#searchI").val();
	var d_statusValue = $("input[name='d_status']:checked").val();
	var d_typeValue = $("input[name='d_type']:checked").val();
	
    jQuery("input[name=searchValue]").val(searchValue);
	jQuery("input[name=d_statusValue]").val(d_statusValue);
	jQuery("input[name=d_typeValue]").val(d_typeValue);
	
    jQuery("input[name=pageNo]").val("1");
    jQuery("form[name=frm]").attr("method", "post");
    jQuery("form[name=frm]").attr("action","").submit();
}
function data_member(data) {
	var gender;
	var m_type;
	var m_status;
	var m_id = data.m_id;
	
	if(data.m_gender === "M") {
		gender = '남';
	} else if(data.m_gender === "W") {
		gender = '여';
	}
	
	if(data.m_type === 'C') {
		m_type = '고객';
	} else {
		m_type = '근로자';
	}
	
	if(data.m_status == 'N') {
		m_status = '<b id="m_btn_txt">회원 탈퇴</b>';
	} else {
		m_status = '<b id="m_btn_txt">회원 복귀</b>';
	}
	
	var category = data.m_category.split(",");
	var category_str = new Array();
	
	for(var i = 0; i < category.length; i++) {
		
		switch (category[i]) {
			case 'A':
				category_str[i] = '<img class="cate_img" src="./resources/image/vacuum.png"> 정기청소';
				break;
			case 'B':
				category_str[i] = '<img class="cate_img" src="./resources/image/cleaning-tools.png"> 특수청소';
				break;
			case 'C':
				category_str[i] = '<img class="cate_img" src="./resources/image/kitchen.png"> 입주청소';
				break;
			case 'D':
				category_str[i] = '<img class="cate_img" src="./resources/image/maid.png"> 상주청소';
				break;
			case 'E':
				category_str[i] = '<img class="cate_img" src="./resources/image/apartment.png"> 빌딩청소';
				break;
			case 'F':
				category_str[i] = '<img class="cate_img" src="./resources/image/coronavirus.png"> 방역청소';
				break;
		}
		
	}
	
	Swal.fire({
		  title: 
			'<strong>'+data.m_id+'님 정보입니다.</strong>',
		  html:
		    '<div class="m_header">' +
		    '    <div class="m_photo">' +
		    '        <img class="m_img" src="/myakkbird/myakkbirdUpload/'+data.m_photo+'">' +
		    '        <div class="m_type_div">' +
		    '            <b class="m_t_zone">'+m_type+'</b>' +
		    '        </div>' +
		    '    </div>' +
		    '    <div class="m_profile">' +
		    '    	 <b class="m_p_b">이름 : </b><span class="m_p_span"> '+data.m_name+'</span><br>' +
		    '    	 <b class="m_p_b">나이 : </b><span class="m_p_span"> '+data.m_age+'세</span><br>' +
		    '    	 <b class="m_p_b">성별 : </b><span class="m_p_span"> '+gender+'</span><br>' +
		    '    	 <b class="m_p_b">이메일 : </b><span class="m_p_span"> '+data.m_email+'</span><br>' +
		    '    	 <b class="m_p_b">전화번호 : </b><span class="m_p_span"> '+data.m_phone+'</span><br>' +
		    '    	 <b class="m_p_b">하트개수 : </b><span class="m_p_span"> '+data.m_heart+'개</span><br>' +
		    '    </div>' +
		    '</div>' +
		    '<div class="m_content">' +
		    '    <b class="m_c_b">지번주소</b><br><span>'+data.m_address_road+'</span><br>' +
		    '    <b class="m_c_b">상세주소</b><br><span>'+data.m_address_detail+'</span><br>' +
		    '    <div class="m_category_div">' +
		    '        <b>* 선호하는 청소</b><br>' +
		    '        <span>'+category_str.join(" ")+'</span>' +
		    '    </div>' +
		    '</div>',
		  confirmButtonColor: '#37B04B',
		  confirmButtonText: ''+m_status+'',
		  showCancelButton: true,
		  cancelButtonText: '<b id="m_btn_txt">취소</b>',
	}).then((result) => {
		if (result.value) {
			if(data.m_status == 'N') {
				member_secession(m_id);
			} else {
				member_comeback(m_id);
			}
		}
	})
};
function member_secession(m_id) {
	
	$.ajax({
		url: '/myakkbird/updateStatus_Y.ak?m_id='+m_id+'',
		type: 'GET',
		dataType : "json",
		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		success: function(data) {
			location.reload();
		},
		error:function(){
	        alert("ajax통신 실패!!!");
	    }
	});
	
}
function member_comeback(m_id) {
	
	$.ajax({
		url: '/myakkbird/updateStatus_N.ak?m_id='+m_id+'',
		type: 'GET',
		dataType : "json",
		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		success: function(data) {
			location.reload();
		},
		error:function(){
	        alert("ajax통신 실패!!!");
	    }
	});
	
}
function counterUp(settings) { 
	var $settings = settings; 
	var $target =$settings.ele; 
	var countUpDatas = []; 
	var countFuncs; 
	var nums = []; 
	var delay=$settings.delay || 0.7; 
	// 숫자 올라가는 속도 조절
	var time=$settings.time || 100; 
	var divisions = time / delay; 
	var num = $settings.num; 
	//콤마가 있는지 체크 정규식 
	var isComma = /[0-9]+,[0-9]+/.test(num); num = num.replace(/,/g, ''); 
	// 숫자 목록 생성 
	for (var i = divisions; i >= 1; i--) { 
		// int 인 경우 int로 유지 
		var newNum = parseInt(num / divisions * i); 
		// 쉼표가있는 경우 쉼표 유지 
		if (isComma) { 
			while (/(\d+)(\d{3})/.test(newNum.toString())) { 
				newNum = newNum.toString().replace(/(\d+)(\d{3})/, '$1'+','+'$2'); 
			} 
		} nums.unshift(newNum); 
	} countUpDatas=nums; $target.text('0'); 
	// 완료 될 때까지 번호를 업데이트 
	
	function updateNum() { 
		$target.text( countUpDatas.shift() ); 
		//숫자를 담고 있는 배열 길이가 존재한다면 계속해서 루프 시킴. 
		if (countUpDatas.length) { 
			setTimeout(countFuncs, delay); 
		} else { 
			delete countUpDatas; countUpDatas=null; countFuncs=null; 
		} 
	} 
	
	countFuncs=updateNum; 
	// 카운트 시작 
	setTimeout(countFuncs, delay); 
} 
//실행할 카운트가 여러개일 경우 설정. 
function numberMotion(items) { 
	if(Object.prototype.toString.call(items)!=='[object Array]') { 
		return 
	} 
	
	for(var i=0;i<items.length;i++) { 
		counterUp( {num:items[i].num, ele:items[i].ele });
	 } 
} 
$(document).ready(function() {
   	
	var customer; // 고객 수
	var worker;   // 근로자 수 
	var status_n; // 활동중 체크
	var status_y; // 탈퇴 체크
	var danger_a; // 신고 수 a타입
	var danger_b; // 신고 수 a타입
	var danger_c; // 신고 수 a타입
	var danger_d; // 신고 수 a타입
	var danger_e; // 신고 수 a타입
	
	
	danger_A();
	type_C();
	status_D();
	
	
	function danger_A(){
		$.ajax({
			url: '/myakkbird/danger_A.ak',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				danger_a = data;
				
				danger_B(danger_a);
				
			},
			error:function(){
		        alert("ajax통신 실패!!!");
		    }
		});
	}
	function danger_B(danger_a){
		$.ajax({
			url: '/myakkbird/danger_B.ak',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				danger_b = data;
				
				danger_C(danger_a,danger_b);
				
			},
			error:function(){
		        alert("ajax통신 실패!!!");
		    }
		});
	}
	function danger_C(danger_a,danger_b){
		$.ajax({
			url: '/myakkbird/danger_C.ak',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				danger_c = data;
				
				danger_D(danger_a,danger_b,danger_c);
				
			},
			error:function(){
		        alert("ajax통신 실패!!!");
		    }
		});
	}
	function danger_D(){
		$.ajax({
			url: '/myakkbird/danger_D.ak',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				danger_d = data;
				
				danger_E(danger_a,danger_b,danger_c,danger_d);
				
			},
			error:function(){
		        alert("ajax통신 실패!!!");
		    }
		});
	}
	function danger_E(danger_a,danger_b,danger_c,danger_d){
		$.ajax({
			url: '/myakkbird/danger_E.ak',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				danger_e = data;
				
				danger_type(danger_a,danger_b,danger_c,danger_d,danger_e);
				
			},
			error:function(){
		        alert("ajax통신 실패!!!");
		    }
		});
	}
	
	
	// 고객 수 구하기
	function type_C() {
		
		$.ajax({
			url: '/myakkbird/type_C.ak',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				customer = data;
				
				type_E(customer);
				
			},
			error:function(){
		        alert("ajax통신 실패!!!");
		    }
		});
	}
	
	// 근로자 수 구하기
	function type_E(customer) {
		
		$.ajax({
			url: '/myakkbird/type_E.ak',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				worker = data;
			},
			error:function(){
		        alert("ajax통신 실패!!!");
		    }
		});
	}
	
	//신고 수 차트
	function danger_type(danger_a,danger_b,danger_c,danger_d,danger_e) {
		var ctx = document.getElementById('myChart');
		var myDoughnutChart = new Chart(ctx, {
		    type: 'doughnut',
		    data: {
		    	    datasets: [{
		    	        data: [danger_a,danger_b,danger_c,danger_d,danger_e],
		    	        backgroundColor: [
							'rgba(204, 204, 000)',
							'rgba(244, 0, 0)',
							'rgba(108, 116, 255)',
							'rgba(255, 102, 051)',
							'rgba(255,0, 255)'
						],
		    	    }],
		    	    labels: [
		    	        '허위정보',
		    	        '음란성',
		    	        '도배/홍보',
		    	        '규정위반',
		    	        '기타'
		    	    ]
		    	},
		    	options: {
                    maintainAspectRatio: false,
                    cutoutPercentage: 50,
                    legend: {
                         display: true,
                         position: 'top',
                         labels: {
                                 fontSize: 12,
                                 fontFamily: 'sans-serif',
                                 fontColor: '#000000',
                                 fontStyle: 'bold'
                                     }
                         }
             }
		});
		
		var if_m;
		
		$('#if_m').html(if_m);
		
		var all_num = danger_a+danger_b+danger_c+danger_d+danger_e;
		var s_danger_a = String(danger_a);
		var s_danger_b = String(danger_b);
		var s_danger_c = String(danger_c);
		var s_danger_d = String(danger_d);
		var s_danger_e = String(danger_e);
		var all = String(all_num);
		
		numberMotion([ 
			{num:s_danger_a, ele:$('#a_num')},
			{num:s_danger_b, ele:$('#b_num')},
			{num:s_danger_c, ele:$('#c_num')},
			{num:s_danger_d, ele:$('#d_num')},
			{num:s_danger_e, ele:$('#e_num')},
			{num:all, ele:$('#all_num')},
		]);
	}
	
	// 신고확인중 체크
	function status_D() {
		
		$.ajax({
			url: './dStatus_D.ak',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				status_d = data;
				
				status_O(status_d);
			},
			error:function(){
		        alert("ajax통신 실패!!!");
		    }
		});
		
	}
	// 신고 제재 체크
	function status_O(status_d) {
		
		$.ajax({
			url: './dStatus_O.ak',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				status_o = data;
				
				status_X(status_d,status_o);
			},
			error:function(){
		        alert("ajax통신 실패!!!");
		    }
		});
		
	}
	
	// 신고 취소 체크
	function status_X(status_d,status_o) {
		
		$.ajax({
			url: './dStatus_X.ak',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				status_x = data;
				
				var d_status_d = String(status_d);
				var d_status_o = String(status_o);
				var d_status_x = String(status_x);
				
				numberMotion([ 
					{num:d_status_d, ele:$('#dd_num')}, 
					{num:d_status_o, ele:$('#do_num')},
					{num:d_status_x, ele:$('#dx_num')}
				]);
			},
			error:function(){
		        alert("ajax통신 실패!!!");
		    }
		});
	}
	
	
	
});
function detail_member(m_id) {
	
	$.ajax({
		url: '/myakkbird/m_detail.ak?m_id='+m_id+'',
		type: 'GET',
		dataType : "json",
		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		success: function(data) {
			
			data_member(data);
			
		},
		error:function(){
	        alert("ajax통신 실패!!!");
	    }
	});
}
function danger_status(d_id,d_num) {
	Swal.fire({
		  title: d_id,
		  text : '해당 피신고자를 제재 하시겠습니다?',
		  icon : 'info',
		  showCancelButton: true,
		  confirmButtonText: '예',
		  confirmButtonColor:'#37B04B',
		  cancelButtonText: '아니요'			
	}).then((result) => {
		  if (result.value) {
			  	dangerOK(d_num);	
			  	reload(); 
			  } else if (result.dismiss === Swal.DismissReason.cancel) {
			    dangerNO(d_num);
			    reload(); 
			  }
			}) 
}
 
function dangerOK(d_num){
	var data = d_num;
	 
	 jQuery.ajax({
          url: "/myakkbird/danger_OK.ak", 
          method: "POST",
          dataType : 'json',
          contentType: "application/json",
          data: data,
          success: function(res){
        	  if(res == "OK"){
        		  
        	  }
          },
          error: function(e) {
        	    console.log(e);
        	  }
	  })
}
	function dangerNO(d_num){
	var data = d_num;
 	 jQuery.ajax({
	          url: "/myakkbird/danger_NO.ak", 
	          method: "POST",
	          dataType : 'json',
	          contentType: "application/json",
	          data:  data,
	          success: function(retVal){
	        	 if (retVal.res == "OK"){
        	
	           	}else
        	 	{
        	 	}
	          },
	          error: function(e) {
	        	    console.log(e);
	        	  }
		  })
}
	
	
	function reload(){  
	location.reload();
}
	
</script> 

</html>