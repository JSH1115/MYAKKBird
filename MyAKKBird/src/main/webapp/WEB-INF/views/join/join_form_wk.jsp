<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% String[] str=request.getParameterValues("m_category"); %>
<% 
String va= "";
for(int i=0;i<str.length;i++){
	if(i==str.length-1){
		va+=str[i];
		break;
	}else if(i<str.length){
		va+=str[i]+",";
	}
}	
%>
<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>
	body {margin:0;padding:0;}
#webView {overflow:hidden;position:relative;background:#FFFFFF;width:1200px;margin:0 auto;
-webkit-transform:translate3d(0,0,0);transform:translate3d(0,0,0);
background-image:url("./resources/image/back_cro1.png"),url("./resources/image/bird2.png");
background-repeat:no-repeat;
background-position:left top, right bottom;
}
#webView[data-show-memo='true'] {overflow:visible}
	a	{
		text-decoration:none;
	}
	b{
		float:right;
		margin:0 8px;
	}
	table {
  border-collapse: separate;
  border-spacing: 0 10px;
}
	input:focus {outline:none;}
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
    width: 360px;
    -webkit-transition: border .3s ease;
    -o-transition: border .3s ease;
    transition: border .3s ease;
	}
		.tex2{
		    height: 50px;
    padding: 14px;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    border: 1px solid red;
    border-radius: 5px;
    margin: 5px 0;
    font-size: 13px;
    font-weight: 500;
    color: #000;
    width: 360px;
    -webkit-transition: border .3s ease;
    -o-transition: border .3s ease;
    transition: border .3s ease;
	}
	
			.tex3{
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
    width:360px;
    -webkit-transition: border .3s ease;
    -o-transition: border .3s ease;
    transition: border .3s ease;
	}
	
	﻿﻿
.fileUploadBtn {
   display: inline-block;
   padding: 0px 2px;
   vertical-align: middle;
   background-color: #e5e5e5;
   cursor: pointer;
   border: 1px solid #4f4f4f;
   border-radius: 2px;
 }
 .fileNmBox {
   width: calc(100% - 70px);
   height: 20px;
   display: inline-block;
   vertical-align: middle;
   background-color: #e6e6e6;
   border: 1px solid #CCCCCC;
 }
 .btnn{
 	margin:5px; 
	padding: 10px; 
	border-radius:5px;
	border:0px;
	background: #37b04b;
	text-decoration: none;
	color:white;
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
	width:66px;
	background: #89df8f;
	text-decoration: none;
	color:white;
	}
 	.addrborder{
 	border: 1px solid #37b04b;
 	border-radius:5px;
 	margin:1px; 
 	}
 	.before{
 		background-color:transparent;
 		border:0;
 		width:70px;
 		color:red;
 	}
 	.after{
 		background-color:transparent;
 		border:0;
 		width:70px;
 		color:#37b04b;
 	}
 	
 	 	input > file-upload-button{
 	background-color:#37b04b;
 	}
