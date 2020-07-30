//전역 변수
var img_d = '';          // 카테고리 이미지
var category_d = '';     // 카테고리 텍스트
var gender = '';         // 성별
//전역 변수
// 데이터 체크
var isEmpty = function(val) {
	if(val === "" || val === null || val === undefined 
		||(val !== null && typeof val === "object" && !Object.keys(val).length)
		) {
		return true
	} else {
		return false
	}
};

$('#back_btn').click(function() {
	location.href="./profile.ak?id="+se_id+"";
});

//찜한 게시글이 없을 경우
function noData() {
	$('#count_b').empty();
	$('#go_mainPoint').empty();
	
	var output = '';
	
	output += '<div class="noLike_div">'
	output += '    <div class="noLike_txt">'
	output += '        <b class="noLike_b">찜한 게시글이 없습니다...</b><br>'
	output += '        <div class="noLike_a">'
	output += '            <a href="./searchProcess.ak?b_address_road="><svg class="go_b_img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#37B04B" width="48px" height="48px"><path d="M0 0h24v24H0z" fill="none"/><path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/></svg>'
	output += '                <span class="go_B_t">찜하러 가기</span>'
	output += '            </a>'
	output += '        </div>'
	output += '    </div>'
	output += '</div>'
	
	$('#noLikeZone').html(output);
};
//무한 스크롤 후 데이터 없을시
function end_board() {
	var end_div = '';
	
	end_div += '<div class="end_title">'
	end_div += '	<div class="end_txt">'
	end_div += '        <div>'
	end_div += '            <svg class="end_icon" xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 24 24" viewBox="0 0 24 24" fill="#424242;" width="48px" height="48px"><g><rect fill="none" height="24" width="24"/></g><g><g><path d="M15.5,14h-0.79l-0.28-0.27C15.41,12.59,16,11.11,16,9.5C16,5.91,13.09,3,9.5,3C6.08,3,3.28,5.64,3.03,9h2.02 C5.3,6.75,7.18,5,9.5,5C11.99,5,14,7.01,14,9.5S11.99,14,9.5,14c-0.17,0-0.33-0.03-0.5-0.05v2.02C9.17,15.99,9.33,16,9.5,16 c1.61,0,3.09-0.59,4.23-1.57L14,14.71v0.79l5,4.99L20.49,19L15.5,14z"/><polygon points="6.47,10.82 4,13.29 1.53,10.82 0.82,11.53 3.29,14 0.82,16.47 1.53,17.18 4,14.71 6.47,17.18 7.18,16.47 4.71,14 7.18,11.53"/></g></g></svg>'
	end_div += '        </div>'
	end_div += '        <b>게시글이 없어요..!</b>'
	end_div += '	</div>'
	end_div += '</div>'
	
	$('#end').html(end_div);
};
//게시글 개수
function board_count(index, startNo) {
	var count = '';
	var listNum = (index+startNo+1);
	
	count += '찜한 게시글 '+listNum+'개'
	
	$('#count_b').html(count);
}
//카테고리, 이미지 설정
function category_list(item) {
	if(item.b_category === "A") {
		img_d = 'vacuum.png';
		category_d = '정기청소';
	} else if(item.b_category === "B") {
		img_d = 'cleaning-tools.png';
		category_d = '특수청소';
	} else if(item.b_category === "C") {
		img_d = 'kitchen.png';
		category_d = '입주청소';
	} else if(item.b_category === "D") {
		img_d = 'maid.png';
		category_d = '상주청소';
	} else if(item.b_category === "E") {
		img_d = 'apartment.png';
		category_d = '빌딩청소';
	} else if(item.b_category === "F") {
		img_d = 'coronavirus.png';
		category_d = '방역청소';
	}
}
//게시글 출력
function list_index(index, item, startNo) {
	var output = '';
	var hot_b = '';
	var photo = '';
	var c_heart = '';
	var today = new Date();
	var to_day = moment(today).format("M월 D일 작성");
	// 게시글 작성 날짜 포맷
	var board_day = moment(item.b_date).format("M월 D일 작성");
	
	// 조회 수 체크
	if(item.b_readcount > 800) {
		hot_b = '<b class="hot_b">인기 게시글</b>';
	} else if(item.b_readcount > 400) {
		hot_b = '<b class="hot_b">관심 게시글</b>';
	} else if(to_day == board_day) {
		hot_b = '<b class="hot_b">오늘 작성글</b>';
	}
	
	// 성별 체크
	if(item.m_gender === 'M') {
		gender = '남';
	} else {
		gender = '여';
	}
	
	if(item.w_state == 'Y') {
		c_heart = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#37B04B" width="30px" height="30px"><path d="M0 0h24v24H0z" fill="none"/><path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/></svg>'
	}
	
	output += '<li data-no='+(index+startNo+1)+' id="list_id">'
	output += '<div class="post" id="post_id'+item.b_num+'">'
	output += '    <div class="post_top">'
	output += '        <strong>'+item.b_subject+'</strong>'
  	output += '            <span class="post_top_span">'+category_d+''	
  	output += '                <img class="post_top_img" src="./resources/image/'+img_d+'">'
  	output += '            </span>'
  	output += '	       <hr class="post_hr">'
  	output += '    </div>'
  	output += '    <div class="post_img">'
  	output += '        <img class="profile" src="/myakkbird/myakkbirdUpload/'+item.m_photo+'">'
  	output += '        <div class="readcount_zone">'+hot_b+'</div>'
  	output += '    </div>'
  	output += '    <div class="post_right">'
  	output += '        <b class="post_r_sub">'+item.m_name.substr(0, 1)+'O'+item.m_name.substr(2, 3)+'</b>'
  	output += '        <span class="post_r_span">'+gender+'</span>'
  	output += '        <a class="favorites" id="f_id'+item.b_num+'" onclick="delete_like('+item.b_num+')">'+c_heart+'</a><br>'
  	output += '        <span class="post_r_span">'+item.b_address_road+'</span><br>'
  	output += '        <span class="post_r_span">'+item.m_age+'세 | </span>'
  	output += '        <span class="post_r_span">희망시급 '+item.b_money+'원</span><br>'
  	output += '        <span class="post_r_span">'+moment(item.b_start).format("M월 D일")+' 청소시작</span>'
  	output += '        <span class="post_r_id"><b>ID </b>'+item.m_id+'</span><br>'
  	output += '        <a class="post_r_detail" href="./BoardDetail.ak?b_num='+item.b_num+'&e_id='+se_id+'"><svg class="move_icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#37B04B" width="22px" height="22px"><path d="M0 0h24v24H0z" fill="none"/><path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"/></svg>자세히보기</a>'
  	output += '        <span class="time_zone">'+board_day+'</span><br>'
  	output += '    </div>'
  	output += '</div>'
  	output += '</li>'
  	
  	$('#data_insert').append(output);
  	
};
//게시글 찜하기 삭제
function delete_like(b_num) {
	
	Swal.fire({
		  html:
			  '<b style="margin-top: 10px; float:right; margin-right:90px;">&nbsp;찜 목록에서 삭제할까요?</b>' +
			  '<svg style="margin-left:-300px; float:right;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#37B04B" width="48px" height="48px"><path d="M0 0h24v24H0z" fill="none"/><path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/></svg>',
		  showCancelButton: true,
		  confirmButtonColor: '#37B04B',
		  cancelButtonColor: '#E6E6E6',
		  confirmButtonText: '<div class="go_btn">삭제</div>',
	      cancelButtonText: '<div class="go_btn">취소</div>'
	}).then((result) => {
	    if (result.value) {
	    	
	    	$.ajax({
	    		url: '/myakkbird/delete_like.ak?b_num='+b_num+'&m_id='+se_id+'',
	    		type: 'GET',
	    		dataType: "json",
	    		contentType: 'application/x-www-form-urlencoded; charset=utf-8',
	    		success: function(data) {
	    			
	    			location.reload();
	    		},
	    		error:function(){
	    	        alert("ajax통신 실패!!!");
	    	    }
	    	});
	    	
		}
	})
	
}
$(document).ready(function(){
	
	onload();
	scroll_top();
	
	//찜한 게시물 5개 출력
	function onload() {
		
		$.ajax({
			url: '/myakkbird/like_boardList.ak?m_id='+se_id+'',
			type : 'GET',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				
				if(isEmpty(data)) {
					noData();
				}
				
				$.each(data, function(index, item){
					var startNo = 0;
					
					board_count(index, startNo);
					category_list(item);
					list_index(index, item, startNo);
				})
				
				$(window).scroll(function () {
					var scrollHeight = $(window).scrollTop() + $(window).height(); 
					var documentHeight = $(document).height();
			
					if(scrollHeight >= documentHeight) {
						appendDocument();
					}
				})
				
			},
			error:function(){
		        alert("ajax통신 실패!!!");
		    }
		});
	}
	
	//찜한 게시물 무한스크롤
	function appendDocument() {
		
		var startNo = $("#data_insert #list_id").last().data("no") || 0;
		
		$.ajax({
			url: '/myakkbird/like_bInfinite.ak?m_id='+se_id+'&startNo='+startNo+'',
			type : 'GET',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				
				if(isEmpty(data)) {
					end_board();
				}
				
				$.each(data, function(index, item){
					
					board_count(index, startNo);
					category_list(item);
					list_index(index, item, startNo);
				})
				
			},
			error:function(){
		        alert("ajax통신 실패!!!");
		    }
		});
	}
});
//스크롤 Top 기능
function scroll_top() {
	$(window).scroll(function() {
		if($( this).scrollTop() > 200 ) {
			$('.top').fadeIn();
		} else {
			$('.top').fadeOut();
		}
	});
	
	$('.top').click(function() {
		$('html, body').animate({ scrollTop : 0 }, 400);
		return false;
	});
};