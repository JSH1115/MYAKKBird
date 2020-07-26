<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% 
	String[] str = request.getParameterValues("m_category"); 
 
	String va = "";
	
	for(int i = 0; i< str.length; i++) {
		
		if(i == str.length-1) {
			va += str[i];
			break;
		} else if(i < str.length) {
			va += str[i] + ",";
		}
	}	
	
	System.out.println("선택한 카테고리 : " + va);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- alert창 API 시작 -->
<script src="resources/js/sweetAlert_J.js"></script>
<!-- alert창 API 끝 -->
<title>마이악어새</title>
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
	
	/* 전체 적용 */
	body {
		margin: 0 auto;
		padding: 0;
		background-color: #F6F6F6;
		font-family: "NotoSansKR-Regular";
	}
	
	input:focus {
		outline-color: #37b04b; 
	}
	
	select:focus {
		outline-color: #37b04b; 
	}
	/* 전체 적용 */
	
	.sign_div {
		width: 1000px;
    	height: 1300px;
    	margin: 70px auto;
	}
	
	.img_div {
		width: 1000px;
		height: 230px;
		text-align: center;
		margin-top: 20px;
	}
	
	.img_profile_div {
		width: 300px;
		height: 110px;
		margin: 0 auto;
	}
	
	.profile_img {
		width: 70px;
		height: 70px;
		border-radius: 35px;
		background-color: white;
		border: 1px solid #E6E6E6;
	}
	
	.img_profile_div b {
		float: left;
		margin-left: 55px;
	}
	
	#detail_btn {
		float: right;
		margin-right: 30px; 
		margin-top: 3px;
		cursor: pointer;
	}
	
	.file_div {
		width: 500px;
		height: 80px;
		margin: 30px auto;
	}
	
	.file_div b {
		float: left;
		line-height: 1;
		margin-left: 45px;		
	}
	
	input[type="file"] { 
		position: absolute; 
		width: 1px; 
		height: 1px; 
		padding: 0; 
		margin: -1px; 
		overflow: hidden; 
		clip:rect(0,0,0,0); 
		border: 0; 
	}
		
	.file_div .upload_name { 
		display: inline-block; 
		width: 290px;
		height: 45px;
		font-size: 15px;
		background-color: white; 
		border-radius: 4px;  
		border: 1px solid rgb(195, 195, 195);
		margin-left: 28px;
		font-family: "NotoSansKR-Medium";
	}
	
	#up_a {
		display: inline-block;
		width: 100px;
		height: 45px;
		background-color: #37B04B;
		float: right;
		margin-right: 45px;
		margin-top: 2px;
		border-radius: 4px;
		color: white;
		font-family: "NotoSansKR-Medium";
		font-size: 15px;
		vertical-align: middle;
		cursor: pointer; 
		line-height: 3.1;
	}
	
	.sign_info_div {
		width: 1000px;
		height: 1000px;
	}
	
	.id_div {
		width: 500px;
		height: 80px;
		margin: 0 auto;
	}
	
	.id_div b {
		float: left;
		margin-left: 45px;
		line-height: 1;
	}
	
	.id_input {
		width: 290px;
		height: 45px;
		margin-left: 44px;
		font-size: 15px;
		border-radius: 4px;  
		border: 1px solid rgb(195, 195, 195);
		font-family: "NotoSansKR-Medium";
	}
	
	.id_chk_btn {
		width: 100px;
		height: 45px;
		background-color: #37B04B;
		float: right;
		margin-right: 45px;
		margin-top: 2px;
		border-radius: 4px;
		color: white;
		border: 0;
		font-family: "NotoSansKR-Medium";
		font-size: 15px;
		vertical-align: middle;
		cursor: pointer; 
	}
	
	.pass_div {
		width: 500px;
		height: 80px;
		margin: 9px auto;
	}
	
	.pass_div b {
		float: left;
		margin-left: 45px;
		line-height: 1;
	}
	
	.pass_input {
		width: 405px;
		height: 45px;
		margin-left: 44px;
		font-size: 15px;
		border-radius: 4px;  
		border: 1px solid rgb(195, 195, 195);
		font-family: "NotoSansKR-Medium";
	}
	
	.pass_chk_div {
		width: 500px;
		height: 80px;
		margin: 9px auto;
	}
	
	.pass_chk_div b {
		float: left;
		margin-left: 45px;
		line-height: 1;
	}
	
	.pass_chk_input {
		width: 405px;
		height: 45px;
		margin-left: 44px;
		font-size: 15px;
		border-radius: 4px;  
		border: 1px solid rgb(195, 195, 195);
		font-family: "NotoSansKR-Medium";
	}
	
	#alert-success {
		text-align: center;
	}
	
	#success_input {
		border: 0px;
		color: green;
		font-family: "NotoSansKR-Medium";
		background-color: #F6F6F6;
		outline: none;
	}
	
	#alert-danger {
		text-align: center;
	}
	
	#danger_input {
		border: 0px;
		color: red;
		font-family: "NotoSansKR-Medium";
		background-color: #F6F6F6;
		outline: none;
	}
	
	.name_div {
		width: 500px;
		height: 80px;
		margin: 9px auto;
	}
	
	.name_div b {
		float: left;
		margin-left: 45px;
		line-height: 1;
	}
	
	.name_input {
		width: 405px;
		height: 45px;
		margin-left: 44px;
		font-size: 15px;
		border-radius: 4px;  
		border: 1px solid rgb(195, 195, 195);
		font-family: "NotoSansKR-Medium";
	}
	
	.age_div {
		width: 500px;
		height: 80px;
		margin: 9px auto;
	}
	
	.age_div b {
		float: left;
		margin-left: 45px;
		line-height: 1;
	}
	
	.age_input {
		width: 405px;
		height: 45px;
		margin-left: 44px;
		font-size: 15px;
		border-radius: 4px;  
		border: 1px solid rgb(195, 195, 195);
		font-family: "NotoSansKR-Medium";
	}
	
	.gender_div {
		width: 500px;
		height: 80px;
		margin: 9px auto;
	}
	
	.gender_div b {
		float: left;
		margin-left: 45px;
		line-height: 1;
	}
	
	.gender_select {
		width: 411px;
		height: 49px;
		margin-left: 44px;
		font-size: 15px;
		border-radius: 4px;  
		cursor: pointer;
		border: 1px solid rgb(195, 195, 195);
		font-family: "NotoSansKR-Medium";
	}
	
	.email_div {
		width: 500px;
		height: 80px;
		margin: 9px auto;
	}
	
	.email_div b {
		float: left;
		margin-left: 45px;
		line-height: 1;
	}
	
	.before {
 		background-color: transparent;
	    border: 0;
	    width: 70px;
	    color: red;
	    position: absolute;
	    margin-left: 5px;
	    margin-top: -2px;
	    font-family: "NotoSansKR-Medium";
	    outline: none;
 	}
 	
 	.after {
 		background-color: transparent;
 		border: 0;
 		width: 70px;
 		color: #37b04b;
 		position: absolute;
	    margin-left: 5px;
	    margin-top: -2px;
	    font-family: "NotoSansKR-Medium";
	    outline: none;
 	}
	
	.email_input {
		width: 290px;
		height: 45px;
		margin-left: 44px;
		font-size: 15px;
		border-radius: 4px;  
		border: 1px solid rgb(195, 195, 195);
		font-family: "NotoSansKR-Medium";
	}
	
	#why {
	    margin-top: 1px;
	    cursor: pointer;
	    position: absolute;
	    margin-left: 59px;
	}
	
	.email_chk_btn {
		width: 100px;
		height: 45px;
		background-color: #37B04B;
		float: right;
		margin-right: 45px;
		margin-top: 2px;
		border-radius: 4px;
		color: white;
		border: 0;
		font-family: "NotoSansKR-Medium";
		font-size: 15px;
		vertical-align: middle;
		cursor: pointer;
	}
	
	.phone_div {
		width: 500px;
		height: 80px;
		margin: 9px auto;
	}
	
	.phone_div b {
		float: left;
		margin-left: 45px;
		line-height: 1;
	}
	
	.phone_input {
		width: 405px;
		height: 45px;
		margin-left: 44px;
		font-size: 15px;
		border-radius: 4px;  
		border: 1px solid rgb(195, 195, 195);
		font-family: "NotoSansKR-Medium";
	}
	
	.addr_div {
		width: 500px;
		height: 300px;
		margin: 9px auto;
	}
	
	.addr_div b {
		float: left;
		margin-left: 45px;
		line-height: 1;
	}
	
	#why_addr {
	    margin-top: 1px;
	    cursor: pointer;
	    position: absolute;
	    margin-left: 3px;
	}
	
	.post_input {
		width: 290px;
		height: 45px;
		margin-left: 44px;
		font-size: 15px;
		border-radius: 4px;  
		border: 1px solid rgb(195, 195, 195);
		font-family: "NotoSansKR-Medium";
	}
	
	.addr_btn {
		width: 100px;
		height: 45px;
		background-color: #37B04B;
		float: right;
		margin-right: 45px;
		margin-top: 2px;
		border-radius: 4px;
		color: white;
		border: 0;
		font-family: "NotoSansKR-Medium";
		font-size: 15px;
		vertical-align: middle;
		cursor: pointer;
	}
	
	.addr_input {
		width: 405px;
		height: 45px;
		margin-left: 44px;
		font-size: 15px;
		border-radius: 4px;  
		border: 1px solid rgb(195, 195, 195);
		font-family: "NotoSansKR-Medium";
		margin-top: 15px;
	}
	
	.btn_div {
		width: 500px;
		height: 80px;
		margin: 20px auto;
		text-align: center;
	}
	
	.submit_btn {
		border-radius: 4px;
	    width: 410px;
	    height: 45px;
	    border: 0px;
	    background: #37b04b;
	    text-decoration: none;
	    color: white;
	    font-size: 16px;
	    font-family: "NotoSansKR-Black";
	    cursor: pointer;
	}
	
	#m_title {
		font-size: 20px;
	}
	
	#m_span {
		font-size: 16px;
	    position: absolute;
	    margin-left: -80px;
	    margin-top: -10px;
	}
	
	.info_profile {
		width: 300px;
		height: 160px;
		margin: 0 auto;
	}
	
	.left_zone {
		width: 150px;
		height: 130px;
		margin-top: 40px;
		float: left;
	}
	
	.right_zone {
		width: 150px;
		height: 130px;
		margin-top: 40px;
		float: right;
	}
	
	#point_txt {
		font-size: 16px;
	}
	
	.left_zone b, .right_zone b {
		font-size: 14px;
	}
	
	.info_img {
		width: 60px;
		height: 60px;
		border-radius: 30px;
		background-color: white;
		border: 1px solid #E6E6E6;
	}
	
	.txt_zone {
		width: 400px;
		height: 30px;
		font-size: 14px;
		margin: 0 auto;
		line-height: 2.5;
	}
	
	#alert_id_txt {
		font-size: 20px;
	}
	
