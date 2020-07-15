<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.bit.myakkbird.mainpoint.*" %>
<%@page import="java.util.ArrayList"%>
<% 
	MasterVO applyBoardVO = (MasterVO)request.getAttribute("applyBoardVO");
	ArrayList<MasterVO> applyEmpProfile = (ArrayList<MasterVO>)request.getAttribute("applyEmpProfile");
	//A:정기청소 B:특수청소 C:입주청소 D:상주청소 E:빌딩청소 F:방역청소
	//카테고리 이미지도 같이 처리해주기
	String str = applyBoardVO.getB_category();
	String b_category = "", b_category_img="";
	
	switch(str){
		case "A" : b_category = "정기청소";
				   b_category_img = "vacuum.png";
				  break;
		case "B" : b_category = "특수청소";
				   b_category_img = "cleaning-tools.png";
		  		  break;
		case "C" : b_category = "입주청소";
				   b_category_img = "kitchen.png";
		 		  break;
		case "D" : b_category = "상주청소";
				   b_category_img = "maid.png";
		 		  break;
		case "E" : b_category = "빌딩청소";
				   b_category_img = "apartment.png";
				  break;
		case "F" : b_category = "방역청소";
				   b_category_img = "coronavirus.png";  		  
				  break;
		default  : b_category = "기타청소";
				   b_category_img = "img_default.png";
	}
	if(applyBoardVO.getB_apply().equals("N")) {
		applyBoardVO.setB_apply("매칭 대기중");
	} else if(applyBoardVO.getB_apply().equals("Y")) {
		applyBoardVO.setB_apply("매칭 완료");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
	html, body {
	 	width: 100%;
	 	height: auto;
	 	margin: 0 auto;
	 	padding: 0;
	}
	.postSround{
		margin: 18px auto;
		width: 580px;
		height: 210px;
		/* background-color: white; */
		box-shadow: 10px 10px 10px -3px #d3d3d3,
	                3px 3px 7px -3px #d3d3d3;
	    background: #A1FFCE; 
		background: -webkit-linear-gradient(to right, #FAFFD1, #A1FFCE);  
		background: linear-gradient(to right, #FAFFD1, #A1FFCE);               
	}
	.post {
		margin: 14px;
		width: 550px;
		height: 180px;
		position: absolute;
		border: 0.1px solid #d3d3d3; 
		border-radius: 5px;
		background-color: white; 
		box-shadow: -3px -3px 7px -3px #d3d3d3,
	                3px 3px 7px -3px #d3d3d3;                       
	}
	
	.post_main {
		width: 100px;
		height: 70px;
		float: left;
	}
	
	.post_no {
		font-size: 11px;
		margin-left: 10px;
	}
	
	.post_photo {
		width: 100px; 
		height: 100px;
		margin-left: 35px;
		margin-top: 7px;
		border-radius: 25px;
		border: 1px solid #d3d3d3;
	}
	
	.photo_span {
		margin-left: 36px;
		font-size: 12px;
		color: #37B04B;
		padding: 3px;
	}
	
	.post_center {
		width: 450px;
		height: 70px;
		font-size: 13px;
		float: right;
		margin-top: 15px;
	}
	.post_center_bottom{
		font-size: 13px;
		float: right;
		margin-top: 84px;
	}
	
	.post_subject {
		font-size: 17.5px;
	}
	
	.post_subject_b{
		margin-left: -28px;
	}
	
	.post_center span {
		margin-left: 84px;
	}
	
	.b_cate {
		float:right;
		margin-top: 1px;
		margin-left: -15px;
	}
	
	.post_img {
		width: 23px; 
		height: 23px;
		margin-right: 30px;
		margin-top: -4px;
		float: right;
	}
	
	.profileListSround{
		margin: 0 auto;
		padding: 0;
		width: 600px;
		height: auto;
		background-color: #E6E6E6; 
		box-shadow: 10px 10px 10px -3px #d3d3d3,
	                3px 3px 7px -3px #d3d3d3;
	}
	
	.profile{
		margin: 18px auto;
		margin-left: -15px;
		width: 550px;
		height: 180px;
		border: 0.1px solid #d3d3d3; 
		border-radius: 5px;
	 	background-color: white;
		box-shadow: -3px -3px 7px -3px #d3d3d3,
	                3px 3px 7px -3px #d3d3d3; 
	}
	
	.profile_main{
		width: 100px;
		height: 70px;
		float: left;
	}
	
	.endDiv{
		margin: 0 auto;
		padding: 0;
		width: 600px;
		height: 15px;
		margin-top: -20px;
		background-color: #E6E6E6; 
		box-shadow: 10px 10px 10px -3px #d3d3d3,
	                3px 3px 7px -3px #d3d3d3;
	}
	.startDiv{
		margin: 0 auto;
		padding: 0;
		width: 600px;
		height: 15px;
		margin-bottom: -20px;
		background-color: #E6E6E6; 
		box-shadow: 10px 10px 10px 0px #d3d3d3,
	                3px 3px 7px -3px #d3d3d3;
	}
	
	.profile_photo{
	    width: 90px;
	    height: 90px;
	    margin: 7px 230px;
	    position: absolute;
	    border-radius: 100px;
	    border: 1px solid #d3d3d3;
	    z-index: 1;
	}
	
	.profile_wingL{
		width: 80px;
	    height: 87px;
	    position: absolute;
	    margin: 1px 166px;
	}
	
	.profile_wingR{
		width: 80px;
	    height: 87px;
	    position: absolute;
	    margin: 1px 311px;
	}
	.profile_center{
		width: auto;
	    margin: 110px 230px;
	    position: absolute;
	}
	.division_line{
		position: relative;
	    float: left;
	    margin-right: 5px;
	    width: 1px;
	    height: 18px;
	    background-color: #ccc;
	}
	.profile_name{
		position: relative;
	    float: left;
	    margin-right: 5px;
	    margin-left: -25px;
	  	color: #424242;
	}
	.profile_age{
		position: relative;
	    float: left;
	    margin-right: 5px;
	    color: #424242;
	}
	.profile_gender{
		position: relative;
	    float: left;
	    margin-top: -2px;
	}
	.accept_img{
		position: absolute;
		margin-left: 79px;
		margin-top: -56px;
	}
	.accept_agree{
		width: 40px;
		height: 40px;
		position: relative;
	    float: left;
	    margin-top: -10px;
	}
	.accept_lineL{
		width: 120px;
		height: 15px;
		position: relative;
	    float: left;
	    margin-top: 6px;
	    
	}
	.accept_derault{
		width: 40px;
		height: 40px;
		position: relative;
	    float: left;
	    margin-top: -10px;
	}
	.accept_lineR{
		width: 120px;
		height: 15px;
		position: relative;
	    float: left;
	    margin-top: 6px;
	}
	.accept_denied{
		width: 40px;
		height: 40px;
		position: relative;
	    float: left;
	    margin-top: -10px;
	}
	</style>
</head>
<body>
	<!-- 게시글 내용 div S -->
	<div class="postSround">
	<div class="post" id="post_id">
		<div class="post_main">
			<span class="post_no">no.<%=applyBoardVO.getB_num() %></span>
			<% if(applyBoardVO.getM_photo() == null) { %>
				<img class="post_photo" src="./resources/image/crocodile_profile.png"><br>
			<% } else { %>
				<img class="post_photo" src="/myakkbird/myakkbirdUpload/<%=applyBoardVO.getM_photo()%>">
			<% } %>
			
			<span class="photo_span">0명 지원</span>
		</div>
		<div class="post_center">
			<span class="post_subject"><b class="post_subject_b"><%=applyBoardVO.getB_subject() %></b></span><b class="b_cate"><%=b_category%><img class="post_img" src="./resources/image/<%=b_category_img%>"></b><br>
			
			<svg class="post_icons1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#37B04B" width="21px" height="35px"><path d="M0 0h24v24H0z" fill="none"/><path d="M18 24h-6.55c-1.08 0-2.14-.45-2.89-1.23l-7.3-7.61 2.07-1.83c.62-.55 1.53-.66 2.26-.27L8 14.34V4.79c0-1.38 1.12-2.5 2.5-2.5.17 0 .34.02.51.05.09-1.3 1.17-2.33 2.49-2.33.86 0 1.61.43 2.06 1.09.29-.12.61-.18.94-.18 1.38 0 2.5 1.12 2.5 2.5v.28c.16-.03.33-.05.5-.05 1.38 0 2.5 1.12 2.5 2.5V20c0 2.21-1.79 4-4 4zM4.14 15.28l5.86 6.1c.38.39.9.62 1.44.62H18c1.1 0 2-.9 2-2V6.15c0-.28-.22-.5-.5-.5s-.5.22-.5.5V12h-2V3.42c0-.28-.22-.5-.5-.5s-.5.22-.5.5V12h-2V2.51c0-.28-.22-.5-.5-.5s-.5.22-.5.5V12h-2V4.79c0-.28-.22-.5-.5-.5s-.5.23-.5.5v12.87l-5.35-2.83-.51.45z"/></svg>
			<span class="post_icons1_txt"><b>신청여부</b> <%=applyBoardVO.getB_apply() %></span><br>
		
			<svg class="post_icons2" xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 24 24" viewBox="0 0 24 24" fill="#37B04B" width="24px" height="24px"><g><rect fill="none" height="24" width="24"/></g><g><g><path d="M16,11h-1V3c0-1.1-0.9-2-2-2h-2C9.9,1,9,1.9,9,3v8H8c-2.76,0-5,2.24-5,5v7h18v-7C21,13.24,18.76,11,16,11z M11,3h2v8h-2V3 z M19,21h-2v-3c0-0.55-0.45-1-1-1s-1,0.45-1,1v3h-2v-3c0-0.55-0.45-1-1-1s-1,0.45-1,1v3H9v-3c0-0.55-0.45-1-1-1s-1,0.45-1,1v3H5 v-5c0-1.65,1.35-3,3-3h8c1.65,0,3,1.35,3,3V21z"/></g></g></svg>
			<span class="post_icons2_txt"><b>청소시작</b> <%=applyBoardVO.getB_start() %></span><br>
			
			<svg class="post_icons3" xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24"><path d="M0 0h24v24H0V0z" fill="none"/><path fill="#37B04B" d="M12 2C8.13 2 5 5.13 5 9c0 4.17 4.42 9.92 6.24 12.11.4.48 1.13.48 1.53 0C14.58 18.92 19 13.17 19 9c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"/></svg>
			<span class="post_icons3_txt"><b>지번주소</b> <%=applyBoardVO.getB_address_road() %></span><br>
			
			<svg class="post_icons4" xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24"><path d="M0 0h24v24H0V0z" fill="none"/><path fill="#37B04B" d="M11 17h2v-1h1c.55 0 1-.45 1-1v-3c0-.55-.45-1-1-1h-3v-1h4V8h-2V7h-2v1h-1c-.55 0-1 .45-1 1v3c0 .55.45 1 1 1h3v1H9v2h2v1zm9-13H4c-1.11 0-1.99.89-1.99 2L2 18c0 1.11.89 2 2 2h16c1.11 0 2-.89 2-2V6c0-1.11-.89-2-2-2zm0 14H4V6h16v12z"/></svg>
			<span class="post_icons4_txt"><b>희망시급</b> <%=applyBoardVO.getB_money() %>원</span><br>
			
		</div>
		<div class="post_center_bottom">
			<span class="span_date1"><b>조회</b> <%=applyBoardVO.getB_readcount() %> </span><br>
			<span class="span_date2"><b>작성</b> <%=applyBoardVO.getB_date() %> </span><br>
		</div>
	</div>
	</div>
	<!-- 게시글 내용 div E -->
	
	<div class="startDiv"></div>
	<!-- 지원자 프로필 리스트 S -->
	<div class="profileListSround">
		
		<ul id="profileList">
			<% for(int i=0; i< applyEmpProfile.size(); i++) { %>
				<div class="profile" id="empProfile" onclick="empReviewLink('<%=applyEmpProfile.get(i).getM_id() %>', <%=applyBoardVO.getB_num()%>, '<%=applyBoardVO.getM_id()%>')">
					<div class="profile_main">
						 <img class="profile_wingL" src="./resources/image/birdwingL.png"> 
				
						<% if(applyEmpProfile.get(i).getM_photo() == null) {	%>
								<img class="profile_photo" src="./resources/image/crocodile_profile.png"><br>
						<% } else {	%>
								<img class="profile_photo" src="/myakkbird/myakkbirdUpload/<%=applyEmpProfile.get(i).getM_photo()%>">
						<% } %>
						<img class="profile_wingR" src="./resources/image/birdwingR.png">
					</div>
					<div class="profile_center">
						<div class="profile_name"><%=applyEmpProfile.get(i).getM_name()%></div>
						<div class="division_line"></div>
						<div class="profile_age"><%=applyEmpProfile.get(i).getM_age()%>세</div>
						<div class="division_line"></div>	
						<div class="profile_gender">
						<% if(applyEmpProfile.get(i).getM_gender().equals("M")){ %>
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path fill="none" d="M0 0h24v24H0z"/><path d="M15.05 8.537L18.585 5H14V3h8v8h-2V6.414l-3.537 3.537a7.5 7.5 0 1 1-1.414-1.414zM10.5 20a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11z" fill="#787878"/></svg>
						<%}else{%>
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path fill="none" d="M0 0h24v24H0z"/><path d="M11 15.934A7.501 7.501 0 0 1 12 1a7.5 7.5 0 0 1 1 14.934V18h5v2h-5v4h-2v-4H6v-2h5v-2.066zM12 14a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11z" fill="#787878"/></svg>
						<%} %>
						</div>
					</div>
				</div>
				<div class="accept_img">
					<img class="accept_agree" src="./resources/image/accept_agree_d.png">
					<img class="accept_lineL" src="./resources/image/accept_line.png">
					<svg class="accept_derault" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="50" height="50"><path fill="none" d="M0 0h24v24H0z"/><path d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm0-2a8 8 0 1 0 0-16 8 8 0 0 0 0 16zm-1-5h2v2h-2v-2zm2-1.645V14h-2v-1.5a1 1 0 0 1 1-1 1.5 1.5 0 1 0-1.471-1.794l-1.962-.393A3.501 3.501 0 1 1 13 13.355z" fill="#89df8f"/></svg> 
					<img class="accept_lineR" src="./resources/image/accept_line.png">
					<img class="accept_denied" src="./resources/image/accept_denied_d.png">  
					
				</div>
			<%}%>
			
		</ul>

	</div>
	

	<!-- 지원자 프로필 리스트 E -->
	
	<div class="endDiv"></div>
	
	<!-- Top 버튼 -->
	<div class="Top_div">
		<button class="top">Top</button>
	</div>
</body>

<script type="text/javascript">
	function empReviewLink(r_id, b_num, m_id) {
		location.href="empReviewProfile.ak?r_id="+r_id+"&b_num="+b_num+"&m_id="+m_id;
	}
</script>
</html>