<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.bit.myakkbird.member.*" %>
<%@ page import="com.bit.myakkbird.review.*" %>
<%@ page import="java.text.SimpleDateFormat" %>

    
<%
	String id = (String)session.getAttribute("id");
	MemberVO memberVO = (MemberVO)request.getAttribute("memberVO");	
	
	  	 String m_type;
	 	if(memberVO.getM_type().equals("C")){ 
	 		m_type = "고객";
		}else if (memberVO.getM_type().equals("E")){ 
			m_type = "근로자";
		}else{ 
			m_type = "알 수 없는 회원입니다.";
		}   
	

%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<style>

.button{
	width:100%;
	font-size:17px;
	padding:5px;
	margin:10px 2px;
	color:white;
	border-radius:8px;
	line-height:25px;
	display:flex;
	flex-direction:row;}

#modifyForm, #modifyProcess, .writeReview{
	width:80px;
	margin:5px;
	padding:10px;
	border-radius:5px;
	background:#89df8f;
	color:white;
	text-decoration: none;
	box-shadow: 2px 2px 2px gray;
}

#getBack{
	width:80px;
	margin:5px;
	padding:10px;
	border-radius:5px;
	background:#37b04b;
	color:white;
	text-decoration: none;
	box-shadow: 2px 2px 2px gray;
}

.reviewPics > *{
	border:solid 1px gray;
	width:200px;
	height:200px;
}

</style>

<script>
$(document).ready(function(){
	$('#modifyForm').click(function(event){
		var m_id = '<%=id%>';
		var m_name ='<%=memberVO.getM_name()%>';
		var m_address_road = '<%=memberVO.getM_address_road()%>';
		var m_address_detail = '<%=memberVO.getM_address_detail()%>';
		var m_email = '<%=memberVO.getM_email() %>';
		var m_phone = '<%=memberVO.getM_phone() %>';
		var m_type = '<%=memberVO.getM_type()%>';
		var m_heart ='<%=memberVO.getM_heart()%>';
		
		var id='';
		id += '<h1>'+ m_name +'님의 프로필 </h1>'
		$('#id').html(id);
		
  		var pic='';
		pic += '<td><input type="file" name="file" value="사진변경">';
		pic += '</td>';
		$('#0').html(pic); 
		 
		 
		var deault ='';
		deault += '<div><input type="hidden" name="m_id" value="'+ m_id +'">';
		deault += '<td><input type="text" size="30" name="m_address_road" value="'+ m_address_road +'"><br/>';
		deault += '<td><input type="text" size="30" name="m_address_detail" value="'+ m_address_detail +'"><hr></td>';
		$('#1').html(deault);
		
		var email ='';
		email += '<div><input type="text" size="30" name="m_email" value="'+ m_email +'"></div><hr>'
		$('#2').html(email);
		
		var phone='';
		phone +='<div><input type="text" size="30" name="m_phone" value="'+ m_phone +'"></div>'
		$('#3').html(phone);
		
		var hidden='';
		hidden +='<td><input type="hidden" name="m_type" value="'+ m_type +'"></td>';
		hidden +='<td><input type="hidden" name="m_heart" value="'+ m_heart +'"></td>';
		hidden +='<td><input type="hidden" name="m_name" value="'+ m_name +'"></td>'
		$('#4').html(hidden);
		
		var btn='';
		btn +='<input type="button" id="modifyProcess" value="확인"/>'
		$('.button').html(btn);
		
	});

	$(document).on('click','#modifyProcess',function(event){
		$('#Profile').submit();
	});
	
	
});
</script>

<meta charset="UTF-8">
<title>mypage_profile2</title>
</head>
<body>


<section>
	<form id ="Profile" action="./modifyProfile.ak" method="post" enctype="multipart/form-data">
	<span id="id">
		<h1> <%=memberVO.getM_name()%>님의 프로필  </h1>
	</span>
		<table>
			<tr>
				<td id="0" rowspan="13" style="vertical-align: middle; width:300px; text-align: center; border: 1px solid gray;">
				<img src="/myakkbird/myakkbirdUpload/<%=memberVO.getM_photo()%>" style="width:300px; height:300px;"/>
				<td>회원구분</td>
			</tr>
			<tr>
				<td> <%=m_type %> <hr> </td>
			</tr>
			<tr>
				<td>보유하트수</td>
			</tr>
			<tr>
				<td> <%=memberVO.getM_heart() %> <hr> </td>
			</tr>
			<tr>
				<td>주소</td>
			</tr>
			<tr>
				<td id="1"> 
					<%=memberVO.getM_address_road()%><br/>
					<%=memberVO.getM_address_detail()%><hr>
				</td>
			</tr>
			<tr>
				<td>이메일</td>
			</tr>
			<tr>
				<td id="2"><%=memberVO.getM_email() %><hr></td>
			</tr>
			<tr>
				<td>휴대전화</td>
			</tr>
			<tr>
				<td id="3"><%=memberVO.getM_phone() %></td>
			</tr>
			<tr>
				<td id="4"></td>
			</tr>
		</table>
	</form>
	<div class="button">
		<input type="button" id="modifyForm"  value="정보수정"/>
		<input type="button" id="getBack" value="돌아가기"/>
	</div>
</section>

<section>
<% 
List<ReviewVO> reviewList = (List<ReviewVO>)request.getAttribute("reviewList");

if(reviewList.size() > 0){
	String avgStar = (String)request.getAttribute("avgStar").toString();
%>
<h3>리뷰 평점 : <%=avgStar %> / 5</h3> 
<%	for (int i = 0; i <reviewList.size(); i++){
		ReviewVO vo = (ReviewVO)reviewList.get(i);
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM//dd(E)");
		String time = format.format(vo.getR_date());
	%> 
		<div style="width:500px">
			<div style="display:flex; justify-content:space-around;">
			  	<span><%=vo.getM_id() %></span>
			  	<span>평점 : <%=vo.getR_star() %></span>
			  	<span><%=time%></span>
			</div>
<%-- 			<% if(vo.getR_org_file() != null){ %> 
			<div class="reviewPics">
				<span>[사진] <%=vo.getR_up_file() %></span>
			</div>
			<% } %>  --%>
			<div>
			  	<%=vo.getR_content()%><hr/>
			</div>
		</div>	
	<% } 
} else{%>
	리뷰가 없습니다
<% } %>

</section>

<form id="multiform" action="profilePhoto.ak" method="post" enctype="multipart/form-data">
	파일 : <input type="file" name="file"/><br><br>	
	<input type="button" value="서버전달1" onclick="document.getElementById('multiform').submit()"/>
</form> 

<form id="form">
   <input type='file' id="imgInput"/>
   <img id="image_section" src="#" alt="your image"/>
</form>
<script>
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#image_section').attr('src', e.target.result);
			}

			reader.readAsDataURL(input.files[0]);
		}
	}

	$("#imgInput").change(function() {
		readURL(this);
	});
</script>





<form id="form" runat="server">
   <input type='file' id="imgInput"/>
   <img id="image_section" src="#" alt="your image"/>
</form>
<script>
function readURL(input) {
	 if (input.files && input.files[0]) {
	  var reader = new FileReader();
	  
	  reader.onload = function (e) {
	   $('#image_section').attr('src', e.target.result);  
	  }
	  
	  reader.readAsDataURL(input.files[0]);
	  }
	}
	  
	$("#imgInput").change(function(){
	   readURL(this);
	});
</script>


</body>
</html>