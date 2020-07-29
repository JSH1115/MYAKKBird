// 청소 안내 modal
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
	
	// 카테고리 유효성 검사
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
		 document.catefrm.action="./joinformcs.ak";
		 document.catefrm.submit();
	});
	
})