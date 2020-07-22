<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	html,body{
		font-family: "NotoSansKR-Regular";
		height:100%;
		padding:0px;
		margin:0px;
	}
	.wrap {
		position: relative;
		min-height:100%;
	}
#upper{
    display: flex;
    flex-direction: row;
    justify-content: center;
    width: 100%;
    background-color: #89df8f;
    padding: 40px;
}
#highlight{
    border-bottom: solid #ffc720 10px;
}
#upper_1{
	position:relative;
	left:20px;
	font-size:30px;
	font-weight: bold;
}
.upper_2, #upper_3, #upper_4{
	margin:20px;
	font-size:18px; 
}
#upper_logo{
	width:240px; 
	height:50px;
}
#upper_pic{
	width:18%;
}
#neun{
	position: relative;
	bottom:20px;
}
#middle{
	padding:20px;
	font-size:30px;
	font-weight: bold;
}
#lower{
    display: flex;
    flex-direction: column;
    align-items: center;
}
.benefit{
	display:flex;
	flex-direction: row;
	justify-content: center;
	margin:10px;
}
.pic{
    width: 520px;
    margin-top:50px;
}
#pic_1{
}
.text{
	width:40%;
	padding:18px;
}
.lower_text{
	text-align: center;
	font-size: larger;
}
.lower_text h1{
	color: #37b04b;
}
#btn_goto{
	width:175px;
	height:50px;
}
#more{
	display: flex;
    flex-direction: column;
    align-items: center;
    padding-bottom: 300px;
}
.starR1{
    background: url('resources/image/star.png') no-repeat -52px 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR2{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0; 
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR1.on{background-position:0 0;}
.starR2.on{background-position:-15px 0;}
</style>
</head>
<body>
<div class="wrap">
<jsp:include page="../header_container.jsp">
	<jsp:param value="m_id" name="m_id"/>
</jsp:include> 
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script>
$(document).ready(function(){
	
$('.starRev span').click(function(){
	  $(this).parent().children('span').removeClass('on');
	  $(this).addClass('on').prevAll('span').addClass('on');
	  return false;
	});
})
</script>


<div class="wrap">
<section id="upper">
	<div>
		<div id="upper_1"> 바쁜데 직접 청소하세요? <br/> <span id="highlight">마이악어새</span>가 있는데!</div>
		<div class="upper_2"> <h3>마이악어새는 어떤 사이트인가요?</h3></div>
		<div class="upper_2"> 악어의 이빨을 청소하고 먹이를 얻으면서<br>  서로 이익을 얻는다는 악어와 악어새의 이야기처럼</div>
		<div><img src="resources/image/fullLogo_removebg.png" id="upper_logo"> <span id="neun">는</span> </div>
		<div id="upper_3"> 청소 도움이 필요한 고객은 청소근로자를,<br/> 일자리가 필요한 근로자는 일자리를<br/>  언제든지 쉽고 빠르게 찾을 수 있는 서비스를 제공합니다.</div>
	</div>
	<div id="upper_pic"> <img src="resources/image/clean_2.png"></div>
</section>

<section id="lower">
<div id="middle"> 타 청소업체와 뭐가 다른가요? </div>
<!-- <div class="starRev">
  <span class="starR1 on">별1_왼쪽</span>
  <span class="starR2">별1_오른쪽</span>
  <span class="starR1">별2_왼쪽</span>
  <span class="starR2">별2_오른쪽</span>
  <span class="starR1">별3_왼쪽</span>
  <span class="starR2">별3_오른쪽</span>
  <span class="starR1">별4_왼쪽</span>
  <span class="starR2">별4_오른쪽</span>
  <span class="starR1">별5_왼쪽</span>
  <span class="starR2">별5_오른쪽</span>
</div> -->
	<div class="benefit">
		<div><img class="pic" id="pic_1" src="resources/image/money.png"></div>
		<div class="text">
			<div class="lower_text"> <h1>01</h1> </div>
			<div class="lower_text"> <h2>업체수수료가 없어요</h2></div>
			<p> 청소근무자를 파견하면서 수수료를 받는 타업체와 달리 </p>
			<p>'마이악어새'는 고객과 근로자가 매칭을 원할 때만 소정의 정보료를 받고 서로 연락처를 오픈해드리는 구조로, 한번 매칭된 이후에는 수수료가 전혀 없어요. </p>
			<p> 한번 매칭이 된 근로자와 정기 근로계약을 맺을 경우에도 단 한번의 이용권만 이용하시면 됩니다.</p>
			<div class="lower_text"onclick="location.href='pay.ak'"> <h3>하트 구매하러 가기</h3> </div>
		</div>
	</div>
	
	<div class="benefit">
		<div class="text">
			<div class="lower_text"> <h1>02</h1> </div>
			<div class="lower_text"> <h2>쉽고 빠르게 구할 수 있어요</h2></div>
			
			<div class="lower_text" onclick="location.href='searchProcess.ak?b_address_road='"> <h3>마이악어새 이용하러가기</h3> </div>
		</div>
		<div><img class="pic" id="pic_2" src="resources/image/clean_3.png"> </div>
	</div>
	
	<div  class="benefit">
		<div class="pic"> </div>
		<div class="text">
			<div class="lower_text"> <h1>03</h1> </div>
			<div class="lower_text"> <h2>다양한 조건을 <br/>직접 선택할 수 있어요</h2></div>
			<div class="lower_text"> 마이악어새는 각자의 상황마다 다른 다양한 조건을 설정하여<br> 고객의 니즈에 맞는 근로자와 매칭될 수 있도록 연결해줍니다.</div>
			<div class="lower_text" onclick="location.href='searchProcess.ak?b_address_road='"> <h3>마이악어새 이용하러가기</h3> </div>
		</div>
	</div>
	
	<div class="benefit">
		<div></div>
	</div>
	
</section>
	<div id="more"> 
		<h3> 우리 사이트에 대해서 더 알고싶으시다면 </h3>
		<img src="resources/image/btn_goto.png" id="btn_goto" onclick="location.href='FAQList.ak'">
	</div>
</div>


<jsp:include page="../footer_container.jsp">
	<jsp:param value="" name=""/>
</jsp:include> 
</div>
</body>
</html>