<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="java.util.*" %>
<%@ page import= "com.bit.myakkbird.*" %>
   
<% 
//String id = (String)session.getAttribute("id");
String m_type = (String)request.getAttribute("m_type");
%>
<!DOCTYPE html>
<html>
<head>

<style>

#menu_container{
	display:flex;
	flex-direction: column;
	align-items: center;}

.menu{
	width: 400px;
	height:40px;
	margin:10px;
	padding:10px;
	list-style:none;
	border: 4px solid #89df8f;
	border-radius:8px;
	line-height:40px;
	display:flex;
	flex-direction:row;
	justify-content: space-between;
}

.menu span{
	color: #37b04b;
	font-weight: bold;
	font-size: 20px; 
	}

a {
	text-decoration: none;
}

</style>

<meta charset="UTF-8">
<title>mypage_menu</title>
</head>
<body>
<div id="menu_container">
<h1>MY PAGE</h1>
<a href="profile.ak?id=${m_id }"> ${m_id } 프로필 </a>
<% if(m_type.equals("C")){%>
	<section>
		<a href="profile.ak?id=${m_id }" class="menu">프로필 보기(고객)<span>>&nbsp;</span></a>
	</section>
	<section>
		<a class="menu" href="BoardWrite.ak" >게시글 쓰기<span>> &nbsp;</span></a>
	</section>
	<section>
		<a class="menu" href="BoardLoad.ak">게시물 보기<span>> &nbsp;</span></a>
	</section>
	<section>
		<a class="menu" href="allowListC.ak">매칭 게시물 목록<span>> &nbsp;</span></a>
	</section>
	<section>
		<a href="pay.ak" class="menu">결제하기<span>> &nbsp;</span></a>
	</section>
<% }else if(m_type.equals("E")){ %>
	<section>
		<a href="profile.ak?id=${m_id }" class="menu">프로필 보기(근로자)<span>>&nbsp;</span></a>
	</section>
	<section>
		<a class="menu">구인현황<span>> &nbsp;</span></a>
	</section>
	<section>
		<a class="menu" href="likeBoard.ak">찜한 게시물<span>> &nbsp;</span></a>
	</section>
	<section>
		<a class="menu" href="allowListE.ak">매칭 게시물 목록<span>> &nbsp;</span></a>
	</section>
	<section>
		<a href="pay.ak" class="menu">결제하기<span>> &nbsp;</span></a>
	</section>
<% }else if(m_type.equals("M")){ %>
	<section>
		<a class="menu">회원목록(관리자)<span>> &nbsp;</span></a>
	</section>
	<section>
		<a class="menu">매칭내역<span>> &nbsp;</span></a>
	</section>
	<section>
		<a class="menu">신고관리<span>> &nbsp;</span></a>
	</section>
	<section>
		<a class="menu">FAQ 관리<span>> &nbsp;</span></a>
	</section>
<% }else{ %>
	<script type="text/javascript">
	  alert("잘못된 회원 정보입니다!");
	</script>
<% } %>
</div>



</body>
</html>

