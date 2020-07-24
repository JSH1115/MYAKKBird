<%@ page language="java" contentType="text/html; charset=utf-8" 
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	if (session.getAttribute("m_id")==null)
			{
		out.println("<script>");
		out.println("location.href='./loginform.ak'");
		out.println("</script>");
	}
%>

<!doctype html>
<html>
<head>
<meta charset="utf-8" />
<title>마이악어새</title>
<script src="http://code.jquery.com/jquery-1.12.4.min.js" ></script>
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
	body {margin:0;padding:0;
	font-family: "NotoSansKR-Regular";}
			#webView {overflow:hidden;position:relative;background:#FFFFFF;
			width:1200px;margin:0 auto;-webkit-transform:translate3d(0,0,0);
			transform:translate3d(0,0,0);
			background-image:url("./resources/image/croheart.png");
			background-repeat:no-repeat;
			background-position:left bottom;}
			#webView[data-show-memo='true'] {overflow:visible}
			a{
			text-decoration:none;
			}
			#logo{
				height:100px;
				float:right;
			}
			td >img{
			width:35px;
			height:35px;
			
			}
			td {
				font-size:20px;
			}
			
				 .btn1{
		 	margin:5px; 
			padding: 5px; 
			border-radius:5px;
			border:0px;
			background: #37b04b;
			text-decoration: none;
			color:white;
			}
	</style>
    <script src="http://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <script>
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
    
    
    function reload(){  
        location.reload();
 }
    </script>


</head>
<body>
<!-- header zone -->
<jsp:include page="../header_container.jsp">
	<jsp:param value="m_id" name="m_id"/>
</jsp:include> 
<!-- header zone -->
<div class="pay_div">
	
</div>
<div id="webView">
<table align="center">
<tr>
	<td width="30px"><img src="./resources/image/heart.png" /></td>
	<td>나의 하트 개수</td>
</tr>
<tr>
	<td colspan="3" style="
	border: 1px solid #37b04b; width:200px;height:50px;
	text-align:center;border-radius: 10px;font-family: NotoSansKR-Medium;">보유 중인 하트 : ${memberVO.getM_heart() }</td>
</tr>
<tr></tr>
<tr>
	<td><img src="./resources/image/heart.png"></td>
	<td>하트5개</td>
	<td><input type="button" class="btn1" value="1000원" onclick="pay5()"style="WIDTH: 50pt; HEIGHT: 20pt"></td>
</tr>
<tr>
	<td><img src="./resources/image/heart.png"></td>
	<td>하트25개</td>
	<td><input type="button" class="btn1" value="5000원" onclick="pay25()"style="WIDTH: 50pt; HEIGHT: 20pt"></td>
</tr>
<tr>

<tr>
	<td><img src="./resources/image/heart.png"></td>
	<td>하트50개</td>
	<td><input type="button" class="btn1" value="10000원" onclick="pay50()"style="WIDTH: 50pt; HEIGHT: 20pt"></td>
</tr>


</table>

</div>
</body>
</html>