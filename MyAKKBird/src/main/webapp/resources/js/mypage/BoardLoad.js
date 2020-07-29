//전역 변수
var b_num;                         // 게시글 번호
var img_d = '';                    // 카테고리 이미지
var category_d = '';               // 카테고리 텍스트
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
	location.href="./profile.ak?id="+m_id+"";
});
// 내가 쓴 게시글이 없을 경우 
function noData() {
	$('#count_b').empty();
	
	var output = '';
	
	output += '<div class="noData_div">'
	output += '    <div class="noData_txt">'
	output += '        <b class="noData_b">등록된 게시글이 없습니다...</b><br>'
	output += '        <div class="noData_a">'
	output += '            <a href="./BoardWrite.ak"><svg class="go_b_img" xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 24 24" viewBox="0 0 24 24" fill="#37b04b" width="48px" height="48px"><g><rect fill="none" height="24" width="24"/><rect fill="none" height="24" width="24"/></g><g><g/><g><path d="M18,12c-0.55,0-1,0.45-1,1v5.22c0,0.55-0.45,1-1,1H6c-0.55,0-1-0.45-1-1V8c0-0.55,0.45-1,1-1h5c0.55,0,1-0.45,1-1 c0-0.55-0.45-1-1-1H5C3.9,5,3,5.9,3,7v12c0,1.1,0.9,2,2,2h12c1.1,0,2-0.9,2-2v-6C19,12.45,18.55,12,18,12z"/><path d="M21.02,5H19V2.98C19,2.44,18.56,2,18.02,2h-0.03C17.44,2,17,2.44,17,2.98V5h-2.01C14.45,5,14.01,5.44,14,5.98 c0,0.01,0,0.02,0,0.03C14,6.56,14.44,7,14.99,7H17v2.01c0,0.54,0.44,0.99,0.99,0.98c0.01,0,0.02,0,0.03,0 c0.54,0,0.98-0.44,0.98-0.98V7h2.02C21.56,7,22,6.56,22,6.02V5.98C22,5.44,21.56,5,21.02,5z"/><path d="M14,9H8c-0.55,0-1,0.45-1,1c0,0.55,0.45,1,1,1h6c0.55,0,1-0.45,1-1C15,9.45,14.55,9,14,9z"/><path d="M14,12H8c-0.55,0-1,0.45-1,1c0,0.55,0.45,1,1,1h6c0.55,0,1-0.45,1-1C15,12.45,14.55,12,14,12z"/><path d="M14,15H8c-0.55,0-1,0.45-1,1c0,0.55,0.45,1,1,1h6c0.55,0,1-0.45,1-1C15,15.45,14.55,15,14,15z"/></g></g></svg>'
	output += '                <span class="go_B_t">게시글 등록하러 가기</span>'
	output += '            </a>'
	output += '        </div>'
	output += '    </div>'
	output += '</div>'
	
	$('#noDataZone').html(output);
}
// 카테고리, 이미지 설정
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
// 게시글 개수
function board_count(index, startNo) {
	var count = '';
	var listNum = (index+startNo+1);
	
	count += '총 게시글 '+listNum+'개'
	
	$('#count_b').html(count);
}
// 게시글 출력 
function board_list(index, item, startNo) {
	var output = '';
	var apply = '';                 
	
	if(item.b_apply === "N") {
		apply = '매칭 대기중';
	} else if(item.b_apply === "Y") {
		apply = '<b style="color:red;">매칭 완료</b>';
	}
	
	var startDay = moment(item.b_start).format("YY년 M월 D일");
	var writeDay = moment(item.b_date).format("YY년 M월 D일");
	
	var b_num = item.b_num;
	apply_conunt(b_num);
	
	output += '<li id="list_id" data-no='+(index+startNo+1)+'>'
	output += '    <div class="post" id="post_id">'
	output += '	       <div class="post_main">'
	output += '            <span class="post_no">no.'+item.b_num+'</span>'
	output += '            <img class="post_photo" src="/myakkbird/myakkbirdUpload/'+item.m_photo+'"><br>'
	output += '            <span class="photo_span" id="count'+item.b_num+'"></span>'
	output += '        </div>'
	output += '        <div class="post_center">'
	output += '            <span class="post_subject"><b>'+item.b_subject+'</b></span><b class="b_cate">'+category_d+'<img class="post_img" src="./resources/image/'+img_d+'"></b><br>'
	output += '            <span><b>신청여부</b> '+apply+'</span><br>'
	output += '            <span><b>청소시작</b> '+startDay+'</span><br>'
	output += '            <span><b>지번주소</b> '+item.b_address_road+'</span><span class="span_date"><b>조회</b> '+item.b_readcount+'</span><br>'
	output += '            <span><b>희망시급</b> '+item.b_money+'원</span><span class="span_date"><b>작성</b> '+writeDay+'</span><br>'
	output += '        </div>'
	output += '        <div class="hr_div">'
	output += '            <hr class="post_hr">'
	output += '        </div>'
	output += '        <div class="post_bottom">'
	output += '            <ul id="check_ul">'
	output += '                <li id="check_li">'
	output += '                    <a href="./allowListC.ak" id="a_btn">신청내역보기</a>'
	output += '                </li>'
	output += '                <li id="check_li">'
	output += '                    <a href="./BoardDetail.ak?b_num='+item.b_num+'&e_id='+m_id+'" class="detail_btn" id="a_btn">게시글 보기</a>'
	output += '                </li>'
	output += '                <li id="check_li">'
	output += '                    <a href="./boardUpdate.ak?b_num='+item.b_num+'" id="a_btn">게시글 수정</a>'
	output += '                </li>'
	output += '                <li id="check_li">'
	output += '                    <a id="a_btn_delete'+item.b_num+'" class="delete_a">게시글 삭제</a>'
	output += '                    <div id="delete_id'+item.b_num+'" class="delete_list">'
	output += '                        <div id="dia'+item.b_num+'">'
	output += '                            <div class="dialog">'
	output += '                                <a id="deleteB'+item.b_num+'">'
	output += '                                    <span class="delete_txt">삭제</span>'
	output += '                                    <svg class="delete_icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#212121;" width="30px" height="30px"><path d="M0 0h24v24H0z" fill="none"/><path d="M6 19c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V7H6v12zM19 4h-3.5l-1-1h-5l-1 1H5v2h14V4z"/></svg>'
	output += '                                </a>'
	output += '                            </div>'
	output += '                        </div>'
	output += '     	           </div>'
	output += '                </li>'
	output += '            </ul>'
	output += '        </div>'
	output += '    </div>'
	output += '</li>'
	
	$('#boardList').append(output);
	
	delete_board(item);
}
// 게시글 삭제
function delete_board(item) {
	
	// 게시글 삭제 버튼 클릭
	$('#a_btn_delete'+item.b_num).on('click', function() {
		
		$('#delete_id'+item.b_num).toggle();
	});
	
	// 게시글 삭제
	$(document).on("click", '#deleteB'+item.b_num, function() {
		
		$.ajax({
			url : '/myakkbird/board_delete.ak?b_num='+item.b_num+'',
			type : 'GET',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				
				location.reload();
				
			},
			error:function(){
		        alert("ajax통신 실패!!!");
		    }
		})
		
	});
}
// 게시글 지원 인원 카운트
function apply_conunt(b_num) {
	
	$.ajax({
		url: '/myakkbird/chk_applyCount.ak?b_num='+b_num+'',
		type : 'GET',
		dataType : "json",
		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		success: function(data) {
			var count = data+'명 지원'
			
			$('#count'+b_num).html(count);
		},
		error:function(){
	        alert("ajax통신 실패!!!");
	    }
	});
	
}
// 무한 스크롤 후 데이터 없을시
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
}
// 조건 검색 창 보이기, 숨기기
$('#search_a').on('click', function() {
	$('.board_search').toggle();
});
// 조건 검색 클릭 후 게시물 5개 출력
$(document).on('click', '#s_btn_id', function(event){
	var params = $('#search_form').serialize();
	
	$(window).unbind();
	scroll_top();
	
	$.ajax({
		url: '/myakkbird/cb_sload.ak',
		type : 'POST',
		data : params,
		dataType : "json",
		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		success: function(data) {
			$('#boardList').empty();
			$('#end').empty();
			$('#noDataZone').empty();
			
			if(isEmpty(data)) {
				noData();
			}
			
			$.each(data, function(index, item){
				var startNo = 0;
				
				category_list(item);
				board_list(index, item, startNo);
				board_count(index, startNo);
			})
			
			$(window).scroll(function () {
				var scrollHeight = $(window).scrollTop() + $(window).height(); 
				var documentHeight = $(document).height();
		
				if(scrollHeight >= documentHeight) {
					appendDocument2(params);
				}
			})
		},
		error:function(){
	        alert("ajax통신 실패!!!");
	    }
	});
});
function appendDocument2(params) {
	
	var startNo = $("#boardList #list_id").last().data("no") || 0;
	$.ajax({
		url : '/myakkbird/cb_sinfinite.ak?startNo='+startNo+'',
		type : 'POST',
		data : params,
		dataType : "json",
		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		success: function(data) {
            
			if(isEmpty(data)) {
				end_board();
			}
			
			$.each(data, function(index, item){
				
				category_list(item);
				board_list(index, item, startNo);
				board_count(index, startNo);
				
			})
		},
		error:function(){
	        alert("ajax통신 실패!!!");
	    }
	});
	event.preventDefault();
}
$(document).ready(function(){
	
	scroll_top();
	onload();
	
	// 내가 쓴 게시글 5개 출력
	function onload() {
		
		$.ajax({
			url: '/myakkbird/cb_load.ak?m_id='+m_id+'',
			type : 'GET',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
				
				if(isEmpty(data)) {
					noData();
				}
				
				$.each(data, function(index, item){
					var startNo = 0;
					
					category_list(item);
					board_list(index, item, startNo);
					board_count(index, startNo);
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
	
	// 무한 스크롤(내가 쓴 게시글)
	function appendDocument() {
		
		var startNo = $("#boardList #list_id").last().data("no") || 0;
		
		$.ajax({
			url : '/myakkbird/cb_infinite.ak?m_id='+m_id+'&startNo='+startNo+'',
			type : 'GET',
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success: function(data) {
	            
				if(isEmpty(data)) {
					end_board();
				}
				
				$.each(data, function(index, item){
					
					category_list(item);
					board_list(index, item, startNo);
					board_count(index, startNo);
					
				})
			},
			error:function(){
		        alert("ajax통신 실패!!!");
		    }
		});
		event.preventDefault();
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