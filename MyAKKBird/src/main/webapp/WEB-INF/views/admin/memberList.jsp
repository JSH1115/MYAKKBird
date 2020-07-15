<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="com.bit.myakkbird.mainpoint.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마이 악어새</title>
	<!-- 스타일 조정 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
  	<!-- 스타일 조정 -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<!-- alert창 API 시작 -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<!-- alert창 API 끝 -->
	<style>
		/* 전체 적용 */
		body {
			margin: 0 auto;
		}
		
		table {
			width: 1000px;
			margin: 0 auto;
		}
		
		table thead th {
			text-align: center;
			font-size: 15px; 
		}
		
		table tbody span {
			margin-top: 10px;
		}
		/* 전체 적용 */
		
		.top_div {
			margin: 0 auto;
			width: 1000px;
			height: 220px;
			border: 1px solid black;
		}
		
		.admin_zone {
			float: left;
			width: 480px;
			height: 220px;
			border: 1px solid black;
			
		}
		
		.stats_zone {
			float: right;
			width: 500px;
			height: 220px;
			border: 1px solid black;
		}
		
		.center_div {
			width: 1000px;
			height: 30px;
			margin: 10px auto;
		}
		
		.search_zone {
			width: 315px;
			height: 30px;
			float: right;			
		}
		
		#searchS {
			height: 30px;
		}
		
		#searchI {
			width: 180px;
			height: 30px;
			float: right;
			margin-right: 4px;
		}
		
		#s_btn {
			background-color: #37B04B;
			color: white;
			width: 60px;
			height: 30px;
			border: 0;
			border-radius: 3px;
			float: right;
		}
		
		.member_zone {
			width: 1000px;
			height: auto;
			margin: 10px auto;
		}
		
		.profile_img {
			width:45px; 
			height:45px;
			border-radius: 22.5px;
			border: 1px solid #d3d3d3;
		}
		
		#num_zone {
			width: 1000px;
			height: auto;
			margin: -30px auto;
			text-align: center;
		}
		
		#member_list {
			cursor: pointer;
		}
		
		.header {
			width: 100%;
			height: 80px;
		}
	</style>
</head>
<body>
	<form name="frm">
    <input type="hidden" name="pageNo" /><!-- //페이지 번호 -->
    <input type="hidden" name="searchFiled" value="${pageVO.searchFiled }" /><!-- //검색조건 -->
    <input type="hidden" name="searchValue" value="${pageVO.searchValue }" /><!-- //검색어 -->
    	<div class="header">
    	</div>
    	<div class="top_div">
    		<div class="admin_zone">
    		</div>
    		<div class="stats_zone">
    			
    		</div>
    	</div>
	    <div class="center_div">
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
	    </div>
	    <div class="member_zone">
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
	            				<td colspan="9">회원이 없습니다. 다시 검색해주세요!</td>
	        				</tr>
        				</c:when>
	            		<c:otherwise>
			            	<c:forEach items="${resultList}" var="resutList">
				                <tr id="member_list" onclick="detail_member('${resutList.m_id}');" align="center">
				                	<c:choose>
				                    	<c:when test="${resutList.m_type eq 'C'}">
				                    		<c:choose>
				                    			<c:when test="${empty resutList.m_photo}">
				                    				<td><img class="profile_img" src="./resources/image/crocodile_profile.png"></td>
				                    			</c:when>
				                    			<c:otherwise>
				                    				<td><img class="profile_img" src="/myakkbird/myakkbirdUpload/${resutList.m_photo}"></td>
				                    			</c:otherwise>
				                    		</c:choose>
				                    	</c:when>
				                    	<c:otherwise>
				                    		<c:choose>
				                    			<c:when test="${empty resutList.m_photo}">
				                    				<td><img class="profile_img" src="./resources/image/bird_profile.png"></td>
				                    			</c:when>
				                    			<c:otherwise>
				                    				<td><img class="profile_img" src="/myakkbird/myakkbirdUpload/${resutList.m_photo}"></td>
				                    			</c:otherwise>
				                    		</c:choose>
				                    	</c:otherwise>
				                    </c:choose>
				                	<td><span>${resutList.m_id}</span></td>
				                    <td><span>${resutList.m_name}</span></td>
				                    <c:choose>
				                    	<c:when test="${resutList.m_gender eq 'M'}">
						                    <td><span>남</span></td>
				                    	</c:when>
				                    	<c:otherwise>
				                    		<td><span>여</span></td>
				                    	</c:otherwise>
				                    </c:choose>
				                    <td><span>${resutList.m_address_road}</span></td>
				                    <td><span>${resutList.m_phone}</span></td>
				                    <td><span>${resutList.m_email}</span></td>
				                    <c:choose>
				                    	<c:when test="${resutList.m_type eq 'C'}">
						                    <td><span>고객</span></td>
				                    	</c:when>
				                    	<c:otherwise>
				                    		<td><span>근로자</span></td>
				                    	</c:otherwise>
				                    </c:choose>
				                    <c:choose>
				                    	<c:when test="${resutList.m_status eq 'N'}">
						                    <td><span>탈퇴안함</span></td>
				                    	</c:when>
				                    	<c:otherwise>
				                    		<td><span>탈퇴함</span></td>
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
					            <li>
					            	<a href="javascript:fn_movePage(${pageVO.firstPageNo})" style="text-decoration: none;">&lt;&lt;</a>
					            </li>
					       </c:if>
					       <c:if test="${pageVO.pageNo != 1}">
					           <li>
					               <a href="javascript:fn_movePage(${pageVO.prevPageNo})" style="text-decoration: none;">&lt;</a>
					           </li>
					        </c:if>
					            <c:forEach var="i" begin="${pageVO.startPageNo}" end="${pageVO.endPageNo}" step="1">
					                <c:choose>
					                    <c:when test="${i eq pageVO.pageNo}">
					                        <li class="page-item">
					                        	<a href="javascript:fn_movePage(${i})" style="text-decoration: none;">
					                            	<font style="font-weight: bold;">${i}</font>
					                        	</a>
					                        </li>
					                    </c:when>
					                    <c:otherwise>
					                        <li class="page-item">
					                        	<a href="javascript:fn_movePage(${i})" style="text-decoration: none;">${i}</a>
					                        </li>
					                    </c:otherwise>
					                </c:choose>
					            </c:forEach>
					        <c:if test="${pageVO.pageNo != pageVO.finalPageNo }">
					            <li class="page-item">
					            	<a href="javascript:fn_movePage(${pageVO.nextPageNo})" style="text-decoration: none;">&gt;</a>
					            </li>
					        </c:if>
					        <c:if test="${pageVO.endPageNo < pageVO.finalPageNo }">
					            <li class="page-item">
					            	<a href="javascript:fn_movePage(${pageVO.finalPageNo})" style="text-decoration: none;">&gt;&gt;</a>
					            </li>
					        </c:if>
				    	</c:if>
			    	</ul>	
	        	</div>
	    	</c:otherwise>
	    </c:choose>
    </form>
</body>
<script type="text/javascript">
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
        jQuery("input[name=searchValue]").val(searchValue);
   
        jQuery("input[name=pageNo]").val("1");
        jQuery("form[name=frm]").attr("method", "post");
        jQuery("form[name=frm]").attr("action","").submit();
    }
    
    function detail_member(m_id) {
    	Swal.fire({
			  html: 
		        '<b class="mw_txt">회원 정보</b>' + 
		        '<span></span>',
			  confirmButtonColor: '#37B04B',
			  confirmButtonText:
			    '확인'
		})
    }
</script> 

</html>