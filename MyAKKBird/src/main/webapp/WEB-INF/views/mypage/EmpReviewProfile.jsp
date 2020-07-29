<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page import="com.bit.myakkbird.mainpoint.*" %>
<%@page import="java.util.ArrayList"%>
<% 
 	MasterVO BoardVO = (MasterVO)request.getAttribute("BoardVO");
	MasterVO empProfileVO = (MasterVO)request.getAttribute("empProfileVO");
	ArrayList<MasterVO> empReviewList = (ArrayList<MasterVO>)request.getAttribute("empReviewList");
	String id = (String)session.getAttribute("m_id"); 
	String a_apply = (String)request.getAttribute("a_apply");
	
	//A:정기청소 B:특수청소 C:입주청소 D:상주청소 E:빌딩청소 F:방역청소
	//카테고리 이미지도 같이 처리해주기
	String str = BoardVO.getB_category();
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
	if(BoardVO.getB_apply().equals("N")) {
		BoardVO.setB_apply("매칭 대기중");
	} else if(BoardVO.getB_apply().equals("Y")) {
		BoardVO.setB_apply("매칭 완료");
	}
%>
<!DOCTYPE html>
<html>
<head>
	<!-- favicon 적용 -->
	<link type="image/x-icon" rel="icon" href="./resources/image/akk_favicon.png">
	<!-- favicon 적용 -->
	<script src="resources/js/sweetAlert.js"></script> <!--  모달창 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css"/>
	<style type="text/css">
	
 	@font-face{
		font-family: "NotoSansKR-Bold";
		src:url('fonts/NotoSansKR-Bold.otf');
	}
	 @font-face{
		font-family: "NotoSansKR-Thin";
		src:url('fonts/NotoSansKR-Thin.otf');
	}
	 @font-face{
		font-family: "NotoSansKR-Black";
		src:url('fonts/NotoSansKR-Black.otf');
	}
	 @font-face{
		font-family: "NotoSansKR-Light";
		src:url('fonts/NotoSansKR-Light.otf');
	}
	 @font-face{
		font-family: "NotoSansKR-Medium";
		src:url('fonts/NotoSansKR-Medium.otf');
	}
	 @font-face{
		font-family: "NotoSansKR-Regular";
		src:url('fonts/NotoSansKR-Regular.otf');
	}
	
	html, body {
	 	width: 100%;
	 	height: auto;
	 	margin: 0 auto;
	 	padding: 0;
	}
	#footer_container{
		margin-top: 40%;
	}
	.postSround{
		margin: 45px 23%;
		margin-top: 125px;
		width: 1000px;
		height: 218px;
		box-shadow: 10px 10px 10px -3px #d3d3d3,
	                3px 3px 7px -3px #d3d3d3;
	    background: #A1FFCE; 
		background: -webkit-linear-gradient(to right, #FAFFD1, #A1FFCE);  
		background: linear-gradient(to right, #FAFFD1, #A1FFCE);               
	}
	.post {
		margin: 14px;
		width: 975px;
		height: 190px;
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
		font-size: 13px;
		margin-left: 10px;
	}
	
	.post_photo {
		width: 130px; 
		height: 130px;
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
		width: 80%;
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
		font-family: "NotoSansKR-Bold",serif;
		font-size: 28px;
	}
	
	.post_subject_b{
		margin-left: -28px;
	}
	
	.post_center span {
		margin-left: 84px;
	}
	
	.b_cate {
		float: right;
	    margin-top: 5px;
	    margin-left: -15px;
	    font-size: 18px;
	    font-family: "NotoSansKR-Thin",serif;
	}
	
	.post_img {
		width: 35px;
	    height: 35px;
	    margin-right: 19px;
	    margin-top: -12px;
	    float: right;
	}
	.post_icons1{
		position: absolute;
  	 	margin-left: 55px;
   		margin-top: 10px;
	}
	
	.post_icons2{
		position: absolute;
  	 		margin-left: 55px;
   		margin-top: 25px;
	}
	.post_icons3{
		position: absolute;
  	 	margin-left: 55px;
   		margin-top: 35px;
	}
	.post_icons4{
		position: absolute;
  	 	margin-left: 55px;
   		margin-top: 45px;
	}
	.post_icons1_txt{
		position: absolute;
  	 	margin-left: 58px;
   		margin-top: 16px;
   		font-family: "NotoSansKR-Thin",serif;
   		font-size: 16px;
	}
	
	.post_icons2_txt{
		position: absolute;
  	 	margin-left: 55px;
   		margin-top: 26px;
   		font-family: "NotoSansKR-Thin",serif;
   		font-size: 16px;
	}
	.post_icons3_txt{
		position: absolute;
  	 	margin-left: 55px;
   		margin-top: 36px;
   		font-family: "NotoSansKR-Thin",serif;
   		font-size: 16px;
	}
	.post_icons4_txt{
		position: absolute;
  	 	margin-left: 55px;
   		margin-top: 46px;
   		font-family: "NotoSansKR-Thin",serif;
   		font-size: 16px;
	}
	.span_date1 {
		position: absolute;
		margin-left: 656px;
		margin-top: 50px;
		font-family: "NotoSansKR-Thin",serif;
		font-size: 14px;
	}
	.span_date2 {
		position: absolute;
		margin-left: 656px;
		margin-top: 49px;
		font-family: "NotoSansKR-Thin",serif;
		font-size: 14px;
	}
	
    .profile_img_Sround{
	    background-color: #f7f8fc;
	    border: double;
    	border-color: #ece7fe;
	}
	.profile_img_Sround:hover .hovertext{
		opacity: 0.5;
		text-align: center;
		color: #ffffff;
	}
	.hovertext{
		background: #000000;
	    opacity: 0;
	    position: absolute;
	    width: 524px;
	    margin-top: -211px;
	    height: 211px;
	}
	.hovertext p{
		margin-left: 10px;
    	margin-top: 60px;
	}
	.profile_text_Sround{
		width: 97.5%;
	    height: 48%;
	    margin-top: 13px;
	    background-color: #f7f8f8;
	    font-family: "NotoSansKR-Regular", serif;
	    opacity: 0.6;
	    font-size: 18px;
	    border: 7px double;
	    border-color: #d3e6ff;
	}
	.profile_photo{
		border-radius: 100%;
	    border: dashed;
    	border-color: #ece7fe;
    	margin-left: 30.5%;
    	width: 200px;
    	height: 200px;
	}
	.profile_header{
		height: 40px;
    	margin-top: -18px;
    	font-family: "NotoSansKR-Bold", serif;
	}
	.profile_header_svg{
		margin-top: -20px;
    	float: left;
    	margin-left: 29%;
	}
	.profile_id{
		border: 2px dashed;
	    border-color: #d3e6ff;
	    width: 47%;
	    float: left;
	    height: 73px;
	    margin-left: 6px;
	    margin-top: 10px;
	}
	.profile_name{
		border: 2px dashed;
	    border-color: #d3e6ff;
	    width: 47%;
	    float: left;
	    height: 73px;
	    margin-left: 10px;
	    margin-right: 4px;
	    margin-top: 10px;
	}
	.profile_age{
		border: 2px dashed;
	    border-color: #d3e6ff;
	    width: 47%;
	    float: left;
	    height: 73px;
	    margin-left: 6px;
	    margin-top: 10px;
	}
	.profile_phone{
		border: 2px dashed;
	    border-color: #d3e6ff;
	    width: 47%;
	    float: left;
	    height: 73px;
	    margin-left: 10px;
	    margin-right: 4px;
	    margin-top: 10px;
	}
	.profile_email{
		border: 2px dashed;
	    border-color: #d3e6ff;
	    width: 97%;
	    float: left;
	    height: 73px;
	    margin-left: 6px;
	    margin-top: 10px;
	}
	.profile_gender{
		width: 40px;
	    height: 35px;
	    margin-left: -403px;
	    margin-top: 116px;
	    position: absolute;
	}
	.profile_id_svg{
		width: 60px;
	    height: 60px;
	    margin-top: 6px;
	    margin-left: 5px;
	    float: left;
	}
	.profile_name_svg{
		width: 60px;
	    height: 60px;
	    margin-top: 6px;
	    margin-left: 5px;
	    float: left;
	}
	.profile_age_svg{
		width: 60px;
	    height: 60px;
	    margin-top: 6px;
	    margin-left: 5px;
	    float: left;
	}
	.profile_phone_svg{
		width: 60px;
	    height: 60px;
	    margin-top: 6px;
	    margin-left: 5px;
	    float: left;
	    border-right: 2px dashed;
	    border-color: #d4e6ff;
    	padding-right: 4px;
	}
	.profile_email_svg{
		width: 60px;
	    height: 60px;
	    margin-top: 6px;
	    margin-left: 5px;
	    float: left;
	}
	.profile_gender_svg{
		width: 20px;
	    height: 20px;
	    margin-top: 128px;
	    margin-left: -392px;
	    position: absolute;
	}
	.profile_id_text{
		float: left;
	    margin-top: 14px;
	    margin-left: 5px;
	    font-size: 30px;
	    border-left: 2px dashed;
	    border-color: #d4e6ff;
	    padding-left: 3px;
	}
	.profile_name_text{
		float: left;
	    margin-top: 14px;
	    margin-left: 5px;
	    font-size: 30px;
	    border-left: 2px dashed;
	    border-color: #d4e6ff;
	    padding-left: 3px;
	}
	.profile_age_text{
		float: left;
	    margin-top: 14px;
	    margin-left: 5px;
	    font-size: 30px;
	    border-left: 2px dashed;
	    border-color: #d4e6ff;
	    padding-left: 3px;
	}
	.profile_phone_text{
		float: left;
	    margin-top: 18px;
	    margin-left: 5px;
	    font-size: 22px;
	}
	.profile_phone_text2_area{
	    width: 241px;
	    height: 73px;
	    float: left;
	    margin-top: 0px;
	    margin-left: 1px;
	    position: absolute;
	    background-color: pink;
	    backdrop-filter: blur(2px);
	    background-color: black;
	    opacity: 0.7;
	    color: white;
	    font-size: 25px;
	}
	.profile_phone_text2{
		position: absolute;
	    margin-top: 20px;
	    margin-left: 74px;
	    opacity: 0.7;
	}
	.profile_email_text{
		float: left;
	    margin-top: 14px;
	    margin-left: 5px;
	    font-size: 24px;
	    border-left: 2px dashed;
	    border-color: #d4e6ff;
	    padding-left: 3px;
	}
	
	/* 스크롤바 스타일 */
   	.right-content::-webkit-scrollbar {
  		width: 12px;
	}
			
	.right-content::-webkit-scrollbar-thumb {
	    background-color: #E6E6E6;
	    border-radius: 10px;
	    background-clip: padding-box;
	    border: 2px solid transparent;
	}
	</style>
	<style type="text/css">
:root {
  --bg-color: #f5f8ff;;
  --main-color: #353536;
  --secondary-color: #8e92a4;
  --main-text-color: #5d606b;
  --secondary-dark-color: #9496a5;
  --tag-color-one: #e0fbf6;
  --tag-color-text-one: #58c2a9;
  --tag-color-two: #ece7fe;
  --tag-color-text-two: #8972f3;
  --tag-color-three: #fde7ea;
  --tag-color-text-three: #e77f89;
  --tag-color-four: #f7f8fc;
  --tag-color-text-four: #a0a6b5;
  --checkbox-color: #009e90;
  --button-color: #49beb7;
  --box-color: #fff1d6;
  --box-color-2: #d3e6ff;
  --box-color-3: #ffd9d9;
  --box-color-4: #daffe5;
  --task-color: #777982;
}
.task-manager {
display: flex;
    justify-content: space-between;
    width: 1000px;
    height: 600px;
    background: #fff;
    position: absolute;
    margin-left: 23%;
    border-radius: 4px;
    box-shadow: 0 0.3px 2.2px rgba(0, 0, 0, 0.011), 0 0.7px 5.3px rgba(0, 0, 0, 0.016), 0 1.3px 10px rgba(0, 0, 0, 0.02), 0 2.2px 17.9px rgba(0, 0, 0, 0.024), 0 4.2px 33.4px rgba(0, 0, 0, 0.029), 0 10px 80px rgba(0, 0, 0, 0.04);
    overflow: hidden;
}
.right-bar {
  width: 430px;
  border-left: 1px solid #e3e7f7;
  display: flex;
  flex-direction: column;
}
.top-part {
  padding: 30px;
  align-self: flex-end;
  height: 0px;
  margin-top: -10px;
}
.top_part_svg{
	width: 30px;
    height: 30px;
    color: var(--main-color);
    margin-right: 14px;
    float: left;
}
.count {
    font-size: 20px;
    border-radius: 50%;
    width: 30px;
    height: 30px;
    background-color: #89df8f;
    color: #fff;
    justify-content: center;
    float: left;
  }
.count_text{
	margin-left: 4px;
}
.right-content {
  padding: 10px 40px;
  overflow-y: auto;
  flex: 1;
  margin-top: 14px;
}
.task-box {
  position: relative;
  border-radius: 12px;
  width: 100%;
  height: 200px;
  margin: 20px 0;
  padding: 16px;
  cursor: pointer;
  box-shadow: 2px 2px 4px 0px rgba(235,235,235,1);
  
  &:hover {
    transform: scale(1.02);
  }
}
.time { 
	margin-bottom: 6px; 
	opacity: 0.4; 
	font-size: 13px; 
	font-family: "NotoSansKR-Thin", serif;
	margin-left: 205px;
}
.task-name { 
  font-size: 14px; 
  font-weight: 500;
  opacity: 0.6;
  margin-top: 12px;
  font-family: "NotoSansKR-Regular", serif;
  line-height: 24px;
  letter-spacing: 4px;
  height: 143px;
}
.yellow { 
  background-color: var(--box-color);
}
.reviewList_reviewer {
 	position: absolute;
    opacity: 0.4;
    color: #37b04b;
    font-size: 15px;
    font-family: "NotoSansKR-Medium", serif;
    margin-top: -29px;
    margin-left: 31px;
}
.reviewList_reviewer_photo{
	width: 30px;
    height: 30px;
    border-radius: 50px;
}
.reviewList_reviewer_photo_sround{
	position: absolute;
	padding-right: 36px;
    margin: -184px 0px 0px -2px;
}
.members {
  display: flex;
  margin-top: 14px;
  
  img {
    border-radius: 50%;
    width: 30px;
    height: 30px;
    margin-right: 4px;
    object-fit: cover;
  }
}
.page-content {
  display: flex;
  flex-direction: column;
  flex: 1;
  padding: 40px 20px 0 20px;
  
  .header { 
    font-size: 26px; 
    color: var(--main-color); 
    margin-top: 30px;
  }
}
.content-categories {
  display: flex;
  justify-content: space-evenly;
  width: 100%;
  border-bottom: 1px solid #ddd;
  padding: 20px 0;
}
.nav-item { display: none; }
.category { 
  font-weight: 500; 
  color: var(--secondary-color); 
  border-bottom: 1px solid #ddd;
  transition: .4s ease-in;
  padding: 20px 30px;
  cursor: pointer;
}
#opt-1:checked + label ,
#opt-2:checked +  label ,
#opt-3:checked +  label ,
#opt-4:checked +  label {
  color: var(--checkbox-color);
  border-bottom: 2px solid var(--checkbox-color);
}
.task-item { display: none; }
.tasks-wrapper {
  padding: 30px 0;
  flex: 1;
  overflow-y: auto;
  height: 100%;
  padding-right: 8px;
}
.task {
  display: flex;
  justify-content: space-between;
  position: relative;
  margin-bottom: 16px;
  padding-left: 30px;
  color: var(--task-color);
  font-size: 13px;
  font-weight: 500;
  
  &:hover {
    transform: translatex(2px);
  }
  
  label {
    cursor: pointer;
  }
}
 label .label-text { position: relative; }
 label .label-text:before {
  content:'';
  position: absolute;
  width: 14px;
  height: 14px;
  border: 1px solid #ddd;
  border-radius: 2px;
  left: -24px;
  transition: .2s ease;
}
.upcoming { 
  border-bottom: 1px solid #ddd; 
  padding-bottom: 30px;
  margin-bottom: 30px;
}
.task-star{
    position: absolute;
    margin-top: 5px;
    margin-left: 200px;
    z-index: 1;
	
}
.x_button{
	position: absolute;
	margin-top: 45px;
	margin-left: 1400px;
	z-index: 1;
}
.x_button_svg{
	box-shadow: 10px 10px 10px -3px #d3d3d3,
	                3px 3px 7px -3px #d3d3d3;
}
	</style>
<meta charset="UTF-8">
<title>마이악어새</title>
<link href="https://fonts.googleapis.com/css?family=DM+Sans:400,500,700&display=swap" rel="stylesheet">
</head>
<body>
	<jsp:include page="../header_container.jsp"></jsp:include>
	<!-- 게시글 내용 div S -->
	<div class="x_button" role="button">
		<a href="javascript:history.back();">
			<svg class="x_button_svg" height="25pt" viewBox="0 0 512 512" width="25pt" xmlns="http://www.w3.org/2000/svg" ><path fill="#89df8f" d="m176.8125 351.1875c-4.097656 0-8.195312-1.554688-11.308594-4.691406-6.25-6.25-6.25-16.382813 0-22.632813l158.378906-158.402343c6.25-6.25 16.382813-6.25 22.632813 0 6.253906 6.25 6.253906 16.382812 0 22.636718l-158.378906 158.398438c-3.132813 3.136718-7.230469 4.691406-11.324219 4.691406zm0 0"/><path d="m335.1875 351.1875c-4.09375 0-8.191406-1.554688-11.304688-4.691406l-158.378906-158.378906c-6.25-6.25-6.25-16.382813 0-22.632813 6.25-6.253906 16.382813-6.253906 22.632813 0l158.378906 158.398437c6.253906 6.25 6.253906 16.382813 0 22.632813-3.132813 3.117187-7.230469 4.671875-11.328125 4.671875zm0 0" fill="#89df8f"/><path d="m453.332031 512h-394.664062c-32.363281 0-58.667969-26.304688-58.667969-58.667969v-394.664062c0-32.363281 26.304688-58.667969 58.667969-58.667969h394.664062c32.363281 0 58.667969 26.304688 58.667969 58.667969v394.664062c0 32.363281-26.304688 58.667969-58.667969 58.667969zm-394.664062-480c-14.699219 0-26.667969 11.96875-26.667969 26.667969v394.664062c0 14.699219 11.96875 26.667969 26.667969 26.667969h394.664062c14.699219 0 26.667969-11.96875 26.667969-26.667969v-394.664062c0-14.699219-11.96875-26.667969-26.667969-26.667969zm0 0" fill="#89df8f"/></svg>
		</a>
	</div>
	<div class="postSround">
	<div class="post" id="post_id" onclick="postlink('<%=id%>',<%=BoardVO.getB_num() %>)">
		<div class="post_main">
			<span class="post_no">no.<%=BoardVO.getB_num() %></span>
			<% if(BoardVO.getM_photo() == null) { %>
				<img class="post_photo" src="./resources/image/crocodile_profile.png"><br>
			<% } else { %>
				<img class="post_photo" src="/myakkbird/myakkbirdUpload/<%=BoardVO.getM_photo()%>">
			<% } %>
		</div>
		<div class="post_center">
			<span class="post_subject"><b class="post_subject_b"><%=BoardVO.getB_subject() %></b></span><b class="b_cate"><%=b_category%><img class="post_img" src="./resources/image/<%=b_category_img%>"></b><br>
			
			<svg class="post_icons1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#37B04B" width="21px" height="35px"><path d="M0 0h24v24H0z" fill="none"/><path d="M18 24h-6.55c-1.08 0-2.14-.45-2.89-1.23l-7.3-7.61 2.07-1.83c.62-.55 1.53-.66 2.26-.27L8 14.34V4.79c0-1.38 1.12-2.5 2.5-2.5.17 0 .34.02.51.05.09-1.3 1.17-2.33 2.49-2.33.86 0 1.61.43 2.06 1.09.29-.12.61-.18.94-.18 1.38 0 2.5 1.12 2.5 2.5v.28c.16-.03.33-.05.5-.05 1.38 0 2.5 1.12 2.5 2.5V20c0 2.21-1.79 4-4 4zM4.14 15.28l5.86 6.1c.38.39.9.62 1.44.62H18c1.1 0 2-.9 2-2V6.15c0-.28-.22-.5-.5-.5s-.5.22-.5.5V12h-2V3.42c0-.28-.22-.5-.5-.5s-.5.22-.5.5V12h-2V2.51c0-.28-.22-.5-.5-.5s-.5.22-.5.5V12h-2V4.79c0-.28-.22-.5-.5-.5s-.5.23-.5.5v12.87l-5.35-2.83-.51.45z"/></svg>
			<span class="post_icons1_txt"><b>신청여부</b> <%=BoardVO.getB_apply() %></span><br>
		
			<svg class="post_icons2" xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 24 24" viewBox="0 0 24 24" fill="#37B04B" width="24px" height="24px"><g><rect fill="none" height="24" width="24"/></g><g><g><path d="M16,11h-1V3c0-1.1-0.9-2-2-2h-2C9.9,1,9,1.9,9,3v8H8c-2.76,0-5,2.24-5,5v7h18v-7C21,13.24,18.76,11,16,11z M11,3h2v8h-2V3 z M19,21h-2v-3c0-0.55-0.45-1-1-1s-1,0.45-1,1v3h-2v-3c0-0.55-0.45-1-1-1s-1,0.45-1,1v3H9v-3c0-0.55-0.45-1-1-1s-1,0.45-1,1v3H5 v-5c0-1.65,1.35-3,3-3h8c1.65,0,3,1.35,3,3V21z"/></g></g></svg>
			<span class="post_icons2_txt"><b>청소시작</b> <%=BoardVO.getB_start() %></span><br>
			
			<svg class="post_icons3" xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24"><path d="M0 0h24v24H0V0z" fill="none"/><path fill="#37B04B" d="M12 2C8.13 2 5 5.13 5 9c0 4.17 4.42 9.92 6.24 12.11.4.48 1.13.48 1.53 0C14.58 18.92 19 13.17 19 9c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"/></svg>
			<span class="post_icons3_txt"><b>지번주소</b> <%=BoardVO.getB_address_road() %></span><br>
			
			<svg class="post_icons4" xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24"><path d="M0 0h24v24H0V0z" fill="none"/><path fill="#37B04B" d="M11 17h2v-1h1c.55 0 1-.45 1-1v-3c0-.55-.45-1-1-1h-3v-1h4V8h-2V7h-2v1h-1c-.55 0-1 .45-1 1v3c0 .55.45 1 1 1h3v1H9v2h2v1zm9-13H4c-1.11 0-1.99.89-1.99 2L2 18c0 1.11.89 2 2 2h16c1.11 0 2-.89 2-2V6c0-1.11-.89-2-2-2zm0 14H4V6h16v12z"/></svg>
			<span class="post_icons4_txt"><b>희망시급</b> <%=BoardVO.getB_money() %>원</span><br>
			
		</div>
		<div class="post_center_bottom">
			<span class="span_date1"><b>조회</b> <%=BoardVO.getB_readcount() %> </span><br>
			<span class="span_date2"><b>작성</b> <%=BoardVO.getB_date() %> </span><br>
		</div>
	</div>
	</div>
	<!-- 게시글 내용 div E -->
	

	
	<!-- 프로필 & 리뷰 css -->
	<div class="task-manager">
	  <div class="page-content">
	    <div class="profile_header">
			<svg class="profile_header_svg" height="60px" viewBox="0 -51 512.00003 512" width="70px" xmlns="http://www.w3.org/2000/svg"><path d="m292.058594 85.625h203.84375c2.761718 0 4.996094 2.238281 4.996094 4.996094v305.027344c0 2.757812-2.234376 4.996093-4.996094 4.996093h-482.019532c-2.761718 0-4.996093-2.238281-4.996093-4.996093v-305.027344c0-2.757813 2.234375-4.996094 4.996093-4.996094h202.230469" fill="#f5f0eb"/><path d="m115.46875 220.488281c-14.4375 0-26.140625-11.703125-26.140625-26.140625v-19.703125c0-14.433593 11.703125-26.136719 26.140625-26.136719s26.140625 11.703126 26.140625 26.136719v19.703125c0 14.4375-11.703125 26.140625-26.140625 26.140625zm0 0" fill="#f2d1a5"/><path d="m50.128906 303.085938v-28.207032c0-13.601562 3.917969-26.914062 11.285156-38.34375 6.460938-10.023437 17.566407-16.078125 29.488282-16.078125h48.480468c11.921876 0 23.03125 6.054688 29.488282 16.078125 7.367187 11.429688 11.285156 24.742188 11.285156 38.34375v28.207032zm0 0" fill="#00ee8a"/><path d="m116.542969 148.507812h-2.136719c-13.847656 0-25.074219 11.222657-25.074219 25.070313v5.910156c7.054688 1.921875 15.445313 3.4375 20.363281 1.625 9.652344-3.558593 17.734376-7.53125 25.496094-5.707031 1.578125.371094 3.84375-.519531 6.410156-2.222656-.207031-13.664063-11.34375-24.675782-25.058593-24.675782zm0 0" fill="#919196"/><path d="m8.886719 303.011719v92.566406c0 2.757813 2.234375 4.996094 4.996093 4.996094h482.019532c2.757812 0 4.996094-2.238281 4.996094-4.996094v-92.566406zm0 0" fill="#919196"/><path d="m333.613281 352.460938c0 10.285156-8.335937 18.621093-18.617187 18.621093-10.285156 0-18.621094-8.335937-18.621094-18.621093 0-10.28125 8.335938-18.617188 18.621094-18.617188 10.28125 0 18.617187 8.335938 18.617187 18.617188zm0 0" fill="#00ee8a"/><path d="m401.441406 352.460938c0 10.285156-8.335937 18.621093-18.621094 18.621093-10.28125 0-18.617187-8.335937-18.617187-18.621093 0-10.28125 8.335937-18.617188 18.617187-18.617188 10.285157 0 18.621094 8.335938 18.621094 18.617188zm0 0" fill="#ff415b"/><path d="m469.066406 352.460938c0 10.285156-8.335937 18.621093-18.621094 18.621093-10.28125 0-18.617187-8.335937-18.617187-18.621093 0-10.28125 8.335937-18.617188 18.617187-18.617188 10.285157 0 18.621094 8.335938 18.621094 18.617188zm0 0" fill="#ff9f22"/><path d="m292.058594 117.246094h-75.945313v-69.28125c0-20.972656 17.003907-37.972656 37.972657-37.972656 20.972656 0 37.972656 17 37.972656 37.972656zm0 0" fill="#5ecef4"/><path d="m497.011719 75.632812h-193.855469v-27.667968c0-26.449219-21.515625-47.964844-47.960938-47.964844-26.449218 0-47.964843 21.515625-47.964843 47.964844v27.667968h-192.242188c-8.265625 0-14.988281 6.722657-14.988281 14.988282v305.027344c0 8.261718 6.722656 14.988281 14.988281 14.988281h482.023438c8.265625 0 14.988281-6.726563 14.988281-14.988281v-305.027344c0-8.265625-6.722656-14.988282-14.988281-14.988282zm-269.796875-27.667968c0-11.910156 7.480468-22.097656 17.984375-26.128906v13.878906c0 5.515625 4.476562 9.992187 9.996093 9.992187 5.515626 0 9.992188-4.476562 9.992188-9.992187v-13.878906c10.503906 4.03125 17.984375 14.21875 17.984375 26.128906v59.289062h-55.957031zm264.800781 342.617187h-472.03125v-77.574219h30.109375c.375.042969.757812.066407 1.144531.066407h130.027344c.386719 0 .769531-.023438 1.144531-.066407h309.605469zm-391.589844-196.234375v-2.722656c1.691407.179688 3.300781.28125 4.8125.28125 3.464844 0 6.460938-.476562 9.019531-1.417969 1.515626-.558593 2.996094-1.125 4.4375-1.683593 5.585938-2.148438 10.488282-4.027344 14.027344-3.84375v9.386718c0 8.6875-6.902344 15.777344-15.511718 16.113282h-1.269532c-8.609375-.335938-15.515625-7.425782-15.515625-16.113282zm29.132813-29.261718c-6.226563.539062-12.199219 2.824218-18.035156 5.070312-1.359376.519531-2.75 1.054688-4.171876 1.578125-.023437.007813-1.726562.550781-6.617187-.203125 1.457031-7.417969 8.003906-13.03125 15.839844-13.03125 5.324219 0 10.042969 2.601562 12.984375 6.585938zm-37.546875 65.363281h14.570312v22.636719c0 5.515624 4.476563 9.992187 9.992188 9.992187 5.519531 0 9.996093-4.476563 9.996093-9.992187v-22.636719h13.921876c8.5625 0 16.449218 4.296875 21.089843 11.496093 6.339844 9.839844 9.691407 21.226563 9.691407 32.933594v18.140625h-110.042969v-18.140625c0-11.707031 3.351562-23.09375 9.691406-32.933594 4.640625-7.199218 12.523437-11.496093 21.089844-11.496093zm400.003906 62.570312h-300.757813v-18.140625c0-15.554687-4.453124-30.683594-12.878906-43.757812-6.859375-10.644532-17.667968-17.746094-29.851562-19.933594 2.664062-5.03125 4.179687-10.761719 4.179687-16.839844v-19.703125c0-.378906-.015625-.757812-.027343-1.132812.003906-.160157.023437-.320313.023437-.480469-.296875-19.035156-16.019531-34.519531-35.054687-34.519531h-2.136719c-19.335938 0-35.0625 15.730469-35.0625 35.066406v.875c0 .066406-.007813.128906-.007813.195313v19.699218c0 6.042969 1.5 11.738282 4.128906 16.746094-12.425781 2.058594-23.476562 9.210938-30.449218 20.027344-8.425782 13.074218-12.878906 28.207031-12.878906 43.757812v18.144532h-21.257813v-197.40625h187.246094v21.628906c0 5.515625 4.472656 9.992187 9.992187 9.992187h75.941406c5.519532 0 9.992188-4.476562 9.992188-9.992187v-21.628906h188.859375zm0 0"/><path d="m316.101562 381.074219c15.777344 0 28.613282-12.835938 28.613282-28.613281 0-15.777344-12.835938-28.609376-28.613282-28.609376-15.777343 0-28.613281 12.832032-28.613281 28.609376 0 15.777343 12.835938 28.613281 28.613281 28.613281zm0-37.238281c4.757813 0 8.628907 3.867187 8.628907 8.625 0 4.757812-3.871094 8.628906-8.628907 8.628906-4.757812 0-8.628906-3.871094-8.628906-8.628906 0-4.757813 3.871094-8.625 8.628906-8.625zm0 0"/><path d="m383.929688 381.074219c15.777343 0 28.609374-12.835938 28.609374-28.613281 0-15.777344-12.832031-28.609376-28.609374-28.609376-15.777344 0-28.613282 12.832032-28.613282 28.609376 0 15.777343 12.835938 28.613281 28.613282 28.613281zm0-37.238281c4.757812 0 8.625 3.867187 8.625 8.625 0 4.757812-3.867188 8.628906-8.625 8.628906-4.757813 0-8.628907-3.871094-8.628907-8.628906 0-4.757813 3.871094-8.625 8.628907-8.625zm0 0"/><path d="m451.554688 381.074219c15.777343 0 28.609374-12.835938 28.609374-28.613281 0-15.777344-12.832031-28.609376-28.609374-28.609376-15.777344 0-28.613282 12.832032-28.613282 28.609376 0 15.777343 12.835938 28.613281 28.613282 28.613281zm0-37.238281c4.757812 0 8.625 3.867187 8.625 8.625 0 4.757812-3.871094 8.628906-8.625 8.628906-4.757813 0-8.628907-3.871094-8.628907-8.628906 0-4.757813 3.871094-8.625 8.628907-8.625zm0 0"/><path d="m242.414062 158.921875c0 5.519531 4.472657 9.992187 9.992188 9.992187h165.117188c5.519531 0 9.992187-4.472656 9.992187-9.992187 0-5.515625-4.472656-9.992187-9.992187-9.992187h-165.117188c-5.519531 0-9.992188 4.476562-9.992188 9.992187zm0 0"/><path d="m457.742188 187.898438h-205.335938c-5.519531 0-9.992188 4.476562-9.992188 9.992187 0 5.519531 4.472657 9.992187 9.992188 9.992187h205.335938c5.515624 0 9.992187-4.472656 9.992187-9.992187 0-5.515625-4.476563-9.992187-9.992187-9.992187zm0 0"/><path d="m333.339844 223.871094h-82.433594c-5.515625 0-9.992188 4.472656-9.992188 9.992187 0 5.515625 4.476563 9.992188 9.992188 9.992188h82.433594c5.519531 0 9.996094-4.476563 9.996094-9.992188 0-5.519531-4.476563-9.992187-9.996094-9.992187zm0 0"/><path d="m458.242188 223.871094h-81.4375c-5.519532 0-9.992188 4.472656-9.992188 9.992187 0 5.515625 4.472656 9.992188 9.992188 9.992188h81.4375c5.515624 0 9.992187-4.476563 9.992187-9.992188 0-5.519531-4.476563-9.992187-9.992187-9.992187zm0 0"/><path d="m450.832031 167.59375.292969.226562c1.804688 1.371094 3.929688 2.035157 6.035156 2.035157 3.019532 0 6-1.363281 7.964844-3.949219 3.339844-4.394531 2.484375-10.664062-1.914062-14.003906l-.292969-.222656c-4.394531-3.335938-10.660157-2.480469-14 1.914062-3.339844 4.394531-2.484375 10.664062 1.914062 14zm0 0"/><path d="m261.546875 67.523438-.292969-.222657c-4.386718-3.347656-10.65625-2.503906-14.003906 1.882813-3.347656 4.390625-2.503906 10.660156 1.882812 14.003906l.292969.226562c1.8125 1.382813 3.941407 2.050782 6.054688 2.050782 3.007812 0 5.984375-1.355469 7.953125-3.933594 3.34375-4.390625 2.5-10.660156-1.886719-14.007812zm0 0"/></svg>
	    	MyAkkBird Profile
	    </div>
	    
	    <div class="profile_img_Sround" onclick="profileLink('<%=empProfileVO.getM_id()%>')">
		<% if(empProfileVO.getM_photo() == null) {	%>
				<img class="profile_photo" src="./resources/image/crocodile_profile.png"><br>
		<% } else {	%>
				<img class="profile_photo" src="/myakkbird/myakkbirdUpload/<%=empProfileVO.getM_photo()%>">
		<% } %>
			<div class="hovertext">
				<p><font size=15>리뷰쓰러 가기!</font></p>
			</div>
		</div>
		
		<div class="profile_text_Sround">
			<div class="profile_id">
				<svg class="profile_id_svg" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve"> <path style="fill:#E0230D;" d="M414.5,7.5h-30v497h30c49.5,0,90-40.5,90-90v-317C504.5,48,464,7.5,414.5,7.5z"/> <path style="fill:#FF5440;" d="M474.5,97.5v317c0,49.5-40.5,90-90,90h-287c-49.5,0-90-40.5-90-90v-317c0-49.5,40.5-90,90-90h287 C434,7.5,474.5,48,474.5,97.5z"/><g> <path style="fill:#FFFFFF;" d="M161,444.5c-11.046,0-20-8.954-20-20v-337c0-11.046,8.954-20,20-20s20,8.954,20,20v337 C181,435.546,172.046,444.5,161,444.5z"/> <path style="fill:#FFFFFF;" d="M261,444.5h-20c-11.046,0-20-8.954-20-20v-337c0-11.046,8.954-20,20-20h20 c66.168,0,120,53.832,120,120v137C381,390.668,327.168,444.5,261,444.5z M261,107.5v297c44.112,0,80-35.888,80-80v-137 C341,143.388,305.112,107.5,261,107.5z"/> </g> <path d="M414.5,0h-317C43.738,0,0,43.738,0,97.5v317C0,468.262,43.738,512,97.5,512h317c53.762,0,97.5-43.738,97.5-97.5v-317 C512,43.738,468.262,0,414.5,0z M497,414.5c0,45.491-37.009,82.5-82.5,82.5h-317C52.009,497,15,459.991,15,414.5v-317 C15,52.009,52.009,15,97.5,15h317c45.491,0,82.5,37.009,82.5,82.5V414.5z"/> <path d="M161,60c-15.164,0-27.5,12.336-27.5,27.5v337c0,15.164,12.336,27.5,27.5,27.5s27.5-12.336,27.5-27.5v-337 C188.5,72.336,176.164,60,161,60z M173.5,424.5c0,6.893-5.607,12.5-12.5,12.5s-12.5-5.607-12.5-12.5v-337 c0-6.893,5.607-12.5,12.5-12.5s12.5,5.607,12.5,12.5V424.5z"/> <path d="M261,60h-20c-15.164,0-27.5,12.336-27.5,27.5v337c0,15.164,12.336,27.5,27.5,27.5h20c70.304,0,127.5-57.196,127.5-127.5 v-137C388.5,117.196,331.304,60,261,60z M373.5,324.5c0,62.033-50.467,112.5-112.5,112.5h-20c-6.893,0-12.5-5.607-12.5-12.5v-337 c0-6.893,5.607-12.5,12.5-12.5h20c62.033,0,112.5,50.467,112.5,112.5V324.5z"/> <path d="M261,100c-4.142,0-7.5,3.358-7.5,7.5V241c0,4.142,3.358,7.5,7.5,7.5s7.5-3.358,7.5-7.5V115.385 c36.465,3.766,65,34.671,65,72.115v137c0,37.444-28.535,68.349-65,72.115V271c0-4.142-3.358-7.5-7.5-7.5s-7.5,3.358-7.5,7.5v133.5 c0,4.142,3.358,7.5,7.5,7.5c48.248,0,87.5-39.252,87.5-87.5v-137C348.5,139.252,309.248,100,261,100z"/><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g></svg>
				<div class="profile_id_text"><%=empProfileVO.getM_id() %></div>
			</div>
			<div class="profile_name">
				<svg class="profile_name_svg" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"	 viewBox="0 0 496 496" style="enable-background:new 0 0 496 496;" xml:space="preserve"><path style="fill:#ECECEC;" d="M176,104H40c-17.672,0-32,14.328-32,32v320c0,17.672,14.328,32,32,32h416c17.672,0,32-14.328,32-32	V136c0-17.672-14.328-32-32-32H320H176z"/><path style="fill:#B6C1CE;" d="M456,472H40c-17.672,0-32-14.328-32-32v16c0,17.672,14.328,32,32,32h416c17.672,0,32-14.328,32-32	v-16C488,457.672,473.672,472,456,472z"/><path style="fill:#D3A06C;" d="M240,304v-40c0-44.184-35.816-80-80-80l0,0c-44.184,0-80,35.816-80,80v40H240z"/><path style="fill:#B27946;" d="M160,184c-2.704,0-5.368,0.144-8,0.4c40.424,4.016,72,38.112,72,79.6v40h16v-40	C240,219.816,204.184,184,160,184z"/><path style="fill:#92E0C0;" d="M184,384l51.304,10.264c17.624,3.528,31.8,16.6,36.736,33.88L280,456H40l7.96-27.856	c4.936-17.28,19.112-30.36,36.736-33.88L136,384H184z"/><path style="fill:#48C397;" d="M248,456h32l-7.96-27.856c-4.936-17.28-19.112-30.352-36.736-33.88L184,384h-16l56.864,25.272	c9.488,4.216,16.344,12.784,18.384,22.968L248,456z"/><g>	<path style="fill:#F9E0A6;" d="M136,368v16c0,13.256,10.744,24,24,24l0,0c13.256,0,24-10.744,24-24v-16H136z"/>	<path style="fill:#F9E0A6;" d="M208,280h8c13.256,0,24,10.744,24,24l0,0c0,13.256-10.744,24-24,24h-8V280z"/>	<path style="fill:#F9E0A6;" d="M112,280h-8c-13.256,0-24,10.744-24,24l0,0c0,13.256,10.744,24,24,24h8V280z"/>	<path style="fill:#F9E0A6;" d="M104,280v40c0,30.928,25.072,56,56,56l0,0c30.928,0,56-25.072,56-56v-40l0,0		c-20.488,0-40.136-8.136-54.624-22.624L160,256l-1.376,1.376C144.136,271.864,124.488,280,104,280L104,280z"/></g><path style="fill:#EABD8C;" d="M200,320c0,28.208-20.872,51.472-48,55.36c2.616,0.376,5.28,0.64,8,0.64c30.928,0,56-25.072,56-56	v-40c-5.424,0-10.776-0.608-16-1.712V320z"/><rect x="176" y="8" style="fill:#FEA82F;" width="144" height="144"/><rect x="176" y="136" style="fill:#FF8031;" width="144" height="16"/><rect x="208" y="8" style="fill:#FFEAA7;" width="80" height="144"/><rect x="208" y="136" style="fill:#FCD770;" width="80" height="16"/><path d="M236.872,386.416L192,377.44v-2.104c14.8-8.592,25.824-22.928,30.048-39.952C236.808,332.544,248,319.576,248,304v-40	c0-48.52-39.48-88-88-88s-88,39.48-88,88v40c0,15.576,11.192,28.544,25.952,31.392c4.224,17.024,15.248,31.36,30.048,39.952v2.104	l-44.864,8.976c-20.656,4.128-37.08,19.272-42.864,39.528L29.392,464h261.216l-10.872-38.056	C273.944,405.688,257.52,390.536,236.872,386.416z M144,381.896c5.128,1.328,10.464,2.104,16,2.104s10.872-0.776,16-2.104V384	c0,8.824-7.176,16-16,16s-16-7.176-16-16V381.896z M224,317.776v-27.552c4.76,2.776,8,7.88,8,13.776S228.76,315,224,317.776z	 M160,192c39.696,0,72,32.304,72,72v12.448c-4.728-2.752-10.144-4.448-16-4.448c-18.496,0-35.888-7.2-48.968-20.272L160,244.672	l-7.024,7.048C139.888,264.8,122.496,272,104,272c-5.856,0-11.272,1.696-16,4.448V264C88,224.304,120.304,192,160,192z M88,304	c0-5.896,3.24-11,8-13.776v27.552C91.24,315,88,309.896,88,304z M112,320v-32.376c17.816-1.648,34.48-8.776,48-20.584	c13.52,11.8,30.184,18.936,48,20.584V320c0,26.472-21.528,48-48,48S112,346.472,112,320z M230.248,448l-6.488-25.936l-15.52,3.872	L213.752,448H106.248l5.512-22.064l-15.52-3.872L89.752,448H50.608l5.048-17.664c4.136-14.472,15.864-25.28,30.616-28.232	l43.312-8.664C133.64,406.464,145.664,416,160,416s26.36-9.536,30.416-22.56l43.312,8.664c14.752,2.952,26.48,13.776,30.616,28.232	L269.392,448H230.248z"/><path d="M456,96H328V0H168v96H40c-22.056,0-40,17.944-40,40v320c0,22.056,17.944,40,40,40h416c22.056,0,40-17.944,40-40V136	C496,113.944,478.056,96,456,96z M312,144h-16v-32h-16v32h-64V16h64v80h16V16h16V144z M200,16v128h-16V16H200z M480,456	c0,13.232-10.768,24-24,24H40c-13.232,0-24-10.768-24-24V136c0-13.232,10.768-24,24-24h128v32h-16v16h192v-16h-16v-32h128	c13.232,0,24,10.768,24,24V456z"/><rect x="280" y="224" width="184" height="16"/><rect x="280" y="272" width="16" height="16"/><rect x="312" y="272" width="152" height="16"/><rect x="280" y="320" width="184" height="16"/><rect x="280" y="368" width="152" height="16"/><rect x="448" y="368" width="16" height="16"/><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g></svg> 
				<div class="profile_name_text"><%=empProfileVO.getM_name() %></div>
			</div>
			<div class="profile_age">
				<svg class="profile_age_svg" height="512pt" viewBox="0 0 512 512" width="512pt" xmlns="http://www.w3.org/2000/svg"><path d="m475.734375 503.464844h-439.46875c-15.316406 0-27.730469-12.414063-27.730469-27.730469v-373.335937h494.929688v373.335937c0 15.316406-12.414063 27.730469-27.730469 27.730469zm0 0" fill="#e7eced"/><path d="m418.132812 307.199219c0 89.542969-72.589843 162.132812-162.132812 162.132812s-162.132812-72.589843-162.132812-162.132812 72.589843-162.132813 162.132812-162.132813 162.132812 72.589844 162.132812 162.132813zm0 0" fill="#366db6" fill-rule="evenodd"/><path d="m281.183594 262.398438c-.863282 0-1.171875-1.109376-.460938-1.621094 13.164063-9.417969 21.066406-26.109375 18.097656-44.484375-2.917968-18.003907-16.726562-32.742188-34.097656-36.222657-27.820312-5.570312-52.164062 16.238282-52.164062 43.921876 0 15.25 7.414062 28.6875 18.703125 36.769531.707031.511719.402343 1.628906-.460938 1.628906-23.78125.007813-43.066406 19.890625-43.066406 44.425781v22.785156 3.199219c0 2.976563.679687 6.554688 2.464844 9.019531 1.878906 2.59375 4.761719 4.871094 7.175781 6.945313 7.144531 6.136719 15.414062 11.519531 24.492188 14.242187v59.894532c0 6.792968 5.332031 12.296875 11.921874 12.296875h44.421876c6.589843 0 11.921874-5.503907 11.921874-12.296875v-59.894532c9.652344-2.894531 17.042969-8.617187 24.890626-14.667968.964843-.742188 1.929687-1.492188 2.835937-2.304688 3.890625-3.515625 6.40625-7.917968 6.40625-13.234375v-25.984375c0-24.535156-19.285156-44.417968-43.082031-44.417968zm0 0" fill="#fff"/><path d="m503.464844 110.933594h-494.929688v-74.667969c0-15.316406 12.414063-27.730469 27.730469-27.730469h439.46875c15.316406 0 27.730469 12.414063 27.730469 27.730469zm0 0" fill="#556080"/><path d="m42.667969 42.667969h34.132812v34.132812h-34.132812zm0 0" fill="#dd352e"/><path d="m110.933594 42.667969h34.132812v34.132812h-34.132812zm0 0" fill="#ebba16"/><path d="m179.199219 42.667969h34.132812v34.132812h-34.132812zm0 0" fill="#23a24d"/><g fill="#4d007e"><path d="m473.601562 512h-435.203124c-21.167969 0-38.398438-17.230469-38.398438-38.398438v-435.203124c0-21.167969 17.230469-38.398438 38.398438-38.398438h435.203124c21.167969 0 38.398438 17.230469 38.398438 38.398438v435.203124c0 21.167969-17.230469 38.398438-38.398438 38.398438zm-435.203124-494.933594c-11.757813 0-21.332032 9.574219-21.332032 21.332032v435.203124c0 11.757813 9.574219 21.332032 21.332032 21.332032h435.203124c11.765626 0 21.332032-9.574219 21.332032-21.332032v-435.203124c0-11.757813-9.574219-21.332032-21.332032-21.332032zm0 0"/><path d="m76.800781 85.332031h-34.132812c-4.710938 0-8.535157-3.820312-8.535157-8.53125v-34.132812c0-4.710938 3.824219-8.535157 8.535157-8.535157h34.132812c4.710938 0 8.53125 3.824219 8.53125 8.535157v34.132812c0 4.710938-3.820312 8.53125-8.53125 8.53125zm-25.601562-17.066406h17.066406v-17.066406h-17.066406zm0 0"/><path d="m145.066406 85.332031h-34.132812c-4.710938 0-8.535156-3.820312-8.535156-8.53125v-34.132812c0-4.710938 3.824218-8.535157 8.535156-8.535157h34.132812c4.710938 0 8.535156 3.824219 8.535156 8.535157v34.132812c0 4.710938-3.824218 8.53125-8.535156 8.53125zm-25.601562-17.066406h17.070312v-17.066406h-17.070312zm0 0"/><path d="m213.332031 85.332031h-34.132812c-4.710938 0-8.53125-3.820312-8.53125-8.53125v-34.132812c0-4.710938 3.820312-8.535157 8.53125-8.535157h34.132812c4.710938 0 8.535157 3.824219 8.535157 8.535157v34.132812c0 4.710938-3.824219 8.53125-8.535157 8.53125zm-25.597656-17.066406h17.066406v-17.066406h-17.066406zm0 0"/><path d="m503.464844 119.464844h-494.929688c-4.710937 0-8.535156-3.820313-8.535156-8.53125v-72.535156c0-21.167969 17.230469-38.398438 38.398438-38.398438h435.203124c21.167969 0 38.398438 17.230469 38.398438 38.398438v72.535156c0 4.710937-3.824219 8.53125-8.535156 8.53125zm-486.398438-17.066406h477.867188v-64c0-11.757813-9.574219-21.332032-21.332032-21.332032h-435.203124c-11.757813 0-21.332032 9.574219-21.332032 21.332032zm0 0"/><path d="m256 477.867188c-94.105469 0-170.667969-76.5625-170.667969-170.667969s76.5625-170.664063 170.667969-170.664063 170.667969 76.558594 170.667969 170.664063-76.5625 170.667969-170.667969 170.667969zm0-324.265626c-84.691406 0-153.601562 68.90625-153.601562 153.597657 0 84.695312 68.910156 153.601562 153.601562 153.601562s153.601562-68.90625 153.601562-153.601562c0-84.691407-68.910156-153.597657-153.601562-153.597657zm0 0"/><path d="m256 443.734375c-4.710938 0-8.535156-3.824219-8.535156-8.535156v-68.265625c0-4.710938 3.824218-8.535156 8.535156-8.535156s8.535156 3.824218 8.535156 8.535156v68.265625c0 4.710937-3.824218 8.535156-8.535156 8.535156zm0 0"/><path d="m76.800781 153.601562h-34.132812c-4.710938 0-8.535157-3.824218-8.535157-8.535156 0-4.710937 3.824219-8.53125 8.535157-8.53125h34.132812c4.710938 0 8.53125 3.820313 8.53125 8.53125 0 4.710938-3.820312 8.535156-8.53125 8.535156zm0 0"/><path d="m42.667969 187.734375c-4.710938 0-8.535157-3.824219-8.535157-8.535156v-34.132813c0-4.710937 3.824219-8.53125 8.535157-8.53125 4.710937 0 8.53125 3.820313 8.53125 8.53125v34.132813c0 4.710937-3.820313 8.535156-8.53125 8.535156zm0 0"/><path d="m469.332031 477.867188h-34.132812c-4.710938 0-8.53125-3.824219-8.53125-8.535157 0-4.710937 3.820312-8.53125 8.53125-8.53125h34.132812c4.710938 0 8.535157 3.820313 8.535157 8.53125 0 4.710938-3.824219 8.535157-8.535157 8.535157zm0 0"/><path d="m469.332031 477.867188c-4.710937 0-8.53125-3.824219-8.53125-8.535157v-34.132812c0-4.710938 3.820313-8.53125 8.53125-8.53125 4.710938 0 8.535157 3.820312 8.535157 8.53125v34.132812c0 4.710938-3.824219 8.535157-8.535157 8.535157zm0 0"/><path d="m204.800781 358.398438c-14.113281 0-25.601562-11.484376-25.601562-25.597657v-25.601562c0-4.710938 3.824219-8.53125 8.535156-8.53125s8.53125 3.820312 8.53125 8.53125v25.601562c0 4.699219 3.832031 8.53125 8.535156 8.53125 4.699219 0 8.53125-3.832031 8.53125-8.53125v-25.601562c0-4.710938 3.824219-8.53125 8.535157-8.53125 4.710937 0 8.53125 3.820312 8.53125 8.53125v25.601562c0 14.113281-11.484376 25.597657-25.597657 25.597657zm0 0"/><path d="m307.199219 358.398438c-14.113281 0-25.597657-11.484376-25.597657-25.597657v-25.601562c0-4.710938 3.820313-8.53125 8.53125-8.53125 4.710938 0 8.535157 3.820312 8.535157 8.53125v25.601562c0 4.699219 3.832031 8.53125 8.53125 8.53125 4.703125 0 8.535156-3.832031 8.535156-8.53125v-25.601562c0-4.710938 3.820313-8.53125 8.53125-8.53125s8.535156 3.820312 8.535156 8.53125v25.601562c0 14.113281-11.488281 25.597657-25.601562 25.597657zm0 0"/><path d="m278.210938 443.734375h-44.421876c-11.28125 0-20.457031-9.34375-20.457031-20.832031v-53.921875c-7.199219-3.035157-14.410156-7.644531-21.511719-13.746094l-1.039062-.886719c-2.484375-2.101562-5.292969-4.480468-7.503906-7.542968-3.546875-4.890626-4.078125-10.871094-4.078125-14.003907v-25.601562c0-23.78125 14.960937-43.800781 35.617187-50.730469-6.910156-9.207031-10.792968-20.597656-10.792968-32.46875 0-16.316406 7.125-31.503906 19.558593-41.695312 11.945313-9.785157 27.5625-13.636719 42.8125-10.597657 20.929688 4.199219 37.339844 21.5625 40.847657 43.222657 2.449218 15.113281-1.3125 29.984374-10.027344 41.546874 20.632812 6.929688 35.585937 26.871094 35.585937 50.332032v25.992187c0 7.347657-3.191406 14.105469-9.226562 19.558594-1.066407.964844-2.199219 1.851563-3.34375 2.730469-6.628907 5.121094-13.355469 10.308594-21.5625 13.867187v53.953125c0 11.480469-9.175781 20.824219-20.457031 20.824219zm-22.246094-256c-7.851563 0-15.316406 2.660156-21.5625 7.773437-8.464844 6.929688-13.3125 17.320313-13.3125 28.492188 0 11.894531 5.65625 23.039062 15.136718 29.832031 3.355469 2.390625 4.773438 6.648438 3.507813 10.574219-1.246094 3.90625-4.835937 6.527344-8.933594 6.527344-19.039062 0-34.535156 16.09375-34.535156 35.882812v25.984375c0 1.960938.496094 3.53125.847656 4.011719.996094 1.390625 2.960938 3.042969 4.691407 4.511719l1.125.957031c7.28125 6.246094 14.472656 10.46875 21.386718 12.542969 3.609375 1.09375 6.082032 4.421875 6.082032 8.183593v59.894532c0 2.074218 1.519531 3.765625 3.390624 3.765625h44.421876c1.871093 0 3.390624-1.691407 3.390624-3.757813v-59.902344c0-3.761718 2.472657-7.089843 6.074219-8.175781 8.089844-2.421875 14.539063-7.398437 22-13.15625.921875-.710937 1.714844-1.316406 2.457031-1.980469 3.601563-3.242187 3.601563-5.992187 3.601563-6.894531v-25.601562c0-20.171875-15.496094-36.265625-34.550781-36.265625-4.089844 0-7.683594-2.613282-8.9375-6.503906-1.253906-3.914063.144531-8.171876 3.5-10.582032 11.339844-8.113281 16.957031-21.980468 14.652344-36.1875-2.332032-14.4375-13.585938-26.460937-27.351563-29.21875-2.378906-.476562-4.742187-.707031-7.082031-.707031zm-29.6875 79.964844c.007812.007812.019531.015625.027344.015625-.007813 0-.019532-.007813-.027344-.015625zm0 0"/></g></svg>
				<div class="profile_age_text"><%=empProfileVO.getM_age() %></div>
			</div>
			<div class="profile_phone">
				<svg class="profile_phone_svg" id="Capa_1" enable-background="new 0 0 512 512" height="512" viewBox="0 0 512 512" width="512" xmlns="http://www.w3.org/2000/svg"><g><path d="m391 7.5h-30v497h30c16.57 0 30-13.43 30-30v-437c0-16.57-13.43-30-30-30z" fill="#404242"/><path d="m361 7.5h-240c-16.57 0-30 13.43-30 30v437c0 16.57 13.43 30 30 30h240c16.57 0 30-13.43 30-30v-60l-90-188.5 90-188.5c0-16.57-13.43-30-30-30z" fill="#565959"/><path d="m286 444.5h-30v30h30c8.284 0 15-6.716 15-15s-6.716-15-15-15z" fill="#8f8f8b"/><path d="m271 459.5c0-8.284-6.716-15-15-15h-30c-8.284 0-15 6.716-15 15s6.716 15 15 15h30c8.284 0 15-6.716 15-15z" fill="#adaca7"/><path d="m256 226 105 188.5h30v-377h-30z" fill="#4b88d5"/><path d="m298.426 37.5-21.213 21.213c-5.452 5.426-12.947 8.787-21.213 8.787s-15.761-3.361-21.193-8.787c-.02 0-21.233-21.213-21.233-21.213h-92.574v377h240v-377z" fill="#69a7ff"/><circle cx="256" cy="37.5" r="6"/><path d="m391 0h-270c-20.678 0-37.5 16.822-37.5 37.5v437c0 20.678 16.822 37.5 37.5 37.5h270c20.678 0 37.5-16.822 37.5-37.5v-437c0-20.678-16.822-37.5-37.5-37.5zm22.5 474.5c0 12.407-10.094 22.5-22.5 22.5h-270c-12.406 0-22.5-10.093-22.5-22.5v-437c0-12.407 10.094-22.5 22.5-22.5h270c12.406 0 22.5 10.093 22.5 22.5z"/><path d="m286 437h-60c-12.406 0-22.5 10.093-22.5 22.5s10.094 22.5 22.5 22.5h60c12.406 0 22.5-10.093 22.5-22.5s-10.094-22.5-22.5-22.5zm0 30h-60c-4.136 0-7.5-3.364-7.5-7.5s3.364-7.5 7.5-7.5h60c4.136 0 7.5 3.364 7.5 7.5s-3.364 7.5-7.5 7.5z"/><path d="m391 30h-92.574c-1.989 0-3.896.79-5.304 2.197l-21.2 21.201c-4.277 4.257-9.932 6.602-15.922 6.602-5.993 0-11.637-2.341-15.893-6.593-.035-.036-13.158-13.139-21.229-21.21-1.407-1.407-3.315-2.197-5.304-2.197h-92.574c-4.143 0-7.5 3.358-7.5 7.5v173.5c0 4.142 3.357 7.5 7.5 7.5s7.5-3.358 7.5-7.5v-166h81.968s18.2 18.189 19.076 18.981l-.038.038c7.089 7.081 16.497 10.981 26.494 10.981 9.983 0 19.396-3.896 26.517-10.984l19.015-19.016h81.968v362h-255v-166c0-4.142-3.357-7.5-7.5-7.5s-7.5 3.358-7.5 7.5v173.5c0 4.142 3.357 7.5 7.5 7.5h270c4.143 0 7.5-3.358 7.5-7.5v-377c0-4.142-3.357-7.5-7.5-7.5z"/></g></svg>
				<%if(empProfileVO.getM_type().equals("E")){ %>
					<%if(a_apply.equals("Y")){ %>
					<div class="profile_phone_text"><%=empProfileVO.getM_phone() %></div>
					<%}else{ %>
					<div class="profile_phone_text2_area" onclick="yetAlert()"><div class="profile_phone_text2">Waiting...</div></div>	
					<%} %>
				<%}else{ %>
				<div class="profile_phone_text2_area" onclick="deniedAlert()"><div class="profile_phone_text2">Waiting...</div></div>
				<%} %>
			</div>
			<div class="profile_email">
				<svg class="profile_email_svg" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve"> <path style="fill:#FFD54F;" d="M501.315,34.048L314.101,169.395l-30.72,22.261c-16.273,12.021-38.489,12.021-54.762,0l-30.72-22.261 L10.463,34.271c10.418-14.581,27.27-23.218,45.19-23.151h400.696C474.135,11.12,490.853,19.646,501.315,34.048z"/><g> <path style="fill:#FFC107;" d="M10.463,34.271L197.9,169.395L16.251,351.043C5.81,340.581-0.022,326.4,0,311.641V66.772 C-0.044,55.085,3.607,43.71,10.463,34.271z"/> <path style="fill:#FFC107;" d="M512,66.772v244.87c0.022,14.759-5.81,28.939-16.25,39.402L314.101,169.395L501.315,34.048 C508.261,43.532,512,54.996,512,66.772z"/> </g> <path style="fill:#455A64;" d="M333.913,411.815c-14.781,0-22.261-11.13-22.261-33.391c0.356-31.098-24.554-56.609-55.652-56.966 s-56.609,24.554-56.966,55.652c-0.356,31.098,24.554,56.609,55.652,56.966c16.673,0.2,32.568-7.012,43.409-19.656 c7.391,12.666,21.17,20.235,35.818,19.656c44.522,0,44.522-41.895,44.522-55.652c0-67.629-54.806-122.435-122.435-122.435 s-122.435,54.806-122.435,122.413S188.372,500.837,256,500.837c31.766,0,62.286-12.355,85.126-34.438 c4.43-4.296,4.519-11.375,0.223-15.783c-4.296-4.43-11.375-4.519-15.805-0.223l0,0c-39.825,38.4-103.246,37.265-141.646-2.56 s-37.265-103.246,2.56-141.646s103.246-37.265,141.646,2.56c18.031,18.699,28.093,43.676,28.071,69.654 C356.174,403.379,350.565,411.815,333.913,411.815z M256,411.815c-18.432,0-33.391-14.959-33.391-33.391 c0-18.432,14.959-33.391,33.391-33.391s33.391,14.937,33.391,33.391C289.392,396.878,274.432,411.815,256,411.815z"/> <path style="fill:#FFA000;" d="M314.101,169.395l-30.72,22.261c-16.273,12.021-38.489,12.021-54.762,0l-30.72-22.261L16.251,351.043 c10.463,10.44,24.643,16.273,39.402,16.25h56.209c6.033-79.605,75.442-139.242,155.025-133.231 c71.235,5.387,127.844,61.997,133.231,133.231h56.231c14.759,0.022,28.939-5.81,39.402-16.25L314.101,169.395z"/> <path d="M456.348,367.294h-44.522c-6.144,0-11.13-4.986-11.13-11.13s4.986-11.13,11.13-11.13h44.522 c18.41,0,33.391-14.982,33.391-33.391V66.772c0-18.41-14.982-33.391-33.391-33.391H55.653c-18.41,0-33.391,14.959-33.391,33.391 v244.87c0,18.41,14.982,33.391,33.391,33.391h44.522c6.144,0,11.13,4.964,11.13,11.13c0,6.166-4.986,11.13-11.13,11.13H55.653 C24.977,367.294,0,342.317,0,311.641V66.772C0,36.096,24.977,11.12,55.653,11.12h400.696C487.046,11.12,512,36.074,512,66.772 v244.87C512,342.317,487.046,367.294,456.348,367.294z"/> <path d="M256.023,211.801c-11.91,0-23.819-3.718-33.992-11.153L49.152,75.788c-5.009-3.606-6.122-10.552-2.515-15.538 c3.584-5.009,10.529-6.122,15.538-2.515L235.142,182.64c12.533,9.149,29.251,9.149,41.695,0.045l172.989-124.95 c4.986-3.584,11.932-2.493,15.538,2.493c3.606,4.986,2.471,11.954-2.493,15.538L289.904,200.671 C279.797,208.084,267.91,211.801,256.023,211.801z"/> <path d="M55.653,322.772c-2.849,0-5.699-1.091-7.88-3.25c-4.341-4.341-4.341-11.398,0-15.738l111.304-111.304 c4.341-4.341,11.398-4.341,15.738,0c4.341,4.341,4.341,11.398,0,15.738L63.511,319.522 C61.351,321.681,58.502,322.772,55.653,322.772z"/> <path d="M456.348,322.772c-2.849,0-5.699-1.091-7.88-3.25L337.164,208.217c-4.341-4.341-4.341-11.398,0-15.738 c4.341-4.341,11.398-4.341,15.738,0l111.304,111.304c4.341,4.341,4.341,11.398,0,15.738 C462.047,321.681,459.198,322.772,456.348,322.772z"/> <path d="M256.067,500.881c-0.69,0-1.38,0-2.07-0.022c-32.701-0.534-63.221-13.779-85.971-37.287 c-46.948-48.529-45.657-126.175,2.849-173.101c23.507-22.751,54.984-34.994,87.151-34.438c32.679,0.534,63.221,13.779,85.971,37.265 c22.194,22.951,34.438,53.181,34.438,85.126c0,6.144-4.986,11.13-11.13,11.13s-11.13-4.986-11.13-11.13 c0-26.134-10.017-50.866-28.205-69.654c-18.61-19.211-43.587-30.052-70.344-30.497c-26.223,0-52.068,9.594-71.302,28.205 c-39.691,38.4-40.737,101.933-2.315,141.624c18.61,19.233,43.587,30.074,70.344,30.497c26.847,0.935,52.046-9.572,71.302-28.182 c4.408-4.252,11.464-4.163,15.738,0.267s4.163,11.464-0.267,15.738C318.13,488.682,288.012,500.881,256.067,500.881z"/> <path d="M256,434.076c-30.675,0-55.652-24.977-55.652-55.652s24.977-55.652,55.652-55.652s55.652,24.954,55.652,55.652 S286.676,434.076,256,434.076z M256,345.033c-18.41,0-33.391,14.982-33.391,33.391c0,18.41,14.982,33.391,33.391,33.391 s33.391-14.982,33.391-33.391C289.392,360.014,274.41,345.033,256,345.033z"/> <path d="M333.913,434.076c-27.871,0-44.522-20.814-44.522-55.652c0-6.144,4.986-11.13,11.13-11.13c6.144,0,11.13,4.964,11.13,11.13 c0,22.15,7.502,33.391,22.261,33.391c16.651,0,22.261-8.437,22.261-33.391c0-6.144,4.986-11.13,11.13-11.13s11.13,4.964,11.13,11.13 C378.435,392.181,378.435,434.076,333.913,434.076z"/><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g></svg>
				<textbox class="profile_email_text"><%=empProfileVO.getM_email() %></texbox>
			</div>
			<% if(empProfileVO.getM_gender().equals("M")){ %>
				<svg class="profile_gender_svg" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve"> <path style="fill:#FF6E54;" d="M459.5,150v30c0,12.426,10.073,22.5,22.5,22.5s22.5-10.074,22.5-22.5v-30H459.5z"/> <path style="fill:#8972F3;" d="M474.5,7.5H332c-12.426,0-22.5,10.074-22.5,22.5s10.074,22.5,22.5,22.5h95.68L323.555,156.625 C290.297,130.255,248.24,114.5,202.5,114.5c-107.696,0-195,87.304-195,195s87.304,195,195,195s195-87.304,195-195 c0-45.74-15.755-87.797-42.126-121.055L459.5,84.32V150c0,12.426,10.073,22.5,22.5,22.5s22.5-10.074,22.5-22.5V37.5 C504.5,21,491,7.5,474.5,7.5z M202.5,459.5c-82.843,0-150-67.157-150-150s67.157-150,150-150s150,67.157,150,150 S285.343,459.5,202.5,459.5z"/> <path d="M474.5,0H332c-16.542,0-30,13.458-30,30s13.458,30,30,30h77.573l-86.672,86.672C287.888,120.693,246.406,107,202.5,107 C90.841,107,0,197.841,0,309.5S90.841,512,202.5,512S405,421.159,405,309.5c0-43.906-13.693-85.389-39.673-120.401L452,102.426V180 c0,16.542,13.458,30,30,30s30-13.458,30-30V37.5C512,16.822,495.178,0,474.5,0z M497,180c0,8.271-6.729,15-15,15s-15-6.729-15-15 V84.32c0-3.034-1.827-5.768-4.63-6.929s-6.028-0.519-8.174,1.626L350.07,183.142c-2.693,2.693-2.939,6.979-0.573,9.963 C375.994,226.521,390,266.77,390,309.5C390,412.888,305.888,497,202.5,497S15,412.888,15,309.5S99.112,122,202.5,122 c42.729,0,82.978,14.005,116.395,40.502c2.985,2.366,7.27,2.12,9.964-0.574L432.983,57.803c2.145-2.145,2.786-5.371,1.625-8.173 c-1.16-2.803-3.896-4.63-6.929-4.63H332c-8.271,0-15-6.729-15-15s6.729-15,15-15h142.5c12.406,0,22.5,10.093,22.5,22.5V180z"/> <path d="M202.5,152c-36.258,0-71.657,12.627-99.676,35.556c-3.206,2.623-3.678,7.348-1.055,10.554s7.349,3.678,10.554,1.055 C137.67,178.423,169.695,167,202.5,167c78.575,0,142.5,63.925,142.5,142.5S281.075,452,202.5,452S60,388.075,60,309.5 c0-32.805,11.423-64.831,32.165-90.177c2.623-3.206,2.151-7.931-1.054-10.554s-7.931-2.15-10.554,1.054 C57.627,237.843,45,273.242,45,309.5C45,396.346,115.654,467,202.5,467S360,396.346,360,309.5S289.346,152,202.5,152z"/><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g></svg>
			<%}else{%>
				<svg class="profile_gender_svg" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve"> <path style="fill:#D63D76;" d="M317,398.5h-30v45h30c12.426,0,22.5-10.074,22.5-22.5S329.426,398.5,317,398.5z"/> <path style="fill:#8972F3;" d="M421,172.5c0-91.127-73.873-165-165-165S91,81.373,91,172.5c0,83.494,62.019,152.491,142.5,163.467 V398.5H195c-12.426,0-22.5,10.074-22.5,22.5s10.074,22.5,22.5,22.5h38.5V482c0,12.426,10.074,22.5,22.5,22.5s22.5-10.074,22.5-22.5 v-38.5h8.5c12.426,0,22.5-10.074,22.5-22.5s-10.074-22.5-22.5-22.5h-8.5v-62.533C358.981,324.991,421,255.994,421,172.5z M256,292.5 c-66.274,0-120-53.726-120-120s53.726-120,120-120s120,53.726,120,120S322.274,292.5,256,292.5z"/> <path d="M256,0C160.883,0,83.5,77.383,83.5,172.5c0,41.965,15.249,82.409,42.938,113.881c25.979,29.529,61.131,49.253,99.562,56.004 V391h-31c-16.542,0-30,13.458-30,30c0,8.013,3.121,15.547,8.787,21.213S186.987,451,195,451h31v31c0,16.542,13.458,30,30,30 s30-13.458,30-30v-31h31c8.014,0,15.547-3.121,21.213-8.787c5.666-5.667,8.787-13.2,8.787-21.213c0-16.542-13.458-30-30-30h-31 v-48.614c38.431-6.751,73.582-26.476,99.562-56.004C413.251,254.909,428.5,214.465,428.5,172.5C428.5,77.383,351.117,0,256,0z M277.486,328.535c-3.716,0.507-6.486,3.681-6.486,7.431V398.5c0,4.142,3.357,7.5,7.5,7.5H317c8.271,0,15,6.729,15,15 c0,4.006-1.561,7.773-4.394,10.607C324.773,434.44,321.007,436,317,436h-38.5c-4.143,0-7.5,3.358-7.5,7.5V482 c0,8.271-6.729,15-15,15s-15-6.729-15-15v-38.5c0-4.142-3.357-7.5-7.5-7.5H195c-4.007,0-7.773-1.56-10.606-4.393 C181.561,428.773,180,425.006,180,421c0-8.271,6.729-15,15-15h38.5c4.143,0,7.5-3.358,7.5-7.5v-62.534 c0-3.75-2.771-6.924-6.486-7.431C156.973,317.96,98.5,250.88,98.5,172.5C98.5,85.654,169.154,15,256,15s157.5,70.654,157.5,157.5 C413.5,250.88,355.027,317.96,277.486,328.535z"/> <path d="M256,45c-28.605,0-55.641,9.262-78.183,26.785c-3.271,2.542-3.861,7.254-1.319,10.524c2.542,3.27,7.255,3.86,10.524,1.318 C206.908,68.17,230.76,60,256,60c62.032,0,112.5,50.467,112.5,112.5S318.032,285,256,285s-112.5-50.467-112.5-112.5 c0-25.241,8.17-49.093,23.628-68.978c2.542-3.271,1.951-7.982-1.319-10.524c-3.269-2.542-7.981-1.953-10.524,1.318 C137.762,116.858,128.5,143.894,128.5,172.5c0,70.304,57.196,127.5,127.5,127.5s127.5-57.196,127.5-127.5S326.304,45,256,45z"/><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g></svg>
			<%} %>
		</div>
	  </div>
	  <div class="right-bar">
	    
	    <!-- 리뷰단 사람 인원수 -->
	    <div class="top-part">	
	      <svg class="top_part_svg" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2" /><circle cx="9" cy="7" r="4" /><path d="M23 21v-2a4 4 0 0 0-3-3.87" /><path d="M16 3.13a4 4 0 0 1 0 7.75" /></svg>
	      <div class="count"><div class="count_text"><%=empReviewList.get(0).getR_cnt() %></div></div>
	    </div>
	    
	    <!-- 리뷰리스트 -->
	    <div class="right-content">
	      <% for(int i=0; i< empReviewList.size(); i++) { %>
		      <div class="task-box yellow">
		        <div class="description-task">
		          <div class="time"><%=empReviewList.get(i).getR_date()%></div>
		          <div class="task-name"><%=empReviewList.get(i).getR_content() %></div>
		        </div>
		        <div class="reviewList_reviewer_photo_sround">
		        	<% if(empReviewList.get(i).getM_photo() == null) {	%>
							<img class="reviewList_reviewer_photo" src="./resources/image/crocodile_profile.png"><br>
					<% } else {	%>
							<img class="reviewList_reviewer_photo" src="/myakkbird/myakkbirdUpload/<%=empReviewList.get(i).getM_photo()%>">
					<% } %>
		        <div class="reviewList_reviewer" onclick="profileLink('<%=empReviewList.get(i).getM_id() %>')"><%=empReviewList.get(i).getM_id() %></div>  
		        </div>
		       
		          <%if(empReviewList.get(i).getR_star() == 5.0){ %>
		          	<div class="task-star">
						<svg class="task-star-svg" id="color" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m23.363 8.584-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.606.093-.848.83-.423 1.265l5.36 5.494-1.267 7.767c-.101.617.558 1.08 1.103.777l6.59-3.642 6.59 3.643c.54.3 1.205-.154 1.103-.777l-1.267-7.767 5.36-5.494c.425-.436.182-1.173-.423-1.266z" fill="#ffc107"/></svg>
						<svg class="task-star-svg" id="color" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m23.363 8.584-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.606.093-.848.83-.423 1.265l5.36 5.494-1.267 7.767c-.101.617.558 1.08 1.103.777l6.59-3.642 6.59 3.643c.54.3 1.205-.154 1.103-.777l-1.267-7.767 5.36-5.494c.425-.436.182-1.173-.423-1.266z" fill="#ffc107"/></svg>
						<svg class="task-star-svg" id="color" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m23.363 8.584-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.606.093-.848.83-.423 1.265l5.36 5.494-1.267 7.767c-.101.617.558 1.08 1.103.777l6.59-3.642 6.59 3.643c.54.3 1.205-.154 1.103-.777l-1.267-7.767 5.36-5.494c.425-.436.182-1.173-.423-1.266z" fill="#ffc107"/></svg>
						<svg class="task-star-svg" id="color" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m23.363 8.584-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.606.093-.848.83-.423 1.265l5.36 5.494-1.267 7.767c-.101.617.558 1.08 1.103.777l6.59-3.642 6.59 3.643c.54.3 1.205-.154 1.103-.777l-1.267-7.767 5.36-5.494c.425-.436.182-1.173-.423-1.266z" fill="#ffc107"/></svg>
						<svg class="task-star-svg" id="color" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m23.363 8.584-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.606.093-.848.83-.423 1.265l5.36 5.494-1.267 7.767c-.101.617.558 1.08 1.103.777l6.59-3.642 6.59 3.643c.54.3 1.205-.154 1.103-.777l-1.267-7.767 5.36-5.494c.425-.436.182-1.173-.423-1.266z" fill="#ffc107"/></svg>
		          	</div>
		          <%}else if(empReviewList.get(i).getR_star() == 4.5){ %>
		          	<div class="task-star">
						<svg class="task-star-svg" id="color" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m23.363 8.584-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.606.093-.848.83-.423 1.265l5.36 5.494-1.267 7.767c-.101.617.558 1.08 1.103.777l6.59-3.642 6.59 3.643c.54.3 1.205-.154 1.103-.777l-1.267-7.767 5.36-5.494c.425-.436.182-1.173-.423-1.266z" fill="#ffc107"/></svg>
						<svg class="task-star-svg" id="color" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m23.363 8.584-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.606.093-.848.83-.423 1.265l5.36 5.494-1.267 7.767c-.101.617.558 1.08 1.103.777l6.59-3.642 6.59 3.643c.54.3 1.205-.154 1.103-.777l-1.267-7.767 5.36-5.494c.425-.436.182-1.173-.423-1.266z" fill="#ffc107"/></svg>
						<svg class="task-star-svg" id="color" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m23.363 8.584-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.606.093-.848.83-.423 1.265l5.36 5.494-1.267 7.767c-.101.617.558 1.08 1.103.777l6.59-3.642 6.59 3.643c.54.3 1.205-.154 1.103-.777l-1.267-7.767 5.36-5.494c.425-.436.182-1.173-.423-1.266z" fill="#ffc107"/></svg>
						<svg class="task-star-svg" id="color" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m23.363 8.584-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.606.093-.848.83-.423 1.265l5.36 5.494-1.267 7.767c-.101.617.558 1.08 1.103.777l6.59-3.642 6.59 3.643c.54.3 1.205-.154 1.103-.777l-1.267-7.767 5.36-5.494c.425-.436.182-1.173-.423-1.266z" fill="#ffc107"/></svg>
						<svg class="task-star-svg" id="color" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m23.79 9.87-5.36 5.49 1.26 7.77c.111.62-.562 1.074-1.1.78l-6.59-3.65v-20.23c.28 0 .56.13.68.4l3.31 7.05 7.37 1.12c.616.11.843.835.43 1.27z" fill="#eceff1"/><path d="m12 .03v20.23l-6.59 3.65c-.529.297-1.212-.153-1.1-.78l1.26-7.77-5.36-5.49c-.413-.435-.187-1.16.43-1.27l7.37-1.12 3.31-7.05c.12-.27.4-.4.68-.4z" fill="#ffc107"/></svg>
		          	</div>
		          <%}else if(empReviewList.get(i).getR_star() == 4.0){ %>
		          	<div class="task-star">
						<svg class="task-star-svg" id="color" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m23.363 8.584-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.606.093-.848.83-.423 1.265l5.36 5.494-1.267 7.767c-.101.617.558 1.08 1.103.777l6.59-3.642 6.59 3.643c.54.3 1.205-.154 1.103-.777l-1.267-7.767 5.36-5.494c.425-.436.182-1.173-.423-1.266z" fill="#ffc107"/></svg>
						<svg class="task-star-svg" id="color" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m23.363 8.584-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.606.093-.848.83-.423 1.265l5.36 5.494-1.267 7.767c-.101.617.558 1.08 1.103.777l6.59-3.642 6.59 3.643c.54.3 1.205-.154 1.103-.777l-1.267-7.767 5.36-5.494c.425-.436.182-1.173-.423-1.266z" fill="#ffc107"/></svg>
						<svg class="task-star-svg" id="color" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m23.363 8.584-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.606.093-.848.83-.423 1.265l5.36 5.494-1.267 7.767c-.101.617.558 1.08 1.103.777l6.59-3.642 6.59 3.643c.54.3 1.205-.154 1.103-.777l-1.267-7.767 5.36-5.494c.425-.436.182-1.173-.423-1.266z" fill="#ffc107"/></svg>
						<svg class="task-star-svg" id="color" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m23.363 8.584-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.606.093-.848.83-.423 1.265l5.36 5.494-1.267 7.767c-.101.617.558 1.08 1.103.777l6.59-3.642 6.59 3.643c.54.3 1.205-.154 1.103-.777l-1.267-7.767 5.36-5.494c.425-.436.182-1.173-.423-1.266z" fill="#ffc107"/></svg>
						<svg class="task-star-svg" id="regular" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m5.574 15.362-1.267 7.767c-.046.283.073.568.308.734.234.165.543.183.795.043l6.59-3.642 6.59 3.643c.114.062.239.093.363.093.152 0 .303-.046.432-.137.235-.166.354-.451.308-.734l-1.267-7.767 5.36-5.494c.196-.201.264-.496.175-.762-.089-.267-.32-.46-.598-.503l-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.278.043-.509.236-.598.503s-.022.561.174.762zm3.063-6.464c.247-.038.459-.196.565-.422l2.798-5.961 2.798 5.96c.106.226.318.385.565.422l6.331.967-4.605 4.72c-.167.17-.242.41-.204.645l1.08 6.617-5.602-3.096c-.113-.062-.238-.094-.363-.094s-.25.031-.363.094l-5.602 3.096 1.08-6.617c.038-.235-.037-.474-.204-.645l-4.605-4.72z" fill="#ffc107"/></svg>
		          	</div>
		          <%}else if(empReviewList.get(i).getR_star() == 3.5){ %>
		          	<div class="task-star">
						<svg class="task-star-svg" id="color" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m23.363 8.584-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.606.093-.848.83-.423 1.265l5.36 5.494-1.267 7.767c-.101.617.558 1.08 1.103.777l6.59-3.642 6.59 3.643c.54.3 1.205-.154 1.103-.777l-1.267-7.767 5.36-5.494c.425-.436.182-1.173-.423-1.266z" fill="#ffc107"/></svg>
						<svg class="task-star-svg" id="color" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m23.363 8.584-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.606.093-.848.83-.423 1.265l5.36 5.494-1.267 7.767c-.101.617.558 1.08 1.103.777l6.59-3.642 6.59 3.643c.54.3 1.205-.154 1.103-.777l-1.267-7.767 5.36-5.494c.425-.436.182-1.173-.423-1.266z" fill="#ffc107"/></svg>
						<svg class="task-star-svg" id="color" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m23.363 8.584-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.606.093-.848.83-.423 1.265l5.36 5.494-1.267 7.767c-.101.617.558 1.08 1.103.777l6.59-3.642 6.59 3.643c.54.3 1.205-.154 1.103-.777l-1.267-7.767 5.36-5.494c.425-.436.182-1.173-.423-1.266z" fill="#ffc107"/></svg>
						<svg class="task-star-svg" id="color" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m23.79 9.87-5.36 5.49 1.26 7.77c.111.62-.562 1.074-1.1.78l-6.59-3.65v-20.23c.28 0 .56.13.68.4l3.31 7.05 7.37 1.12c.616.11.843.835.43 1.27z" fill="#eceff1"/><path d="m12 .03v20.23l-6.59 3.65c-.529.297-1.212-.153-1.1-.78l1.26-7.77-5.36-5.49c-.413-.435-.187-1.16.43-1.27l7.37-1.12 3.31-7.05c.12-.27.4-.4.68-.4z" fill="#ffc107"/></svg>
						<svg class="task-star-svg" id="regular" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m5.574 15.362-1.267 7.767c-.046.283.073.568.308.734.234.165.543.183.795.043l6.59-3.642 6.59 3.643c.114.062.239.093.363.093.152 0 .303-.046.432-.137.235-.166.354-.451.308-.734l-1.267-7.767 5.36-5.494c.196-.201.264-.496.175-.762-.089-.267-.32-.46-.598-.503l-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.278.043-.509.236-.598.503s-.022.561.174.762zm3.063-6.464c.247-.038.459-.196.565-.422l2.798-5.961 2.798 5.96c.106.226.318.385.565.422l6.331.967-4.605 4.72c-.167.17-.242.41-.204.645l1.08 6.617-5.602-3.096c-.113-.062-.238-.094-.363-.094s-.25.031-.363.094l-5.602 3.096 1.08-6.617c.038-.235-.037-.474-.204-.645l-4.605-4.72z" fill="#ffc107"/></svg>
		          	</div>
		          <%}else if(empReviewList.get(i).getR_star() == 3.0){ %>
		          	<div class="task-star">
						<svg class="task-star-svg" id="color" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m23.363 8.584-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.606.093-.848.83-.423 1.265l5.36 5.494-1.267 7.767c-.101.617.558 1.08 1.103.777l6.59-3.642 6.59 3.643c.54.3 1.205-.154 1.103-.777l-1.267-7.767 5.36-5.494c.425-.436.182-1.173-.423-1.266z" fill="#ffc107"/></svg>
						<svg class="task-star-svg" id="color" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m23.363 8.584-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.606.093-.848.83-.423 1.265l5.36 5.494-1.267 7.767c-.101.617.558 1.08 1.103.777l6.59-3.642 6.59 3.643c.54.3 1.205-.154 1.103-.777l-1.267-7.767 5.36-5.494c.425-.436.182-1.173-.423-1.266z" fill="#ffc107"/></svg>
						<svg class="task-star-svg" id="color" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m23.363 8.584-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.606.093-.848.83-.423 1.265l5.36 5.494-1.267 7.767c-.101.617.558 1.08 1.103.777l6.59-3.642 6.59 3.643c.54.3 1.205-.154 1.103-.777l-1.267-7.767 5.36-5.494c.425-.436.182-1.173-.423-1.266z" fill="#ffc107"/></svg>
						<svg class="task-star-svg" id="regular" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m5.574 15.362-1.267 7.767c-.046.283.073.568.308.734.234.165.543.183.795.043l6.59-3.642 6.59 3.643c.114.062.239.093.363.093.152 0 .303-.046.432-.137.235-.166.354-.451.308-.734l-1.267-7.767 5.36-5.494c.196-.201.264-.496.175-.762-.089-.267-.32-.46-.598-.503l-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.278.043-.509.236-.598.503s-.022.561.174.762zm3.063-6.464c.247-.038.459-.196.565-.422l2.798-5.961 2.798 5.96c.106.226.318.385.565.422l6.331.967-4.605 4.72c-.167.17-.242.41-.204.645l1.08 6.617-5.602-3.096c-.113-.062-.238-.094-.363-.094s-.25.031-.363.094l-5.602 3.096 1.08-6.617c.038-.235-.037-.474-.204-.645l-4.605-4.72z" fill="#ffc107"/></svg>
						<svg class="task-star-svg" id="regular" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m5.574 15.362-1.267 7.767c-.046.283.073.568.308.734.234.165.543.183.795.043l6.59-3.642 6.59 3.643c.114.062.239.093.363.093.152 0 .303-.046.432-.137.235-.166.354-.451.308-.734l-1.267-7.767 5.36-5.494c.196-.201.264-.496.175-.762-.089-.267-.32-.46-.598-.503l-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.278.043-.509.236-.598.503s-.022.561.174.762zm3.063-6.464c.247-.038.459-.196.565-.422l2.798-5.961 2.798 5.96c.106.226.318.385.565.422l6.331.967-4.605 4.72c-.167.17-.242.41-.204.645l1.08 6.617-5.602-3.096c-.113-.062-.238-.094-.363-.094s-.25.031-.363.094l-5.602 3.096 1.08-6.617c.038-.235-.037-.474-.204-.645l-4.605-4.72z" fill="#ffc107"/></svg>
		          	</div>
		          <%}else if(empReviewList.get(i).getR_star() == 2.5){ %>
		          	<div class="task-star">
						<svg class="task-star-svg" id="color" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m23.363 8.584-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.606.093-.848.83-.423 1.265l5.36 5.494-1.267 7.767c-.101.617.558 1.08 1.103.777l6.59-3.642 6.59 3.643c.54.3 1.205-.154 1.103-.777l-1.267-7.767 5.36-5.494c.425-.436.182-1.173-.423-1.266z" fill="#ffc107"/></svg>
						<svg class="task-star-svg" id="color" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m23.363 8.584-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.606.093-.848.83-.423 1.265l5.36 5.494-1.267 7.767c-.101.617.558 1.08 1.103.777l6.59-3.642 6.59 3.643c.54.3 1.205-.154 1.103-.777l-1.267-7.767 5.36-5.494c.425-.436.182-1.173-.423-1.266z" fill="#ffc107"/></svg>
						<svg class="task-star-svg" id="color" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m23.79 9.87-5.36 5.49 1.26 7.77c.111.62-.562 1.074-1.1.78l-6.59-3.65v-20.23c.28 0 .56.13.68.4l3.31 7.05 7.37 1.12c.616.11.843.835.43 1.27z" fill="#eceff1"/><path d="m12 .03v20.23l-6.59 3.65c-.529.297-1.212-.153-1.1-.78l1.26-7.77-5.36-5.49c-.413-.435-.187-1.16.43-1.27l7.37-1.12 3.31-7.05c.12-.27.4-.4.68-.4z" fill="#ffc107"/></svg>
						<svg class="task-star-svg" id="regular" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m5.574 15.362-1.267 7.767c-.046.283.073.568.308.734.234.165.543.183.795.043l6.59-3.642 6.59 3.643c.114.062.239.093.363.093.152 0 .303-.046.432-.137.235-.166.354-.451.308-.734l-1.267-7.767 5.36-5.494c.196-.201.264-.496.175-.762-.089-.267-.32-.46-.598-.503l-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.278.043-.509.236-.598.503s-.022.561.174.762zm3.063-6.464c.247-.038.459-.196.565-.422l2.798-5.961 2.798 5.96c.106.226.318.385.565.422l6.331.967-4.605 4.72c-.167.17-.242.41-.204.645l1.08 6.617-5.602-3.096c-.113-.062-.238-.094-.363-.094s-.25.031-.363.094l-5.602 3.096 1.08-6.617c.038-.235-.037-.474-.204-.645l-4.605-4.72z" fill="#ffc107"/></svg>
						<svg class="task-star-svg" id="regular" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m5.574 15.362-1.267 7.767c-.046.283.073.568.308.734.234.165.543.183.795.043l6.59-3.642 6.59 3.643c.114.062.239.093.363.093.152 0 .303-.046.432-.137.235-.166.354-.451.308-.734l-1.267-7.767 5.36-5.494c.196-.201.264-.496.175-.762-.089-.267-.32-.46-.598-.503l-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.278.043-.509.236-.598.503s-.022.561.174.762zm3.063-6.464c.247-.038.459-.196.565-.422l2.798-5.961 2.798 5.96c.106.226.318.385.565.422l6.331.967-4.605 4.72c-.167.17-.242.41-.204.645l1.08 6.617-5.602-3.096c-.113-.062-.238-.094-.363-.094s-.25.031-.363.094l-5.602 3.096 1.08-6.617c.038-.235-.037-.474-.204-.645l-4.605-4.72z" fill="#ffc107"/></svg>
		          	</div>
		          <%}else if(empReviewList.get(i).getR_star() == 2.0){ %>
		          	<div class="task-star">
						<svg class="task-star-svg" id="color" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m23.363 8.584-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.606.093-.848.83-.423 1.265l5.36 5.494-1.267 7.767c-.101.617.558 1.08 1.103.777l6.59-3.642 6.59 3.643c.54.3 1.205-.154 1.103-.777l-1.267-7.767 5.36-5.494c.425-.436.182-1.173-.423-1.266z" fill="#ffc107"/></svg>
						<svg class="task-star-svg" id="color" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m23.363 8.584-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.606.093-.848.83-.423 1.265l5.36 5.494-1.267 7.767c-.101.617.558 1.08 1.103.777l6.59-3.642 6.59 3.643c.54.3 1.205-.154 1.103-.777l-1.267-7.767 5.36-5.494c.425-.436.182-1.173-.423-1.266z" fill="#ffc107"/></svg>
						<svg class="task-star-svg" id="regular" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m5.574 15.362-1.267 7.767c-.046.283.073.568.308.734.234.165.543.183.795.043l6.59-3.642 6.59 3.643c.114.062.239.093.363.093.152 0 .303-.046.432-.137.235-.166.354-.451.308-.734l-1.267-7.767 5.36-5.494c.196-.201.264-.496.175-.762-.089-.267-.32-.46-.598-.503l-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.278.043-.509.236-.598.503s-.022.561.174.762zm3.063-6.464c.247-.038.459-.196.565-.422l2.798-5.961 2.798 5.96c.106.226.318.385.565.422l6.331.967-4.605 4.72c-.167.17-.242.41-.204.645l1.08 6.617-5.602-3.096c-.113-.062-.238-.094-.363-.094s-.25.031-.363.094l-5.602 3.096 1.08-6.617c.038-.235-.037-.474-.204-.645l-4.605-4.72z" fill="#ffc107"/></svg>
						<svg class="task-star-svg" id="regular" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m5.574 15.362-1.267 7.767c-.046.283.073.568.308.734.234.165.543.183.795.043l6.59-3.642 6.59 3.643c.114.062.239.093.363.093.152 0 .303-.046.432-.137.235-.166.354-.451.308-.734l-1.267-7.767 5.36-5.494c.196-.201.264-.496.175-.762-.089-.267-.32-.46-.598-.503l-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.278.043-.509.236-.598.503s-.022.561.174.762zm3.063-6.464c.247-.038.459-.196.565-.422l2.798-5.961 2.798 5.96c.106.226.318.385.565.422l6.331.967-4.605 4.72c-.167.17-.242.41-.204.645l1.08 6.617-5.602-3.096c-.113-.062-.238-.094-.363-.094s-.25.031-.363.094l-5.602 3.096 1.08-6.617c.038-.235-.037-.474-.204-.645l-4.605-4.72z" fill="#ffc107"/></svg>
						<svg class="task-star-svg" id="regular" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m5.574 15.362-1.267 7.767c-.046.283.073.568.308.734.234.165.543.183.795.043l6.59-3.642 6.59 3.643c.114.062.239.093.363.093.152 0 .303-.046.432-.137.235-.166.354-.451.308-.734l-1.267-7.767 5.36-5.494c.196-.201.264-.496.175-.762-.089-.267-.32-.46-.598-.503l-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.278.043-.509.236-.598.503s-.022.561.174.762zm3.063-6.464c.247-.038.459-.196.565-.422l2.798-5.961 2.798 5.96c.106.226.318.385.565.422l6.331.967-4.605 4.72c-.167.17-.242.41-.204.645l1.08 6.617-5.602-3.096c-.113-.062-.238-.094-.363-.094s-.25.031-.363.094l-5.602 3.096 1.08-6.617c.038-.235-.037-.474-.204-.645l-4.605-4.72z" fill="#ffc107"/></svg>
		          	</div>
		          <%}else if(empReviewList.get(i).getR_star() == 1.5){ %>
		          	<div class="task-star">
						<svg class="task-star-svg" id="color" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m23.363 8.584-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.606.093-.848.83-.423 1.265l5.36 5.494-1.267 7.767c-.101.617.558 1.08 1.103.777l6.59-3.642 6.59 3.643c.54.3 1.205-.154 1.103-.777l-1.267-7.767 5.36-5.494c.425-.436.182-1.173-.423-1.266z" fill="#ffc107"/></svg>
						<svg class="task-star-svg" id="color" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m23.79 9.87-5.36 5.49 1.26 7.77c.111.62-.562 1.074-1.1.78l-6.59-3.65v-20.23c.28 0 .56.13.68.4l3.31 7.05 7.37 1.12c.616.11.843.835.43 1.27z" fill="#eceff1"/><path d="m12 .03v20.23l-6.59 3.65c-.529.297-1.212-.153-1.1-.78l1.26-7.77-5.36-5.49c-.413-.435-.187-1.16.43-1.27l7.37-1.12 3.31-7.05c.12-.27.4-.4.68-.4z" fill="#ffc107"/></svg>
						<svg class="task-star-svg" id="regular" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m5.574 15.362-1.267 7.767c-.046.283.073.568.308.734.234.165.543.183.795.043l6.59-3.642 6.59 3.643c.114.062.239.093.363.093.152 0 .303-.046.432-.137.235-.166.354-.451.308-.734l-1.267-7.767 5.36-5.494c.196-.201.264-.496.175-.762-.089-.267-.32-.46-.598-.503l-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.278.043-.509.236-.598.503s-.022.561.174.762zm3.063-6.464c.247-.038.459-.196.565-.422l2.798-5.961 2.798 5.96c.106.226.318.385.565.422l6.331.967-4.605 4.72c-.167.17-.242.41-.204.645l1.08 6.617-5.602-3.096c-.113-.062-.238-.094-.363-.094s-.25.031-.363.094l-5.602 3.096 1.08-6.617c.038-.235-.037-.474-.204-.645l-4.605-4.72z" fill="#ffc107"/></svg>
						<svg class="task-star-svg" id="regular" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m5.574 15.362-1.267 7.767c-.046.283.073.568.308.734.234.165.543.183.795.043l6.59-3.642 6.59 3.643c.114.062.239.093.363.093.152 0 .303-.046.432-.137.235-.166.354-.451.308-.734l-1.267-7.767 5.36-5.494c.196-.201.264-.496.175-.762-.089-.267-.32-.46-.598-.503l-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.278.043-.509.236-.598.503s-.022.561.174.762zm3.063-6.464c.247-.038.459-.196.565-.422l2.798-5.961 2.798 5.96c.106.226.318.385.565.422l6.331.967-4.605 4.72c-.167.17-.242.41-.204.645l1.08 6.617-5.602-3.096c-.113-.062-.238-.094-.363-.094s-.25.031-.363.094l-5.602 3.096 1.08-6.617c.038-.235-.037-.474-.204-.645l-4.605-4.72z" fill="#ffc107"/></svg>
						<svg class="task-star-svg" id="regular" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m5.574 15.362-1.267 7.767c-.046.283.073.568.308.734.234.165.543.183.795.043l6.59-3.642 6.59 3.643c.114.062.239.093.363.093.152 0 .303-.046.432-.137.235-.166.354-.451.308-.734l-1.267-7.767 5.36-5.494c.196-.201.264-.496.175-.762-.089-.267-.32-.46-.598-.503l-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.278.043-.509.236-.598.503s-.022.561.174.762zm3.063-6.464c.247-.038.459-.196.565-.422l2.798-5.961 2.798 5.96c.106.226.318.385.565.422l6.331.967-4.605 4.72c-.167.17-.242.41-.204.645l1.08 6.617-5.602-3.096c-.113-.062-.238-.094-.363-.094s-.25.031-.363.094l-5.602 3.096 1.08-6.617c.038-.235-.037-.474-.204-.645l-4.605-4.72z" fill="#ffc107"/></svg>
		          	</div>
		          <%}else if(empReviewList.get(i).getR_star() == 1.0){ %>
		          	<div class="task-star">
						<svg class="task-star-svg" id="color" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m23.363 8.584-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.606.093-.848.83-.423 1.265l5.36 5.494-1.267 7.767c-.101.617.558 1.08 1.103.777l6.59-3.642 6.59 3.643c.54.3 1.205-.154 1.103-.777l-1.267-7.767 5.36-5.494c.425-.436.182-1.173-.423-1.266z" fill="#ffc107"/></svg>
						<svg class="task-star-svg" id="regular" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m5.574 15.362-1.267 7.767c-.046.283.073.568.308.734.234.165.543.183.795.043l6.59-3.642 6.59 3.643c.114.062.239.093.363.093.152 0 .303-.046.432-.137.235-.166.354-.451.308-.734l-1.267-7.767 5.36-5.494c.196-.201.264-.496.175-.762-.089-.267-.32-.46-.598-.503l-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.278.043-.509.236-.598.503s-.022.561.174.762zm3.063-6.464c.247-.038.459-.196.565-.422l2.798-5.961 2.798 5.96c.106.226.318.385.565.422l6.331.967-4.605 4.72c-.167.17-.242.41-.204.645l1.08 6.617-5.602-3.096c-.113-.062-.238-.094-.363-.094s-.25.031-.363.094l-5.602 3.096 1.08-6.617c.038-.235-.037-.474-.204-.645l-4.605-4.72z" fill="#ffc107"/></svg>
						<svg class="task-star-svg" id="regular" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m5.574 15.362-1.267 7.767c-.046.283.073.568.308.734.234.165.543.183.795.043l6.59-3.642 6.59 3.643c.114.062.239.093.363.093.152 0 .303-.046.432-.137.235-.166.354-.451.308-.734l-1.267-7.767 5.36-5.494c.196-.201.264-.496.175-.762-.089-.267-.32-.46-.598-.503l-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.278.043-.509.236-.598.503s-.022.561.174.762zm3.063-6.464c.247-.038.459-.196.565-.422l2.798-5.961 2.798 5.96c.106.226.318.385.565.422l6.331.967-4.605 4.72c-.167.17-.242.41-.204.645l1.08 6.617-5.602-3.096c-.113-.062-.238-.094-.363-.094s-.25.031-.363.094l-5.602 3.096 1.08-6.617c.038-.235-.037-.474-.204-.645l-4.605-4.72z" fill="#ffc107"/></svg>
						<svg class="task-star-svg" id="regular" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m5.574 15.362-1.267 7.767c-.046.283.073.568.308.734.234.165.543.183.795.043l6.59-3.642 6.59 3.643c.114.062.239.093.363.093.152 0 .303-.046.432-.137.235-.166.354-.451.308-.734l-1.267-7.767 5.36-5.494c.196-.201.264-.496.175-.762-.089-.267-.32-.46-.598-.503l-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.278.043-.509.236-.598.503s-.022.561.174.762zm3.063-6.464c.247-.038.459-.196.565-.422l2.798-5.961 2.798 5.96c.106.226.318.385.565.422l6.331.967-4.605 4.72c-.167.17-.242.41-.204.645l1.08 6.617-5.602-3.096c-.113-.062-.238-.094-.363-.094s-.25.031-.363.094l-5.602 3.096 1.08-6.617c.038-.235-.037-.474-.204-.645l-4.605-4.72z" fill="#ffc107"/></svg>
						<svg class="task-star-svg" id="regular" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m5.574 15.362-1.267 7.767c-.046.283.073.568.308.734.234.165.543.183.795.043l6.59-3.642 6.59 3.643c.114.062.239.093.363.093.152 0 .303-.046.432-.137.235-.166.354-.451.308-.734l-1.267-7.767 5.36-5.494c.196-.201.264-.496.175-.762-.089-.267-.32-.46-.598-.503l-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.278.043-.509.236-.598.503s-.022.561.174.762zm3.063-6.464c.247-.038.459-.196.565-.422l2.798-5.961 2.798 5.96c.106.226.318.385.565.422l6.331.967-4.605 4.72c-.167.17-.242.41-.204.645l1.08 6.617-5.602-3.096c-.113-.062-.238-.094-.363-.094s-.25.031-.363.094l-5.602 3.096 1.08-6.617c.038-.235-.037-.474-.204-.645l-4.605-4.72z" fill="#ffc107"/></svg>
		          	</div>
		          <%}else if(empReviewList.get(i).getR_star() == 0.5){ %>
		          	<div class="task-star">
						<svg class="task-star-svg" id="color" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m23.79 9.87-5.36 5.49 1.26 7.77c.111.62-.562 1.074-1.1.78l-6.59-3.65v-20.23c.28 0 .56.13.68.4l3.31 7.05 7.37 1.12c.616.11.843.835.43 1.27z" fill="#eceff1"/><path d="m12 .03v20.23l-6.59 3.65c-.529.297-1.212-.153-1.1-.78l1.26-7.77-5.36-5.49c-.413-.435-.187-1.16.43-1.27l7.37-1.12 3.31-7.05c.12-.27.4-.4.68-.4z" fill="#ffc107"/></svg>
						<svg class="task-star-svg" id="regular" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m5.574 15.362-1.267 7.767c-.046.283.073.568.308.734.234.165.543.183.795.043l6.59-3.642 6.59 3.643c.114.062.239.093.363.093.152 0 .303-.046.432-.137.235-.166.354-.451.308-.734l-1.267-7.767 5.36-5.494c.196-.201.264-.496.175-.762-.089-.267-.32-.46-.598-.503l-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.278.043-.509.236-.598.503s-.022.561.174.762zm3.063-6.464c.247-.038.459-.196.565-.422l2.798-5.961 2.798 5.96c.106.226.318.385.565.422l6.331.967-4.605 4.72c-.167.17-.242.41-.204.645l1.08 6.617-5.602-3.096c-.113-.062-.238-.094-.363-.094s-.25.031-.363.094l-5.602 3.096 1.08-6.617c.038-.235-.037-.474-.204-.645l-4.605-4.72z" fill="#ffc107"/></svg>
						<svg class="task-star-svg" id="regular" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m5.574 15.362-1.267 7.767c-.046.283.073.568.308.734.234.165.543.183.795.043l6.59-3.642 6.59 3.643c.114.062.239.093.363.093.152 0 .303-.046.432-.137.235-.166.354-.451.308-.734l-1.267-7.767 5.36-5.494c.196-.201.264-.496.175-.762-.089-.267-.32-.46-.598-.503l-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.278.043-.509.236-.598.503s-.022.561.174.762zm3.063-6.464c.247-.038.459-.196.565-.422l2.798-5.961 2.798 5.96c.106.226.318.385.565.422l6.331.967-4.605 4.72c-.167.17-.242.41-.204.645l1.08 6.617-5.602-3.096c-.113-.062-.238-.094-.363-.094s-.25.031-.363.094l-5.602 3.096 1.08-6.617c.038-.235-.037-.474-.204-.645l-4.605-4.72z" fill="#ffc107"/></svg>
						<svg class="task-star-svg" id="regular" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m5.574 15.362-1.267 7.767c-.046.283.073.568.308.734.234.165.543.183.795.043l6.59-3.642 6.59 3.643c.114.062.239.093.363.093.152 0 .303-.046.432-.137.235-.166.354-.451.308-.734l-1.267-7.767 5.36-5.494c.196-.201.264-.496.175-.762-.089-.267-.32-.46-.598-.503l-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.278.043-.509.236-.598.503s-.022.561.174.762zm3.063-6.464c.247-.038.459-.196.565-.422l2.798-5.961 2.798 5.96c.106.226.318.385.565.422l6.331.967-4.605 4.72c-.167.17-.242.41-.204.645l1.08 6.617-5.602-3.096c-.113-.062-.238-.094-.363-.094s-.25.031-.363.094l-5.602 3.096 1.08-6.617c.038-.235-.037-.474-.204-.645l-4.605-4.72z" fill="#ffc107"/></svg>
						<svg class="task-star-svg" id="regular" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m5.574 15.362-1.267 7.767c-.046.283.073.568.308.734.234.165.543.183.795.043l6.59-3.642 6.59 3.643c.114.062.239.093.363.093.152 0 .303-.046.432-.137.235-.166.354-.451.308-.734l-1.267-7.767 5.36-5.494c.196-.201.264-.496.175-.762-.089-.267-.32-.46-.598-.503l-7.378-1.127-3.307-7.044c-.247-.526-1.11-.526-1.357 0l-3.306 7.044-7.378 1.127c-.278.043-.509.236-.598.503s-.022.561.174.762zm3.063-6.464c.247-.038.459-.196.565-.422l2.798-5.961 2.798 5.96c.106.226.318.385.565.422l6.331.967-4.605 4.72c-.167.17-.242.41-.204.645l1.08 6.617-5.602-3.096c-.113-.062-.238-.094-.363-.094s-.25.031-.363.094l-5.602 3.096 1.08-6.617c.038-.235-.037-.474-.204-.645l-4.605-4.72z" fill="#ffc107"/></svg>
		          	</div>
		          <%} %>
		          </div> 
		  <%}%>	
	  </div>
	</div>
	</div>
	
	<jsp:include page="../footer_container.jsp"></jsp:include>
	
	
	<script type="text/javascript">
	//게시물 디테일 페이지로 이동
	function postlink(m_id, b_num){
		location.href="BoardDetail.ak?b_num="+b_num+"&e_id="+m_id;
	}
	
	function deniedAlert() {
		Swal.fire({
		  title: 'We sent your Phone-number',
		  text: '곧 악어님에게 연락이 올 거예요.',
		  background: '#FFFFFB',
		  confirmButtonColor:'#37B04B',
		  showClass: {
		    popup: 'animate__animated animate__fadeInDown'
		  },
		  hideClass: {
		    popup: 'animate__animated animate__fadeOutUp'
		  }
		})
	}
	
	function yetAlert() {
		Swal.fire({
		  title: 'Do you want a Phone-number?',
		  text: '매칭 수락을 하시면 연락처가 공개됩니다.',
		  background: '#FFFFFB',
		  confirmButtonColor:'#37B04B',
		  showClass: {
		    popup: 'animate__animated animate__fadeInDown'
		  },
		  hideClass: {
		    popup: 'animate__animated animate__fadeOutUp'
		  }
		})
	}
	
	//프로필(마이페이지)로이동
	function profileLink(m_id) {
		location.href="profile.ak?id="+m_id;
	}
	</script>
</body>
	
</html>