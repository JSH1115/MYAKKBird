<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.bit.myakkbird.mypage.*" %>

<%
	BoardVO board = (BoardVO)request.getAttribute("board");	//게시글정보
	String apply_cnt = (String)session.getAttribute("apply_cnt").toString();	//지원자 수
	
	String m_img = (String)session.getAttribute("m_img").toString();	//게시글작성한 회원프로필이미지
	String b_num= request.getParameter("b_num");			//게시글번호
	String e_id = (String)session.getAttribute("m_id");		//현재로그인한 아이디(요청하는사람.근로자)
	String c_id = board.getM_id();							//게시글 작성한 아이디(요청받는사람.회원)
	
	String apply_chk = (String)session.getAttribute("apply_chk");	//현재 게시글에 근로자가 신청한 이력이 있는지 체크 카운팅한 변수
	System.out.println(apply_chk+"문서에서 체크");

	
	//A:정기청소 B:특수청소 C:입주청소(이사청소) D:상주청소 E:빌딩청소 F:방역청소
	//카테고리 이미지도 같이 처리해주기
	String str = board.getB_category();
	String b_category = "", b_category_img="";
	
	switch(str){
		case "A" : b_category = "정기청소";
				   b_category_img = "vacuum.png";
				  break;
		case "B" : b_category = "특수장비청소";
				   b_category_img = "cleaning-tools.png";
		  		  break;
		case "C" : b_category = "입주청소(이사청소)";
				   b_category_img = "kitchen.png";
		 		  break;
		case "D" : b_category = "상주청소";
				   b_category_img = "maid.png";
		 		  break;
		case "E" : b_category = "빌딩청소";
				   b_category_img = "apartment.png";
				  break;
		case "F" : b_category = "방역";
				   b_category_img = "coronavirus.png";  		  
				  break;
		default  : b_category = "기타";
				   b_category_img = "img_default.png";
	}
	
%>
<!DOCTYPE html>
<html>
<head>
	<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mypage/detailStyle.css"> --%>
	<link rel="stylesheet" type="text/css" href="css/mypage/detailStyle.css"> <!-- 디테일페이지 css -->
	<!-- <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>  --> <!-- 모달창 -->
	<script src="resources/js/sweetAlert.js"></script>  <!-- 모달창 -->
