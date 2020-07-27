<%@ page language="java" contentType="text/html; charset=utf-8" 
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.bit.myakkbird.member.*" %>
<%
	if (session.getAttribute("m_id")==null)
			{
		out.println("<script>");
		out.println("location.href='./loginform.ak'");
		out.println("</script>");
	}
	
	MemberVO memberVO = (MemberVO)request.getAttribute("memberVO");
	System.out.println("하트 구매할 아이디 : " + memberVO.getM_id());
%>

<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<title>마이악어새</title>
	<script src="http://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<!-- 결제 API 시작 -->
	<script src="http://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<!-- 결제 API 끝 -->
	<!-- alert창 API 시작 -->
	<script src="resources/js/sweetAlert_J.js"></script>
	<!-- alert창 API 끝 -->
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
			margin: 0;
			padding: 0;
			font-family: "NotoSansKR-Regular";
		}
		
		a {
			text-decoration: none;
		}
		
		ul li {
			list-style: none;
		}
		/* 전체 적용 */
		
		.pay_div {
			width: 1000px;
			height: 600px;
			margin: 20px auto;
		}
		
		.addClass {
			width: 500px;
    		height: 20px;
    		margin: 20px auto;
		}
		
		.title_zone {
			width: 150px;
			height: 40px;
			margin: 0 auto;
			text-align: center;
		}
		
		#detail_btn {
			float: right;
			margin-top: 6px;
			cursor: pointer;
			margin-left: -15px;
		}
		
		.heart_info {
			width: 500px;
			height: 110px;
			margin: 20px auto;
		}
		
		#heart_info_txt {
			font-size: 18px;
		}
		
		.heart_info_div {
			width: 500px;
			height: 60px;
			border: 1px solid rgb(195, 195, 195);
			border-radius: 3px;
			margin-top: 12px;
		}
		
		#heart_icon {
			float: left;
			margin-top: 16px;
	    	margin-left: 20px;
		}
		
		.heart_info_div b {
			line-height: 3.5;
	    	font-family: "NotoSansKR-Light";
	    	margin-left: 5px;
		}
		
		#point_txt {
			font-family: "NotoSansKR-Black";
		}
		
		#move_info {
			margin-left: 230px;
			display: inline-block;
			background-color: #37B04B;
			color: white;
			font-size: 13px;
			padding: 5px;
			border-radius: 3px;
			cursor: pointer;
		}
		
		.charge_zone {
			width: 500px;
			height: 400px;
			margin: 0 auto;
		}
		
		#charge_zone_txt {
			font-size: 18px;
		}
		
		.heart_buy_div {
			width: 500px;
			height: 320px;
			background-color: #E6E6E6;
			border-radius: 3px;
			margin-top: 12px;
		}
		
		.heart_pay_div1 {
		    width: 300px;
		    height: 70px;
		    background-color: white;
		    border-radius: 3px;
		    position: absolute;
		    line-height: 4.2;
		    margin-left: 100px;
		    margin-top: 30px;
		    box-shadow: -3px -3px 7px -3px #d3d3d3, 3px 3px 7px -3px #d3d3d3;
		}
		
		.heart_pay_div2 {
		    width: 300px;
		    height: 70px;
		    background-color: white;
		    border-radius: 3px;
		    position: absolute;
		    line-height: 4.2;
		    margin-left: 100px;
		    margin-top: 125px;
		    box-shadow: -3px -3px 7px -3px #d3d3d3, 3px 3px 7px -3px #d3d3d3;
		}
		
		.heart_pay_div3 {
		    width: 300px;
		    height: 70px;
		    background-color: white;
		    border-radius: 3px;
		    position: absolute;
		    line-height: 4.2;
		    margin-left: 100px;
		    margin-top: 220px;
		    box-shadow: -3px -3px 7px -3px #d3d3d3, 3px 3px 7px -3px #d3d3d3;
		}
		
		#heart_txt {
			font-size: 15px;
			color: #37B04B;
			margin-left: 5px;
		}
		
		#heart_icon2 {
			float: left;
			margin-top: 22px;
	    	margin-left: 20px;
		}
		
		.pay_btn {
			background-color: #37B04B;
		    color: white;
		    cursor: pointer;
		    float: right;
		    border: 0;
		    font-family: "NotoSansKR-Medium";
		    width: 75px;
		    height: 30px;
		    margin-right: 25px;
		    margin-top: 20px;
		    border-radius: 3px;
		}
		
		.pay_btn:focus {
			outline: none;	
		}
		
		.terms_zone {
			width: 500px;
			height: 240px;
			margin: 0 auto;
		}
		
		#terms_zone_txt {
			font-size: 18px;
		}
		
		.content_div {
			width: 500px;
			height: 300px;
			border-radius: 3px;
			margin: -5px auto;
		}
		
		#content_ul {
			margin-left: -35px;
			font-family: "NotoSansKR-Regular";
		}
		
		#m_title {
			font-size: 20px;
		}
		
		#m_content {
			font-size: 17px;
		}
		
		.text_div {
			margin-top: 8px;
		}
		
		#back_btn {
			margin-top: 47px;
			cursor: pointer;
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
			<b>보유 중인 하트 <strong id="point_txt">${memberVO.getM_heart() }</strong>개</b>
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
</body>
<script>

