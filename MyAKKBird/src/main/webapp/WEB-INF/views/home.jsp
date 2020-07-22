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
<link rel="stylesheet" type="text/css" href="fonts/font.css">
<style>
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
	/* ------------------------------------------------ */
	
	body, html{
		margin:0px;
		padding:0px;
	}
	
	.wrap {
		position: relative;
		min-height:100%;
	}
	
	#content_container{
	}
	/* ------------------------------------------------ */	 
	#header_container, #ad_container, #search_container, #review_container, #FAQ_container{
		text-align:center;
	}
	/* ------------------------------------------------ */
	#ad_container{
		height:470px;
			
	}
	/* ------------------------------------------------ */	
	#total_count{
		display:flex;
		justify-content:center;
		align-items:center;
		height:70px;
		background-color: #89df8f;
		color:white;
		font-size: 18px;
	}
	
	#total_count span{
		color: #37b04b;
	    font-weight: bold;
	    font-size: x-large;
	}
	
	/* ------------------------------------------------ */
	
	#search_container{
		
		height: 400px;
	}
	
	#search_area{
		display:flex;
		flex-direction: row;
		justify-content: center;
		padding: 60px 0 40px;
	}
	
	#search_area span{
		color: #37b04b;
		font-size: 50px;
		cursor:pointer;
	}
	
	#search_area input{
		text-align: center;
		height:50px;
		width:500px;
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
		margin:20px;
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
	
	#btn_container_review{
		width: 300px;
	    border: 1px solid green;
	    margin-bottom: 10px;
    }
	
	.chooseReview{
		padding: 0px 45px;
	}
	
	.reviews{
		border-spacing:5px;
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
		width:265px;
		padding:5px;
		background-color:white;
		border: solid #89df8f 5px;
		cursor:pointer;
	}
	
	.each_review table{
		position: relative;
		bottom:20px;
		left: 25px;
   		border-spacing: 5px;
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
	
	.review_star{
		width:100px;
	}
	
	.each_review div{
		width:100%;
		height:150px;
		padding: 5px 0;
		margin:0;
		background-color: #e6f7e4;
		display:block;
	  	overflow: hidden; 
	 	text-overflow: ellipsis;
	}
	
	.each_review .content{
		position:relative;
		width:252px;
	}
	
	#thumbnails{
		position:absolute;
		left:5px;
		bottom:0px;
		display:flex;
		flex-direction: row;
		height:60px;
	}
	
	#thumbnails img{
		width:50px;
		height:50px;
	}
	
	.each_pic{
		position:absolute;
		right:10px;
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
		display: flex;
	    flex-direction: column;
	    align-items: center;
	    padding-bottom: 300px;
	}
	
	#FAQ_container h3{
		position: relative;
		top:20px;
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
		margin:20px 40px 40px 40px;
		padding:20px;
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
		margin:20px;
		margin-bottom:30px;
		padding:10px;
		color:white;
		cursor:pointer;
	}
	
	/* ------------------------------------------------ */
	
	
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
	
	.closer_webchat_button {
	background-color: green;
	}
	
	/* ------------------------------------------------ */
	
	.modal {
	    display: none; /* Hidden by default */
	    position: fixed; /* Stay in place */
	    z-index: 1; /* Sit on top :  숫자가 클수록 상단에 위치 */
	    left: 0;
	    top: 0;
	    width: 100%; /* Full width */
	    height: 100%; /* Full height */
	    overflow: auto; /* Enable scroll if needed */
	    background-color: rgb(0,0,0); /* Fallback color */
	    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	}
	/* Modal Content/Box */
	.modal-content {
	    background-color: #fefefe;
	    margin: 15% auto; /* 15% from the top and centered */
	    padding: 20px;
	    border: 1px solid #888;
	    width: 50%; /* Could be more or less, depending on screen size */                          
	}
	/* The Close Button */
	.close {
	    color: #aaa;
	    float: right;
	    font-size: 28px;
	    font-weight: bold;
	}
	.close:hover,
	.close:focus {
	    color: black;
	    text-decoration: none;
    	cursor: pointer;
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
<div class="wrap">
<jsp:include page="./header_container.jsp">
	<jsp:param value="m_id" name="m_id"/>
</jsp:include> 
	
<div id="content_container">
<section id="ad_container">
	<div class="slideshow-container">
		<div class="mySlides fade" style="background-color: #FDFDFD;">
			<img src="resources/image/main_s1.png" width="1024" height="400px">
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
<% int totalBoardCount = ((Integer)request.getAttribute("totalBoardCount")).intValue(); %>
<section id="search_container">
	<div id="total_count"> 
	<% if (totalBoardCount != 0){ %>
		마이악어새 게시물  총&nbsp;&nbsp; <span> <%=totalBoardCount %> </span> &nbsp;건
	<% } %>
	</div>
	<form name="selectForm" action="searchProcess.ak" >
		<div id="search_area">
			<input type="text" name="b_address_road" placeholder="거주하는 동네를 입력해보세요!">
			<span class="material-icons" onclick="location.href='javascript:selectForm.submit()'">near_me</span>
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
<!-- 	<div id="btn_container_review">
		<span id="recentReviews" class="chooseReview">최신순</span>
		<span id="likeReviews" class="chooseReview">좋아요순</span>
	</div> -->
<% List<ReviewVO> reviewList = (List<ReviewVO>)request.getAttribute("reviewList"); %>
<% if (reviewList != null || reviewList.size() > 0){ %>
	<!-- 리뷰가 3개 이하 -->
	<% if (reviewList.size() <=3){ %>	 
	<table class="reviews">
		<tr>
			<%for (int i=0; i <reviewList.size(); i++){
				ReviewVO vo = (ReviewVO)reviewList.get(i); %>
				<td class="each_review" id="<%=vo.getR_num()%>" onclick="location.href='profile.ak?id=<%=vo.getR_id()%>'"> 
					<table>
						<tr>
							<td rowspan="3" class="each_review_img"><img src="/myakkbird/myakkbirdUpload/<%=vo.getM_photo()%>"></td>
							<td><%=vo.getR_id() %></td>
						</tr>
						<tr><td><%=vo.getR_star() %></td></tr> 
						<tr><td><%=vo.getR_date().substring(0,10) %></td></tr>
					</table>
					<div><%=vo.getR_content() %> </div>
				</td>
			<% } %>
		</tr>
	</table>
	
	<!-- 리뷰가 3개 이상 9개 이하 -->
	<% } else if(reviewList.size() <=9){ 	%>
	<div>
		<table class="reviews">
			<tr>
				<% for (int i=0; i<3; i++){
					ReviewVO vo = (ReviewVO)reviewList.get(i); %>
					<td class="each_review" id="<%=vo.getR_num()%>" onclick="location.href='profile.ak?id=<%=vo.getR_id()%>'"> 
						<img src="resources/image/new2.png" class="each_review_new">
						<table>
							<tr>
								<td rowspan="3" class="each_review_img" ><img src="/myakkbird/myakkbirdUpload/<%=vo.getM_photo()%>"></td>
								<td><%=vo.getR_id() %></td>
							</tr>
							<tr><td>		
							<% if (vo.getR_star() == 0.5){ %> 
							<img src="resources/image/star_0.5.png" class="review_star">
							<% } else if (vo.getR_star() == 1.0){%>
							<img src="resources/image/star_1.0.png" class="review_star">
							<% } else if (vo.getR_star() == 1.5){%>
							<img src="resources/image/star_1.5.png" class="review_star">
							<% } else if (vo.getR_star() == 2.0){%>
							<img src="resources/image/star_2.0.png" class="review_star">
							<% } else if (vo.getR_star() == 2.5){%>
							<img src="resources/image/star_2.5.png" class="review_star">
							<% } else if (vo.getR_star() == 3.0){%>
							<img src="resources/image/star_3.0.png" class="review_star">
							<% } else if (vo.getR_star() == 3.5){%>
							<img src="resources/image/star_3.5.png" class="review_star">
							<% } else if (vo.getR_star() == 4.0){%>
							<img src="resources/image/star_4.0.png" class="review_star">
							<% } else if (vo.getR_star() == 4.5){%>
							<img src="resources/image/star_4.5.png" class="review_star">
							<% } else {%>
							<img src="resources/image/star_5.0.png" class="review_star">
							<% } %>
							</td></tr>
							<tr><td><%=vo.getR_date().substring(0,10) %></td></tr>
						</table>
						<div class="content"><%=vo.getR_content() %> 
						<% if (vo.getR_up_file() != null){
							String[] files = vo.getR_up_file().split(","); %>
							<div id =thumbnails>
								<% for (String a : files){ %>
									<img src="/myakkbird/myakkbirdUpload/<%=a%>" class="each_pic">
								<% } %>
							</div>
						<% } %>
						</div>
					</td>
				<% } %>
			</tr>
		</table>
		 <table  class="reviews" id="story" style="display: none" >
			<tr>
				<% for (int i=3; i<6; i++){
					ReviewVO vo = (ReviewVO)reviewList.get(i); %>
					<td class="each_review" id="<%=vo.getR_num()%>" onclick="location.href='profile.ak?id=<%=vo.getR_id()%>'"> 
						<img src="resources/image/new2.png" class="each_review_new">
						<table>
							<tr>
								<td rowspan="3" class="each_review_img" ><img src="/myakkbird/myakkbirdUpload/<%=vo.getM_photo()%>"></td>
								<td><%=vo.getR_id() %></td>
							</tr>
							<tr><td>
							<% if (vo.getR_star() == 0.5){ %> 
							<img src="resources/image/star_0.5.png" class="review_star">
							<% } else if (vo.getR_star() == 1.0){%>
							<img src="resources/image/star_1.0.png" class="review_star">
							<% } else if (vo.getR_star() == 1.5){%>
							<img src="resources/image/star_1.5.png" class="review_star">
							<% } else if (vo.getR_star() == 2.0){%>
							<img src="resources/image/star_2.0.png" class="review_star">
							<% } else if (vo.getR_star() == 2.5){%>
							<img src="resources/image/star_2.5.png" class="review_star">
							<% } else if (vo.getR_star() == 3.0){%>
							<img src="resources/image/star_3.0.png" class="review_star">
							<% } else if (vo.getR_star() == 3.5){%>
							<img src="resources/image/star_3.5.png" class="review_star">
							<% } else if (vo.getR_star() == 4.0){%>
							<img src="resources/image/star_4.0.png" class="review_star">
							<% } else if (vo.getR_star() == 4.5){%>
							<img src="resources/image/star_4.5.png" class="review_star">
							<% } else {%>
							<img src="resources/image/star_5.0.png" class="review_star">
							<% } %>
							</td></tr>
							<tr><td><%=vo.getR_date().substring(0,10) %></td></tr>
						</table>
						<div class="content"><%=vo.getR_content() %> 
						<% if (vo.getR_up_file() != null){
							String[] files = vo.getR_up_file().split(","); %>
							<div id =thumbnails>
								<% for (String a : files){ %>
									<img src="/myakkbird/myakkbirdUpload/<%=a%>" class="each_pic">
								<% } %>
							</div>
						<% } %>
						</div>
					</td>
				<% } %>
			</tr>
			<tr>
				<% for(int i =6; i<reviewList.size(); i++){
					ReviewVO vo = (ReviewVO)reviewList.get(i);%>
					<td class="each_review" id="<%=vo.getR_num()%>" onclick="location.href='profile.ak?id=<%=vo.getR_id()%>'"> 
						<img src="resources/image/new2.png" class="each_review_new">
						<table>
							<tr>
								<td rowspan="3" class="each_review_img" ><img src="/myakkbird/myakkbirdUpload/<%=vo.getM_photo()%>"></td>
								<td><%=vo.getR_id() %></td>
							</tr>
							<tr><td>
							<% if (vo.getR_star() == 0.5){ %> 
							<img src="resources/image/star_0.5.png" class="review_star">
							<% } else if (vo.getR_star() == 1.0){%>
							<img src="resources/image/star_1.0.png" class="review_star">
							<% } else if (vo.getR_star() == 1.5){%>
							<img src="resources/image/star_1.5.png" class="review_star">
							<% } else if (vo.getR_star() == 2.0){%>
							<img src="resources/image/star_2.0.png" class="review_star">
							<% } else if (vo.getR_star() == 2.5){%>
							<img src="resources/image/star_2.5.png" class="review_star">
							<% } else if (vo.getR_star() == 3.0){%>
							<img src="resources/image/star_3.0.png" class="review_star">
							<% } else if (vo.getR_star() == 3.5){%>
							<img src="resources/image/star_3.5.png" class="review_star">
							<% } else if (vo.getR_star() == 4.0){%>
							<img src="resources/image/star_4.0.png" class="review_star">
							<% } else if (vo.getR_star() == 4.5){%>
							<img src="resources/image/star_4.5.png" class="review_star">
							<% } else {%>
							<img src="resources/image/star_5.0.png" class="review_star">
							<% } %>
							</td></tr>
							<tr><td><%=vo.getR_date().substring(0,10) %></td></tr>
						</table>
						<div class="content"><%=vo.getR_content() %> 
						<% if (vo.getR_up_file() != null){
							String[] files = vo.getR_up_file().split(","); %>
							<div id =thumbnails>
								<% for (String a : files){ %>
									<img src="/myakkbird/myakkbirdUpload/<%=a%>" class="each_pic">
								<% } %>
							</div>
						<% } %>
						</div>
					</td>
				<% } %>
			</tr>
			
		</table>
	</div>
	<div id="more" onclick="more()"> <img src="resources/image/btn_more.png"></div>
	 <% } 
	}else{ %>
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
</div> <!-- content_container -->
<jsp:include page="./footer_container.jsp">
	<jsp:param value="" name=""/>
</jsp:include> 
</div> <!-- div id="wrap" -->
</body>
<script id="embeddedChatbot" data-botId="B1ezy3" src="https://www.closer.ai/js/webchat.min.js"></script>
</html>