<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<style>
	#header_container{
		display:flex;
		flex-direction:row;
		justify-content:center;;
		height:80px;
		padding : 20px 400px 20px 400px;
   		border-bottom: 1px solid #bfbebe;
		text-align:center;
		word-spacing: 8px;
	}
	
	#header_container > div {
		width:80%;
	}
	
	#header_container  div{
		display:flex;
		flex-direction:row;
		justify-content: space-around;
	}
	
	#main_logo{
		width: 360px;
		cursor:pointer;
	}
	
	.header_guide{
		position: relative;
	    top: 30px;
	    height: 100px;
	    padding: 0 50px 0 10px;
	    letter-spacing: 2px;
	    font-weight: bold;
	    cursor: pointer;
	}
	
	.btn_header{
		margin:18px 5px 5px 5px;
		width:100px;
		height:50px;
		border-radius: 10px;
		background-color: #89df8f;
		line-height:47px;
		color:white;
		cursor:pointer;
	} 
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	$(document).on('mouseover','.header_guide',function(){
		$(this).css({
			'text-decoration':'underline'
		})
	}).on('mouseleave','.header_guide',function(){
		$(this).css({
			'text-decoration':'none'
		})
	})
	$(document).on('mouseover','.btn_header',function(){
		$(this).css({
			'background-color':'#37b04b',
			'box-shadow': '-9px -9px 9px -9px #d3d3d3, 9px 9px 9px -9px #a9a8a8'
			})
	}).on('mouseleave','.btn_header',function(){
		$(this).css({
			'background-color':'#89df8f',
			'box-shadow':'0 0 0 #ffffff, 0 0 0 #ffffff'
			})
	})
</script>


<section id="header_container">
<div>
	<img src="resources/image/fullLogo_removebg.png" id="main_logo" onclick="location.href='home.ak'">
	
	<div>
		<span class="header_guide" onclick="location.href='guide.ak'"> 처음오셨나요?</span>
		<span class="header_guide" onclick="location.href='pay.ak'"> 하트구매 </span>
	</div>
	
	<c:if test="${login.m_id == null}">
		<div>
			<span class="btn_header" onclick="location.href='loginform.ak'">로그인</span>
			<span class="btn_header" onclick="location.href='joinselect.ak'">회원가입</span>
<!-- 			<img src="resources/image/btn_login.png" class="btn_header" onclick="location.href='loginform.ak'">
			<img src="resources/image/btn_join.png" class="btn_header" onclick="location.href='joinselect.ak'"> -->
		</div>
	</c:if>
	<c:if test="${login.m_id != null}">
		<div>
			
			<span class="btn_header" onclick="location.href='profile.ak?id=${login.m_id }'">${login.m_id}</span>
			<span class="btn_header"onclick="location.href='logOut.ak'">로그아웃</span>
<%-- 			<img src="resources/image/btn_mypage.png" class="btn_header" onclick="location.href='profile.ak?id=${login.m_id }'">
			<img src="resources/image/btn_logout.png" class="btn_header" onclick="location.href='logOut.ak'"> --%>
			
		</div>
	</c:if>
</div>
</section>