.custom-file-input::-webkit-file-upload-button {
  visibility: hidden;
}
.custom-file-input::before {
  content: 'Open';
  background: linear-gradient(top, #f9f9f9, #e3e3e3);
  border: 1px solid #37b04b;
  border-radius:5px;
  margin:5px; 
  padding: 5px;
  outline: none;
  white-space: nowrap;
  -webkit-user-select: none;
  cursor: pointer;
  font-weight: 700;
  font-size: 10pt;
  color:white;
  background-color:#37b04b;
}
.custom-file-input:hover::before {
  border-color: #37b04b;
}
.custom-file-input:active::before {
  background: -webkit-linear-gradient(top, #e3e3e3, #f9f9f9);
}
 	
</style>

<script type="text/javascript">
function mail_check(){
	var email =  $("#m_email").val();
	if($("#m_email").val()==""){
		alert("이메일를 입력해주세요.");
		$("#m_emil").focus();
		return false;
	}
	
	if(email.indexOf("@") == "-1"){
    	alert("유효하지않은 이메일입니다.");
    	return false;
    }
	var check = document.joinformcs;
	
	var popupX = (document.body.offsetWidth/2)-(200/2);
	//&nbsp;만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
	var popupY= (window.screen.height/2)-(300/2);
	//&nbsp;만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
	window.open('', "popView", 'status=no, height=120, width=466, left='+ popupX + ', top='+ popupY);
	
	check.action="./auth.ak";
	check.target = "popView";
	check.submit();
}
$(function(){ $("#alert-success").hide(); 
$("#alert-danger").hide();
$("input").keyup(function(){ 
	var pwd1=$("#m_password").val();
	var pwd2=$("#m_password2").val();
	if(pwd1 != "" || pwd2 != ""){
		if(pwd1 == pwd2){ 
			$("#alert-success").show(); 
			$("#alert-danger").hide();
			$("#submit").removeAttr("disabled"); 
			}else{ 
				$("#alert-success").hide();
				$("#alert-danger").show(); 
				$("#submit").attr("disabled", "disabled"); 
			}
		} 
	});
});
$(document).ready(function(){
   //빈칸
	$("#join").on("click", function(){
		if($("#m_id").val()==""){
			alert("아이디를 입력해주세요.");
			$("#m_id").focus();
			return false;
		}
		if($("#m_password").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#m_password").focus();
			return false;
		}
		if($("#m_name").val()==""){
			alert("성명을 입력해주세요.");
			$("#m_name").focus();
			return false;
		}
		if($("#m_age").val()==""){
			alert("나이를 입력해주세요.");
			$("#m_age").focus();
			return false;
		}
		if($("#m_email").val()==""){
			alert("이메일을 입력해주세요.");
			$("#m_email").focus();
			return false;
		}
		if($("#mailCheck").val()=="인증필요"){
			alert("이메일인증을 해주세요.");
			$("#m_email").focus();
			return false;
		}
		if($("#m_phone").val()==""){
			alert("핸드폰번호를 입력해주세요.");
			$("#m_phone").focus();
			return false;
		}
		var ccc = "1";
		if(idck != ccc){
			alert("아이디 중복검사를 해주세요.");
			$("#m_id").focus();
			return false;
		}
		if($("#m_address_road").val()==""){
			alert("도로명주소를 입력해주세요.");
			$("#m_address_road").focus();
			return false;
		}
		
		document.joinformcs.target = '_self';
		document.joinformcs.action="./joininput.ak";
		document.joinformcs.submit();
		
	});
})
/* $(document).ready(function() {
   var strData = $('input[name=va]').val();
    var arrDay = strData.split(',');
   
    $('.m_category').prop('checked', false); // 일단 모두 uncheck
   
    for (var nArrCnt in arrDay) {
                    $("input[name=m_category][value="+arrDay[nArrCnt]+"]").prop("checked",true);
    }    
}); */
//프로필 미리보기
$(function() {
    $("#imgInp").on('change', function(){
        readURL(this);
    });
});
function readURL(input) {
    if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
            $('#image_section').attr('src', e.target.result);
        }
      reader.readAsDataURL(input.files[0]);
    }
}
//아이디 중복체크
var idck = 0;
$(function() {
    //idck 버튼을 클릭했을 때 
    $("#idcheck").click(function() {
        
        //userid 를 param.
        var userid =  $("#m_id").val(); 
        
        $.ajax({
            async: true,
            type : 'POST',
            data : userid,
            url : "./idcheck.ak",
            dataType : "json",
            contentType: "application/json; charset=UTF-8",
            success : function(data) {
                if (data.cnt > 0) {
                    
                    alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
                    //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
                    $("#m_id").addClass("tex2")
                    $("#m_id").removeClass("tex1")
                    $("#m_id").focus();
                    
                
                } else {
                    alert("사용가능한 아이디입니다.");
                    //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
                    $("#m_id").addClass("tex1")
                    $("#m_id").removeClass("tex2")
                    $("#m_password").focus();
                    //아이디가 중복하지 않으면  idck = 1 
                    idck = 1;
                    
                }
            },
            error : function(error) {
                
                alert("error : " + error);
            }
        });
    });
});
</script>


<title>근로자 회원가입</title>
</head>
<body>
<div id="webView" style="text-align:center;">

