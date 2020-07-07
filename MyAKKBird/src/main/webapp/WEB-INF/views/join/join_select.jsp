<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
	<style>
	body {margin:0;padding:0;}
#webView {overflow:hidden;position:relative;background:#FFFFFF;width:1200px;margin:0 auto;-webkit-transform:translate3d(0,0,0);transform:translate3d(0,0,0)}
#webView[data-show-memo='true'] {overflow:visible}
	a {
		text-decoration:none;
		color:black;
	}
	#logo{
		height:100px;
		float:right;
	}
	</style>
</head>
<body>
<div id="webView">
<!-- 사이트이미지 -->
<header style="height:100px;display: flex;">
<div style="text-align:left;flex: 1;">
<img id="logo" src="./resources/image/crocodile_logo.png"></div>

<!-- 사이트이름 -->
<div style="text-align:center;flex: 5;">
<h1 style="text-align:left;font-size:30;"><a href="home.ak" style="color:green;">마이악어새</a></h1>
</div>


<!-- 회원가입 로그인 -->
<div style="text-align:right;flex: 2;">
<button style="text-align:center;font-size:15;" onclick="location.href='./joinselect.ak'">회원가입</button>
<button style="text-align:center;font-size:15;margin:20;" onclick="location.href='loginform.ak'">
로그인</button>
</div>
</header>
<hr size="3" color="gray">
<br />
<br />
<div style="width:600px;margin:0 auto;margin-top:100px;" >


<!-- 고객 -->
<div style="display:flex;">
<div style="text-align:left;flex: 2;height:150px;">
<img src="./resources/image/crocodile_profile.png" style="height:120px">
</div>
<div style="text-align:left;flex: 4;height:100px;">
<br/>
<br/>
<b style="font-size:25px;">"청소해주실 분 찾습니다!"</b>

</div>
</div>
<a href="joinformcscate.ak" style="height:15px;">&nbsp;&nbsp;&nbsp;고객회원가입 ▶</a>
<hr size="3" color="gray">
<br>
<br/>



<!-- 근로자 -->
<div style="display:flex;" >
<div style="text-align:left;flex: 2;height:150px;">
<img src="./resources/image/bird_profile.png" style="height:120px;">
</div>
<div style="text-align:left;flex: 4;height:100px;">
<br/>
<br/>
<b style="font-size:25px;">"대신 청소해드립니다!"</b>
</div>
</div>
<a href="joinformwkcate.ak" style="height:15px;text-color:black;">&nbsp;&nbsp;&nbsp;근로자 or 업체 회원가입 ▶</a>
</div>



</div>
</body>
</html>