<meta charset="UTF-8">
<title>BoardDetail</title>
</head>
<body>
	<!-- 요청하기 -->
	<input type="hidden" name="b_num" value="<%=b_num %>" />
	<input type="hidden" name="e_id" value="<%=e_id %>" />
	<input type="hidden" name="c_id" value="<%=c_id %>" />
	
	
	<div class="vDnl_">
	<div>
		<div class="_33cd2">
			<div class="_1t1Y8" role="button">
				<a href="javascript:history.back();">
				<img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/icon/icon-back%402x.png" 
					 width="28" height="46" alt="뒤로가기"></a>
			</div>
			<a class="danger_icon" href="./insertBoardDanger.ak?b_num=<%=board.getB_num()%>"><div class="_2kHD3" role="button">
				<img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/icon/icon-report%402x.png"
					 width="13" height="15" alt="신고하기">신고
			</div></a>
		</div>
		<div class="NHtEz">
			<div class="_3s0Sp" role="button">	<!-- 프로필이미지 -->
				<%if(m_img.equals("no_img")){ %>
					<img src="./resources/image/crocodile_profile.png" width="50" height="50">
				<%}else{ %>
					<img src="/myakkbird/myakkbirdUpload/<%=m_img%>" style="width:70px; height:70px;">
				<%} %>
			</div>
			<div class="_1EHsp"><%=board.getB_subject()%></div>
			<div class="_2cNHy">
				<div class="_2y3iE"><%=board.getM_name1() %>○<%=board.getM_name2() %></div>
				<div class="_2eHf6"></div>	<!-- 구분선| -->
				<span class="_3LAfL"> <%=board.getB_date() %> </span>
				<div class="_2eHf6"></div>	<!-- 구분선| -->
				<span class="_3LAfL">조회:<%=board.getB_readcount() %></span>
			</div>
		</div>
		<div class="_C2zw1T">
			<div class="CXIc6g">
				<div class="_C1Y9r0">
					<div class="_C3TIsb">근무시작일</div>
					<div class="_C1GMZ1 _C1mdUo"><%=board.getB_start() %></div>
				</div>
			</div>
			<div class="_C1gHH2"></div>	<!-- 구분선 -->
			<div class="CXIc6g">
				<div class="_C1Y9r0">
					<div class="_C3TIsb">근무종료일</div>
					<div class="_C1GMZ1 _C1mdUo"><%=board.getB_end() %></div>
				</div>	
			</div>
			<div class="_C1gHH2"></div>	<!-- 구분선 -->
			<div class="CXIc6g">
				<div class="_C1Y9r0">
					<div class="_C3TIsb">상세근무시간</div>
					<div class="_C1GMZ1 _C1mdUo"><%=board.getB_d_detail() %></div>
				</div>	
			</div>
		</div>
		<div>
			<div class="_2zw1T">
				<div class="XIc6g">	<!--지원자수  -->
					<svg xmlns="http://www.w3.org/2000/svg" width="43" height="43" viewBox="0 0 43 43">	<!-- 지원자 아이콘 -->
						<g fill="none" fill-rule="evenodd">
							<circle cx="21.5" cy="21.5" r="21.5" fill="#F2F3F5"></circle>
							<g fill="#82878A" fill-rule="nonzero">
								<path d="M28 17.025v2.597c0 .49.188.944.509 1.289v.882a.67.67 0 0 0 .663.682.67.67 0 0 0 .663-.682v-1.2a.69.69 0 0 0-.294-.564.486.486 0 0 1-.215-.407v-2.597c0-.91.724-1.654 1.608-1.654h.542c.884 0 1.608.744 1.608 1.654v2.597c0 .166-.08.317-.215.407a.672.672 0 0 0-.294.565v2.501c0 .303.174.586.435.717.315.158 1.95 1.006 3.463 2.28.127.11.2.269.2.448v1.096h-4.648a.67.67 0 0 0-.663.682.67.67 0 0 0 .663.682h5.312a.67.67 0 0 0 .663-.682V26.54c0-.585-.248-1.13-.69-1.502-1.333-1.123-2.76-1.943-3.41-2.294v-1.84c.322-.345.51-.8.51-1.288v-2.598c0-1.668-1.32-3.018-2.934-3.018h-.542C29.319 14.007 28 15.357 28 17.025zM5.663 29h5.392a.67.67 0 0 0 .663-.682.67.67 0 0 0-.663-.683H6.326V26.54c0-.172.074-.338.201-.448a18.641 18.641 0 0 1 3.463-2.282.796.796 0 0 0 .435-.717V20.59a.69.69 0 0 0-.294-.565.487.487 0 0 1-.215-.407V17.02c0-.91.724-1.654 1.608-1.654h.542c.884 0 1.608.744 1.608 1.654v2.6c0 .165-.08.316-.215.406a.673.673 0 0 0-.294.565v1.255c0 .379.294.682.663.682a.67.67 0 0 0 .663-.682v-.938c.321-.344.509-.8.509-1.289V17.02C15 15.351 13.68 14 12.066 14h-.542c-1.621 0-2.934 1.358-2.934 3.02v2.598c0 .49.188.945.51 1.29v1.84c-.657.351-2.077 1.165-3.41 2.295A1.97 1.97 0 0 0 5 26.546v1.772c0 .379.295.682.663.682z"></path>
								<path d="M25.412 17.061v-3.355c0-2.046-1.595-3.706-3.561-3.706h-.695c-1.966 0-3.562 1.66-3.562 3.706v3.355c0 .607.239 1.171.649 1.585v2.583c-.775.413-2.668 1.488-4.435 3.004A2.33 2.33 0 0 0 13 26.017v2.301c0 .379.291.682.655.682h15.69a.666.666 0 0 0 .655-.682v-2.301a2.33 2.33 0 0 0-.808-1.784c-1.767-1.509-3.66-2.59-4.435-3.004v-2.583c.417-.407.655-.978.655-1.585zm2.953 8.226c.212.179.33.448.33.73v1.619H14.318v-1.619c0-.282.12-.551.331-.73 1.947-1.667 4.058-2.776 4.462-2.983a.845.845 0 0 0 .45-.744v-3.238a.692.692 0 0 0-.29-.565.839.839 0 0 1-.358-.689v-3.355c0-1.295 1.012-2.342 2.25-2.342h.695c1.245 0 2.251 1.054 2.251 2.342v3.355a.83.83 0 0 1-.357.69.675.675 0 0 0-.291.564v3.238c0 .317.178.606.45.744.397.207 2.509 1.323 4.455 2.983z"></path>
							</g>
						</g>
					</svg>
					<div class="_1Y9r0">
						<div class="_3TIsb">지원자 수</div>
						<div class="_1GMZ1 _1mdUo">현재<%=apply_cnt %>명 </div>
					</div>
				</div>
				<div class="_1gHH2"></div>	<!-- 구분선 -->
				<div class="XIc6g">	<!-- 시급아이콘 -->
					<svg xmlns="http://www.w3.org/2000/svg" width="43" height="43" viewBox="0 0 43 43">
						<g fill="none" fill-rule="evenodd">
							<circle cx="21.5" cy="21.5" r="21.5" fill="#F2F3F5"></circle>
							<path fill="#767B7E" fill-rule="nonzero" d="M20.781 30.125h1.438v-1.438H20.78v1.438zm.719-17.25a.719.719 0 0 0-.719.719v7.205h-5.75a.719.719 0 0 0 0 1.437H21.5a.719.719 0 0 0 .719-.719v-7.923a.719.719 0 0 0-.719-.719zM14.84 26.41l.994.997.995-.997-.995-.996-.995.996zm2.127-10.428l-1.017-1.016-1.017 1.016 1.017 1.016 1.017-1.016zm8.9-.036l.995.997.995-.997-.995-.997-.995.997zm-.21 10.426l1.016 1.016 1.016-1.016-1.016-1.017-1.016 1.017zm3.03-5.59v1.437h1.438V20.78h-1.438zM21.5 10C15.148 10 10 15.15 10 21.5 10 27.852 15.148 33 21.5 33S33 27.85 33 21.5 27.852 10 21.5 10zm0 21.563c-5.557 0-10.063-4.506-10.063-10.063S15.944 11.437 21.5 11.437 31.563 15.944 31.563 21.5 27.056 31.563 21.5 31.563z"></path>
						</g>
					</svg>
					<div class="_1Y9r0">	<!-- 시급 -->
						<div class="_3TIsb">시급</div>
						<div class="_1GMZ1"><%=board.getB_money() %></div>
					</div>
				</div>
			</div>
		</div>
		
		<div>
			<div class="_D2zw1T">
				<div class="DXIc6g">
					<div class="_D1Y9r0">
						<div class="_D3TIsb">요청사항</div>
						<div class="_DconBox">
							<div class="_D1GMZ1 _D1mdUo"><%=board.getB_content() %></div>
						</div>
					</div>
				</div>
				<div class="_D1gHH2"></div>	<!-- 구분선 -->
				<div class="DXIc6g">
					<div class="_D1Y9r0">
						<div class="_D3TIsb">지도</div>
						<div class="_DconBox"> <!-- 지도 이미지 -->
							<div class="_D1GMZ1 _D1mdUo"><div id="map" style="width:100%;height:300px;"></div></div>
						</div>
					</div>	
				</div>
			</div>
		</div>
		
		<div>
			<div class="_E2zw1T">
				<div class="EXIc6g">
					<svg xmlns="http://www.w3.org/2000/svg" width="43" height="43" viewBox="0 0 43 43">	<!-- 카테고리 아이콘 -->
						<img class="post_top_img" src="./resources/image/<%=b_category_img%>">
					</svg>
					<div class="_E1Y9r0">
						<div class="_E3TIsb"><%=b_category %></div>
					</div>
				</div>
				<div class="_E1gHH2"></div>	<!-- 구분선 -->
				<div class="EXIc6g">
					<%if(board.getB_up_file() == null){ %>
						<img src="./resources/image/x_img.png" width="50" height="50">
					<%}else { %>
						<img src="/myakkbird/myakkbirdUpload/<%=board.getB_up_file() %>" width="50" height="50" onclick="big_img('http://localhost:8080/myakkbird/myakkbirdUpload/<%=board.getB_up_file() %>')">
					<%} %>
					<div class="_E1Y9r0">
						<div class="_E3TIsb">첨부사진</div>
					</div>	
				</div>
				<div class="_E1gHH2"></div>	<!-- 구분선 -->
				
				<%-- <%if(apply_chk.equals("0")) {%> --%>
				<%if(apply_chk == null) {%>
				<div class="EXIc6g">
					<svg xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 24 24" viewBox="0 0 24 24" fill="#37B04B" width="48px" height="48px"><g><rect fill="none" height="24" width="24" x="0"/></g><g><g><g><path d="M9,11.24V7.5C9,6.12,10.12,5,11.5,5S14,6.12,14,7.5v3.74c1.21-0.81,2-2.18,2-3.74C16,5.01,13.99,3,11.5,3S7,5.01,7,7.5 C7,9.06,7.79,10.43,9,11.24z M18.84,15.87l-4.54-2.26c-0.17-0.07-0.35-0.11-0.54-0.11H13v-6C13,6.67,12.33,6,11.5,6 S10,6.67,10,7.5v10.74c-3.6-0.76-3.54-0.75-3.67-0.75c-0.31,0-0.59,0.13-0.79,0.33l-0.79,0.8l4.94,4.94 C9.96,23.83,10.34,24,10.75,24h6.79c0.75,0,1.33-0.55,1.44-1.28l0.75-5.27c0.01-0.07,0.02-0.14,0.02-0.2 C19.75,16.63,19.37,16.09,18.84,15.87z"/></g></g></g></svg>
					<div class="_E1Y9r0">
						<div class="_E3TIsb">처음신청하기</div>
					</div>
				</div>
				<%}else{ %>
				<div class="EXIc6g_ard">
					<svg xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 24 24" viewBox="0 0 24 24" fill="#37B04B" width="48px" height="48px"><g><rect fill="none" height="24" width="24" x="0"/></g><g><g><g><path d="M9,11.24V7.5C9,6.12,10.12,5,11.5,5S14,6.12,14,7.5v3.74c1.21-0.81,2-2.18,2-3.74C16,5.01,13.99,3,11.5,3S7,5.01,7,7.5 C7,9.06,7.79,10.43,9,11.24z M18.84,15.87l-4.54-2.26c-0.17-0.07-0.35-0.11-0.54-0.11H13v-6C13,6.67,12.33,6,11.5,6 S10,6.67,10,7.5v10.74c-3.6-0.76-3.54-0.75-3.67-0.75c-0.31,0-0.59,0.13-0.79,0.33l-0.79,0.8l4.94,4.94 C9.96,23.83,10.34,24,10.75,24h6.79c0.75,0,1.33-0.55,1.44-1.28l0.75-5.27c0.01-0.07,0.02-0.14,0.02-0.2 C19.75,16.63,19.37,16.09,18.84,15.87z"/></g></g></g></svg>
					<div class="_E1Y9r0_ard">
						<div class="_E3TIsb_ard">이미신청했지</div>
					</div>
				</div>
				<%} %>
			
			</div>
		</div>
		
		<!-- 댓글리스트 -->
		<jsp:include page="./comments.jsp">
			<jsp:param name="b_num" value="<%=board.getB_num() %>" />
		</jsp:include>
		
	</div>
	</div>
	
	
	<script>
		$(document).ready(function() {
			apply_match_chk();
		});
	
		//이미지 띄우는 모달창
		function big_img(up_img) {
			Swal.fire({
				  title: 'Sweet!',
				  text: '악어님이 업로드한 사진이에요.',
				  imageUrl: up_img,
				  imageWidth: 550,
				  imageHeight: 350,
				  confirmButtonColor:'#37B04B',
				  confirmButtonText:'OK'
			})  
		}
		//신청하기 모달창
		$('.EXIc6g:nth-last-child(1)').click(function (event) {
			Swal.fire({
				  title: '매칭을 원해요!',
				  text: "매칭 신청시 1 하트가 차감됩니다",
				  icon: 'info',
				  iconColor: '#37B04B',
				  showCancelButton: true,
				  confirmButtonColor: '#37B04B',
				  cancelButtonColor: '#E6E6E6',
				  confirmButtonText: '<div onclick="apply_match()">신청 할래요</div>',
				  cancelButtonText:'다음에 할게요',
				})
		});	

		$('.EXIc6g_ard').click(function (event) {
			Swal.fire({
				  title: 'Aleady applied?',
				  text: "이미 매칭 신청을 완료한 게시물 입니다!",
				  icon: 'info',
				  iconColor: '#37B04B',
				  showCancelButton: true,
				  confirmButtonColor: '#37B04B',
				  cancelButtonColor: '#E6E6E6',
				  confirmButtonText: '<div onclick="">신청내역보기</div>',
				  cancelButtonText:'Close',
				})
		});	

		
		var b_num = $('[name=b_num]').val();
		var c_id = $('[name=c_id]').val();
		var e_id = $('[name=e_id]').val();
		
		//매칭 신청전 신청내역 체크
		function apply_match_chk() {
   			$.ajax({
				url : '/myakkbird/apply_match_chk.ak',
				type : 'POST',
				data : {'b_num':b_num,'e_id':e_id },
				dataType : 'json',
				contentType : 'application/x-www-form-urlencoded; charset=utf-8',
				success : function(data) {
					alert("싱청내역체크성공");
				},
				error:function() {
					alert("ajax 통신 실패(매칭 신청전 체크 통신)!!!");
				}
			}); 
		}
		
		//매칭 신청하기 통신
		function apply_match() {
   			$.ajax({
				url : '/myakkbird/apply_match.ak',
				type : 'POST',
				data : {'b_num':b_num,'c_id':c_id,'e_id':e_id },
				dataType : 'json',
				contentType : 'application/x-www-form-urlencoded; charset=utf-8',
				success : function(data) {
					if(data == 1){
					    Swal.fire({
					    	icon: 'success',
					    	title:'신청 완료!',
					    	text:'매칭수락 시, 곧 악어님을 만날 수 있어요!',	
					    	showConfirmButton: false
					    })
					}
				},
				error:function() {
					alert("ajax 통신 실패(매칭 신청하기 통신)!!!");
				}
			}); 
		}
	</script>
	
	<!-- 다음지도api -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3cbd93568d5ed61c52a1851035124ae3&libraries=services"></script>
	<script>
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  
	

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('<%=board.getB_address_road()%>', function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
	</script>
</body>
</html>