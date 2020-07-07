<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.bit.myakkbird.mypage.*" %>
<%
	int b_num = Integer.parseInt(request.getAttribute("b_num").toString());
	
	BoardVO name_vo = (BoardVO)request.getAttribute("name_vo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@media only screen and (min-width:860px) { .CHMRN { max-width: 600px; margin: 20px auto } }
.ClJHU { text-align: center; margin: 20px 0 }
.ClJHU>img { border-radius: 60px; margin-bottom: 10px }
.ClJHU ._2p8ES { font-size: 14px; color: #585858 }
.ClJHU ._2k1eb { font-size: 15px; color: #585858; display: inline-block; margin-left: 5px; font-weight: 500 }
._2_cZ6 { font-weight: 700 }
._2ateS, ._2_cZ6 { font-size: 16px;	line-height: 1.25; text-align: left; color: #3d3d3d }
._2ateS { font-weight: 500;	margin: 15px 0 width: 100%; height: 1px; padding: 15px; background-color: #f5f5f5; resize: none; border: none; margin-left: -20px; font-weight: 400; font-size: 13px; line-height: 0.3; text-align: left; color: #585858;}
._1NQW0 { margin-top: 40px }
._1NQW0>textarea { width: 100%; height: 249px; padding: 20px; background-color: #f5f5f5; resize: none; border: none; margin-left: -20px; font-weight: 400; font-size: 13px; line-height: 1.54; text-align: left; color: #585858 }
._3E-zP { font-size: 12px; color: #3d3d3d; margin: 20px 0 }
._3jyGn { margin: 41px 5px;	font-size: 25px; line-height: 1.5; text-align: center }
</style>

<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script> 

 <script>

//신고 등록

function chk_form(){
	
	//신고유형 체크
	if(!(document.danger_form.d_type[0].checked == true  || document.danger_form.d_type[1].checked == true 
	  || document.danger_form.d_type[2].checked == true) || document.danger_form.d_type[3].checked == true || document.danger_form.d_type[4].checked == true){	
		$('#dan_typeid').css("color", "red");
		return false;
	}
	
	//신고내용 체크
	if(document.danger_form.d_con.value == "")	{
		$('#dan_conid').css("color", "red");
		document.danger_form.d_con.focus();
		return false;
	}
	dangerFormSubmit();
}

function dangerFormSubmit() {
	alert("신고완료");
	document.danger_form.submit();
}
</script> 
</head>
<body>
		
	<form name="danger_form" action="insertBoardDangerAction.ak?b_num=<%=b_num %>" method="post" enctype="multipart/form-data"> 
	<input type="hidden" name="m_id" value="${m_id }" />
	<div class="CHMRN">
	<div>
		<div style="color: rgba(0, 0, 0, 0.87); background-color: white; transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; box-sizing: border-box; font-family: &amp; quot; Noto Sans KR&amp;quot; , sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-shadow: none; border-radius: 0px; position: relative; z-index: 1100; width: 100%; display: flex; padding-left: 24px; padding-right: 24px;">
			<div style="margin-top: 8px; margin-right: 8px; margin-left: -16px;">
				<a href="javascript:history.back();">
				<button tabindex="0" type="button" style="border: 10px; box-sizing: border-box; display: inline-block; font-family: &amp; quot; Noto Sans KR&amp;quot; , sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); cursor: pointer; text-decoration: none; margin: 0px; padding: 12px; outline: none; font-size: 0px; font-weight: inherit; position: relative; z-index: 1; overflow: visible; transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; width: 48px; height: 48px; background: none;">
					<div>
						<svg viewBox="0 0 24 24" style="display: inline-block; color: rgba(0, 0, 0, 0.87); fill: black; height: 24px; width: 24px; user-select: none; transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms;">
							<path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path></svg>
					</div>
				</button></a>
			</div>
			<div style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; margin: 0px; padding-top: 0px; letter-spacing: 0px; font-size: 24px; font-weight: 400; color: rgb(255, 255, 255); height: 64px; line-height: 64px; flex: 1 1 0%;">
				<span style="color: black; font-size: 20px; font-weight: 400; vertical-align: top; text-align: center; display: block; position: absolute; width: 200px; 
				left: calc(50% - 100px);">신고하기</span>
			</div>
			<div style="margin-top: 8px; margin-right: -16px; margin-left: auto;">
				<button name="dangerSubmitBtn" type="button" tabindex="0" style="border: 1px solid rgb(0, 174, 153); box-sizing: border-box; display: inline-block; font-family: &amp; quot; Noto Sans KR&amp;quot; , sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); cursor: pointer; text-decoration: none; margin: 7px 0px 0px; padding: 0px; outline: none; font-size: inherit; font-weight: inherit; position: relative; z-index: 1; height: 36px; line-height: 36px; min-width: 0px; color: rgb(255, 255, 255); transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; border-radius: 2px; user-select: none; overflow: hidden; background-color: rgba(0, 0, 0, 0); text-align: center; width: 70px;"
				 onclick="chk_form()">
					<div>
						<span style="position: relative; padding: 0px; vertical-align: top; letter-spacing: 0px; text-transform: uppercase; font-weight: 500; font-size: 14px; 
						color: rgb(0, 174, 153);">제출</span>
					</div>
				</button>
			</div>
		</div>
		<div style="padding: 0px 20px;">
			<div class="ClJHU">
				<img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/joinNew/n-child.png"
					width="60" height="60" alt="신고대상"> <br>
				<span class="_2p8ES">no. <%=b_num %></span>
				<span class="_2k1eb"><%=name_vo.getM_name1() %>○<%=name_vo.getM_name2() %></span>
			</div>
			<div class="_2_cZ6">
				<h3 id="dan_typeid" class="_2ateS">신고 유형을 선택해주세요.</h3>
				<div>
					<div style="cursor: pointer; position: relative; overflow: visible; display: table; height: 35px; width: 100%;">
						<input type="radio" name="d_type" value="A" >   허위정보를 기재하였습니다.
					</div>
					<div style="cursor: pointer; position: relative; overflow: visible; display: table; height: 35px; width: 100%;">
						<input type="radio" name="d_type" value="B" >   음란성 / 부적절한 게시물 입니다.
					</div>
					<div style="cursor: pointer; position: relative; overflow: visible; display: table; height: 35px; width: 100%;">
						<input type="radio" name="d_type" value="C" >   도배/홍보성 게시물 입니다.
					</div>
					<div style="cursor: pointer; position: relative; overflow: visible; display: table; height: 35px; width: 100%;">
						<input type="radio" name="d_type" value="D" >   규정을 위반하였습니다.
					</div>
					<div style="cursor: pointer; position: relative; overflow: visible; display: table; height: auto; width: 100%;">
						<input type="radio" name="d_type" value="E" >   기타
					</div>
				</div>
			</div>
			<div class="_1NQW0">
				<h3 id="dan_conid" class="_2ateS">신고 내용을 입력해주세요.</h3>
				<textarea placeholder="예). 부적절한 사진이 올라가 있습니다." name="d_con"></textarea>
			</div>
			<p class="_3E-zP">
				* 이 회원이 신고대상에 해당하는지 다시 한번 확인하여 주시기 바랍니다. <br>
				<br>* 신고 내용이 등록되면, 악어새팀이 조사에 들어갈 것입니다. <br>
				<br>* 신고자와 신고 내용은 외부에 공개되지 않습니다. <br>
				<br>* 신고된 회원은 마이악어새 약관에 따라 이용 제재 등 불이익을 받을 수 있습니다. <br>
				<br>
			</p>
		</div>
	</div>
	</div>
	</form>
</body>
</html>