</style>
<script type="text/javascript">
function mail_check(){
	var email =  $("#m_email").val();
	if($("#m_email").val()==""){
		Swal.fire({
			  html: 
		        '<b id="alert_id_txt">이메일를 입력해주세요.</b>',
			  timer: 1500,
			  confirmButtonColor: '#37B04B',
			  confirmButtonText:
			    '확인'
		})
		$("#m_emil").focus();
		return false;
	}
	
	if(email.indexOf("@") == "-1"){
    	Swal.fire({
			  html: 
		        '<b id="alert_id_txt">유효하지않은 이메일입니다.</b>',
			  timer: 1500,
			  confirmButtonColor: '#37B04B',
			  confirmButtonText:
			    '확인'
		})
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
                  
                  Swal.fire({
	       			  html: 
	       		        '<b id="alert_id_txt">아이디가 존재합니다. 다른 아이디를 입력해주세요.</b>',
	       			  timer: 1500,
	       			  confirmButtonColor: '#37B04B',
	       			  confirmButtonText:
	       			    '확인'
        		  })
        		  
                  //아이디가 존재할 경우 빨강으로 , 아니면 그린으로 처리하는 디자인
                  $("#m_id").addClass("tex2")
                  $("#m_id").removeClass("tex1")
                  $("#m_id").removeClass("tex3")
                  $("#m_id").focus();
              
              } else {
            	  
                  Swal.fire({
	       			  html: 
	       		        '<b id="alert_id_txt">사용가능한 아이디입니다.</b>',
	       			  confirmButtonColor: '#37B04B',
	       			  confirmButtonText:
	       			    '확인'
        		  })
                  
                  $("#m_id").addClass("tex3")
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
$(document).ready(function(){
   //빈칸
	$("#join").on("click", function(){
		if($("#m_id").val()==""){
			Swal.fire({
     			  html: 
     		        '<b id="alert_id_txt">아이디를 입력해주세요.</b>',
     			  timer: 1500,
     			  confirmButtonColor: '#37B04B',
     			  confirmButtonText:
     			    '확인'
  		  	})
			$("#m_id").focus();
			return false;
		}
		if($("#m_password").val()==""){
			Swal.fire({
   			  html: 
   		        '<b id="alert_id_txt">비밀번호를 입력해주세요.</b>',
   			  timer: 1500,
   			  confirmButtonColor: '#37B04B',
   			  confirmButtonText:
   			    '확인'
		  	})
			$("#m_password").focus();
			return false;
		}
		if($("#m_name").val()==""){
			Swal.fire({
	   			  html: 
	   		        '<b id="alert_id_txt">이름을 입력해주세요.</b>',
	   			  timer: 1500,
	   			  confirmButtonColor: '#37B04B',
	   			  confirmButtonText:
	   			    '확인'
			})
			$("#m_name").focus();
			return false;
		}
		if($("#m_age").val()==""){
			Swal.fire({
	   			  html: 
	   		        '<b id="alert_id_txt">나이를 입력해주세요.</b>',
	   			  timer: 1500,
	   			  confirmButtonColor: '#37B04B',
	   			  confirmButtonText:
	   			    '확인'
			})
			$("#m_age").focus();
			return false;
		}
		if($("#m_email").val()==""){
			Swal.fire({
	   			  html: 
	   		        '<b id="alert_id_txt">이메일을 입력해주세요.</b>',
	   			  timer: 1500,
	   			  confirmButtonColor: '#37B04B',
	   			  confirmButtonText:
	   			    '확인'
			})
			$("#m_email").focus();
			return false;
		}
		if($("#m_phone").val()==""){
			Swal.fire({
	   			  html: 
	   		        '<b id="alert_id_txt">휴대전화를 입력해주세요.</b>',
	   			  timer: 1500,
	   			  confirmButtonColor: '#37B04B',
	   			  confirmButtonText:
	   			    '확인'
			})
			$("#m_phone").focus();
			return false;
		}
		if($("#m_address_road").val()==""){
			Swal.fire({
	   			  html: 
	   		        '<b id="alert_id_txt">지번주소를 선택해주세요.</b>',
	   			  timer: 1500,
	   			  confirmButtonColor: '#37B04B',
	   			  confirmButtonText:
	   			    '확인'
			})
			$("#m_address_road").focus();
			return false;
		}
		if($("#mailCheck").val()!="인증완료"){
			Swal.fire({
	   			  html: 
	   		        '<b id="alert_id_txt">메일인증을 받아주세요.</b>',
	   			  timer: 1500,
	   			  confirmButtonColor: '#37B04B',
	   			  confirmButtonText:
	   			    '확인'
			})
			$("#m_email").focus();
			return false;
		}
		var ccc = "1";
		if(idck != ccc){
			Swal.fire({
	   			  html: 
	   		        '<b id="alert_id_txt">아이디 중복검사를 해주세요.</b>',
	   			  timer: 1500,
	   			  confirmButtonColor: '#37B04B',
	   			  confirmButtonText:
	   			    '확인'
			})
			$("#m_id").focus();
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
</script>
</head>
<body>
<!-- header zone -->
<jsp:include page="../header_container.jsp">
	<jsp:param value="m_id" name="m_id"/>
</jsp:include>
<!-- header zone -->
<div class="sign_div">
	<form name="joinformcs" method="post" enctype="multipart/form-data" >
		<input type="hidden" name="m_category" value="<%=va%>">
		<input type="hidden" name="m_type" value="C" >
		<div class="img_div">
			<div class="img_profile_div">
			 	<img class="profile_img" id="image_section" src="resources/image/crocodile_profile.png"/><br>
			 	<b>마이악어새 기본 프로필 사진</b>
			 	<svg id="detail_btn" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 25 25"><g fill="none" fill-rule="evenodd"><g><circle cx="12.5" cy="12.5" r="12.5" fill="#BDBDBD"/><path fill="#FFF" d="M11.194 14.606c-.402-2.66 2.445-3.717 2.445-5.302 0-.826-.553-1.355-1.424-1.355-.737 0-1.323.38-1.859.925L9 7.652C9.87 6.677 11.06 6 12.517 6 14.527 6 16 7.024 16 9.139c0 2.345-2.914 3.138-2.663 5.467h-2.143zM12.266 19c-.871 0-1.524-.694-1.524-1.586 0-.892.653-1.586 1.524-1.586.887 0 1.54.694 1.54 1.586 0 .892-.653 1.586-1.54 1.586z"/></g><path d="M-176 23h375v30h-375z"/></g></svg>
			 </div>
			 <div class="file_div">
			 	<b>프로필 사진</b><br>
			 	<input class="upload_name" value="  파일선택" disabled="disabled">
				<label for="img_input"><a id="up_a">업로드</a></label> 
				<input type="file" name="file" id="img_input" accept="image/*">
			 </div>
		</div>	
		<div class="sign_info_div">
			<div class="id_div">
				<b>아이디</b><br>
				<input class="id_input" type="text" id="m_id" name="m_id" placeholder="  아이디를 입력해주세요.">
				<input class="id_chk_btn" type="button" id="idcheck" name="idcheck" value="중복확인">
			</div>
			<div class="pass_div">
				<b>비밀번호</b><br>
				<input class="pass_input" type="password" id="m_password" name="m_password" placeholder="  비밀번호를 입력해주세요.">
			</div>
			<div class="pass_chk_div">
				<b>비밀번호 재입력</b><br>
				<input class="pass_chk_input" type="password" id="m_password2" name="m_password2" placeholder="  한번 더 비밀번호를 입력해주세요.">
				<div id="alert-success">
					<input type="text" id="success_input" size="17px" readonly value="* 비밀번호가 일치합니다.">
				</div> 
				<div id="alert-danger">
					<input type="text" id="danger_input" size="23px" readonly value="* 비밀번호가 일치하지 않습니다.">
				</div>
			</div>
			<div class="name_div">
				<b>이름</b><br>
				<input class="name_input" type="text" id="m_name" name="m_name" placeholder="  이름을 입력해주세요.">
			</div>
			<div class="age_div">
				<b>나이</b><br>
				<input class="age_input" type="text" id="m_age" name="m_age" placeholder="  나이를 입력해주세요.">
			</div>
			<div class="gender_div">
				<b>성별</b><br>
				<select class="gender_select" name="m_gender">
					<option value="M">&nbsp;남자</option>
					<option value="W">&nbsp;여자</option>
				</select>
			</div>
			<div class="email_div">
				<b>이메일</b>
				<input type="text" id="mailCheck" value="인증필요" class="before" readonly>
				<svg id="why" xmlns="http://www.w3.org/2000/svg" width="17" height="17" viewBox="0 0 25 25"><g fill="none" fill-rule="evenodd"><g><circle cx="12.5" cy="12.5" r="12.5" fill="#BDBDBD"/><path fill="#FFF" d="M11.194 14.606c-.402-2.66 2.445-3.717 2.445-5.302 0-.826-.553-1.355-1.424-1.355-.737 0-1.323.38-1.859.925L9 7.652C9.87 6.677 11.06 6 12.517 6 14.527 6 16 7.024 16 9.139c0 2.345-2.914 3.138-2.663 5.467h-2.143zM12.266 19c-.871 0-1.524-.694-1.524-1.586 0-.892.653-1.586 1.524-1.586.887 0 1.54.694 1.54 1.586 0 .892-.653 1.586-1.54 1.586z"/></g><path d="M-176 23h375v30h-375z"/></g></svg><br>
				<input class="email_input" type="text" id="m_email" name="m_email" placeholder="  이메일을 입력해주세요.">
				<input class="email_chk_btn" type="button" value="이메일 인증" onClick='mail_check()'>
			</div> 
			<div class="phone_div">
				<b>휴대전화</b><br>
				<input class="phone_input" type="text" id="m_phone" name="m_phone" placeholder="  예) 010-XXXX-XXXX">
			</div>
			<div class="addr_div">
				<b>주소</b>
				<svg id="why_addr" xmlns="http://www.w3.org/2000/svg" width="17" height="17" viewBox="0 0 25 25"><g fill="none" fill-rule="evenodd"><g><circle cx="12.5" cy="12.5" r="12.5" fill="#BDBDBD"/><path fill="#FFF" d="M11.194 14.606c-.402-2.66 2.445-3.717 2.445-5.302 0-.826-.553-1.355-1.424-1.355-.737 0-1.323.38-1.859.925L9 7.652C9.87 6.677 11.06 6 12.517 6 14.527 6 16 7.024 16 9.139c0 2.345-2.914 3.138-2.663 5.467h-2.143zM12.266 19c-.871 0-1.524-.694-1.524-1.586 0-.892.653-1.586 1.524-1.586.887 0 1.54.694 1.54 1.586 0 .892-.653 1.586-1.54 1.586z"/></g><path d="M-176 23h375v30h-375z"/></g></svg><br>
				<input type="text" class="post_input" id="m_postcode" readonly placeholder="  우편번호">
				<input type="button" class="addr_btn" onclick="sample6_execDaumPostcode()" value="우편번호"><br>
				<input type="text" class="addr_input" id="m_address_road" name="m_address_road" readonly placeholder="  지번주소를 선택해주세요."><br>
				<input type="text" class="addr_input" id="m_address_detail" name="m_address_detail" placeholder="  상세주소를 입력해주세요.">
				<input type="text" class="addr_input" id="m_extraAddress" placeholder="  참고항목(선택)">
			</div>
		</div>
		<div class="btn_div">
			<input type="button" id="join" class="submit_btn" value="회원가입">
		</div>
	</form>
</div>
<script type="text/javascript">
$('#detail_btn').click(function() {
	Swal.fire({
		title: 
			'<strong id="m_title">※마이악어새 기본 프로필 사진</strong>',
		html: 
			'<div class="info_profile">' +
			'    <span id="m_span">사진을 정하지 않으면!</span>' +
			'    <div class="left_zone">' +
			'        <img class="info_img" src="resources/image/crocodile_profile.png"><br>' +
			'        <b id="point_txt">고객</b><br> <b>기본 프로필 사진</b>' +
			'    </div>' +
			'    <div class="right_zone">' +
			'        <img class="info_img" src="resources/image/bird_profile.png"><br>' +
			'        <b id="point_txt">근로자</b><br> <b>기본 프로필 사진</b>' +
			'    </div>' +
			'</div>' +
			'<div class="txt_zone">' +
			'    <span>*고객은 악어, 근로자는 악어새 입니다.</span>' +
			'</div>',
		confirmButtonColor: '#37B04B',
		confirmButtonText:
		    '확인'
	})
});
$('#why').click(function() {
	Swal.fire({
		html: '<b>마이악어새는 고객과 근로자의 안전을 위해 </b><br>' +
		      '<b>이메일 인증이 필요합니다!</b>',
		confirmButtonColor: '#37B04B',
		confirmButtonText:
		    '확인'
	})
});
$('#why_addr').click(function() {
	Swal.fire({
		html: '<b>마이악어새는 정확한 주소 위치를 확인하기 위해</b><br>' +
		      '<b>지번주소가 필요합니다!</b>',
		confirmButtonColor: '#37B04B',
		confirmButtonText:
		    '확인'
	})
});
var fileTarget = $('#img_input'); 
//파일 업로드 후 파일 이름 출력
fileTarget.on('change', function(){ 
	if(window.FileReader){ 
		var filename = $(this)[0].files[0].name; 
	} else { 
		var filename = $(this).val().split('/').pop().split('\\').pop(); 
	}
	$(this).siblings('.upload_name').val(filename); 
});
//파일 업로드 후 미리보기
$(function() {
    $("#img_input").on('change', function(){
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
</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
    	
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
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
                
            }
        }).open();
    }
    
</script>
</body>
</html>