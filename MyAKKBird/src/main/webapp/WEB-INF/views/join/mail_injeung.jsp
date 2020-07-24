<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
	 .btn1{
 	margin:5px; 
	padding: 5px; 
	border-radius:5px;
	border:0px;
	background: #37b04b;
	text-decoration: none;
	color:white;
	}
		 .btn2{
 	margin:5px; 
	padding: 5px; 
	border-radius:5px;
	border:0px;
	background: #89df8f;
	text-decoration: none;
	color:white;
	}
	form { 
		top : 0;
		
		bottom: 0;
		
		margin : auto;
    }  
	
</style>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>메일 인증 코드</title>
<script>
	function check(){
		var form = document.authenform;
		var num = ${num};
		if(!form.num.value){
			alert("인증번호를 입력하세요");
			return false;
		}
		if(form.num.value!=num){
			alert("틀린 인증번호입니다. 인증번호를 다시  입력하세요");
			return false;
		}
		if(form.num.value==num){
			alert("인증완료");
			opener.document.joinformcs.mailCheck.value="인증완료";
			$("#mailCheck", opener.document).addClass('after');  
			$("#mailCheck", opener.document).removeClass('before');
			self.close();
		}
	}
</script>
</head>
<body style="background-color:#e6e6e6">
<div class="containder" >
<form method="post" name="authenform" onSubmit="return check();">

<table border="1" width="450" height="100" align="center" class="btn2">
	<tr>
		<td align="center">
			인증번호 입력 : <input style="color:black" type="text" name="num" placeholder="인증번호를 입력하세요">
			<input type="submit" value="인증번호 전송" class="btn1">
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>