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
<title>로그인</title>
	<style>
	body {margin:0;padding:0;}
#webView {overflow:hidden;position:relative;background:#FFFFFF;width:1200px;margin:0 auto;-webkit-transform:translate3d(0,0,0);transform:translate3d(0,0,0)}
#webView[data-show-memo='true'] {overflow:visible}
	a {
		text-decoration:none;
	}
	#logo{
		height:100px;
		float:right;
	}

	</style>
	
	
<script>
function check_input()
{
	var str, i, ch;
	// 아이디 체크 ----> 
	if (document.loginform.m_id.value == "")
	{
		alert("아이디를 입력하세요!!!");
		document.loginform.m_id.focus();
		return;
	}
	else
	{
		str = document.loginform.m_id.value;
		
		for (i=0; i<str.length; i++)
		{
			ch = str.substring(i, i+1);
			if (!((ch >= "0" && ch <= "9") || (ch >= "a" && ch <= "z") 
					|| (ch >= "A" && ch <= "Z")))
			{
				alert("특수문자가 포함, 다시 입력!!!");
				document.loginform.m_id.focus();
				return;
			}
		}
	} // 아이디 체크 <------
	
	// 패스워드 체크 ------>
	if (document.loginform.m_password.value == "")
	{
		alert("패스워드를 입력하세요!!!");
		document.loginform.m_password.focus();
		return;
	}

	loginform.submit();
}
</script>	
	
	
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

<div class="login-box">
<center>
<form name="loginform" action="./login.ak" method="post">
<h1>로그인</h1></b>
<div class="form-group">
<input type="text" class="form-control" name="m_id"  placeholder="아이디를 입력해주세요."
style="width:200px; height:20px;" ></div><br/>
<div class="form-group">
<input type="password" class="form-control" name="m_password"  placeholder="비밀번호를 입력해주세요."
style="width:200px; height:20px;"></div>
<label>
            <input type="checkbox" name="useCookie"> 로그인유지
</label>
<br /><br />
<input type="button" class="btn btn-default" value="로그인" style="width:200px; height:30px;background-color:#19CE60;"
onclick="check_input()">
<br />
<br>
<div>
	<a  href='./joinselect.ak'>회원가입</a>&nbsp;


	<a >계정 찾기</a>
</div>



</form>
</center>


</div>






</div>
</body>
</html>