<br/>
<br/>
<h2>이제 거의 다 왔어요!</h2>
<h1>마이악어새를 이용하기 위해 정보를 입력해주세요.</h1>
<br/>
<br/>
<form name="joinformcs" method="post" enctype="multipart/form-data">
<input type="hidden" name="m_category" value="<%=va%>">
<input type="hidden" name="m_type" value="E" >
<table align="center">
<tr>
<td colspan="3">
<img class="img-responsive center-block" name="file" id="image_section" src="resources/image/bird_profile.png"
	style="height:100px;width:100px" >
</td>
</tr>
<tr>
	<td style="width:120px;"><b>프로필 사진</b></td>
		<td><input type="file" id="imgInp" name="file" class="tex custom-file-input"style="margin-left: auto;
   			 margin-right: auto;"/></td>
</tr>

<tr>
	<td class="aliright"><b>아이디</b></td>
		<td><input class="tex" type="text" id="m_id" name="m_id" placeholder="아이디를 입력해주세요"></td>
		<td><input class="btn1" style="float:left;" type="button" id="idcheck" name="idcheck" value="중복확인">	
		</td>
</tr>
<tr>
	<td><b>비밀번호</b></td>
		<td><input class="tex" type="password" id="m_password"name="m_password" placeholder="내용을 입력해주세요"></td>
</tr>
<tr>
	<td><b>비밀번호 재입력</b></td>
		<td><input class="tex" type="password" id="m_password2" name="m_password2" placeholder="비밀번호룰 입력해주세요">
		<div id="alert-success"  >
		<input type="text" style="border:0px;color:green;"size="17px" readonly value="비밀번호가 일치합니다"></div> 
		<div id="alert-danger">
		<input type="text" style="border:0px;color:red;"size="23px" readonly value="비밀번호가 일치하지 않습니다"></div>
	</td>
</tr>
<tr>
	<td><b>이름</b></td>
		<td><input class="tex" type="text"  id="m_name" name="m_name" placeholder="내용을 입력해주세요"><br/></td>
	
</tr>

<tr>
	<td><b>나이</b></td>
		<td><input class="tex" type="text" name="m_age" placeholder="내용을 입력해주세요"></td>
</tr>
<tr>
	<td><b>성별</b></td>
		<td class="tex"><input type="radio" name="m_gender" value="남" checked/>남자
		<input type="radio" name="m_gender" value="여"/>여자</td>
</tr>
<tr>
	<td><b>이메일</b></td>
		<td><input class="tex" type="text"  id="m_email" name="m_email" placeholder="이메일을 입력해주세요"></td>
		<td><input class="btn1" type="button" value="이메일인증" onClick='mail_check()'>
		<input type="text" id="mailCheck" value="인증필요" class="before" readonly>
	</td>
</tr>
<tr>
	<td><b>핸드폰</b></td>
		<td><input class="tex" type="text"  id="m_phone" name="m_phone" placeholder="번호를 입력해주세요"></td>
</tr>
<tr>
	<td><b>주소</b></td>
		<td><input type="text"class="addrborder" id="m_postcode" placeholder="우편번호">
		<input type="text"class="addrborder" id="m_address_road" name="m_address_road"placeholder="주소"><br>
		<input type="text"class="addrborder" id="m_address_detail" name="m_address_detail" placeholder="상세주소">
		<input type="text"class="addrborder" id="m_extraAddress" placeholder="참고항목"></td>
		<td><input type="button" style="float:left" class="btn1"onclick="sample2_execDaumPostcode()" value="우편번호 찾기">
	</td>
</tr>


</table>
<br/>
<input type="button"  class="btn3" onclick="cancel()" value="취소">
<input type="button" id="join" class="btn1"value="회원가입" >
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
</form>
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>
</div>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function cancel(){
		window.location.href="./joinselect.ak"
	}
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');
    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }
    function sample2_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("m_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("m_extraAddress").value = '';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('m_postcode').value = data.zonecode;
                document.getElementById("m_address_road").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("m_address_detail").focus();
                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);
        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';
        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }
    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께
        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>
</body>
</html>