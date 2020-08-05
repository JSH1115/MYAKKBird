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
   var a_applyValue = $("input[name='a_apply']:checked").val();
   
   jQuery("input[name=searchValue]").val(searchValue);
   jQuery("input[name=a_applyValue]").val(a_applyValue);
	   
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
	} else {
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
//숫자 카운팅
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
	var accept_d;
	var accept_y;
	var accept_n;
	
	top_addr();
	accept_D();
	
	
	
	//매칭 미확인 수 구하기
	function accept_D() {
		
		$.ajax({
			url: '/myakkbird/accept_D.ak',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				accept_d = data;
				
				accept_Y(accept_d)
				
			},
			error:function(){
		        alert("ajax통신 실패!!!");
		    }
		});
	}
	
	//매칭 완료 수 구하기
	function accept_Y(accept_d) {
		
		$.ajax({
			url: '/myakkbird/accept_Y.ak',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				accept_y = data;
				
				accept_N(accept_y,accept_d)
				
			},
			error:function(){
		        alert("ajax통신 실패!!!");
		    }
		});
	}
	
	//매칭 전 수 구하기
	function accept_N(accept_y,accept_d) {
		
		$.ajax({
			url: '/myakkbird/accept_N.ak',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				accept_n = data;
				
				accept_type(accept_y,accept_d,accept_n)
				
			},
			error:function(){
		        alert("ajax통신 실패!!!");
		    }
		});
	}
	
	//매칭 게시물 차트
	function accept_type(accept_y,accept_d,accept_n) {
		var ctx = document.getElementById('myChart');
		var myDoughnutChart = new Chart(ctx, {
		    type: 'doughnut',
		    data: {
		    	    datasets: [{
		    	        data: [accept_d,accept_y,accept_n],
		    	        backgroundColor: [
							
		    	        	'rgba(255, 051,000)',
		    	        	'rgba(102, 153, 255)',
							
							'rgba(255, 102, 204)'
						],
		    	    }],
		    	    labels: [
		    	    	'미확인',
		    	        '매칭완료',
		    	        '매칭전'
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
		
		var all_num = accept_d + accept_y + accept_n;
		var s_accept_d = String(accept_d);
		var s_accept_y = String(accept_y);
		var s_accept_n = String(accept_n);
		var all = String(all_num);
		
		numberMotion([ 
			{num:s_accept_d, ele:$('#d_num')},
			{num:s_accept_y, ele:$('#y_num')},
			{num:s_accept_n, ele:$('#n_num')},
			{num:all, ele:$('#all_num')}
		]);
		console.log(all);
		console.log(s_accept_y);
	}
	
	// 가장 많은 매칭 주소 구하기
	function top_addr() {
		 
		$.ajax({
			url: '/myakkbird/top_addr_match.ak',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				
				$.each(data, function(index, item){
					var output = '';
					 
					if(index == 0) {
						output += '<li>'
						output += '    <svg class="best_img" xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 24 24" viewBox="0 0 24 24" fill="#37B04B" width="20px" height="20px"><g><path d="M0,0h24v24H0V0z" fill="none"/><path d="M0,0h24v24H0V0z" fill="none"/></g><g><path d="M12,17.27l4.15,2.51c0.76,0.46,1.69-0.22,1.49-1.08l-1.1-4.72l3.67-3.18c0.67-0.58,0.31-1.68-0.57-1.75l-4.83-0.41 l-1.89-4.46c-0.34-0.81-1.5-0.81-1.84,0L9.19,8.63L4.36,9.04c-0.88,0.07-1.24,1.17-0.57,1.75l3.67,3.18l-1.1,4.72 c-0.2,0.86,0.73,1.54,1.49,1.08L12,17.27z"/></g></svg>&nbsp;<b>'+(index+1)+'. '+item.b_address_road+'</b>'
						output += '</li>'
					} else if(index == 1){
						output += '<li>'
						output += '    <svg class="best_img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#37B04B" width="20px" height="20px"><path d="M0 0h24v24H0z" fill="none"/><path d="M19.65 9.04l-4.84-.42-1.89-4.45c-.34-.81-1.5-.81-1.84 0L9.19 8.63l-4.83.41c-.88.07-1.24 1.17-.57 1.75l3.67 3.18-1.1 4.72c-.2.86.73 1.54 1.49 1.08l4.15-2.5 4.15 2.51c.76.46 1.69-.22 1.49-1.08l-1.1-4.73 3.67-3.18c.67-.58.32-1.68-.56-1.75zM12 15.4V6.1l1.71 4.04 4.38.38-3.32 2.88 1 4.28L12 15.4z"/></svg>&nbsp;<span>'+(index+1)+'. '+item.b_address_road+'</span>'
						output += '</li>'
					} else {
						output += '<li>'
						output += '    <svg class="best_img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#37B04B" width="20px" height="20px"><path d="M0 0h24v24H0V0z" fill="none"/><path d="M19.65 9.04l-4.84-.42-1.89-4.45c-.34-.81-1.5-.81-1.84 0L9.19 8.63l-4.83.41c-.88.07-1.24 1.17-.57 1.75l3.67 3.18-1.1 4.72c-.2.86.73 1.54 1.49 1.08l4.15-2.5 4.15 2.51c.76.46 1.69-.22 1.49-1.08l-1.1-4.73 3.67-3.18c.67-.58.32-1.68-.56-1.75zM12 15.4l-3.76 2.27 1-4.28-3.32-2.88 4.38-.38L12 6.1l1.71 4.04 4.38.38-3.32 2.88 1 4.28L12 15.4z"/></svg>&nbsp;<span>'+(index+1)+'. '+item.b_address_road+'</span>'
						output += '</li>'
					}
					
					$('#addr_top').append(output);
				});
			},
			error:function(){
		        alert("ajax통신 실패!!!");
		    }
		});
	}
	
	
});