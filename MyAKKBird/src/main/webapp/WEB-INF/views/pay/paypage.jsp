<%@ page language="java" contentType="text/html; charset=utf-8" 
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.bit.myakkbird.member.*" %>
<%
	if(session.getAttribute("m_id") == null) {
		out.println("<script>");
		out.println("location.href='./loginform.ak'");
		out.println("</script>");
	}
	
	MemberVO memberVO = (MemberVO)request.getAttribute("memberVO");
	System.out.println("하트 구매할 아이디 : " + memberVO.getM_id());
	System.out.println(memberVO.getM_id() + "의 하트 개수 : " + memberVO.getM_heart() + "개");
%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<title>마이악어새 결제</title>
	<!-- favicon 적용 -->
	<link type="image/x-icon" rel="icon" href="./resources/image/akk_favicon.png">
	<!-- favicon 적용 -->
	<script src="http://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<!-- 결제 API 시작 -->
	<script src="http://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<!-- 결제 API 끝 -->
	<!-- alert창 API 시작 -->
	<script src="resources/js/sweetAlert_J.js"></script>
	<!-- alert창 API 끝 -->
	<!-- paypage.css style 파일 -->
	<link rel="stylesheet" type="text/css" href="./resources/css/pay/paypage.css">
	<!-- paypage.css style 파일 -->
</head>
<body>
<!-- header zone -->
<jsp:include page="../header_container.jsp">
	<jsp:param value="m_id" name="m_id"/>
</jsp:include> 
<!-- header zone -->
<div class="pay_div">
	<div class="addClass">
		<svg id="back_btn" viewBox="0 0 24 24" style="display: inline-block; color: rgba(0, 0, 0, 0.87); fill: black; height: 24px; width: 24px; user-select: none; transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms;"><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path></svg>
	</div>
	<div class="title_zone">
		<h2>하트 충전<svg id="detail_btn" xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 25 25"><g fill="none" fill-rule="evenodd"><g><circle cx="12.5" cy="12.5" r="12.5" fill="#BDBDBD"/><path fill="#FFF" d="M11.194 14.606c-.402-2.66 2.445-3.717 2.445-5.302 0-.826-.553-1.355-1.424-1.355-.737 0-1.323.38-1.859.925L9 7.652C9.87 6.677 11.06 6 12.517 6 14.527 6 16 7.024 16 9.139c0 2.345-2.914 3.138-2.663 5.467h-2.143zM12.266 19c-.871 0-1.524-.694-1.524-1.586 0-.892.653-1.586 1.524-1.586.887 0 1.54.694 1.54 1.586 0 .892-.653 1.586-1.54 1.586z"/></g><path d="M-176 23h375v30h-375z"/></g></svg></h2>
	</div>
	<div class="heart_info">
		<b id="heart_info_txt">나의 하트개수</b>
		<div class="heart_info_div">
			<svg id="heart_icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#37B04B" width="23px" height="23px"><path d="M0 0h24v24H0z" fill="none"/><path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/></svg>
			<b>보유 중인 하트 <strong id="p_txt">${memberVO.getM_heart() }</strong>개</b>
			<a href="./payList.ak" id="move_info">상세보기</a>
		</div>
	</div>
	<div class="charge_zone">
		<b id="charge_zone_txt">하트 패키지</b>
		<div class="heart_buy_div">
			<div class="heart_pay_div1">
				<svg id="heart_icon2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#37B04B" width="23px" height="23px"><path d="M0 0h24v24H0z" fill="none"/><path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/></svg>
				<b id="heart_txt">하트 5개</b>
				<input type="button" class="pay_btn" value="1,000원" onclick="pay5()">
			</div>
			<div class="heart_pay_div2">
				<svg id="heart_icon2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#37B04B" width="23px" height="23px"><path d="M0 0h24v24H0z" fill="none"/><path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/></svg>
				<b id="heart_txt">하트 25개</b>
				<input type="button" class="pay_btn" value="5,000원" onclick="pay25()">
			</div>
			<div class="heart_pay_div3">
				<svg id="heart_icon2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#37B04B" width="23px" height="23px"><path d="M0 0h24v24H0z" fill="none"/><path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/></svg>
				<b id="heart_txt">하트 50개</b>
				<input type="button" class="pay_btn" value="10,000원" onclick="pay50()">
			</div>
		</div>
	</div>
	<div class="terms_zone">
		<b id="terms_zone_txt">필수 유의사항</b>
		<div class="content_div">
			<ul id="content_ul">
				<li>
					<span>&bull; 환불 요청은 하트를 사용하지 않았거나 3일 이내에만 가능합니다.</span>
				</li>
				<li>
					<div class="text_div">
						<span>&bull; 환불 요청 시간은 평일 10:00~18:00입니다.<br>
						&nbsp;&nbsp;(점심시간 12:00~13:00 제외/주말, 공휴일 제외)</span>
					</div>
				</li>
				<li>
					<div class="text_div">
						<span>&bull; 타인과 하트 이용권을 공유하는 행위는 엄격히 금지하며 "재가입 불가 탈<br>
						&nbsp;&nbsp;퇴" 처리하고 있으니 유의해주세요.</span>
					</div>
				</li>
				<li>
					<div class="text_div">
						<span>&bull; 결제되는 금액은 VAT 포함 가격입니다.</span>
					</div>
				</li>
			</ul>
		</div>
	</div>
</div>
<!-- footer zone -->
<jsp:include page="../footer_container.jsp">
	<jsp:param value="" name=""/>
</jsp:include>	
<!-- footer zone -->
</body>
<script>
// 결제에 사용할 변수
var m_id = '<%=memberVO.getM_id() %>';                    // 회원 아이디
var m_email = '<%=memberVO.getM_email() %>';              // 회원 이메일
var m_name = '<%=memberVO.getM_name() %>';                // 회원 이름
var m_phone = '<%=memberVO.getM_phone() %>';              // 회원 전화번호
var m_address_road = '<%=memberVO.getM_address_road() %>' // 회원 주소
// 결제에 사용할 변수
</script>
<!-- paypage.js 파일 -->
<script type="text/javascript" src="./resources/js/pay/paypage.js"></script>
<!-- paypage.js 파일 -->
</html>