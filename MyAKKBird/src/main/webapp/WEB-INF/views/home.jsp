<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="com.bit.myakkbird.*" %>
<%@ page import="com.bit.myakkbird.review.*" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://kit.fontawesome.com/535c824fa5.js" crossorigin="anonymous"></script>
<style>

	body{
		padding:0px;
		margin:0px;
	}
	
	#header_container, #ad_container, #search_container, #review_container, #FAQ_container{
		text-align:center;
	}
	
	#menu_container{
		
	}
	/* ------------------------------------------------ */
	
	#header_container{
		display:flex;
		flex-direction:row;
		justify-content:space-between;
		width:100%;
		height:80px;
		background-color:white;
	}
	
	#header_container > div{
		display:flex;
		flex-direction:row;
		justify-content: space-around;
	}
	
	#main_logo{
		width: 360px;
		cursor:pointer;
	}
	
	.btn_header{
		width:100px;
		height:50px;
		padding-top:15px;
		border-radius: 10px;
		color:white;
		cursor:pointer;
	} 
	
	/* ------------------------------------------------ */
	
	#ad_container{
		height:470px;
		padding-top:80px;
			
	}
	
	/* ------------------------------------------------ */
	
	#search_container{
		
		height: 400px;
	}
	
	#search_area{
		display:flex;
		flex-direction: row;
		justify-content: center;
		padding: 80px 0 40px;
	}
	
	#search_area span{
		color: #37b04b;
		font-size: 50px;
	}
	
	#search_area input{
		text-align: center;
		height:50px;
		width:400px;
		border: solid 3px #37b04b;
		border-radius: 4px; 
		line-height: 70px;
		
	}
	
	#hotplace{
		font-size:18px;
		font-weight:bold;
		margin:10px 0 10px 0;
		padding: 10px; 
	}
	
	#search_category{
		display:flex;
		flex-direction: row;
		justify-content:center;
	}
	
	.btn_category{
		width:60px;
		height:80px;
		margin:10px;
		padding:13px 5px 5px 5px;
		border-radius:20px;
		cursor: pointer;
	}
	
	.btn_category img{
		width:50px;
		height:50px;
	}
	
	#search_category >div > span{
		color: #37b04b;
		size:20px;
	}
	
	/* ------------------------------------------------ */
	
	#review_container{
		background-color: #89df8f;
		display:flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}
	
	#review_container > img{
		width:400px;
		height:130px;
	}
	
	#total_count{
		display:flex;
		justify-content:center;
		align-items:center;
		height:70px;
		background-color: #89df8f;
		color:white;
		font-size: 18px;
	}
	
	#more img{
		margin-top:10px;
		width:400px;
		height:50px;
		cursor:pointer;
	}
	
	#org_reviews{
		display:flex;
		flex-direction:column;
		justify-content: center;
		padding:20px 0;
	}
	
	.each_review{
		width: 220px;
		height:250px;
		padding:5px;
		background-color:white;
		border: solid #89df8f 1px;
	}
	
	.each_review table{
		position: relative;
		bottom:20px;
		left:5px;
	}
	
	.each_review_img img {
		width:70px;
		height:70px;
		border-radius:70px;
	}
	
	.each_review_new{
		position:relative;
		bottom:2px;
		left:110px;
		width:40px;
		height:40px;
	}
	
	.each_review div{
		width:255px;
		height:150px;
		padding: 5px 0;
		margin:0;
		background-color: #e6f7e4;
		display:block;
	  	overflow: hidden; 
	 	text-overflow: ellipsis;
	}
	
	#more_reviews{
		position:relative;
		background-color:#37b04b;
		width:100%;
		height:20px;
	}
	
	.reviews{
		width:800px;
	}
	
	#fold_reviews{
		position:absolute;
		bottom:0;
		background-color:#37b04b;
		width:100%;
		height:20px;
	}
	
	/* ------------------------------------------------ */
	
	#FAQ_container{
		display:flex;
		flex-direction:column;
		align-items: center;
	}
	
	#FAQ_category{
		display:flex;
		flex-direction: row;
		justify-content: center;
		height:250px;
	}
	
	#btn_goto{
		width:175px;
		height:50px;
		margin-bottom: 40px;
	}
	
	.each_FAQ{
		display:flex;
		flex-direction:column;
		align-items:center;
		width:120px;
		margin:30px;
		padding:10px;
		cursor: pointer;
	}
		
	.each_FAQ img{
		width:100px;
		height:100px;
	}
	
	#btn_FAQ{
		width:100px;
		height:25px;
		background-color: #37b04b;
		border-radius: 10px;
		margin:5px;
		margin-bottom:30px;
		padding:10px;
		color:white;
		cursor:pointer;
	}
	
	/* ------------------------------------------------ */
	
	#footer_container{
		height:300px;
		background-color: #d4d4d4;
	}
	
	#footer_logos{
		margin:2px; 
		padding:5px; 
	}
	 
	#footer_logos i{
		font-size:40px;
	}
	
	#footer_akkbird{
		width:250px;
	}
	
	.sns{
		width:40px;
		height:40px;
		border-radius: 40px; 
	}
	
	#footer_info{
		display:flex;
		flex-direction: row;
		justify-content: center;
		padding:10px;
		
	}
	
	#footer_info > div{
		margin:10px; 
		padding:10px; 
		color:#595959;
	}
	
	/* background-image{
		background-repeat: no-repeat;
		background-size: 1080px 400px;
		background-position: center;
		background-color: #FDFDFD;
	} */
	
	/* The dots */
	.dot {height: 15px; width: 15px; margin: 0px 0px 2px 2px;
	  background-color: #89df8f; border-radius: 50%; display: inline-block;
	  transition: background-color 0.6s ease;}/*  ease말고도 많음(linear..) */
	.active {  background-color: #37b04b;}
	
	/* Fading animation 해당브라우저 타입 (엔진 종류)명시해주는게 앞2개, 뒤2개는 표준 */
	.fade { -webkit-animation-name: fade;  -webkit-animation-duration: 2s;
	  		animation-name: fade;  animation-duration: 2s;}
	  		
	/*  CSS animation -> w3schools.com/ 에서 확인 */
	@-webkit-keyframes fade { from {opacity: .4} to {opacity: 1}} /* 투명도를 .4에서 1로 조절 */
	@keyframes fade { from {opacity: .4} to {opacity: 1}}
	/* 모바일 화면 글자 크기 조정 */
	@media only screen and (max-width: 200px) { .text {font-size: 11px}}

</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	function more(){
		 if(story.style.display =='none'){
			 story.style.display ='';
			 document.getElementById('more').innerHTML ='<img src="resources/image/btn_fold.png">'
		 }else{
			 story.style.display='none';
			 document.getElementById('more').innerHTML='<img src="resources/image/btn_more.png">'
		 }
	}
	
	$(document).ready(function(){
		var slideIndex = 0;
		showSlides();
		
		function showSlides() {
		  var i;
		  var slides = document.getElementsByClassName("mySlides");
		  var dots = document.getElementsByClassName("dot");
		  for (i = 0; i < slides.length; i++) {
		    slides[i].style.display = "none";
		  }
		  slideIndex++;
		  if (slideIndex > slides.length) {
			  slideIndex = 1;
			  }
		  for (i = 0; i < dots.length; i++) {
		    dots[i].className = dots[i].className.replace(" active", "");
		  }
		  
		  // 화면에 보여줄 대상 선택
		  slides[slideIndex - 1].style.display = "block";
		  dots[slideIndex - 1].className += " active";
		  setTimeout(showSlides, 2000); // setInterval 사용해도 가능
		}
	})
</script>

</head>

<body>
	<!-- 호준님 -->
	<!-- 
	<div id="header_container">
		<img src="resources/image/fullLogo.png" class="logo">
		<div class="header_empty"></div>	
		<div class="header_member_img">프로필<br><span class="material-icons">
		done_outline
		</span> </div>
		<c:if test="${login.m_id == null}">
			<ul class="header_btn">
				<li><a href="joinselect.ak" id="header_btn_1">회원가입</a></li>
				<li><a href="loginform.ak" id="header_btn_2">로그인 </a></li>
			</ul>
		</c:if>

		<c:if test="${login.m_id != null}">
			<div>${login.m_id }님 환영합니다.</div>
			<ul class="header_btn">
				<li><a href="mypage_menu.ak?id=${login.m_id }" id="header_btn_1">마이페이지</a></li>
				<li><a href="logOut.ak" id="header_btn_2">로그아웃 </a></li>
			</ul>
		</c:if>
	</div> -->
	<!-- 호준님 -->
	
	<!-- 지연님 -->
	<jsp:include page="./header_container.jsp">
		<jsp:param value="m_id" name="m_id"/>
	</jsp:include> 
	<!-- 지연님 -->
	
	<!-- 지연님 -->
	<%--  <section id="header_container">
	<img src="resources/image/fullLogo.png" id="main_logo">
	
	<c:if test="${m_id == null}">
		<div>
			<!-- <div class="btn_header" onclick="location.href='loginform.ak'">로그인</div>
			<div class="btn_header" onclick="location.href='joinselect.ak'">회원가입</div> -->
			<img src="resources/image/btn_login.png" class="btn_header" onclick="location.href='loginform.ak'">
			<img src="resources/image/btn_join.png" class="btn_header" onclick="location.href='joinselect.ak'">
		</div>
	</c:if>
	<c:if test="${m_id != null}">
		<div>
			<div class="btn_header" onclick="location.href='mypage_menu.ak?id=${m_id}'">마이페이지</div>
			<div class="btn_header" onclick="location.href='logOut.ak'">로그아웃</div>
			<img src="resources/image/btn_mypage.png" class="btn_header" onclick="location.href='mypage_menu.ak?id=${m_id}'">
			<img src="resources/image/btn_logout.png" class="btn_header" onclick="location.href='logOut.ak'">
			
		</div>
	</c:if>
	</section>  --%>
	<!-- 지연님 -->


<section id="ad_container">
	<div class="slideshow-container">
		<div class="mySlides fade" style="background-color: #FDFDFD;">
			<img src="resources/image/main_s1.png" width="1080px" height="400px">
		</div>
		
<!--  		<div class="mySlides fade" style="background-color: #e4fffd">
			<img src="resources/image/main_s2.png" width="1080px" height="400px">
		</div>
		
		<div class="mySlides fade">
			<div class="numbertext">3 / 4</div>
			<img src="./images/jeju3.jpg" width="400px" height="300px">
			<div class="text">제주 3</div>
		</div>
		
		<div class="mySlides fade">
			<div class="numbertext">4 / 4</div>
			<img src="./images/jeju4.jpg" width="400px" height="300px">
			<div class="text">제주 4</div>
		</div> 
	</div> -->
	<br>
	<div style="text-align:center">
		<span class="dot"></span>
		<span class="dot"></span>
		<span class="dot"></span>
		<span class="dot"></span>
	</div>
</section>

<script>
$(document).ready(function(){
	$('.btn_category').hover(function(){
		$(this).css('border','3px solid #89df8f');
	}, function(){
		$(this).css('border','none');
	});
})
</script>

<section id="search_container">
	<div id="total_count"> 
		실시간 마이악어새 총 게시물 <h3>' n '</h3>건
	</div>
	<form name="selectForm" action="searchProcess.ak" >
		<div id="search_area">
			<span class="material-icons">near_me</span>
			<input type="text" name="b_address_road" placeholder="거주하는 동네를 입력해보세요!">
		</div>
		<span id="hotplace">핫한 지역 바로가기</span>
		<div id="search_category">
			<div class="btn_category" onclick="location.href='searchProcess.ak?b_address_road=역삼'">
				<img src="resources/image/clean1.png"> 역삼
			</div>
			<div class="btn_category" onclick="location.href='searchProcess.ak?b_address_road=서초'">
				<img src="resources/image/clean6.png"> 서초
			</div>
			<div class="btn_category" onclick="location.href='searchProcess.ak?b_address_road=압구정'">
				<img src="resources/image/clean3.png"> 압구정
			</div>
			<div class="btn_category" onclick="location.href='searchProcess.ak?b_address_road=논현'">
				<img src="resources/image/clean4.png"> 논현
			</div>
			<div class="btn_category" onclick="location.href='searchProcess.ak?b_address_road=삼성'">
				<img src="resources/image/clean5.png"> 삼성
			</div>
		</div>
	</form>
</section>

<section id="review_container">
	<img src="resources/image/main_review_title.gif">
<% List<ReviewVO> reviewList = (List<ReviewVO>)request.getAttribute("reviewList");
if (reviewList != null){ %>
<% if (reviewList.size() <=3){ %>
	<table class="reviews">
		<tr>
			<%for (int i=0; i <reviewList.size(); i++){
				ReviewVO vo = (ReviewVO)reviewList.get(i); %>
				<td class="each_review"> 
					<table>
						<tr>
							<td rowspan="3" class="each_review_img"><img src="/myakkbird/myakkbirdUpload/<%=vo.getM_photo()%>"></td>
							<td><%=vo.getR_id() %></td>
						</tr>
						<tr><td><%=vo.getR_star() %></td></tr>
						<tr><td><%=vo.getR_date() %></td></tr>
					</table>
					<div><%=vo.getR_content() %> </div>
				</td>
			<% } %>
		</tr>
	</table>
	
	<%} else if(reviewList.size() <=5){ %>
	<div>
		<table class="reviews">
			<tr>
			<%for (int i=0; i<3; i++){
				ReviewVO vo = (ReviewVO)reviewList.get(i); %>
				<td class="each_review"> 
					<table>
						<tr>
							<td rowspan="3" class="each_review_img"><img src="/myakkbird/myakkbirdUpload/<%=vo.getM_photo()%>"></td>
							<td><%=vo.getR_id() %></td>
						</tr>
						<tr><td><%=vo.getR_star() %></td></tr>
						<tr><td><%=vo.getR_date() %></td></tr>
					</table>
					<div><%=vo.getR_content() %> </div>
				</td>
			</tr>
		</table>
		<div id="story" class="reviews"style="display: none">
			<table>
				<tr>
				<% } for (int i=3; i<reviewList.size(); i++){
					ReviewVO vo = (ReviewVO)reviewList.get(i); %>
						<td class="each_review"> 
							<table>
								<tr>
									<td rowspan="3" class="each_review_img"><img src="/myakkbird/myakkbirdUpload/<%=vo.getM_photo()%>"></td>
									<td><%=vo.getR_id() %></td>
								</tr>
								<tr><td><%=vo.getR_star() %></td></tr>
								<tr><td><%=vo.getR_date() %></td></tr>
							</table>
							<div><%=vo.getR_content() %> </div>
						</td>
				<% } %>
				</tr>
			</table>
		</div>
	</div>
	<div id="more" style="CURSOR: hand" onclick="more()"> <img src="resources/image/btn_more.png"></div>
	
	
	
	
	<% } else if(reviewList.size() <=9){ 
	%>

	<div>
		<table class="reviews">
			<tr>
				<% for (int i=0; i<3; i++){
					ReviewVO vo = (ReviewVO)reviewList.get(i); %>
					<td class="each_review"> 
						<img src="resources/image/new2.png" class="each_review_new">
						<table>
							<tr>
								<td rowspan="3" class="each_review_img" ><img src="/myakkbird/myakkbirdUpload/<%=vo.getM_photo()%>"></td>
								<td><%=vo.getR_id() %></td>
							</tr>
							<tr><td><%=vo.getR_star() %></td></tr>
							<tr><td><%=vo.getR_date() %></td></tr>
						</table>
						<div><%=vo.getR_content() %> </div>
					</td>
				<% } %>
			</tr>
		</table>
		 <table  class="reviews" id="story" style="display: none" >
			<tr>
				<% for (int i=3; i<6; i++){
					ReviewVO vo = (ReviewVO)reviewList.get(i); %>
					<td class="each_review"> 
					<img src="resources/image/new2.png" class="each_review_new">
						<table>
							<tr>
								<td rowspan="3" class="each_review_img"><img src="/myakkbird/myakkbirdUpload/<%=vo.getM_photo()%>"></td>
								<td><%=vo.getR_id() %></td>
							</tr>
							<tr><td><%=vo.getR_star() %></td></tr>
							<tr><td><%=vo.getR_date() %></td></tr>
						</table>
						<div><%=vo.getR_content() %> </div>
					</td>
				<% } %>
			</tr>
			<tr>
				<% for(int i =6; i<reviewList.size(); i++){
					ReviewVO vo = (ReviewVO)reviewList.get(i);%>
					<td class="each_review"> 
					<img src="resources/image/new2.png" class="each_review_new">
						<table>
							<tr>
								<td rowspan="3" class="each_review_img"><img src="/myakkbird/myakkbirdUpload/<%=vo.getM_photo()%>"></td>
								<td><%=vo.getR_id() %></td>
							</tr>
							<tr><td><%=vo.getR_star() %></td></tr>
							<tr><td><%=vo.getR_date() %></td></tr>
						</table>
						<div><%=vo.getR_content() %> </div>
					</td>
				<% } %>
			</tr>
			
		</table>
	</div>
	<div id="more" style="CURSOR: hand" onclick="more()"> <img src="resources/image/btn_more.png"></div>
	 <% } 
	}else{%>
	<div>리뷰가 없습니다. 리뷰를 작성해주세요!</div>
	<% } %>
<script>
	
	function b(){
		alert('h2');
	}
</script>


	
	<div>&nbsp;</div>
</section>

<section id="FAQ_container">
	<h3>우리 사이트가 궁금하신가요?</h3>
	<div id="FAQ_category">
		<div class="each_FAQ" onclick="b()">
			<img src="resources/image/dependable.png">
			<h4>믿을 수 있나요?</h4>
		</div>
		<div class="each_FAQ" onclick="b()">
			<img src="resources/image/target.png">
			<h4>매칭은 <br>어떻게 되나요?</h4>
		</div>
		<div class="each_FAQ" onclick="b()">
			<img src="resources/image/donation.png">
			<h4>이용권이 <br> 궁금해요!</h4>
		</div>
	</div>
	<img src="resources/image/btn_goto.png" id="btn_goto">
	
</section>

<section id="footer_container">
	<div id="footer_info">
		<div>
		(주)마이악어새 <br/>
			<div id="footer_logos">
				<i class="fab fa-facebook-square" class="sns"></i>
				<i class="fab fa-twitter-square"></i>
				<i class="fab fa-instagram-square"></i>
			</div>
		서울 서초구 강남대로 459 백암빌딩 구관 (우)06611 <br/>
		지번 : 서초동 1303-34 <br/>
		<img src="resources/image/fullLogo_removebg.png" id="footer_akkbird">
		</div>
		
		<div>
		이용문의 > <br/>
		평일 9:30 ~ 18:10 <br/>
		(점심시간 13:00 ~ 14:00 제외, 주말/공휴일 제외) <br/><br/>
		
		제휴관련 문의 > <br/>
		Email : abcd1234@myakkbird.bit <br/>
		Tel : 1588 -1588 <br/>
		Fax : 02 - 1234 -5678 <br/>
		</div>
	</div>
</section>

</body>
<script id="embeddedChatbot" data-botId="B1ezy3" src="https://www.closer.ai/js/webchat.min.js"></script>
</html>
