<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.bit.myakkbird.member.*" %>
    
<%
	String id = (String)session.getAttribute("id");
	MemberVO memberVO = (MemberVO)request.getAttribute("memberVO");

 	//System.out.println(memberVO.getM_type()+"멤버타입");
 	
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

header{
text-align: center;
}


.button{
	width:100%;
	font-size:17px;
	padding:5px;
	margin:10px 2px;
	text-align:center;
	color:white;
	border-radius:8px;
	line-height:25px;
	display:flex;
	flex-direction:row;
	justify-content: center;
}

#modifyProfile, #btn_modifyProfile{
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

</style>


<meta charset="UTF-8">
<title>mypage_profile</title>
</head>
<body>


<section id="profile_form">
	<header>
		<h1> <%=memberVO.getM_name()%>님의 프로필  </h1>
	</header>
	<form>
		<table>
			<tr>
				<td rowspan="10" style="vertical-align: middle; width:300px; text-align: center; border: 1px solid gray;">사진</td>
				<td>회원구분</td>
			</tr>
			<tr>
				<td> <%=m_type%> <hr> </td>
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
				<td> 
					<%=memberVO.getM_address_road()%><br/>
					<%=memberVO.getM_address_detail()%><hr>
				</td>
			</tr>
			<tr>
				<td>이메일</td>
			</tr>
			<tr>
				<td><%=memberVO.getM_email() %><hr></td>
			</tr>
			<tr>
				<td>휴대전화</td>
			</tr>
			<tr>
				<td><%=memberVO.getM_phone() %><hr></td>
			</tr>
		</table>
	</form>
	<footer class="button">
		<input type="button" id="modifyProfile"  value="수정"/>
		<input type="button" id="getBack" value="돌아가기"/>
	</footer>
</section>

<script>	
$('#modifyProfile').click(function(event){
	var m_name = '<%=memberVO.getM_name()%>';
	var m_type = '<%=m_type%>';
	var m_heart = '<%=memberVO.getM_heart()%>';
	var m_address_road = '<%=memberVO.getM_address_road()%>';
	var m_address_detail = '<%=memberVO.getM_address_detail()%>';
	var m_email = '<%=memberVO.getM_email() %>';
	var m_phone = '<%=memberVO.getM_phone() %>';
	var m_id = '<%=id%>';
	
	var a ='';
	a +='<header> <h1>'+ m_name +'님의 프로필  </h1> </header>'
	a +='<form id="modifyProfileForm" action="./modifyProfile.ak" method="post">';
	a +='<table >';
	a +='<tr>';
	a +='<input type="hidden" name="m_name" value="'+ m_name +'">';
	a +='<input type="hidden" name="m_type" value="'+ m_type +'">';
	a +='<input type="hidden" name="m_id" value="'+ m_id +'">';
	a +='<td rowspan="12" style="vertical-align: middle; width:300px; text-align: center;">사진 </td>';
	a +='<td> 회원구분 </td>';
	a +='</tr>';
	a +='<tr>';
	a +='<td>'+ m_type +'<hr> </td>';
	a +='</tr>';
	a +='<tr>';
	a +='</tr>';
	a +='<tr>';
	a +='<td> 보유하트수 </td>';
	a +='</tr>';
	a +='<tr>';
	a +='<td>'+ m_heart +' <hr> </td>';
	a +='</tr>';
	a +='<tr>';
	a +='<td> 주소 </td>';
	a +='</tr>';
	a +='<tr>';
	a +='<td> <input type="text" size="30" name="m_address_road" value="'+ m_address_road +'"> <br/>';
	a +='<input type="text" size="30" name="m_address_detail" value="'+ m_address_detail +'"> <hr> </td>';
	a +='</tr>';
	a +='<tr>';
	a +='<td> 이메일 </td>';
	a +='</tr>';
	a +='<tr>';
	a +='<td> <input type="text" size="25" name="m_email" value="'+ m_email +'"> <hr> </td>';
	a +='</tr>';
	a +='<tr>';
	a +='<td> 휴대전화 </td>';
	a +='</tr>';
	a +='<tr>';
	a +='<td> <input type="text" size="25" name="m_phone" value="'+ m_phone +'"><hr> </td>';
	a +='<tr>';
	a +='</table>';
	a +='<form>';
	a +='<footer class="button">';
	a +='<input type="button" id="btn_modifyProfile" value="수정"/>';
	a +='<input type="button" id="getBack" value="돌아가기" />';
	a +='</footer>';
	
	$('#profile_form').html(a);
	})
	
$(document).on('click','#btn_modifyProfile',function(event){
	$('#modifyProfileForm').submit();

})



</script>

</body>
</html>