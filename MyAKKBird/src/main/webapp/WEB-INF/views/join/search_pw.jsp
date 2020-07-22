<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
	body {margin:0;padding:0;
	font-family: "NotoSansKR-Regular";}
#webView {overflow:hidden;position:relative;background:#FFFFFF;width:1200px;margin:0 auto;-webkit-transform:translate3d(0,0,0);transform:translate3d(0,0,0)}
#webView[data-show-memo='true'] {overflow:visible}
	.tex{
	height: 50px;
    padding: 14px;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    border: 1px solid #37b04b;
    border-radius: 5px;
    margin: 5px 0;
    font-size: 13px;
    font-weight: 500;
    color: #000;
    width: 300px;
    -webkit-transition: border .3s ease;
    -o-transition: border .3s ease;
    transition: border .3s ease;
	}
	a{
		display:inline-block;
	}
		 a:hover {
		text-decoration: none;
	}
	#logo{
		height:100px;
		float:right;
	}
	h1{
	color:#37b04b;
	}
	b{
		float:right;
		margin:0 8px;
	}
	 .btn1{
 	margin:5px; 
	padding: 5px; 
	border-radius:5px;
	border:0px;
	background: #37b04b;
	text-decoration: none;
	color:white;
	}
		 .btn3{
 	margin:5px; 
	padding: 5px; 
	border-radius:5px;
	border:0px;
	
	background: #89df8f;
	text-decoration: none;
	color:white;
	}
</style>
<script>
</script>
<title>Search Password</title>
</head>
<body>
<div id="webView">
<!-- 사이트이미지 -->
<header style="height:100px;display: flex;">
<div style="text-align:left;flex: 1;"><img src="./resources/image/crocodile_logo.png" id="logo"/></div>

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
<center>
<div id="webView">
<h1 color="red">비밀번호 찾기</h1><br/>

<form action="./findPw.ak"  method="post">

<table align="center">

<tr>
	<td  style="width:120px;"><b>이름</b></td>
	<td style="width:400px;"><input type="text" name="m_name" class="tex" placeholder="이름를 입력해주세요"></a></td>
</tr>
<tr>
	<td><b>아이디</b></td>
	<td><input type="text" name="m_id" class="tex" placeholder="아이디를 입력해주세요"></td>
</tr>

<tr>
	<td><b>이메일</b></td>
	<td><input type="text" name="m_email" class="tex" placeholder="이메일를 입력해주세요"></td>
</tr>
<tr>
	<td colspan="2" align="center">
		<input type="button" onclick="javascript:history.back()" class="btn3"value="뒤로">
		<input type="submit" value="찾기" class="btn1">
	</td>
</tr>
</table>

</form>

</div>
</center>




</div>
</body>
</html>