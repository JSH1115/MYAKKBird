//엔터키 검색 막기
$('input[type="text"]').keydown(function() {
    if (event.keyCode === 13) {
        event.preventDefault();
    };
});
//페이지 이동
function fn_movePage(val){
   jQuery("input[name=pageNo]").val(val);
   jQuery("form[name=frm]").attr("method", "post");
   jQuery("form[name=frm]").attr("action","").submit();
}
//검색 버튼
function fn_search(){
    if( jQuery("#searchS").val() == "" ){
        return;
    }else{
        jQuery("input[name=searchFiled]").val(jQuery("#searchS").val());
    }
    
    var searchValue = jQuery("#searchI").val();
	var d_statusValue = $("input[name='d_status']:checked").val();
	var d_typeValue = $("input[name='d_type']:checked").val();
	
    jQuery("input[name=searchValue]").val(searchValue);
	jQuery("input[name=d_statusValue]").val(d_statusValue);
	jQuery("input[name=d_typeValue]").val(d_typeValue);
	
    jQuery("input[name=pageNo]").val("1");
    jQuery("form[name=frm]").attr("method", "post");
    jQuery("form[name=frm]").attr("action","").submit();
}
function data_member(data) {
	var gender;
	var m_type;
	var m_status;
	var m_id = data.m_id;
	
	if(data.m_gender === "M") {
		gender = '남';
	} else if(data.m_gender === "W") {
		gender = '여';
	}
	
	if(data.m_type === 'C') {
		m_type = '고객';
	} else {
		m_type = '근로자';
	}
	
	if(data.m_status == 'N') {
		m_status = '<b id="m_btn_txt">회원 탈퇴</b>';
	} else {
		m_status = '<b id="m_btn_txt">회원 복귀</b>';
	}
	
	var category = data.m_category.split(",");
	var category_str = new Array();
	
	for(var i = 0; i < category.length; i++) {
		
		switch (category[i]) {
			case 'A':
				category_str[i] = '<img class="cate_img" src="./resources/image/vacuum.png"> 정기청소';
				break;
			case 'B':
				category_str[i] = '<img class="cate_img" src="./resources/image/cleaning-tools.png"> 특수청소';
				break;
			case 'C':
				category_str[i] = '<img class="cate_img" src="./resources/image/kitchen.png"> 입주청소';
				break;
			case 'D':
				category_str[i] = '<img class="cate_img" src="./resources/image/maid.png"> 상주청소';
				break;
			case 'E':
				category_str[i] = '<img class="cate_img" src="./resources/image/apartment.png"> 빌딩청소';
				break;
			case 'F':
				category_str[i] = '<img class="cate_img" src="./resources/image/coronavirus.png"> 방역청소';
				break;
		}
		
	}
	
	Swal.fire({
		  title: 
			'<strong>'+data.m_id+'님 정보입니다.</strong>',
		  html:
		    '<div class="m_header">' +
		    '    <div class="m_photo">' +
		    '        <img class="m_img" src="/myakkbird/myakkbirdUpload/'+data.m_photo+'">' +
		    '        <div class="m_type_div">' +
		    '            <b class="m_t_zone">'+m_type+'</b>' +
		    '        </div>' +
		    '    </div>' +
		    '    <div class="m_profile">' +
		    '    	 <b class="m_p_b">이름 : </b><span class="m_p_span"> '+data.m_name+'</span><br>' +
		    '    	 <b class="m_p_b">나이 : </b><span class="m_p_span"> '+data.m_age+'세</span><br>' +
		    '    	 <b class="m_p_b">성별 : </b><span class="m_p_span"> '+gender+'</span><br>' +
		    '    	 <b class="m_p_b">이메일 : </b><span class="m_p_span"> '+data.m_email+'</span><br>' +
		    '    	 <b class="m_p_b">전화번호 : </b><span class="m_p_span"> '+data.m_phone+'</span><br>' +
		    '    	 <b class="m_p_b">하트개수 : </b><span class="m_p_span"> '+data.m_heart+'개</span><br>' +
		    '    </div>' +
		    '</div>' +
		    '<div class="m_content">' +
		    '    <b class="m_c_b">지번주소</b><br><span>'+data.m_address_road+'</span><br>' +
		    '    <b class="m_c_b">상세주소</b><br><span>'+data.m_address_detail+'</span><br>' +
		    '    <div class="m_category_div">' +
		    '        <b>* 선호하는 청소</b><br>' +
		    '        <span>'+category_str.join(" ")+'</span>' +
		    '    </div>' +
		    '</div>',
		  confirmButtonColor: '#37B04B',
		  confirmButtonText: ''+m_status+'',
		  showCancelButton: true,
		  cancelButtonText: '<b id="m_btn_txt">취소</b>',
	}).then((result) => {
		if (result.value) {
			if(data.m_status == 'N') {
				member_secession(m_id);
			} else {
				member_comeback(m_id);
			}
		}
	})
};
function member_secession(m_id) {
	
	$.ajax({
		url: '/myakkbird/updateStatus_Y.ak?m_id='+m_id+'',
		type: 'GET',
		dataType : "json",
		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		success: function(data) {
			location.reload();
		},
		error:function(){
	        alert("ajax통신 실패!!!");
	    }
	});
	
}
function member_comeback(m_id) {
	
	$.ajax({
		url: '/myakkbird/updateStatus_N.ak?m_id='+m_id+'',
		type: 'GET',
		dataType : "json",
		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		success: function(data) {
			location.reload();
		},
		error:function(){
	        alert("ajax통신 실패!!!");
	    }
	});
	
}
function counterUp(settings) { 
	var $settings = settings; 
	var $target =$settings.ele; 
	var countUpDatas = []; 
	var countFuncs; 
	var nums = []; 
	var delay=$settings.delay || 0.7; 
	// 숫자 올라가는 속도 조절
	var time=$settings.time || 100; 
	var divisions = time / delay; 
	var num = $settings.num; 
	//콤마가 있는지 체크 정규식 
	var isComma = /[0-9]+,[0-9]+/.test(num); num = num.replace(/,/g, ''); 
	// 숫자 목록 생성 
	for (var i = divisions; i >= 1; i--) { 
		// int 인 경우 int로 유지 
		var newNum = parseInt(num / divisions * i); 
		// 쉼표가있는 경우 쉼표 유지 
		if (isComma) { 
			while (/(\d+)(\d{3})/.test(newNum.toString())) { 
				newNum = newNum.toString().replace(/(\d+)(\d{3})/, '$1'+','+'$2'); 
			} 
		} nums.unshift(newNum); 
	} countUpDatas=nums; $target.text('0'); 
	// 완료 될 때까지 번호를 업데이트 
	
	function updateNum() { 
		$target.text( countUpDatas.shift() ); 
		//숫자를 담고 있는 배열 길이가 존재한다면 계속해서 루프 시킴. 
		if (countUpDatas.length) { 
			setTimeout(countFuncs, delay); 
		} else { 
			delete countUpDatas; countUpDatas=null; countFuncs=null; 
		} 
	} 
	
	countFuncs=updateNum; 
	// 카운트 시작 
	setTimeout(countFuncs, delay); 
} 
//실행할 카운트가 여러개일 경우 설정. 
	function numberMotion(items) { 
		if(Object.prototype.toString.call(items)!=='[object Array]') { 
			return 
		} 
		
		for(var i=0;i<items.length;i++) { 
			counterUp( {num:items[i].num, ele:items[i].ele });
		 } 
	} 
	$(document).ready(function() {
	
		var danger_a; // 신고 수 a타입
		var danger_b; // 신고 수 a타입
		var danger_c; // 신고 수 a타입
		var danger_d; // 신고 수 a타입
		var danger_e; // 신고 수 a타입
		
		
		danger_A();
		status_D();
		
		
//A타입신고 수 구하기
	function danger_A(){
		$.ajax({
			url: '/myakkbird/danger_A.ak',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				danger_a = data;
				
				danger_B(danger_a);
				
			},
			error:function(){
		        alert("ajax통신 실패!!!");
		    }
		});
	}
//B타입신고 수 구하기
	function danger_B(danger_a){
		$.ajax({
			url: '/myakkbird/danger_B.ak',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				danger_b = data;
				
				danger_C(danger_a,danger_b);
				
			},
			error:function(){
		        alert("ajax통신 실패!!!");
		    }
		});
	}
