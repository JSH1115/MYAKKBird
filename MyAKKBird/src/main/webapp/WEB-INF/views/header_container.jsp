<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<style>
	@font-face{font-family: "NotoSansKR-Bold";src:url('fonts/NotoSansKR-Bold.otf');}
	@font-face{font-family: "NotoSansKR-Thin";src:url('fonts/NotoSansKR-Thin.otf');}
	@font-face{font-family: "NotoSansKR-Black";src:url('fonts/NotoSansKR-Black.otf');}
	@font-face{font-family: "NotoSansKR-Light";src:url('fonts/NotoSansKR-Light.otf');}
	@font-face{font-family: "NotoSansKR-Medium";src:url('fonts/NotoSansKR-Medium.otf');}
	@font-face{font-family: "NotoSansKR-Regular";src:url('fonts/NotoSansKR-Regular.otf');}
	
	body{
		font-family: "NotoSansKR-Medium", serif;
	}
	
	#header_container{
		margin: 0 auto;
		height: 93px;
	}
	.header_sround{
   	 	height: 64px;
    	background-color: #fff1d670;
	}
	#main_logo{
	    position: absolute;
	    left: 50%;
	    top: -30px;
	    margin-left: -93px;
	    z-index: 1000;
	}
	#header_line{
		background-color: #37b04b;
		height: 28px;
	}
	#main_text{
		position: absolute;
    	float: left;
    	left: 25%;
    	font-family: Noto Sans KR,sans-serif!important; 
    	font-size: 20px;
    	font-weight: 400;
    	margin-top: 16px;
	}
	#main_button_mypage{
		position: absolute;
		font-family: Noto Sans KR,sans-serif!important; 
		right: 25%;
		font-size: 16px;
    	font-weight: 400;
    	margin-top: 16px;
	}
	.header_guide2_svg{
		width: 30px;
		height: 30px;
		margin-left: 25px;
	}
	.btn_header1{
		border: 1px solid #37b04b;
	    height: 38px;
	    min-width: 90px;
	    border-radius: 19px;
	    color:white;
	    background-color: #37b04b;
	    text-align: center;
	}
	.btn_header2{
		margin-left: 10px;
		border: 1px solid #37b04b;
	    height: 38px;
	    min-width: 90px;
	    border-radius: 19px;
	    background-color: white;
	    text-align: center;
	    color: #37b04b;
	}
	.btn_header1:hover{
		color: white;
    	background-color: #37b04b4d;
    	border: 1px solid #37b04b4d;
	}
	.btn_header2:hover{
		color: white;
    	background-color: #37b04b4d;
    	border: 1px solid #37b04b4d;
	}
</style>