var m_id = '<%=memberVO.getM_id() %>';

$('#back_btn').click(function() {
	location.href="./profile.ak?id="+m_id+"";
});

$('#detail_btn').click(function name() {
	Swal.fire({
		title: '<strong id="m_title">※마이악어새 하트란?</strong>',
		html: '<span id="m_content">게시글 신청과 고객과 근로자 매칭을 위해 필요한 이용수단입니다.</span>',
		confirmButtonColor: '#37B04B',
		confirmButtonText:
		    '<div class="go_btn">FAQ가기</div>'
	}).then((result) => {
		if (result.value) {
	    	location.href="./FAQList.ak";
		}
	})
});

function pay5() {
      var IMP = window.IMP;
      var code = "imp37972570"; // 가맹점 식별코드
      IMP.init(code);
      // 결제요청
      IMP.request_pay({
          // name과 amount만 있어도 결제 진행가능
          pg : 'kakao', // pg 사 선택(kakao, kakaopay 둘다 가능)
          pay_method : 'card',
          merchant_uid : 'merchant_' + new Date().getTime(),
          merchant_time : new Date().getTime(),
         // merchant_uid : 'merchant_1', // 주문번호
          name : '하트', // 상품명
          amount : 1000,
          buyer_email : '${memberVO.getM_email()}',
          buyer_name : '${memberVO.getM_name()}',
          buyer_tel : '${memberVO.getM_phone()}',
          buyer_addr : '${memberVO.getM_address_road()}',
          buyer_postcode : '123-456',
          // 결제 완료후 이동할 페이지. kakao나 kakaopay는 생략함
          //m_redirect_url : 'https://localhost:8080/payments/complete' / 
      }, function(rsp) {
          if ( rsp.success ) { // 결제 성공시 
             /* var msg = '결제가 완료되었습니다.';
              msg += '고유ID : ' + rsp.imp_uid;
              msg += '상점 거래ID : ' + rsp.merchant_uid;
              msg += '결제 금액 : ' + rsp.paid_amount;
              msg += '카드 승인번호 : ' + rsp.apply_num;
		*/
		var newData =   {
				   p_price: rsp.paid_amount,
		              m_id: '${memberVO.getM_id()}',
		              m_heart: '5'
		              
                  };
		var dataJson = JSON.stringify(newData);
		  jQuery.ajax({
	          url: "./paysuccess.ak", // 가맹점 서버
	          method: "POST",
	          dataType : 'json',
	          contentType: "application/json",
	          data: dataJson,
	          success: function(retVal){
	        	  if (retVal.res == "OK"){
	        		  reload();
		           	}else
	        	 	{
	        	 		alert("결제 실패!!!");
	        	 	}
	        	
	          },
	          error: function(e) {
	        	    console.log(e);
	        	  }
		  });
          }
          else { // 결제 실패시
              var msg = '결제에 실패하였습니다. 에러내용 : ' + rsp.error_msg
          }
      });
}
  