//C타입신고 수 구하기
	function danger_C(danger_a,danger_b){
		$.ajax({
			url: '/myakkbird/danger_C.ak',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				danger_c = data;
				
				danger_D(danger_a,danger_b,danger_c);
				
			},
			error:function(){
		        alert("ajax통신 실패!!!");
		    }
		});
	}
//D타입신고 수 구하기
	function danger_D(){
		$.ajax({
			url: '/myakkbird/danger_D.ak',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				danger_d = data;
				
				danger_E(danger_a,danger_b,danger_c,danger_d);
				
			},
			error:function(){
		        alert("ajax통신 실패!!!");
		    }
		});
	}
//E타입신고 수 구하기
	function danger_E(danger_a,danger_b,danger_c,danger_d){
		$.ajax({
			url: '/myakkbird/danger_E.ak',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				danger_e = data;
				
				danger_type(danger_a,danger_b,danger_c,danger_d,danger_e);
				
			},
			error:function(){
		        alert("ajax통신 실패!!!");
		    }
		});
	}

//신고 수 차트
	function danger_type(danger_a,danger_b,danger_c,danger_d,danger_e) {
		var ctx = document.getElementById('myChart');
		var myDoughnutChart = new Chart(ctx, {
		    type: 'doughnut',
		    data: {
		    	    datasets: [{
		    	        data: [danger_a,danger_b,danger_c,danger_d,danger_e],
		    	        backgroundColor: [
							'rgba(204, 204, 000)',
							'rgba(244, 0, 0)',
							'rgba(108, 116, 255)',
							'rgba(255, 102, 051)',
							'rgba(255,0, 255)'
						],
		    	    }],
		    	    labels: [
		    	        '허위정보',
		    	        '음란성',
		    	        '도배/홍보',
		    	        '규정위반',
		    	        '기타'
		    	    ]
		    	},
		    	options: {
                    maintainAspectRatio: false,
                    cutoutPercentage: 50,
                    legend: {
                         display: true,
                         position: 'top',
                         labels: {
                                 fontSize: 12,
                                 fontFamily: 'sans-serif',
                                 fontColor: '#000000',
                                 fontStyle: 'bold'
                                     }
                         }
             }
		});
		
		var if_m;
		
		$('#if_m').html(if_m);
		
		var all_num = danger_a+danger_b+danger_c+danger_d+danger_e;
		var s_danger_a = String(danger_a);
		var s_danger_b = String(danger_b);
		var s_danger_c = String(danger_c);
		var s_danger_d = String(danger_d);
		var s_danger_e = String(danger_e);
		var all = String(all_num);
		
		numberMotion([ 
			{num:s_danger_a, ele:$('#a_num')},
			{num:s_danger_b, ele:$('#b_num')},
			{num:s_danger_c, ele:$('#c_num')},
			{num:s_danger_d, ele:$('#d_num')},
			{num:s_danger_e, ele:$('#e_num')},
			{num:all, ele:$('#all_num')},
		]);
	}
	
