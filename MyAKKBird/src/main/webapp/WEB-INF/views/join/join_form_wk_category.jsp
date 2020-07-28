<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- alert창 API 시작 -->
<script src="resources/js/sweetAlert_J.js"></script>
<!-- alert창 API 끝 -->
	<title>마이악어새 근로자 회원가입</title>
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
			padding: 0;
			font-family: "NotoSansKR-Regular";
		}
		
		ul li {
			list-style: none;
		}
		
		a {
			text-decoration:none;
		}
		
		input[type="checkbox"] {
			display:none;
		}
		
		label {
			width:200px;
			height:150px;
		}
		/* 전체 적용 */
		.category_div {
			width: 600px;
			height: 600px;
			margin: 100px auto;
		}
	
		.b_div {
			width: 400px;
			height: 75px;
			margin: 0 auto;
		}
		
		.b_div b {
			font-size: 25px;
			margin-left: 70px;
		}
		
		#b_div_txt {
			margin-left: 125px;
		}
		
		#detail_btn {
			float: right;
		    margin-right: 58px;
		    margin-top: 4px;
		    cursor: pointer;
		}
		
		.c_chk_div1 {
			width: 600px;
			height: 150px;
			margin-top: 20px;
		}
		
		#c_chk_div1_img {
			margin-left: -60px;
		}
		
		#c_chk_div1_img li {
			display: inline-block;
			padding-left: 80px;
		}
		
		.c_chk_div2 {
			width: 600px;
			height: 150px;
			margin-top: 20px;
		}
		
		#c_chk_div2_img {
			margin-left: -60px;
		}
		
		#c_chk_div2_img li {
			display: inline-block;
			padding-left: 80px;
		}
		
		#chk_txt1 {
			position: absolute;
			margin-top: 20px;
	    	margin-left: 20px;
	    	font-size: 17px;
	    	font-family: "NotoSansKR-Bold";
	    	cursor: pointer;
		}
		
		#chk_txt2 {
			position: absolute;
			margin-top: 20px;
	    	margin-left: 20px;
	    	font-size: 17px;
	    	font-family: "NotoSansKR-Bold";
	    	cursor: pointer;
		}
		
		#chk_txt3 {
			position: absolute;
			margin-top: 20px;
	    	margin-left: 20px;
	    	font-size: 17px;
	    	font-family: "NotoSansKR-Bold";
	    	cursor: pointer;
		}
		
		#chk_txt4 {
			position: absolute;
			margin-top: 20px;
	    	margin-left: 20px;
	    	font-size: 17px;
	    	font-family: "NotoSansKR-Bold";
	    	cursor: pointer;
		}
		
		#chk_txt5 {
			position: absolute;
			margin-top: 20px;
	    	margin-left: 20px;
	    	font-size: 17px;
	    	font-family: "NotoSansKR-Bold";
	    	cursor: pointer;
		}
		
		#chk_txt6 {
			position: absolute;
			margin-top: 20px;
	    	margin-left: 20px;
	    	font-size: 17px;
	    	font-family: "NotoSansKR-Bold";
	    	cursor: pointer;
		}
		
		input[type="checkbox"] + label .chk_img {
			width: 100px;
			height:100px;
			background:url("./resources/image/vacuum.png")no-repeat;
			background-size:100px 100px;
			cursor:pointer;  
		}
		
		input[type="checkbox"]:checked + label .chk_img {
			background:url("./resources/image/vacuum_check1.png")no-repeat;
			background-size:100px 100px;
		} 
		
		input[type="checkbox"] + label .chk2_img {
			width: 100px;
			height:100px;
			background:url("./resources/image/cleaning-tools.png")no-repeat;
			background-size:100px 100px;
			cursor:pointer;  
		}
		
		input[type="checkbox"]:checked + label .chk2_img {
			background:url("./resources/image/cleaning-tools_check.png")no-repeat;
			background-size:100px 100px;
		} 
		
		input[type="checkbox"] + label .chk3_img {
			width: 100px;
			height:100px;
			background:url("./resources/image/kitchen.png")no-repeat;
			background-size:100px 100px;
			cursor:pointer;  
		}
		
		input[type="checkbox"]:checked + label .chk3_img {
			background:url("./resources/image/kitchen_check.png")no-repeat;
			background-size:100px 100px;
		} 
		
		input[type="checkbox"] + label .chk4_img {
			width: 100px;
			height: 100px;
			background:url("./resources/image/maid.png")no-repeat;
			background-size:100px 100px;
			cursor:pointer;  
		}
		
		input[type="checkbox"]:checked + label .chk4_img {
			background:url("./resources/image/maid_check.png")no-repeat;
			background-size:100px 100px; 
		} 
		
		input[type="checkbox"] + label .chk5_img {
			width: 100px;
			height: 100px;
			background:url("./resources/image/apartment.png")no-repeat;
			background-size:100px 100px;
			cursor:pointer;  
		}
		
		input[type="checkbox"]:checked + label .chk5_img {
			background:url("./resources/image/apartment_check.png")no-repeat;
			background-size:100px 100px; 
		} 
		
		input[type="checkbox"] + label .chk6_img {
			width: 100px;
			height: 100px;
			background:url("./resources/image/coronavirus.png")no-repeat;
			background-size:100px 100px;
			cursor:pointer;  
		}
		
		input[type="checkbox"]:checked + label .chk6_img {
			background:url("./resources/image/coronavirus_check.png")no-repeat;
			background-size:100px 100px; 
		} 
	
		.btn_div {
			width: 600px;
			height: 38px;
			margin-top: 40px;
		}
		
		.btn_sub {
			border-radius: 4px;
		    width: 470px;
		    height: 40px;
		    border: 0px;
		    background: #37b04b;
		    text-decoration: none;
		    color: white;
		    margin-left: 55px;
		    font-size: 16px;
		    font-family: "NotoSansKR-Black";
		    cursor: pointer;
		}
		
		.btn_sub:focus {
			outline: none;
		}
		
		#alert_id_txt {
			font-size: 20px;
		}
		
		#m_title {
			font-size: 20px;
		}
		
		.m_div1 {
			width: 330px;
			height: 40px;
			margin: 15px auto;
			border-bottom: 1px solid #888888;
		}
		
		.m_div1 b, .m_div1 span {
			font-size: 17px;
			float: left;
		}
		
		.m_div2 {
			width: 330px;
			height: 40px;
			margin: 15px auto;
			border-bottom: 1px solid #888888;
		}
		
		.m_div2 b, .m_div2 span {
			float: left;
			font-size: 17px;
		}
		
		.go_btn {
			font-family: "NotoSansKR-Medium";
		}
	</style>
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
<script type="text/javascript">
$('#detail_btn').click(function name() {
	Swal.fire({
		title: '<strong id="m_title">※마이악어새가 알려주는 청소 종류</strong>',
		html: 
	        '<div class="m_div1">' +
	        '    <b>정기청소</b><span>&nbsp;&nbsp;집 청소, 음식점 청소 등</span>' +
	        '</div>' +
	        '<div class="m_div2">' +
	        '    <b>특수청소</b><span>&nbsp;&nbsp; 범죄 현장 청소, 폐기물 처리 등</span>' +
	        '</div>' +
	        '<div class="m_div2">' +
	        '    <b>입주청소</b><span>&nbsp;&nbsp; 이사, 리모델링 청소 등</span>' +
	        '</div>' +
	        '<div class="m_div2">' +
	        '    <b>상주청소</b><span>&nbsp;&nbsp; 어르신 집 청소, 회사 청소 등</span>' +
	        '</div>' +
	        '<div class="m_div2">' +
	        '    <b>빌딩청소</b><span>&nbsp;&nbsp; 아파트 외벽, 빌딩 옥상 등</span>' +
	        '</div>' +
	        '<div class="m_div2">' +
	        '    <b>방역청소</b><span>&nbsp;&nbsp; 코로나로 인한 방역</span>' +
	        '</div>',
		confirmButtonColor: '#37B04B',
		confirmButtonText:
			'<div class="go_btn">확인</div>'
	})
});
$(document).ready(function(){
	   //빈칸
	$("#select").on("click", function(){
		var isSeasonChk = $("input:checkbox[name='m_category']").is(":checked");
		    
	    if(!isSeasonChk){
	    	Swal.fire({
				  html: 
			        '<b id="alert_id_txt">카테고리를 한개 이상 선택해주세요!</b>',
				  timer: 1500,
				  confirmButtonColor: '#37B04B',
				  confirmButtonText:
					  '<div class="go_btn">확인</div>'
			})
	        return false;
	     }
	    
	     document.catefrm.target = '_self';
		 document.catefrm.action="./joinformwk.ak";
		 document.catefrm.submit();
	});
})
	
</script>
</html>