function pay25() {
      var IMP = window.IMP;
      var code = "imp51586343"; // 가맹점 식별코드
      IMP.init(code);
      // 결제요청
      IMP.request_pay({
          // name과 amount만 있어도 결제 진행가능
          pg : 'kakao', // pg 사 선택(kakao, kakaopay 둘다 가능)
          pay_method : 'card',
          //merchant_uid : 'merchant_' + new Date().getTime(),
          merchant_uid : 'merchant_'+ new Date().getTime(), // 주문번호
          name : '하트', // 상품명
          amount : 5000,
          buyer_email : '${memberVO.getM_email()}',
          buyer_name : '${memberVO.getM_name()}',
          buyer_tel : '${memberVO.getM_phone()}',
          buyer_addr : '${memberVO.getM_address_road()}',
          buyer_postcode : '123-456',
          // 결제 완료후 이동할 페이지. kakao나 kakaopay는 생략함
          //m_redirect_url : 'https://localhost:8080/payments/complete' / 
      }, function(rsp) {
          if ( rsp.success ) { // 결제 성공시 
          	var newData =   {
				   p_price: rsp.paid_amount,
		              m_id: '${memberVO.getM_id()}',
		            	  m_heart: '25'
                  };
          	var dataJson = JSON.stringify(newData);
		  jQuery.ajax({
	          url: "./paysuccess.ak", // 가맹점 서버
	          method: "POST",
	          dataType : 'json',
	          contentType: "application/json",
	          data: dataJson,
	          success: function(retVal){
	        	  if (retVal.res == "OK"){
	        		  reload();
		           	}else
	        	 	{
	        	 		alert("결제 실패!!!");
	        	 	}
	        
	          },
	          error: function(e) {
	        	    console.log(e);
	        	  }
		  });
        }
        else { // 결제 실패시
            var msg = '결제에 실패하였습니다. 에러내용 : ' + rsp.error_msg
        }
    });
}
    
function pay50() {
      var IMP = window.IMP;
      var code = "imp51586343"; // 가맹점 식별코드
      IMP.init(code);
      // 결제요청
      IMP.request_pay({
          // name과 amount만 있어도 결제 진행가능
          pg : 'kakao', // pg 사 선택(kakao, kakaopay 둘다 가능)
          pay_method : 'card',
          //merchant_uid : 'merchant_' + new Date().getTime(),
          merchant_uid : 'merchant_'+ new Date().getTime(), // 주문번호
          name : '하트', // 상품명
          amount : 10000,
          buyer_email : '${memberVO.getM_email()}',
          buyer_name : '${memberVO.getM_name()}',
          buyer_tel : '${memberVO.getM_phone()}',
          buyer_addr : '${memberVO.getM_address_road()}',
          buyer_postcode : '123-456',
          // 결제 완료후 이동할 페이지. kakao나 kakaopay는 생략함
          //m_redirect_url : 'https://localhost:8080/payments/complete' / 
      }, function(rsp) {
          if ( rsp.success ) { // 결제 성공시 
          	var newData =   {
				   p_price: rsp.paid_amount,
		              m_id: '${memberVO.getM_id()}',
		            	  m_heart: '50'
                  };
          	var dataJson = JSON.stringify(newData);
		  jQuery.ajax({
	          url: "./paysuccess.ak", // 가맹점 서버
	          method: "POST",
	          dataType : 'json',
	          contentType: "application/json",
	          data: dataJson,
	          success: function(retVal){
	        	  if (retVal.res == "OK"){
	        		  reload();
		           	}else
	        	 	{
	        	 		alert("결제 실패!!!");
	        	 	}
	        
	          },
	          error: function(e) {
	        	    console.log(e);
	        	  }
		  });
        }
        else { // 결제 실패시
            var msg = '결제에 실패하였습니다. 에러내용 : ' + rsp.error_msg
        }
    });
}
    
function reload() { 
    location.reload();
}
</script>
</html>