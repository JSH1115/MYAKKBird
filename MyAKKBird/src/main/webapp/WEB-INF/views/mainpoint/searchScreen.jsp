<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bit.myakkbird.mainpoint.*" %>
<%
	String addr = (String)request.getAttribute("b_address_road");
	String m_id = (String)request.getAttribute("m_id");
	System.out.println("검색한 주소 : " + addr);
	System.out.println("현재 세션 아이디 : " + m_id);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마이악어새 악어 찾기</title>
	<!-- favicon 적용 -->
	<link type="image/x-icon" rel="icon" href="./resources/image/akk_favicon.png">
	<!-- favicon 적용 -->
  	<!-- jQuery 자동 완성 -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  	<!-- jQuery 자동 완성 -->
  	<!-- 카카오 지도 API 시작 -->
  	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3cbd93568d5ed61c52a1851035124ae3&libraries=services"></script>
  	<!-- 카카오 지도 API 끝 -->
  	<!-- 시간 설정 API 시작 -->
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
  	<!-- 시간 설정 API 끝 -->
  	<!-- alert창 API 시작 -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<!-- alert창 API 끝 -->
	<!-- searchSreen.css style 파일 -->
	<link rel="stylesheet" type="text/css" href="./resources/css/mainpoint/searchScreen.css">
	<!-- searchSreen.css style 파일 -->
