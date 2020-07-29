<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이악어새 메일인증</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
	
	/* 전체 적용  */
	body {
		margin: 0;
		padding: 0;
		background-color: #F6F6F6;
		font-family: "NotoSansKR-Regular";
	}
	
	input:focus {
		outline-color: #37b04b; 
	}
	/* 전체 적용  */
	
	.mail_div {
		width: 400px;
		margin: 30px auto;
	}
	
	.mail_form_div {
		width: 400px;
		margin: 55px auto;
	}
	
	#mail_txt {
		font-size: 16px;
	   	font-family: "NotoSansKR-Medium";
	   	margin-left: 44px;
	}
	
	#input_num {
		width: 200px;
		height: 45px;
		margin-left: 44px;
		font-size: 15px;
		border-radius: 4px;  
		border: 1px solid rgb(195, 195, 195);
		font-family: "NotoSansKR-Medium";
	}
	
	.go_btn {
	 	width: 100px;
		height: 45px;
		background-color: #37B04B;
		margin-right: 45px;
		margin-top: 2px;
		border-radius: 4px;
		color: white;
		border: 0;
		font-family: "NotoSansKR-Medium";
		font-size: 15px;
		cursor: pointer;
	}
</style>
</head>
<body>
<div class="mail_div" >
	<div class="mail_form_div">
		<b id="mail_txt">인증번호 입력</b>
		<form method="post" name="authenform" onSubmit="return check();">
			<input type="text" name="num" id="input_num" placeholder="  인증번호를 입력하세요">
			<input type="submit" value="인증번호 전송" class="go_btn">
		</form>
	</div>
</div>
</body>
<script>
// 메일 인증 체크
function check(){
	var form = document.authenform;
	var num = ${num};
	if(!form.num.value){
		alert("인증번호를 입력하세요");
		return false;
	}
	if(form.num.value!=num){
		alert("틀린 인증번호입니다. 인증번호를 다시 입력하세요");
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
</html>