<section id="header_container"><!-- header -->
	<div id="header_line"></div>
	<div id="header" class="header_sround">
		<div id="main_logo" onclick="location.href='home.ak'">
			<img class="main_logo_img" src="resources/image/akklogo_main.png" width="200" height="187">
		</div>
		
		<div id="main_text">
			
			<svg  class="header_guide1_svg" id="Capa_1" enable-background="new 0 0 512 512" height="30px" viewBox="0 0 512 512" width="30px" xmlns="http://www.w3.org/2000/svg"><g><g><path d="m433.8 326.97-32.25-5.16h-159.1l-32.25 5.16c-39.29 6.29-68.2 40.19-68.2 79.98v95.05h360v-95.05c0-39.79-28.91-73.69-68.2-79.98z" fill="#a7e8a6"/><path d="m472 133.54v11.46c-33.842 0-261.842 0-300 0v-11.46c0-18.52 15.02-33.54 33.54-33.54h232.92c18.52 0 33.54 15.02 33.54 33.54z" fill="#918787"/><path d="m412 100h-180c0-49.71 40.29-90 90-90s90 40.29 90 90z" fill="#a7e8a6"/><path d="m412 196v-51h-180v51c0 39.19 25.04 72.53 60 84.88v33l-49.55 7.93 79.55 106.07 79.55-106.07-49.55-7.93v-33c34.96-12.35 60-45.69 60-84.88z" fill="#ffcebf"/><path d="m292 436h61v66h-61z" fill="#eefaff"/><path d="m190 262-150 60v-120z" fill="#ff9171"/></g><g><path d="m435.38 317.096c-14.337-2.294-59.157-9.467-73.38-11.743v-17.685c36.163-15.78 60-51.752 60-91.667v-41h50c5.522 0 10-4.478 10-10v-11.46c0-24.009-19.532-43.541-43.54-43.541h-16.958c-5.034-50.463-47.736-90-99.502-90s-94.468 39.537-99.501 90h-16.959c-24.008 0-43.54 19.532-43.54 43.54v11.46c0 5.522 4.477 10 10 10h50v41c0 39.917 23.839 75.89 60 91.668v17.685c-15.31 2.45-57.975 9.278-73.38 11.743-44.075 7.056-76.62 45.115-76.62 89.854v95.05c0 5.522 4.477 10 10 10h360c5.522 0 10-4.478 10-10v-95.05c0-44.636-32.442-82.782-76.62-89.854zm-113.38-297.096c40.724 0 74.413 30.594 79.353 70h-158.706c4.94-39.406 38.629-70 79.353-70zm-80 176v-41h36.001c5.522 0 10-4.478 10-10s-4.478-10-10-10c-10.308 0-83.83 0-96.001 0v-1.46c0-12.98 10.56-23.54 23.54-23.54h232.92c12.98 0 23.54 10.56 23.54 23.54v1.46c-9.646 0-83.472 0-93.999 0-5.522 0-10 4.478-10 10s4.478 10 10 10h33.999v41c0 43.716-35.387 80-80 80-44.61 0-80-36.281-80-80zm51.58 127.754c4.852-.776 8.42-4.961 8.42-9.874v-19.896c6.544 1.329 13.229 2.016 20 2.016s13.457-.687 20-2.016v19.896c0 4.913 3.568 9.098 8.42 9.874l33.189 5.311-61.609 82.148-61.609-82.148zm49.42 168.246h-41v-46h41zm-191-85.05c0-35.077 25.142-64.561 59.78-70.106l26.29-4.207 70.02 93.363h-16.09c-5.522 0-10 4.478-10 10v56h-70v-56c0-5.522-4.477-10-10-10s-10 4.478-10 10v56h-40zm340 85.05h-40v-56c0-5.522-4.478-10-10-10s-10 4.478-10 10v56h-69v-56c0-5.522-4.478-10-10-10h-17.09l70.02-93.363 26.289 4.207c34.639 5.546 59.781 35.029 59.781 70.106z"/><path d="m356.627 216.005c2.765-4.781 1.129-10.898-3.652-13.662-4.781-2.765-10.898-1.129-13.662 3.652-3.568 6.171-10.202 10.005-17.313 10.005s-13.745-3.834-17.313-10.005c-2.763-4.779-8.878-6.418-13.662-3.652-4.781 2.764-6.417 8.881-3.652 13.662 7.13 12.333 20.398 19.995 34.627 19.995s27.497-7.662 34.627-19.995z"/><path d="m10 492c-5.523 0-10 4.478-10 10s4.477 10 10 10h60c5.523 0 10-4.478 10-10s-4.477-10-10-10h-20v-163.229l143.714-57.486c3.797-1.519 6.286-5.196 6.286-9.285s-2.489-7.767-6.286-9.285l-143.714-57.486v-53.229c0-5.522-4.477-10-10-10s-10 4.478-10 10v350zm153.074-230-113.074 45.229v-90.458z"/><circle cx="323" cy="145" r="10"/></g></g></svg>
			<span class="header_guide1" onclick="location.href='guide.ak'"> 처음오셨나요?</span>
			<svg  class="header_guide2_svg"version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve"> <path style="fill:#37b04b;" d="M448,502L448,502c-18.778,0-34-15.222-34-34V96.257h68V468C482,486.778,466.778,502,448,502z"/> <path style="fill:#89df8f;" d="M448,502c-18.778,0-34-15.222-34-34V256.76V96.257H30V468c0,18.778,15.222,34,34,34H448L448,502 L448,502z"/><g> <circle style="fill:#FF5D5D;" cx="142" cy="180.26" r="28"/> <circle style="fill:#FF5D5D;" cx="302" cy="180.26" r="28"/> <path style="fill:#FF5D5D;" d="M268.283,248c-18.23,0-34.67,7.855-46.283,20.443C210.387,255.855,193.947,248,175.717,248 c-35.187,0-63.712,29.258-63.712,65.349C112.005,363.904,222,448,222,448s109.995-84.096,109.995-134.651 C331.995,277.258,303.47,248,268.283,248z"/> </g> <path d="M30,326.03c2.63,0,5.21-1.07,7.069-2.93c1.86-1.86,2.931-4.44,2.931-7.07s-1.07-5.21-2.931-7.07 c-1.859-1.86-4.439-2.93-7.069-2.93s-5.21,1.07-7.07,2.93S20,313.4,20,316.03s1.069,5.21,2.93,7.07 C24.79,324.96,27.37,326.03,30,326.03z"/> <path d="M268.283,238c-16.858,0-33.256,6-46.283,16.718C208.973,244,192.575,238,175.717,238c-40.645,0-73.712,33.801-73.712,75.349 c0,23.726,19.496,55.141,57.946,93.375c27.643,27.486,54.831,48.346,55.976,49.221c1.792,1.371,3.933,2.056,6.073,2.056 s4.281-0.685,6.073-2.056c1.145-0.875,28.333-21.735,55.976-49.221c38.45-38.233,57.946-69.649,57.946-93.375 C341.995,271.801,308.928,238,268.283,238z M270.088,392.4c-19.163,19.071-38.55,35.186-48.089,42.857 c-9.508-7.644-28.801-23.68-47.945-42.716c-33.564-33.375-52.049-61.499-52.049-79.192c0-30.52,24.095-55.349,53.712-55.349 c14.859,0,28.687,6.117,38.934,17.224c1.893,2.052,4.558,3.219,7.35,3.219s5.457-1.167,7.35-3.219 C239.597,264.117,253.424,258,268.283,258c29.617,0,53.712,24.83,53.712,55.349C321.995,331.016,303.561,359.09,270.088,392.4z"/> <path d="M482,86.257h-68h-34.084C377.946,38.36,338.372,0,290,0c-5.522,0-10,4.477-10,10s4.478,10,10,10 c37.342,0,67.946,29.393,69.897,66.257h-47.981C309.946,38.36,270.372,0,222,0s-87.946,38.36-89.916,86.257H30 c-5.522,0-10,4.477-10,10V271c0,5.523,4.478,10,10,10s10-4.477,10-10V106.257h92v37.345c-16.116,4.402-28,19.163-28,36.655 c0,20.953,17.047,38,38,38s38-17.047,38-38c0-17.492-11.884-32.253-28-36.655v-37.345h140v37.345c-16.116,4.402-28,19.163-28,36.655 c0,20.953,17.047,38,38,38s38-17.047,38-38c0-17.492-11.884-32.253-28-36.655v-37.345h92V256.76v195.178h-46 c-5.522,0-10,4.477-10,10s4.478,10,10,10h46.186c0.655,7.355,3.127,14.191,6.965,20.063H64c-13.233,0-24-10.767-24-24V358.5 c0-5.523-4.478-10-10-10s-10,4.477-10,10V468c0,24.262,19.738,44,44,44h384c24.262,0,44-19.738,44-44V96.257 C492,90.734,487.522,86.257,482,86.257z M160,180.257c0,9.925-8.075,18-18,18s-18-8.075-18-18c0-6.227,3.18-11.723,8-14.956v7.956 c0,5.523,4.478,10,10,10s10-4.477,10-10v-7.956C156.82,168.534,160,174.03,160,180.257z M320,180.257c0,9.925-8.075,18-18,18 s-18-8.075-18-18c0-6.227,3.18-11.723,8-14.956v7.956c0,5.523,4.478,10,10,10s10-4.477,10-10v-7.956 C316.82,168.534,320,174.03,320,180.257z M222,20c37.342,0,67.946,29.393,69.897,66.257H152.103C154.054,49.393,184.658,20,222,20z M472,468c0,13.234-10.767,24-24,24s-24-10.766-24-24V256.76V106.257h48V468z"/> <path d="M315.26,454.87c-1.86,1.86-2.93,4.44-2.93,7.07s1.069,5.21,2.93,7.07c1.87,1.86,4.44,2.93,7.07,2.93s5.21-1.07,7.069-2.93 c1.87-1.86,2.931-4.44,2.931-7.07c0-2.64-1.061-5.21-2.931-7.07c-1.859-1.86-4.43-2.93-7.069-2.93 C319.7,451.94,317.12,453.01,315.26,454.87z"/><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g><g></g></svg>
			<c:if test="${login.m_id == null}">
			<span class="header_guide2" onclick="location.href='loginform.ak'"> 하트구매 </span>
			</c:if>
			<c:if test="${login.m_id != null}">
			<span class="header_guide2" onclick="location.href='pay.ak'"> 하트구매 </span>
			</c:if>
		</div>
		
		<c:if test="${login.m_id == null}">
		<div id="main_button_mypage">
			<button class="btn_header1" onclick="location.href='loginform.ak'">로그인</button>
			<button class="btn_header2" onclick="location.href='joinselect.ak'">회원가입</button>
		</div>
		</c:if>
		
		<c:if test="${login.m_id != null}">
		<div id="main_button_mypage">
			<button class="btn_header1" onclick="location.href='profile.ak?id=${login.m_id }'">${login.m_id}</button>
			<button class="btn_header2" onclick="location.href='logOut.ak'">로그아웃</button>
		</div>
		</c:if>
		
	</div>
</section><!-- header -->