</head>
<body>
	<!-- header zone -->
	<jsp:include page="../header_container.jsp">
		<jsp:param value="m_id" name="m_id"/>
	</jsp:include> 
	<!-- header zone -->
	<div class="addClass">
	</div>
	<div class="screen_Top">
		<div class="screen_Top_text">
			<b class="screen_t_sub"><strong>악어</strong>를 찾고 싶은 지역,</b><br>
			<span class="screen_t_sub2">위치와 청소 종류를  찾아 검색하세요.</span>
			<b class="screen_t_rogo_txt">청소는 역시 마이 <b>악어새</b></b>
		</div>
		<hr class="top_hr">
		<div class="screen_Top_form">
			<form name="search_form_name" id="search_form" method="post">
				<div class="search_form_text">
					<b class="search_f_sub">청소 지역</b><br>
					<div class="input_div">
						<!-- 주소 검색 input -->
						<span>* 지번 주소로 검색</span>
						<input type="text" class="search_input" name="b_address_road" id="autoText"
						       placeholder="  주소를 입력해주세요."/>
						<!-- 주소 검색 input -->
					</div>
					<div class="choice_div">
						<!-- 검색 조건 버튼 -->
						<ul>
							<li>
								<input type="radio" class="choice" id="choice1" name="choice" value="ND">
								<label for="choice1"><div class="c1"></div></label>
							</li>
							<li>
								<input type="radio" class="choice" id="choice2" name="choice" value="MM">
								<label for="choice2"><div class="c2"></div></label>
							</li>
							<li>
								<input type="radio" class="choice" id="choice3" name="choice" value="MS">
								<label for="choice3"><div class="c3"></div></label>
							</li>
						</ul>
						<!-- 검색 조건 버튼 -->
					</div>
				</div>
				<div class="search_form_check" >
				<b class="search_fc_sub">청소 종류</b>
				<svg id="detail_btn" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 25 25"><g fill="none" fill-rule="evenodd"><g><circle cx="12.5" cy="12.5" r="12.5" fill="#BDBDBD"/><path fill="#FFF" d="M11.194 14.606c-.402-2.66 2.445-3.717 2.445-5.302 0-.826-.553-1.355-1.424-1.355-.737 0-1.323.38-1.859.925L9 7.652C9.87 6.677 11.06 6 12.517 6 14.527 6 16 7.024 16 9.139c0 2.345-2.914 3.138-2.663 5.467h-2.143zM12.266 19c-.871 0-1.524-.694-1.524-1.586 0-.892.653-1.586 1.524-1.586.887 0 1.54.694 1.54 1.586 0 .892-.653 1.586-1.54 1.586z"/></g><path d="M-176 23h375v30h-375z"/></g></svg><br>
					<div class="chk_list">
						<!-- 카테고리 이미지 버튼 -->
						<ul id="cate_ul">
							<li>
								<input type="checkbox" name="b_category" id="b_category_id1" onclick="oneCheckbox(this);" value="A">
								<label for="b_category_id1">
									<div class="b_category1">
									</div>
								</label>
							</li>
							<li>
								<input type="checkbox" name="b_category" id="b_category_id2" onclick="oneCheckbox(this);" value="B">
								<label for="b_category_id2">
									<div class="b_category2">
									</div>
								</label>
							</li>
							<li>
								<input type="checkbox" name="b_category" id="b_category_id3" onclick="oneCheckbox(this);" value="C">
								<label for="b_category_id3">
									<div class="b_category3">
									</div>
								</label>
							</li>
							<li>
								<input type="checkbox" name="b_category" id="b_category_id4" onclick="oneCheckbox(this);" value="D">
								<label for="b_category_id4">
									<div class="b_category4">
									</div>
								</label>
							</li>
							<li>
								<input type="checkbox" name="b_category" id="b_category_id5" onclick="oneCheckbox(this);" value="E">
								<label for="b_category_id5">
									<div class="b_category5">
									</div>
								</label>
							</li>
							<li>
								<input type="checkbox" name="b_category" id="b_category_id6" onclick="oneCheckbox(this);" value="F">
								<label for="b_category_id6">
									<div class="b_category6">
									</div>
								</label>
							</li>
						</ul>
						<!-- 카테고리 이미지 버튼 -->
					</div>
					<div class="chk_text">
						<!-- 카테고리 텍스트 버튼 -->
						<ul>
							<li>
								<label for="b_category_id1">
									<b>정기청소</b>
								</label>
							</li>
							<li>
								<label for="b_category_id2">
									<b>특수청소</b>
								</label>
							</li>
							<li>
								<label for="b_category_id3">
									<b>입주청소</b>
								</label>
							</li>
							<li>
								<label for="b_category_id4">
									<b>상주청소</b>
								</label>
							</li>
							<li>
								<label for="b_category_id5">
									<b>빌딩청소</b>
								</label>
							</li>
							<li>
								<label for="b_category_id6">
									<b>방역청소</b>
								</label>
							</li>
						</ul>
						<!-- 카테고리 텍스트 버튼 -->
					</div>
				</div>
				<div class="search_Top_btn">
					<!-- 검색 버튼(편집 금지) -->
					<input type="button" class="search_button" value="악어 검색" id="search_data"><input type="reset" class="reset_button" value="&orarr; 필터 초기화">
					<!-- 검색 버튼(편집 금지) -->
				</div>
			</form>
		</div>
	</div>
	<!-- 게시글 개수 출력 -->
	<div class="screen_middle">
	</div>
	<!-- 게시글 개수 출력 -->
	<div class="screen_main">
		<div class="screen_left">
			<div class="map_wrap" id="map_div">
				<!-- 지도 생성 -->
			    <div id="map"></div> 
			    <!-- 지도 생성 -->
			</div>
		</div>
		<div class="screen_right" id="screen_data">
			<!-- 게시글 출력 -->
			<ul id="data_insert">
			</ul>
			<!-- 게시글 출력 -->
			<!-- 게시글 데이터 없을때 -->
			<div id="end">
			</div>
			<!-- 게시글 데이터 없을때 -->
		</div>
	</div>
	<!-- Top 버튼 -->
	<div class="Top_div">
		<button class="top">Top</button>
	</div>
	<!-- Top 버튼 -->
<script>
var se_id = '<%=m_id %>'; // 세션 아이디
var addr = '<%=addr %>';  // 검색한 주소
</script>
<!-- searchScreen.js 파일 -->
<script type="text/javascript" src="./resources/js/mainpoint/searchScreen.js"></script>
<!-- searchScreen.js 파일 -->
</body>
</html>