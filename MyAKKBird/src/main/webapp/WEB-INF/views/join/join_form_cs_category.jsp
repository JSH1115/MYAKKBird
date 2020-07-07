<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
	body {margin:0;padding:0;}
#webView {overflow:hidden;position:relative;background:#FFFFFF;width:1200px;margin:0 auto;-webkit-transform:translate3d(0,0,0);transform:translate3d(0,0,0)}
#webView[data-show-memo='true'] {overflow:visible}
	a	{
		text-decoration:none;
	}
	b{
		font-size:50px;
		text-align:center;
	}
	table {
  		border-collapse: separate;
	 	border-spacing: 0 10px;
	}
	
	.ccheck {
	display: table-cell;
    vertical-align: middle;
	}
	.ccheck input[type="checkbox"] {
	display:none;
}

.ccheck label{
	width:200px;
	height:150px;
}

.ccheck input[type="checkbox"] + label .chk_img {
	padding:0 0 0 100px;
	height:150px;
	background:url("./resources/image/vacuum_off.png")no-repeat;
	background-size:100px 100px;
	cursor:pointer;  
}
.ccheck input[type="checkbox"]:checked + label .chk_img {
	background:url("./resources/image/vacuum_on.png")no-repeat;
	background-size:100px 100px;
} 
.ccheck input[type="checkbox"] + label .chk2_img {
	padding:0 0 0 100px;
	height:150px;
	background:url("./resources/image/cleaning-tools_off.png")no-repeat;
	background-size:100px 100px;
	cursor:pointer;  
}
.ccheck input[type="checkbox"]:checked + label .chk2_img {
	background:url("./resources/image/cleaning-tools_on.png")no-repeat;
	background-size:100px 100px;
} 
.ccheck input[type="checkbox"] + label .chk3_img {
	padding:0 0 0 100px;
	height:150px;
	background:url("./resources/image/kitchen_off.png")no-repeat;
	background-size:100px 100px;
	cursor:pointer;  
}
.ccheck input[type="checkbox"]:checked + label .chk3_img {
	background:url("./resources/image/kitchen_on.png")no-repeat;
	background-size:100px 100px;
} 
.ccheck input[type="checkbox"] + label .chk4_img {
	padding:0 0 0 100px;
	height:150px;
	background:url("./resources/image/maid_off.png")no-repeat;
	background-size:100px 100px;
	cursor:pointer;  
}
.ccheck input[type="checkbox"]:checked + label .chk4_img {
	background:url("./resources/image/maid_on.png")no-repeat;
	background-size:100px 100px; 
} 
.ccheck input[type="checkbox"] + label .chk5_img {
	padding:0 0 0 100px;
	height:150px;
	background:url("./resources/image/apartment_off.png")no-repeat;
	background-size:100px 100px;
	cursor:pointer;  
}
.ccheck input[type="checkbox"]:checked + label .chk5_img {
	background:url("./resources/image/apartment_on.png")no-repeat;
	background-size:100px 100px; 
} 
.ccheck input[type="checkbox"] + label .chk6_img {
	padding:0 0 0 100px;
	height:150px;
	background:url("./resources/image/coronavirus_off.png")no-repeat;
	background-size:100px 100px;
	cursor:pointer;  
}
.ccheck input[type="checkbox"]:checked + label .chk6_img {
	background:url("./resources/image/coronavirus_on.png")no-repeat;
	background-size:100px 100px; 
} 
</style>
<title>Insert title here</title>
</head>
<body>
<form name="catefrm" action="./joinformcs.ak">
<div id="webView" align="center">
<br/>
<br/>
<b>어떤 청소를 원하세요?</b>
<br/>
<br/>
<div>
<div class="ccheck">
	<input type="checkbox" id="check_test" name="m_category" value="a">
	<label for="check_test">
		<div class="chk_img">정기 청소</div>
	</label>
	
	</div>
<div class="ccheck">
	<input type="checkbox" id="check_test2" name="m_category" value="b">
	<label for="check_test2">
		<div class="chk2_img">특수 장비 청소</div>
	</label>
</div>
<div class="ccheck">
	<input type="checkbox" id="check_test3" name="m_category" value="c">
	<label for="check_test3">
		<div class="chk3_img">입주 청소</div>
	</label>
</div>
<br>
<div class="ccheck">
	<input type="checkbox" id="check_test4" name="m_category"value="d">
	<label for="check_test4">
		<div class="chk4_img">상주 청소</div> 
	</label>
</div>
<div class="ccheck">
	<input type="checkbox" id="check_test5" name="m_category"value="e">
	<label for="check_test5">
		<div class="chk5_img">빌딩 청소</div>
	</label>
</div>
<div class="ccheck">
	<input type="checkbox" id="check_test6" name="m_category"value="f">
	<label for="check_test6">
		<div class="chk6_img">방역</div>
	</label>
</div>





</div>
<input type="submit" value="다음">

</div>
</form>
</body>
</html>