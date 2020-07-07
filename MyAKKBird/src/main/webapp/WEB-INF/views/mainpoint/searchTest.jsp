<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>searchTest</title>
	<style>
		body {
			margin: 0 auto;
		}
	
		.div1 {
			text-align: center;
			width: 600px;
			height: 100px;
			margin: 100px auto;
		}
		
		input {
			width: 400px;
			height: 50px;
		}
	</style>
</head>
<body>
	<h1 style="text-align: center;">검색 테스트 창</h1>
	<div class="div1">
		<form name="selectForm" action="searchProcess.ak" >
			<input type="text" name="b_address_road" placeholder="주소를 입력하세요">
			<a href="javascript:selectForm.submit()">검색</a>
		</form>
	</div>
</body>
</html>