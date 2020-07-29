var m_type;                       //회원 타입

$(document).ready(function() {
	
	if(m_id != null) {
		memberCheck();
	}
	
});

// 회원 체크
function memberCheck() {
	
	$.ajax({
		url: '/myakkbird/faqMemberCheck.ak?m_id='+m_id+'',
		type: 'GET',
		dataType : "json",
		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		success: function(data) {
			var output = '';
			m_type = data.m_type;
			
			if(m_type === 'M') {
				output += '<b id="faq_count">총 FAQ게시글 '+listcount+'개</b>'
				output += '<a href="FAQWrite.ak" id="faq_w_move">FAQ 작성</a>'
				
				$('.admin_zone').html(output);
			}
		}
	});
}
// FAQ 자세히 보기
function detail_view(f_num) {
	$('#f_c_div'+f_num).toggle();
	
	$.ajax({
		url: '/myakkbird/faq_detail.ak?f_num='+f_num+'',
		type: 'GET',
		dataType : "json",
		contentType : 'application/x-www-form-urlencoded; charset=utf-8',
		success: function(data) {
			var output = '';
			var f_board_day = moment(data.f_date).format("YYYY.M.D");
			
			output += '<div class="f_content_zone">'
			output += '    <b id="d_b_txt">답변 : </b>'
			output += '    <p id="p_txt">&nbsp;'+data.f_content+'</p><br>'
			output += '    <span id="span_d_txt">'+f_board_day+'</span><br>'
			output += '</div>'
			
			if(m_type === 'M') {
				output += '<div class="work_div">'
				output += '    <a href="./faq_update.ak?f_num='+f_num+'" id="work_btn">수정</a>'
				output += '    <a href="./faq_delete.ak?f_num='+f_num+'" id="work_btn">삭제</a>'
				output += '</div>'
			}
			
			$('#cd_id'+f_num).html(output);
		}
	});
}