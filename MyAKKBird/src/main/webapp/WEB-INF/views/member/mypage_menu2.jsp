<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
$(document).ready(function(){
	$('.eachMenu').hover(function(){
		$(this).css('border-top','solid 2px #89df8f');
		$(this).css('border-right','solid 14px #89df8f');
		$(this).css('border-bottom','solid 2px #89df8f');
		$(this).css('border-left','solid 14px #89df8f');
	}, function(){
		$(this).css('border','none')
	})
})
</script>
	
	<% String m_type = (String)request.getAttribute("m_type"); %>
	
	<% if(m_type.equals("C")){ %>
		<div class="eachMenu" onclick="location.href='BoardWrite.ak'">
			<div>게시글 쓰기</div>
		</div>
		<div class="eachMenu" onclick="location.href='BoardLoad.ak'">
			<div> 게시물 보기 </div>
		</div>
		<div class="eachMenu" onclick="location.href='allowListC.ak'">
			<div>매칭게시물 목록</div>
		</div>
		<div class="eachMenu" onclick="location.href='pay.ak'">
			<div>하트 구매</div>
		</div>
	<% }else if (m_type.equals("E")){%>
		<div class="eachMenu" onclick="location.href='likeBoard.ak'">
			<div>찜한 게시물</div>
		</div>
		<div class="eachMenu" onclick="location.href=''">
			<div>구인현황</div>
		</div>
		<div class="eachMenu" onclick="location.href='allowListE.ak'">
			<div>매칭게시물 목록</div>
		</div>
		<div class="eachMenu" onclick="location.href='pay.ak'">
			<div>하트 구매</div>
		</div>
	<% } else if(m_type.equals("M")){ %>
		<div class="eachMenu" onclick="location.href='memberList.ak'">
			<div>회원목록</div>
		</div>
		<div class="eachMenu" onclick="location.href='matchingList.ak'">
			<div>매칭내역</div>
		</div>
		<div class="eachMenu" onclick="location.href='DangerList.ak'">
			<div>신고관리</div>
		</div>
		<div class="eachMenu">
			<div>FAQ관리</div>
		</div>
	<% } %>