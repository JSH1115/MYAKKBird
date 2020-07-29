<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마이악어새 근로자 회원가입</title>
	<!-- favicon 적용 -->
	<link type="image/x-icon" rel="icon" href="./resources/image/akk_favicon.png">
	<!-- favicon 적용 -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<!-- alert창 API 시작 -->
	<script src="resources/js/sweetAlert_J.js"></script>
	<!-- alert창 API 끝 -->
	<!-- join_form_wk_category.css style 파일 -->
	<link rel="stylesheet" type="text/css" href="./resources/css/join/join_form_wk_category.css">
	<!-- join_form_wk_category.css style 파일 -->
</head>
<body>
<!-- header zone -->
<jsp:include page="../header_container.jsp">
	<jsp:param value="m_id" name="m_id"/>
</jsp:include>
<!-- header zone -->
<div class="category_div">
	<form name="catefrm" action="./joinformwk.ak">
		<div class="b_div">
			<b><svg id="detail_btn" xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 25 25"><g fill="none" fill-rule="evenodd"><g><circle cx="12.5" cy="12.5" r="12.5" fill="#BDBDBD"/><path fill="#FFF" d="M11.194 14.606c-.402-2.66 2.445-3.717 2.445-5.302 0-.826-.553-1.355-1.424-1.355-.737 0-1.323.38-1.859.925L9 7.652C9.87 6.677 11.06 6 12.517 6 14.527 6 16 7.024 16 9.139c0 2.345-2.914 3.138-2.663 5.467h-2.143zM12.266 19c-.871 0-1.524-.694-1.524-1.586 0-.892.653-1.586 1.524-1.586.887 0 1.54.694 1.54 1.586 0 .892-.653 1.586-1.54 1.586z"/></g><path d="M-176 23h375v30h-375z"/></g></svg>어떤 청소를 원하세요?</b>
			<span id="b_div_txt">※최대 6개 선택가능</span>
		</div>
		<div class="c_chk_div1">
			<ul id="c_chk_div1_img">
				<li>
					<input type="checkbox" id="check_test" name="m_category" value="A">
					<label for="check_test">
						<div class="chk_img"></div>
					</label>
					<label for="check_test">
						<b id="chk_txt1">정기청소</b>
					</label>
				</li>
				<li>
					<input type="checkbox" id="check_test2" name="m_category" value="B">
					<label for="check_test2">
						<div class="chk2_img"></div>
					</label>
					<label for="check_test2">
						<b id="chk_txt2">특수청소</b>
					</label>
				</li>
				<li>
					<input type="checkbox" id="check_test3" name="m_category" value="C">
					<label for="check_test3">
						<div class="chk3_img"></div>
					</label>
					<label for="check_test3">
						<b id="chk_txt3">입주 청소</b>
					</label>
				</li>
			</ul>
		</div>
		<div class="c_chk_div2">
			<ul id="c_chk_div2_img">
				<li>
					<input type="checkbox" id="check_test4" name="m_category" value="D">
					<label for="check_test4">
						<div class="chk4_img"></div> 
					</label>
					<label for="check_test4">
						<b id="chk_txt4">상주청소</b> 
					</label>
				</li>
				<li>
					<input type="checkbox" id="check_test5" name="m_category" value="E">
					<label for="check_test5">
						<div class="chk5_img"></div>
					</label>
					<label for="check_test5">
						<b id="chk_txt5">빌딩청소</b> 
					</label>
				</li>
				<li>
					<input type="checkbox" id="check_test6" name="m_category"value="F">
					<label for="check_test6">
						<div class="chk6_img"></div>
					</label>
					<label for="check_test6">
						<b id="chk_txt6">방역청소</b> 
					</label>
				</li>
			</ul>
		</div>
		<div class="btn_div">
			<input type="button" class="btn_sub" id="select" value="다음">
		</div>
	</form>
</div>
</body>
<!-- join/join_form_wk_category.js 파일 -->
<script type="text/javascript" src="./resources/js/join/join_form_wk_category.js"></script>
<!-- join/join_form_wk_category.js 파일 -->
</html>