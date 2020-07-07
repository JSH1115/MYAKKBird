<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


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
			self.close();
		}
	}

</script>
</head>
<body>
<div class="containder">
<form method="post" name="authenform" onSubmit="return check();">

<table border="1" width="450" height="70" align="center">
	<tr>
		<td align="center">
			인증번호 입력 : <input type="text" name="num" placeholder="인증번호를 입력하세요">
			<input type="submit" value="인증번호 전송">
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>