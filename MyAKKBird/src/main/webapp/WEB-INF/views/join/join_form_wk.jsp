<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% 
	String[] str = request.getParameterValues("m_category"); 
	String va = "";
	
	for(int i = 0; i < str.length; i++) {
		if(i == str.length-1) {
			va += str[i];
			break;
		} else if (i < str.length) {
			va += str[i]+",";
		}
	}	
	
	System.out.println("선택한 카테고리 : " + va);
%>
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
	<!-- 다음 주소 API 시작 -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- 다음 주소 API 끝 -->
	<!-- join_form_wk.css style 파일 -->
	<link rel="stylesheet" type="text/css" href="./resources/css/join/join_form_wk.css">
	<!-- join_form_wk.css style 파일 -->
</head>
<body>
<!-- header zone -->
<jsp:include page="../header_container.jsp">
	<jsp:param value="m_id" name="m_id"/>
</jsp:include>
<!-- header zone -->
<div class="sign_div">
	<form name="joinformcs" method="post" enctype="multipart/form-data" >
		<!-- 선택한 카테고리, 회원 타입 -->
		<input type="hidden" name="m_category" value="<%=va%>">
		<input type="hidden" name="m_type" value="E" >
		<!-- 선택한 카테고리, 회원 타입 -->
		<div class="title_div">
			<b id="title_txt1">이제 거의 다 왔어요!</b><br>
			<b id="title_txt2">마이악어새를 이용하기 위해 정보를 입력해주세요.</b>
		</div>
		<div class="img_div">
			<div class="img_profile_div">
			 	<img class="profile_img" id="image_section" src="resources/image/bird_profile.png"/><br>
			 	<b>마이악어새 기본 프로필 사진</b>
			 	<svg id="detail_btn" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 25 25"><g fill="none" fill-rule="evenodd"><g><circle cx="12.5" cy="12.5" r="12.5" fill="#BDBDBD"/><path fill="#FFF" d="M11.194 14.606c-.402-2.66 2.445-3.717 2.445-5.302 0-.826-.553-1.355-1.424-1.355-.737 0-1.323.38-1.859.925L9 7.652C9.87 6.677 11.06 6 12.517 6 14.527 6 16 7.024 16 9.139c0 2.345-2.914 3.138-2.663 5.467h-2.143zM12.266 19c-.871 0-1.524-.694-1.524-1.586 0-.892.653-1.586 1.524-1.586.887 0 1.54.694 1.54 1.586 0 .892-.653 1.586-1.54 1.586z"/></g><path d="M-176 23h375v30h-375z"/></g></svg>
			 </div>
			 <div class="file_div">
			 	<b>프로필 사진</b><br>
			 	<input class="upload_name" value="  파일선택" disabled="disabled">
				<label for="img_input"><a id="up_a">업로드</a></label> 
				<input type="file" name="file" id="img_input" accept="image/*">
			 </div>
		</div>	
		<div class="sign_info_div">
			<div class="id_div">
				<b>아이디</b><br>
				<input class="id_input" type="text" id="m_id" name="m_id" placeholder="  아이디를 입력해주세요.">
				<input class="id_chk_btn" type="button" id="idcheck" name="idcheck" value="중복확인">
			</div>
			<div class="pass_div">
				<b>비밀번호</b><br>
				<input class="pass_input" type="password" id="m_password" name="m_password" placeholder="  비밀번호를 입력해주세요.">
			</div>
			<div class="pass_chk_div">
				<b>비밀번호 재입력</b><br>
				<input class="pass_chk_input" type="password" id="m_password2" name="m_password2" placeholder="  한번 더 비밀번호를 입력해주세요.">
				<div id="alert-success">
					<input type="text" id="success_input" size="17px" readonly value="* 비밀번호가 일치합니다.">
				</div> 
				<div id="alert-danger">
					<input type="text" id="danger_input" size="23px" readonly value="* 비밀번호가 일치하지 않습니다.">
				</div>
			</div>
			<div class="name_div">
				<b>이름</b><br>
				<input class="name_input" type="text" id="m_name" name="m_name" placeholder="  이름을 입력해주세요.">
			</div>
			<div class="age_div">
				<b>나이</b><br>
				<input class="age_input" type="text" id="m_age" name="m_age" placeholder="  나이를 입력해주세요.">
			</div>
			<div class="gender_div">
				<b>성별</b><br>
				<select class="gender_select" name="m_gender">
					<option value="M">&nbsp;남자</option>
					<option value="F">&nbsp;여자</option>
				</select>
			</div>
			<div class="email_div">
				<b>이메일</b>
				<input type="text" id="mailCheck" value="인증필요" class="before" readonly>
				<svg id="why" xmlns="http://www.w3.org/2000/svg" width="17" height="17" viewBox="0 0 25 25"><g fill="none" fill-rule="evenodd"><g><circle cx="12.5" cy="12.5" r="12.5" fill="#BDBDBD"/><path fill="#FFF" d="M11.194 14.606c-.402-2.66 2.445-3.717 2.445-5.302 0-.826-.553-1.355-1.424-1.355-.737 0-1.323.38-1.859.925L9 7.652C9.87 6.677 11.06 6 12.517 6 14.527 6 16 7.024 16 9.139c0 2.345-2.914 3.138-2.663 5.467h-2.143zM12.266 19c-.871 0-1.524-.694-1.524-1.586 0-.892.653-1.586 1.524-1.586.887 0 1.54.694 1.54 1.586 0 .892-.653 1.586-1.54 1.586z"/></g><path d="M-176 23h375v30h-375z"/></g></svg><br>
				<input class="email_input" type="text" id="m_email" name="m_email" placeholder="  이메일을 입력해주세요.">
				<input class="email_chk_btn" type="button" value="이메일 인증" onClick='mail_check()'>
			</div> 
			<div class="phone_div">
				<b>휴대전화</b><br>
				<input class="phone_input" type="text" id="m_phone" name="m_phone" placeholder="  예) 010-XXXX-XXXX">
			</div>
			<div class="addr_div">
				<b>주소</b>
				<svg id="why_addr" xmlns="http://www.w3.org/2000/svg" width="17" height="17" viewBox="0 0 25 25"><g fill="none" fill-rule="evenodd"><g><circle cx="12.5" cy="12.5" r="12.5" fill="#BDBDBD"/><path fill="#FFF" d="M11.194 14.606c-.402-2.66 2.445-3.717 2.445-5.302 0-.826-.553-1.355-1.424-1.355-.737 0-1.323.38-1.859.925L9 7.652C9.87 6.677 11.06 6 12.517 6 14.527 6 16 7.024 16 9.139c0 2.345-2.914 3.138-2.663 5.467h-2.143zM12.266 19c-.871 0-1.524-.694-1.524-1.586 0-.892.653-1.586 1.524-1.586.887 0 1.54.694 1.54 1.586 0 .892-.653 1.586-1.54 1.586z"/></g><path d="M-176 23h375v30h-375z"/></g></svg><br>
				<!-- 다음 주소 API -->
				<input type="text" class="post_input" id="m_postcode" readonly placeholder="  우편번호">
				<input type="button" class="addr_btn" onclick="sample6_execDaumPostcode()" value="주소찾기"><br>
				<input type="text" class="addr_input" id="m_address_road" name="m_address_road" readonly placeholder="  지번주소를 선택해주세요."><br>
				<input type="text" class="addr_input" id="m_address_detail" name="m_address_detail" placeholder="  상세주소를 입력해주세요.">
				<input type="text" class="addr_input" id="m_extraAddress" placeholder="  참고항목(선택)">
				<!-- 다음 주소 API -->
			</div>
		</div>
		<div class="btn_div">
			<input type="button" id="join" class="submit_btn" value="회원가입">
		</div>
	</form>
</div>
<!-- join_form_wk.js 파일 -->
<script type="text/javascript" src="./resources/js/join/join_form_wk.js"></script>
<!-- join_form_wk.js 파일 -->
</body>
</html>