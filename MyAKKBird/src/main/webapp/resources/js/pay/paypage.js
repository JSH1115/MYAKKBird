//뒤로 가기
$('#back_btn').click(function() {
	location.href="./profile.ak?id="+m_id+"";
});

// 하트 구입 안내
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

//하트 5개 결제
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
          buyer_email : m_email,
          buyer_name : m_name,
          buyer_tel : m_phone,
          buyer_addr : m_address_road,
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
		              m_id: m_id,
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
  
// 하트 결제 25개
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
          buyer_email : m_email,
          buyer_name : m_name,
          buyer_tel : m_phone,
          buyer_addr : m_address_road,
          buyer_postcode : '123-456',
          // 결제 완료후 이동할 페이지. kakao나 kakaopay는 생략함
          //m_redirect_url : 'https://localhost:8080/payments/complete' / 
      }, function(rsp) {
          if ( rsp.success ) { // 결제 성공시 
          	var newData =   {
				   p_price: rsp.paid_amount,
		              m_id: m_id,
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

// 하트 결제 50개
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
          buyer_email : m_email,
          buyer_name : m_name,
          buyer_tel : m_phone,
          buyer_addr : m_address_road,
          buyer_postcode : '123-456',
          // 결제 완료후 이동할 페이지. kakao나 kakaopay는 생략함
          //m_redirect_url : 'https://localhost:8080/payments/complete' / 
      }, function(rsp) {
          if ( rsp.success ) { // 결제 성공시 
          	var newData =   {
				   p_price: rsp.paid_amount,
		              m_id: m_id,
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

// 새로 고침
function reload() { 
    location.reload();
}