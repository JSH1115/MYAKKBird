<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
$(document).ready(function(){
	$('.eachMenu').hover(function(){
		$(this).css('border','solid 4px #37b04b');
	}, function(){
		$(this).css('border','solid 4px #89df8f')
	})
})
</script>

	<a href="profile.ak?id=ljy7828"> ljy7828프로필 </a>
	<a href="profile.ak?id=rain1208"> rain1208프로필 </a>
	
	
	<% String m_type = (String)request.getAttribute("m_type"); %>
	
	<% if(m_type.equals("C")){ %>
		<div  class="eachMenu" onclick="location.href='profile.ak?id=${m_id}'">
			<div>프로필 보기</div>
			<div class= "dir"> > </div>
		</div>
		<div class="eachMenu" onclick="location.href='BoardWrite.ak'">
			<div>게시글 쓰기</div>
			<div class= "dir"> > </div>
		</div>
		<div class="eachMenu" onclick="location.href='BoardLoad.ak'">
			<div> 게시물 보기 </div>
			<div class= "dir"> > </div>
		</div>
		<div class="eachMenu" onclick="location.href='allowListC.ak'">
			<div>매칭게시물 목록</div>
			<div class= "dir"> > </div>
		</div>
		<div class="eachMenu" onclick="location.href='pay.ak'">
			<div>하트 구매</div>
			<div class= "dir"> > </div>
		</div>
	<% }else if (m_type.equals("E")){%>
		<div class="eachMenu" onclick="location.href='profile.ak?id=${m_id}'">
			<div>프로필보기</div>
			<div class= "dir"> > </div>
		</div>
		<div class="eachMenu" onclick="location.href='likeBoard.ak'">
			<div>찜한 게시물</div>
			<div class= "dir"> > </div>
		</div>
		<div class="eachMenu" onclick="location.href=''">
			<div>구인현황</div>
			<div class= "dir"> > </div>
		</div>
		<div class="eachMenu" onclick="location.href='allowListE.ak'">
			<div>매칭게시물 목록</div>
			<div class= "dir"> > </div>
		</div>
		<div class="eachMenu" onclick="location.href='pay.ak'">
			<div>하트 구매</div>
			<div class= "dir"> > </div>
		</div>
	<% } else if(m_type.equals("M")){ %>
		<div class="eachMenu">
			<div>회원목록</div>
			<div class= "dir"> > </div>
		</div>
		<div class="eachMenu">
			<div>매칭내역</div>
			<div class= "dir"> > </div>
		</div>
		<div class="eachMenu">
			<div>신고관리</div>
			<div class= "dir"> > </div>
		</div>
		<div class="eachMenu">
			<div>FAQ관리</div>
			<div class= "dir"> > </div>
		</div>
	<% } %>
	