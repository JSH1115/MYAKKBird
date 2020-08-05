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
	<!-- DangerList.css style 파일 -->
	<link rel="stylesheet" type="text/css" href="resources/css/admin/DangerList.css">
	<!-- DangerList.css style 파일 -->

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
<!-- DangerList.js 파일 -->
<script type="text/javascript" src="./resources/js/admin/DangerList.js"></script>
<!-- DangerList.js 파일 -->

</html>