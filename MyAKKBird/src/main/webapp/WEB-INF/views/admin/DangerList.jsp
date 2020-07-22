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
	<link rel="stylesheet" type="text/css" href="fonts/font.css">
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
			margin: 0 auto;
			font-family: "NotoSansKR-Regular";
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
			width: 350px;
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
		a:hover{
			text-decoration:none;
		}
		th{
			font-family: "NotoSansKR-Bold";
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
	    <div class="center_div">
	    	<div class="search_zone">
		        <select id="searchS">
		            <option value="m_id">신고자ID</option>
		            <option value="d_id">피신고자ID</option>
		             <option value="b_num">신고 게시물</option>
		              <option value="d_date">신고 날짜</option>
		        </select>
		        <input type="button" id="s_btn" value="검색" onclick="fn_search();"/>
		        <input type="text" id="searchI"/>
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
	                    <th>신고 게시물</th>
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
				                	<td ><span>${resutList.d_date}</span></td>
				                	<c:choose>
				                    	<c:when test="${resutList.d_type eq 'A'}">
				                  				<td><span>허위정보</span></td>
				                    	</c:when>
				                    	<c:when test="${resutList.d_type eq 'B'}">
				                  				<td><span>음란성</span></td>
				                    	</c:when>
				                    	<c:when test="${resutList.d_type eq 'C'}">
				                  				<td><span>도배/홍보</span></td>
				                    	</c:when>
				                    	<c:when test="${resutList.d_type eq 'D'}">
				                  				<td><span>규정위반</span></td>
				                    	</c:when>
				                    </c:choose>
				                    <td onclick="detail_member('${resutList.m_id}');"><span>${resutList.m_id}</span></td>
				                    <td onclick="detail_member('${resutList.d_id}');"><span>${resutList.d_id}</span></td>
				                    <td><span><a href="./BoardDetail.ak?b_num=${resutList.b_num}&e_id=${m_id}">${resutList.b_subject}</a></span></td>
				                    <td><span>${resutList.d_con}</span></td>
				                    <td onclick="danger_status('${resutList.d_id}');"><span>${resutList.d_status}</span></td>
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
		        '<span>ID : '+ m_id + '</span>',
			  confirmButtonColor: '#37B04B',
			  confirmButtonText:
			    '확인'
		})
    }
    
    function detail_member(d_id) {
    	Swal.fire({
			  html: 
		        '<b class="mw_txt">회원 정보</b><br>' + 
		        '<span>ID : '+ d_id + '</span>',
			  confirmButtonColor: '#37B04B',
			  confirmButtonText:
			    '확인'
		})
    }
    
    
    function danger_status(d_id) {
    	Swal.fire({
			  title: d_id,
			  text : '제재 하시겠습니다?',
			  icon : 'info',
			  showCancelButton: true,
			  confirmButtonText: '예',
			  confirmButtonColor:'#37B04B',
			  cancelButtonText: '아니요'			
		}).then((result) => {
			  if (result.value) {
				  	dangerOK(d_id);	
				  	reload(); 
				  } else if (result.dismiss === Swal.DismissReason.cancel) {
				    dangerNO(d_id);
				    reload(); 
				  }
				}) 
    }
     
    function dangerOK(d_id){
    	  var data = d_id;
    	 
    	 jQuery.ajax({
	          url: "./danger_OK.ak", 
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
 	function dangerNO(d_id){
 		  var data = d_id;
     	 
     	 jQuery.ajax({
 	          url: "./danger_NO.ak", 
 	          method: "POST",
 	          dataType : 'json',
 	          contentType: "application/json",
 	          data: data,
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