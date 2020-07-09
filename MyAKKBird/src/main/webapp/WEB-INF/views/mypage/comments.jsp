<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String b_num= request.getParameter("b_num");
	String id = (String)session.getAttribute("m_id");	
%>
	<!-- 댓글 처리 추가 시작  -->
	<!-- 댓글 -->
	<div>
		<div class="commentsCount"></div>
		<form name="commentsInsertForm">
			<div>
				<input type="hidden" name="b_num" value="<%=b_num %>" />
				<input type="hidden" name="m_id" value="${m_id }" />
				<div class="comm_input_srd">
					<input class="comm_inputbox" type="text" id="c_content" name="c_content" placeholder="내용을 입력하세요." >
					<button class="comm_inputbtn" type="button" name="commentsInsertBtn" onclick="chk_form()" >등록</button>
				</div>
				<label class="chk_comm_input"></label>
			</div>
		</form>
	</div><br/>
	
	<div>
		<div class="commentsList"></div>
	</div>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	
	
	//페이지 로딩시 댓글 목록 출력
	$(document).ready(function() {
		commentsList();
		commentsCount();
	}); 
	
	//댓글유효성검사 (공백문자입력시)
	function chk_form(){
		
		if(document.commentsInsertForm.c_content.value == "")	{
			$('.chk_comm_input').html('댓글 내용을 입력 해주세요.');
			$('.chk_comm_input').css("color", "red");
			document.commentsInsertForm.c_content.focus();
			return false;
		}
		$('.chk_comm_input').empty();	/* .empty() 태그안의 내용을 비워주기 */
		chk_form_Submit();
	}
	
	//유효성검사 후 댓글 데이터 넘겨주기
	function chk_form_Submit() {				

		var b_num = $('[name=b_num]').val();
		var c_content = $('#c_content').val();
		var insertData2 = {
				b_num : b_num,
				c_content : c_content
		};
		commentsInsert(insertData2);
	}
	
	var b_num = <%=b_num %>; //게시판 글내용
	
	//댓글개수구하기
	function commentsCount(){
		$.ajax({
			url : '/myakkbird/comments_count.ak',
			type : 'POST',
			data : {'b_num':b_num},
			dataType : 'json',
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success : function(data) {
				var a = '';
				$.each(data, function(key, value) {
					a += '<h4>댓글 '+value.comment_cnt+'개</h4>';
				});
				$(".commentsCount").html(a);
			},
			error:function() {
				alert("댓글개수ajax 통신 실패(list)!!!");
			}
		});
	}

	//댓글 목록
	function commentsList() {
		
		
		$.ajax({
			url : '/myakkbird/comments_list.ak',
			type : 'POST',
			data : {'b_num':b_num},
			dataType : 'json',
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success : function(data) {
				var a = '';
				$.each(data, function(key, value) {
					if(value.c_re_lev == 0){
						a += '<div class="commentsArea" style="border-bottom:1px solid darkgray; margin-bottom: 5px;">';
						a += '<div class="commentsInfo'+value.c_num+'">'+value.c_date+' / '+value.m_id+'&nbsp;&nbsp;';
						
						if(value.m_id == '<%=id%>'){
						a += '<a onclick="commentsUpdateForm('+value.c_num+', \''+value.c_content+'\');">수정</a>&nbsp;';
						a += '<a onclick="commentsDelete('+value.c_num+');">삭제</a>&nbsp;';
						}
						
						a += '<a onclick="commentsReplyForm('+value.b_num+','+value.c_num+');">답글</a>';
						a += '<svg class="comm_more_vert" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#37B04B" width="18px" height="18px"><path d="M0 0h24v24H0z" fill="none"/><path d="M12 8c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2zm0 2c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm0 6c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"/></svg>';
						a += '</div><div class="maincomm'+value.c_num+'">'+value.c_content;
						a += '<div class="replycomm'+value.b_num+value.c_num+'"></div></div></div>';
					}
					else if(value.c_re_lev == 1){
						a += '<div class="commentsArea" style="border-bottom:1px solid darkgray; margin-bottom: 5px;">';
						a += '<div class="commentsInfo'+value.c_num+'">'+'&nbsp;&nbsp;&nbsp;' + value.c_date+' / '+value.m_id+'&nbsp;&nbsp;';
						
						if(value.m_id == '<%=id%>'){
						a += '<a onclick="commentsUpdateForm('+value.c_num+', \''+value.c_content+'\');">수정</a>&nbsp;';
						a += '<a onclick="commentsDelete('+value.c_num+');">삭제</a>';
						}
												
						a += '</div><div class="maincomm'+value.c_num+'">&nbsp;&nbsp;&nbsp;&nbsp;<svg class="comm_bar" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#37B04B" width="18px" height="18px"><path d="M0 0h24v24H0V0z" fill="none"/><path d="M19 15l-6 6-1.42-1.42L15.17 16H4V4h2v10h9.17l-3.59-3.58L13 9l6 6z"/></svg>'+value.c_content;
						a += '</div></div>';
					}
				});
				
				$(".commentsList").html(a);
			},
			error:function() {
				alert("댓글목록ajax 통신 실패(list)!!!"+b_num);
			}
		});
	} 
	

 	//댓글 등록
	 function commentsInsert(insertData2) {
		$.ajax({
			url : '/myakkbird/comments_insert.ak',
			type : 'POST',
			data : insertData2,
			dataType : 'json',
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success : function(data) {
				if(data == 1) {
					commentsList(); //댓글 작성 후 댓글 목록 reload
					$('[name=c_content]').val('');
				}
			},
			error:function() {
				alert("댓글등록ajax 통신 실패(list)!!!"+insertData+m_id);
			}
		});
	} 
 	
	//대댓글 입력양식
	function commentsReplyForm(b_num, c_num) {
		var a = '';
		
		a += '<div class="comm_input_srd_sub">';
		a += '<input class="comm_inputbox_sub" type="text" name="reply_c_content_'+c_num+'" />';
		a += '<span><button class="comm_inputbtn_sub" type="button" onclick="commentsReplyInsert('+b_num+','+c_num+');">등록</button></span>';	
		a += '</div>';
		
		$('.replycomm'+b_num+c_num).html(a);	
	}
	
	//대댓글 등록
	 function commentsReplyInsert(b_num, c_num) {
		var replyContent = $('[name=reply_c_content_'+c_num+']').val();
		$.ajax({
			url : '/myakkbird/comments_reply_insert.ak',
			type : 'POST',
			data : {'c_content' : replyContent, 'b_num' : b_num, 'c_num' : c_num},
			dataType : 'json',
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success : function(data) {
				if(data == 1) {
					commentsList(); //대댓글 작성 후 댓글 목록 reload
				}
			},
			error:function() {
				alert("댓글등록ajax 통신 실패(list)!!!"+insertData+m_id);
			}
		});
	} 
 	
	//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경
	function commentsUpdateForm(c_num, c_content) {
		var a = '';
		
		a += '<div class="comm_input_srd_sub">';
		a += '<input class="comm_inputbox_sub" type="text" name="c_content_'+c_num+'"value="'+c_content+'"/>';
		a += '<span><button class="comm_inputbtn_sub" type="button" onclick="commentsUpdate('+c_num+');">수정</button></span>';
		a += '</div>';
		
		$('.maincomm'+c_num).html(a);
		
	}
	
	//댓글 수정
	function commentsUpdate(c_num) {
		var updateContent = $('[name=c_content_'+c_num+']').val();
		
		$.ajax({
			url : '/myakkbird/comments_update.ak', 
			type : 'POST',
			data : {'c_content' : updateContent, 'c_num' : c_num},
			dataType : 'json',
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success : function(data) {
				if(data == 1) commentsList(b_num) // 댓글 수정 후 목록 처리
			},
			error:function() {
				alert("ajax 통신 실패(수정list)!!!");
			}
		});
	}
	
	//댓글 삭제
	function commentsDelete(c_num) {
		$.ajax({
			url : '/myakkbird/comments_delete.ak', 
			type : 'POST',
			data : {'c_num' : c_num},
			dataType : 'json',
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success : function(data) {
				if(data == 1) commentsList(b_num);
			},
			error:function() {
				alert("ajax 통신 실패(삭제list)!!!");
			}
		});
	}

</script>
