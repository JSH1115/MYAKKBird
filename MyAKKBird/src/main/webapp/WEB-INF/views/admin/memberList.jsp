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
	<title>마이악어새 관리자 회원목록</title>
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
	<!-- memberList.css style 파일 -->
	<link rel="stylesheet" type="text/css" href="resources/css/admin/memberList.css">
	<!-- memberList.css style 파일 -->
</head>
<body>
<!-- header zone -->
<jsp:include page="../header_container.jsp">
	<jsp:param value="m_id" name="m_id"/>
</jsp:include> 
<!-- header zone -->
	<form name="frm">
    <input type="hidden" name="pageNo" />									        <!-- 페이지 번호 -->
    <input type="hidden" name="searchFiled" value="${pageVO.searchFiled }" />       <!-- 검색조건 -->
    <input type="hidden" name="searchValue" value="${pageVO.searchValue }" />       <!-- 검색어 -->
    <input type="hidden" name="m_statusFiled" value="m_status" />				    <!-- 탈퇴여부 -->
    <input type="hidden" name="m_statusValue" value="${pageVO.m_statusValue }" />   <!-- 체크값 -->
    <input type="hidden" name="m_typeFiled" value="m_type" />						<!-- 회원타입 -->
    <input type="hidden" name="m_typeValue" value="${pageVO.m_typeValue }" />       <!-- 체크값 -->
    	<div class="top_div">
    		<div class="addClass">
			</div>
			<div class="titleClass">
				<h3>마이악어새 회원목록</h3>
			</div>
    		<div class="left_zone">
    			<div class="admin_zone">
    				<!-- 운영자 프로필 -->
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
	    			<!-- 운영자 프로필 -->
    			</div>
    			<div class="search_div">
    				<!-- 검색 조건 -->
   					<div class="check_zone">
   						<b>* 회원유형</b>&nbsp;
	    				<input type="radio" name="m_type" id="m_type_C" value="C">&nbsp;
	    				<label for="m_type_C">고객</label>&nbsp;
	    				<input type="radio" name="m_type" id="m_type_E" value="E">&nbsp;
	    				<label for="m_type_E">근로자</label><br>
	    				<div class="check_zone2">
		    				<b>* 탈퇴여부</b>&nbsp;
		    				<input type="radio" name="m_status" id="m_status_Y" value="Y">&nbsp;
		    				<label for="m_status_Y">탈퇴</label>&nbsp;
		    				<input type="radio" name="m_status" id="m_status_N" value="N">&nbsp;
		    				<label for="m_status_N">활동중</label>
		    				<b id="listCounut">검색된 회원 <%=listcount %>명</b><br>
	    				</div>
   					</div>
   					<!-- 검색 조건 -->
   					<!-- 검색 input, select -->
	    			<div class="search_zone">
				        <select id="searchS">
				            <option value="m_id">아이디</option>
				            <option value="m_name">이름</option>
				            <option value="m_email">이메일</option>
				            <option value="m_address_road">주소</option>
				        </select>
				        <input type="button" id="s_btn" value="검색" onclick="fn_search();"/>
				        <input type="text" id="searchI"/>
	    			</div>
	    			<!-- 검색 input, select -->
	    		</div>
    		</div>
    		<!-- 마이악어새 회원 통계 창 -->
    		<div class="stats_zone">
    			<div class="stats_left">
    				<b id="chart_txt">- 마이악어새 회원 분포 -</b><br>
    				<div class="stats_chart">
	    				<canvas id="myChart"></canvas>
	    			</div>
	    			<span id="if_m"></span>
    			</div>
    			<div class="stats_right">
    				<div class="stats_info">
    					<b id="info_txt">* 마이악어새 회원 수</b>
    					<div class="stats_interval">
		    				<img class="stats_img" src="./resources/image/crocodile_profile.png">
		    				&nbsp;<b>고객 수 : </b>&nbsp;<span id="c_num"></span>명<br>
	    				</div>
	    				<div class="stats_interval">
		    				<img class="stats_img" src="./resources/image/bird_profile.png">
		    				&nbsp;<b>근로자 수 : </b>&nbsp;<span id="e_num"></span>명<br>
	    				</div>
	    				<div class="stats_interval">
		    				<img class="stats_img" src="./resources/image/admin_profile.png">
		    				&nbsp;<b>총회원 수 : </b>&nbsp;<span id="all_num"></span>명<br>
	    				</div>
    				</div>
    				<div class="m_status_info">
    					<b id="info_txt">* 탈퇴 회원 수</b>
    					<div class="m_status_interval">
							<svg class="m_status_img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#37B04B" width="25px" height="25px"><path d="M0 0h24v24H0V0z" fill="none"/><path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v1c0 .55.45 1 1 1h14c.55 0 1-.45 1-1v-1c0-2.66-5.33-4-8-4z"/></svg>
							<b class="m_status_txt">활동중 : &nbsp;</b><span id="mn_num" class="m_status_txt2"></span><span class="m_status_txt2">명</span>
							<svg class="m_status_img2" xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 24 24" viewBox="0 0 24 24" fill="#37B04B" width="25px" height="25px"><g><rect fill="none" height="24" width="24"/><rect fill="none" height="24" width="24"/></g><g><path d="M14,8c0-2.21-1.79-4-4-4S6,5.79,6,8s1.79,4,4,4S14,10.21,14,8z M2,18v1c0,0.55,0.45,1,1,1h14c0.55,0,1-0.45,1-1v-1 c0-2.66-5.33-4-8-4S2,15.34,2,18z M18,10h4c0.55,0,1,0.45,1,1v0c0,0.55-0.45,1-1,1h-4c-0.55,0-1-0.45-1-1v0 C17,10.45,17.45,10,18,10z"/></g></svg>
    						<b class="m_status_txt">탈퇴 : &nbsp;</b><span id="my_num" class="m_status_txt2"></span><span class="m_status_txt2">명</span>
    					</div>
    				</div>
    				<div class="m_addr_info">
    					<b id="info_txt">* 가장 많이 사는 지역</b>
    					<div class="m_addr_interval">
	    					<ul id="addr_top">
	    					</ul>
    					</div>
    				</div>
    			</div>
    		</div>
	    	<!-- 마이악어새 회원 통계 창 -->
    	</div>
	    <div class="member_zone">
	    	<!-- 회원 테이블 -->
	        <table class="table table-hover">
	            <thead>
	                <tr>
	                	<th>프로필 사진</th>
	                    <th>아이디</th>
	                    <th>이름</th>
	                    <th>성별</th>
	                    <th>주소</th>
	                    <th>전화번호</th>
	                    <th>이메일</th>
	                    <th>회원구분</th>
	                    <th>탈퇴여부</th>
	                </tr>
	            </thead>
	            <tbody>
	            	<c:choose>
	            		<c:when test="${empty resultList}">
		            		<tr>
	            				<td colspan="9"><div class="no_zone"><b>회원이 없습니다. 다시 검색해주세요!</b></div></td>
	        				</tr>
        				</c:when>
	            		<c:otherwise>
			            	<c:forEach items="${resultList}" var="resutList">
				                <tr id="member_list" align="center" onclick="detail_member('${resutList.m_id}')">
                    				<td><img class="profile_img" src="/myakkbird/myakkbirdUpload/${resutList.m_photo}"></td>
				                	<td><div class="t_div"><b>${resutList.m_id}</b></div></td>
				                    <td><div class="t_div"><span>${resutList.m_name}</span></div></td>
				                    <c:choose>
				                    	<c:when test="${resutList.m_gender eq 'M'}">
						                    <td><div class="t_div"><span>남</span></div></td>
				                    	</c:when>
				                    	<c:otherwise>
				                    		<td><div class="t_div"><span>여</span></div></td>
				                    	</c:otherwise>
				                    </c:choose>
				                    <td><div class="t_div"><span>${resutList.m_address_road}</span></div></td>
				                    <td><div class="t_div"><span>${resutList.m_phone}</span></div></td>
				                    <td><div class="t_div"><span>${resutList.m_email}</span></div></td>
				                    <c:choose>
				                    	<c:when test="${resutList.m_type eq 'C'}">
						                    <td><div class="t_div"><b>고객</b></div></td>
				                    	</c:when>
				                    	<c:otherwise>
				                    		<td><div class="t_div"><b>근로자</b></div></td>
				                    	</c:otherwise>
				                    </c:choose>
				                    <c:choose>
				                    	<c:when test="${resutList.m_status eq 'N'}">
						                    <td><div class="t_div"><b>활동중</b></div></td>
				                    	</c:when>
				                    	<c:otherwise>
				                    		<td><div class="t_div"><b>탈퇴</b></div></td>
				                    	</c:otherwise>
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
    <!-- footer zone -->
    <jsp:include page="../footer_container.jsp">
		<jsp:param value="" name=""/>
	</jsp:include> 
	<!-- footer zone -->
</body>
<!-- memberList.js 파일 -->
<script type="text/javascript" src="./resources/js/admin/memberList.js"></script>
<!-- memberList.js 파일 -->
</html>