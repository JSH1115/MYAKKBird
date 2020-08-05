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
	<title>마이악어새 관리자 매칭목록</title>
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
	<!-- matchingList.css style 파일 -->
	<link rel="stylesheet" type="text/css" href="resources/css/admin/matchingList.css">
	<!-- matchingList.css style 파일 -->
	<!-- chart API 시작 -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
	<!-- chart API 끝 -->
</head>
<body>
<!-- header zone -->
<jsp:include page="../header_container.jsp">
	<jsp:param value="m_id" name="m_id"/>
</jsp:include> 
<!-- header zone -->
	<form name="frm">
    <input type="hidden" name="pageNo" /><!-- //페이지 번호 -->
    <input type="hidden" name="searchFiled" value="${pageVO.searchFiled }" /><!-- //검색조건 -->
    <input type="hidden" name="searchValue" value="${pageVO.searchValue }" /><!-- //검색어 -->
    <input type="hidden" name="m_statusFiled" value="m_status" /><!-- //검색어 -->
    <input type="hidden" name="m_statusValue" value="${pageVO.m_statusValue }" /><!-- //검색어 -->
    <input type="hidden" name="m_typeFiled" value="m_type" /><!-- //검색어 -->
    <input type="hidden" name="m_typeValue" value="${pageVO.m_typeValue }" /><!-- //검색어 -->
    <input type="hidden" name="a_applyFiled" value="a_apply" /><!-- //검색어 -->
    <input type="hidden" name="a_applyValue" value="${pageVO.a_applyValue }" /><!-- //검색어 -->	
    	<div class="top_div">
    		<div class="addClass">
			</div>
			<div class="titleClass">
				<h3>마이악어새 매칭목록</h3>
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
						<b>* 매칭여부</b>&nbsp;
	    				<input type="radio" name="a_apply" id="a_apply_D" value="D">
	    				<label for="a_apply_D">미확인</label>&nbsp;
	    				<input type="radio" name="a_apply" id="a_apply_Y" value="Y">
	    				<label for="a_apply_Y">매칭완료</label>&nbsp;
	    				<input type="radio" name="a_apply" id="a_apply_N" value="N">
	    				<label for="a_apply_N">매칭전</label><br>
	    					<b id="listCounut">검색된 매칭 <%=listcount %>건</b>
						</div>
	    			<div class="search_zone">
				        <select id="searchS">
				            <option value="c_id">작성ID</option>
				            <option value="e_id">매칭ID</option>
				            <option value="a_date">매칭날짜</option>
				            <option value="b_subject">제목</option>
				        </select>
				        <input type="button" id="s_btn" value="검색" onclick="fn_search();"/>
				        <input type="text" id="searchI"/>
	    			</div>
	    		</div>
    		</div>
    		<div class="stats_zone">
    			<div class="stats_left">
    				<b id="chart_txt">- 마이악어새 매칭 현황 -</b><br>
    				<div class="stats_chart">
	    				<canvas id="myChart"></canvas>
	    			</div>
	    			<span id="if_m"></span>
    			</div>
    			<div class="stats_right">
    				<div class="stats_info">
    					<b id="info_txt">* 마이악어새 매칭 수</b>
    					<div class="stats_interval">
		    		
		    				&nbsp;<b>미확인 : </b>&nbsp;<span id="d_num"></span>건<br>
	    				</div>
	    				<div class="stats_interval">
		    				
		    				&nbsp;<b>매칭 완료 : </b>&nbsp;<span id="y_num"></span>건<br>
	    				</div>
	    				<div class="stats_interval">
		    				
		    				&nbsp;<b>매칭 전 : </b>&nbsp;<span id="n_num"></span>건<br>
	    				</div>
	    				<div class="stats_interval">
		    				
		    				&nbsp;<b>총 매칭 : </b>&nbsp;<span id="all_num"></span>건<br>
	    				</div>
    				</div>
    				
    				<div class="m_addr_info">
    					<b id="info_txt">* 가장 많은 매칭 지역</b>
    					<div class="m_addr_interval">
	    					<ul id="addr_top">
	    					</ul>
    					</div>
    				</div>
    			</div>
    		</div>
    	</div>
	<div class="member_zone">
	        <table class="table table-hover">
	            <thead>
	                <tr>
	                	<th>게시물</th>
	                    <th>작성자 ID</th>
	                    <th>매칭자 ID</th>
	                    <th>매칭 상황</th>
	                    <th>매칭 날짜</th>
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
				                <tr id="member_list"  align="center" valign="middle">
				           			
				                	<td><div class="t_div"><span><a href="./BoardDetail.ak?b_num=${resutList.b_num}&e_id=${m_id}">${resutList.b_subject}</a></span></div></td>
				                	<td onclick="detail_member('${resutList.c_id}');"><div class="t_div"><b><span>${resutList.c_id}</span></b></div></td>
				                    <td onclick="detail_member('${resutList.e_id}');"><div class="t_div"><b><span>${resutList.e_id}</span></b></div></td>
				                    <c:choose>
				                    	<c:when test="${resutList.a_apply eq 'D'}">
				                  				<td><div class="t_div"><span>미확인</span></div></td>
				                    	</c:when>
				                    	<c:when test="${resutList.a_apply eq 'Y'}">
				                  				<td><div class="t_div"><span>매칭 완료</span></div></td>
				                    	</c:when>
				                    	<c:when test="${resutList.a_apply eq 'N'}">
				                  				<td><div class="t_div"><span>매칭 전</span></div></td>
				                    	</c:when>
				                    </c:choose>
				                    <td><div class="t_div"><span>${resutList.a_date}</span></div></td>
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
<!-- matchingList.js 파일 -->
<script type="text/javascript" src="./resources/js/admin/matchingList.js"></script>
<!-- matchingList.js 파일 -->

</html>