// 신고확인중 체크
	function status_D() {
		
		$.ajax({
			url: './dStatus_D.ak',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				status_d = data;
				
				status_O(status_d);
			},
			error:function(){
		        alert("ajax통신 실패!!!");
		    }
		});
		
	}
// 신고 제재 체크
	function status_O(status_d) {
		
		$.ajax({
			url: './dStatus_O.ak',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				status_o = data;
				
				status_X(status_d,status_o);
			},
			error:function(){
		        alert("ajax통신 실패!!!");
		    }
		});
		
	}
	
// 신고 취소 체크
	function status_X(status_d,status_o) {
		
		$.ajax({
			url: './dStatus_X.ak',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				status_x = data;
				
				var d_status_d = String(status_d);
				var d_status_o = String(status_o);
				var d_status_x = String(status_x);
				
				numberMotion([ 
					{num:d_status_d, ele:$('#dd_num')}, 
					{num:d_status_o, ele:$('#do_num')},
					{num:d_status_x, ele:$('#dx_num')}
				]);
			},
			error:function(){
		        alert("ajax통신 실패!!!");
		    }
		});
	}
	
	
	
});
//고객 프로필 보기
	function detail_member(m_id) {
		
		$.ajax({
			url: '/myakkbird/m_detail.ak?m_id='+m_id+'',
			type: 'GET',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				
				data_member(data);
				
			},
			error:function(){
		        alert("ajax통신 실패!!!");
		    }
		});
	}
//신고자 제재하기
	function danger_status(d_id,d_num) {
		Swal.fire({
			  title: d_id,
			  text : '해당 피신고자를 제재 하시겠습니다?',
			  icon : 'info',
			  showCancelButton: true,
			  confirmButtonText: '예',
			  confirmButtonColor:'#37B04B',
			  cancelButtonText: '아니요'			
		}).then((result) => {
			  if (result.value) {
				  	dangerOK(d_num);	
				  	reload(); 
				  } else if (result.dismiss === Swal.DismissReason.cancel) {
				    dangerNO(d_num);
				    reload(); 
				  }
				}) 
	}
	 
//제재하기
	function dangerOK(d_num){
		var data = d_num;
		 
		 jQuery.ajax({
	          url: "/myakkbird/danger_OK.ak", 
	          method: "POST",
	          dataType : 'json',
	          contentType: "application/json",
	          data: data,
	          success: function(res){
	        	  if(res == "OK"){
	        		  
	        	  }
	          },
	          error: function(e) {
	        	    console.log(e);
	        	  }
		  })
	}
//신고 취소
	function dangerNO(d_num){
	var data = d_num;
 	 jQuery.ajax({
	          url: "/myakkbird/danger_NO.ak", 
	          method: "POST",
	          dataType : 'json',
	          contentType: "application/json",
	          data:  data,
	          success: function(retVal){
	        	 if (retVal.res == "OK"){
        	
	           	}else
        	 	{
        	 	}
	          },
	          error: function(e) {
	        	    console.log(e);
	        	  }
		  })
}
	
//새로고침
	function reload(){  
	location.reload();
}
	