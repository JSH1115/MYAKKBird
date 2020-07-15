<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="com.bit.myakkbird.member.*" %>
<%@ page import="com.bit.myakkbird.review.*" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
	String id = (String)session.getAttribute("m_id");
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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
body{
	padding: 0px;
	margin: 0px;
}
/* ------------------------------------------------ */
#header_container{
	display:flex;
	flex-direction:row;
	justify-content:space-between;
	width:100%;
	height:80px;
	background-color:white;
}
#header_container > div{
	display:flex;
	flex-direction:row;
	justify-content: space-around;
}
#main_logo{
	width: 360px;
	cursor:pointer;
}
.btn_header{
	width:100px;
	height:50px;
	padding-top:15px;
	border-radius: 10px;
	color:white;
	cursor:pointer;
} 
/* ------------------------------------------------ */
#body{
	display:flex;
	flex-direction: row;
}
#menu_container{
	top:100px;
	left:80px;
	display:flex;
	flex-direction: column;
	align-items: flex-start;
	flex-shrink:1;
	height:100%;
	width:600px;
	padding-left:10px;
	margin:0 30px 0 100px;
	border-left: solid 7px #37b04b;
}
#main{
	display:flex;
	flex-direction:column;
	align-items:center;
	flex-shrink:0;
	margin:0 300px 0 0;
}
.eachMenu{
	display:flex;
	flex-direction:row;
	justify-content:space-between;
	width:250px;
	height:30px;
	margin:10px;
	padding:10px;
	line-height:30px;
	border:4px solid #89df8f;
	border-radius:20px;
	box-shadow: -3px -3px 5px -3px #d3d3d3, 3px 3px 5px -3px #bbbaba;
	cursor: pointer;
}
.dir{
	font-weight: bold;
	color: #37b04b;
	font-size: 20px;
}
/* ------------------------------------------------ */
#profile_container, #review_container{
	text-align:center;
}
#profile_container{
	width:700px;
	margin:10px;
	background-color: #e6f7e4;
	border-radius: 50px;
	border: 2px solid gray;
	box-shadow: -15px -15px 20px -15px #d3d3d3, 15px 15px 20px -15px #a9a8a8;
}
#Profile{
	margin:20px;
}
#Profile table{
	font-size: 16px;
}
#Profile hr{
	width:300px;
	border: solid #e6f7e4 ;
}
#m_id h1{
	margin:0px;
	padding:13px;
	background-color: #89df8f;
	border-radius: 50px 50px 0 0;
	border-bottom: 2px solid black;
}
#m_photo{
	width:350px;
}
#m_photo img{
	width:330px; 
	height:330px;
 	border-radius: 330px; 
	border: 2px solid gray;
}
/* ------------------------------------------------ */
#review_container{
	width:700px;
	padding: 5px;
	border: solid gray 2px;
	border-radius:20px;
	box-shadow: -15px -15px 20px -15px #d3d3d3, 15px 15px 20px -15px #a9a8a8;
	
}
#review_container div{
	overflow: auto;
}
.eachReview{
	margin:10px;
	padding:10px;
	border:2px solid #89df8f;
	border-radius:20px;
}
.eachReview_info{
	display:flex;
	justify-content: space-around;
}
.review_profile{
	width:60px;
	height:60px;
	border-radius:60px;
}
.thumb_up_no img{
	width:30px;
	height:30px;
	cursor:pointer;
}
.thumb_up_yes img{
	width:30px;
	height:30px;
	cursor:pointer;
}
#like_yes{
	color:red;
}
.review_content{
	margin:10px;
	padding:10px;
	background-color: #e6f7e4;
	
}
#thumbnails{
	display:flex;
	flex-direction:row;
	width:650px;
	overflow-x:scroll;
}
#thumbnails img{
	width:100px;
	height:100px;
	cursor:pointer;
}
.big_photo{
	display:inline-block;
	width:630px;
	height:630px;
	margin:5px;
	cursor:pointer;
	
}
/* The Modal 스타일 시작 --------------------------------> */
/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top :  숫자가 클수록 상단에 위치 */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
/* Modal Content/Box */
.modal-content {
    background-color: #fefefe;
    margin: 15% auto; /* 15% from the top and centered */
    padding: 20px;
	border: solid 4px #37b04b;
	border-radius: 20px;
    width: 40%; /* Could be more or less, depending on screen size */                          
}
.modal-content textarea{
	width:90%;
	margin:10px;
	border: solid 3px #89df8f;
}
/* The Close Button */
.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}
.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}
/* The Modal 스타일 끝 <---------------------------------- */
#reviewform{
	display:flex;
	flex-direction: column;
	align-items:center;
	margin:10px; 
	padding:10px;
}
#btn_submit_review{
	width:10%;
	margin:10px;
}
</style>

<meta charset="UTF-8">
<title>mypage_profile3</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript"> 
	// 프로필 출력
	function getProfile(){
		$.ajax({
			url:'/myakkbird/getProfile.ak',
			type:'POST',
			dataType:'json',
			contentType:'application/x-www-form-urlencoded; charset=utf-8',
			success: function(memberVO){
				var id='';
				id += '<h1>'+ memberVO.m_id +'님의 프로필</h1>';
				$('#m_id').html(id);
				
				var pic='';
				pic += '<img src="/myakkbird/myakkbirdUpload/'+ memberVO.m_photo +'">'; 
				$('#m_photo').html(pic)
				
				var addr ='';
				addr += memberVO.m_address_road +'<br/>';
				addr += memberVO.m_address_detail +'<hr>';
				$('#m_addr').html(addr);
				
				var email='';
				email += memberVO.m_email+'<hr>';
				$('#m_email').html(email);
				
				var phone='';
				phone += memberVO.m_phone;
				$('#m_phone').html(phone);
				
				var btn='';
				
				$('.button').html(btn);
			}
		})
	}
	
	//프로필 수정 : input빈칸으로 바꾸기 
	function modifyProfile(){
		
		var exPhoto = '<%=memberVO.getM_photo()%>';
		$.ajax({
			url:'/myakkbird/getProfile.ak',
			type:'POST',
			dataType:'json',
			contentType:'application/x-www-form-urlencoded; charset=utf-8',
			success: function(memberVO){			
				var id='';
				id += '<h1>'+ memberVO.m_id +'님의 프로필 </h1>';
				$('#m_id').html(id);
				
				
		  		var pic='';
				if (exPhoto == 'null'){ /* 지정된 프로필 사진 없는 경우 */
					pic += '<div><img id="img_preview" src="img/crocodile_profile.png"><div>';
				}else{ /* 따로 프로필사진 지정한 경우 */
					pic += '<div><img id="img_preview" src="/myakkbird/myakkbirdUpload/'+ exPhoto +'">'; /* 원래 프로필사진 출력 */
					pic += '<input type="hidden" name="m_photo" value="'+ exPhoto +'"><div>'; /* 프로필사진 변경 안할 경우 원래 프로필사진을 던져줌  */
				}
				pic += '<input type="file" name="file" id="input_img">';
				$('#m_photo').html(pic); 
				 
				var addr ='';
				addr += '<div><input type="hidden" name="m_id" value="'+ memberVO.m_id +'">';
				addr += '<input type="text" size="30" name="m_address_road" value="'+ memberVO.m_address_road +'"><br/>';
				addr += '<input type="text" size="30" name="m_address_detail" value="'+ memberVO.m_address_detail +'"><hr>';
				$('#m_addr').html(addr);
				
				var email ='';
				email += '<input type="text" size="30" name="m_email" value="'+ memberVO.m_email +'"><hr>'
				$('#m_email').html(email);
				
				var phone='';
				phone +='<input type="text" size="30" name="m_phone" value="'+ memberVO.m_phone +'">'
				$('#m_phone').html(phone);
	
				var btn='';
				btn +='<input type="button" id="btn_modifyProcess" value="확인"/>'
				$('.button').html(btn);
				
				// 프로필 수정 > 파일 선택 클릭한 경우 미리보기로 출력
				$(document).on('change','#input_img',function(){
					function readURL(input){
						if(input.files && input.files[0]){
							var reader = new FileReader();
							
							reader.onload = function(e){
								$('#img_preview').attr('src',e.target.result);
							}
							reader.readAsDataURL(input.files[0]);
						}
					}
					 readURL(this); 
				}) 
				
				// 프로필 수정
				$(document).on('click','#btn_modifyProcess',function(event){
					var formData = new FormData($('#Profile')[0]);
					$.ajax({
						url : '/myakkbird/modifyProfileProcess.ak',
						type : 'POST',
						data : formData,
						dataType : "json", 
				        contentType : false,
				        enctype: 'multipart/form-data',
				        processData :false,			
				        success : function(retVal){
				        	if(retVal.res == "OK"){
				        		alert("프로필이 수정되었습니다");
				        		getProfile();	        		
				        	}else {
				        		alert("retVal 없대")
				        	}
				        },
				        error: function(){
				        	alert("ajaxxxxxxxxxx")
				        }
					});
				});
			},
			error: function(){
				alert("getProfile error")
			}
		});
	}
	
	// 리뷰썸네일 클릭시 큰화면으로 출력
	function getReviewDetail(e){ /* e : this(사진) */
		var pic = $(e).attr('id'); /* pic : r_up_file (.jpg) */
		var r_num = $(e).parents('.eachReview').attr('id'); /* x: 리뷰번호 (r_num) */ 
		
		$('#'+ r_num +'').children('.detail').css({
			'height':'650px',
			'display':'block'
		})
		
		var a ='';
		a += '<img src="/myakkbird/myakkbirdUpload/'+ pic +'" class="big_photo">';
		$('#'+ r_num +'').children('.detail').html(a);
	 }   
	 
	$(document).on('click','.detail',function(){
		$('.detail').css({
			'height' : '1px',
			'display' : 'none'
		})
	})
	// 리뷰 작성 모달창	
	$(document).on('click','#myBtn', function(){
		var modal = document.getElementById('myModal'); // 모달창
		var btn = document.getElementById("myBtn"); // 버튼
		var span = document.getElementsByClassName("close")[0]; // x     
		
	    modal.style.display = "block";
		
		$(document).on('click','.close',function(){
		    modal.style.display = "none";
		})
	})
	
	// 리뷰 수정버튼 누르면 : 모달창에 내용 출력
	function modifyReview(e){
		var modal = document.getElementById('myModal'); // 모달창
		var span = document.getElementsByClassName("close")[0]; // x     
	
	    modal.style.display = "block";
		
		$(document).on('click','.close',function(){
		    modal.style.display = "none"; 
		})
		
		var r_num = $(e).parent('.eachReview').attr('id');
		
		$.ajax({
			data: {r_num : r_num},
			url:'/myakkbird/modifyReview.ak',
			type:'POST',
			dataType:'json',
			contentType:'application/x-www-form-urlencoded; charset=utf-8',
			success:function(reviewVO){
				var a ='';
				a +='<span class="close">&times;</span>';
				a +='<form id="modifyreviewform" action="./modifyReviewProcess.ak" method="post">';
				a +='<input type="hidden" name="r_num" value="'+ reviewVO.r_num +'">';
				a +='<h4>'+ reviewVO.r_id +' 님의 후기 수정하기 </h4> 작성자 : '+ reviewVO.m_id;
				a +='<div> 평점 : <input type="number" name="r_star" min="0.5" max="5" step="0.5" value="'+ reviewVO.r_star +'" required></div>';
				a +='<textarea name="r_content" cols="50" rows="20" style="resize:none;" required>'+ reviewVO.r_content +'</textarea>';
				a +='<input type="submit" value="수정">';
				a +='</form>';	
				$('.modal-content').html(a);	
			},
			error:function(){
				alert("수정 error");
			}
		})
		
	}
		
</script>



</head>
<body>

<jsp:include page="../header_container.jsp">
	<jsp:param value="m_id" name="m_id"/>
</jsp:include> 


<section id="body">
	<div id="menu_container">
		<jsp:include page="./mypage_menu2.jsp">
			<jsp:param value="m_type" name="m_type"/>
		</jsp:include>
	</div>
		
<section id="main">
	<section id="profile_container">
		<span id="m_id">
			<h1> <%=memberVO.getM_name()%>&nbsp;(<%=memberVO.getM_id() %>)  </h1>
		</span>
		<form id ="Profile" action="./modifyProcess.ak" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td id="m_photo" rowspan="13">
						<% if ( memberVO.getM_photo() == null){ %>
						<img src="resources/image/crocodile_profile.png"/>
						<% } else{  %>
						<img src="/myakkbird/myakkbirdUpload/<%=memberVO.getM_photo()%>"/> 
						<% } %>
					</td>
					<td>회원구분</td>
				</tr>
				<tr>
					<td id="m_type"> <%=m_type %> <hr></td>
				</tr>
				<tr>
					<td>보유하트수</td>
				</tr>
				<tr>
					<td id="m_heart"> <%=memberVO.getM_heart() %> <hr> </td>
				</tr>
				<tr>
					<td>주소</td>
				</tr>
				<tr>
					<td id="m_addr"> 
						<%=memberVO.getM_address_road()%><br/>
						<%=memberVO.getM_address_detail()%><hr>
					</td>
				</tr>
				<tr>
					<td>이메일</td>
				</tr>
				<tr>
					<td id="m_email"><%=memberVO.getM_email() %><hr></td>
				</tr>
				<tr>
					<td>휴대전화</td>
				</tr>
				<tr>
					<td id="m_phone"><%=memberVO.getM_phone() %></td>
				</tr>
			</table>
		</form>
	</section> <!-- profile_container -->
	
	<span class="button">
		<img src="resources/image/btn_modify2.png" id="modifyForm" onclick="modifyProfile()" />
		<!-- <input type="button" id="modifyForm"  value="정보수정" onclick="modifyProfile()" /> -->
		<!-- <input type="button" id="getBack" value="돌아가기"/> -->
	</span>

	<section id=review_container>
	<% 
	List<ReviewVO> reviewList = (List<ReviewVO>)request.getAttribute("reviewList");
	
	if(reviewList.size() > 0){ // 리뷰 있으면 
		String avgStar = (String)request.getAttribute("avgStar").toString();
	%>
		<h3>리뷰 평점 : <%=avgStar %> / 5 </h3> 
		
	<script>
	/* 좋아요 누르면 */
	$(document).on('click','.thumb_up_no',function(event){ 
		var r_num = $(this).parents('.eachReview').attr('id');
		
		// 그림 바꿔주고 class명 변경
		var a = '<img src="resources/image/thumb_up_yes.png">'; 
		$(this).html(a);
		$(this).attr('class','thumb_up_yes');
		$.ajax ({
			url: '/myakkbird/likeReview.ak',
			type:'POST',
			data : {r_num : r_num},
			dataType:'json',
			contentType:'application/x-www-form-urlencoded; charset=utf-8',
			enctype : 'multipart/form-data',
			success : function(retVal){
		        	if(retVal.res == "OK"){
		        		console.log(retVal.like_cnt);
						// 좋아요 개수 + 1
			        	$('#'+ r_num +'').children('.eachReview_info').children('.like_cnt').html(retVal.like_cnt);
						
		        	}else {
		        		alert("좋아요 안됐어!");
		        	}
		        },
			error : function(){
				alert("'좋아요'할 수 없습니다");
			}
		});
			event.preventDefault(); 
	})  
		
	$(document).on('click','.thumb_up_yes',function(event){
		var r_num = $(this).parents('.eachReview').attr('id');
		
		//그림 바꿔주고 class명 변경
		var a = '<img src="resources/image/thumb_up_no.png">';
		$(this).html(a);
		$(this).attr('class','thumb_up_no');
		
		$.ajax({
			url:'/myakkbird/unlikeReview.ak',
			type:'POST',
			data : {r_num : r_num},
			dataType:'json',
			contentType:'application/x-www-form-urlencoded; charset=utf-8',
			enctype : 'multipart/form-data',
			success : function(retVal){
				if(retVal.res == "OK"){
					$('#'+ r_num +'').children('.eachReview_info').children('.like_cnt').html(retVal.like_cnt);					
				}else{
					alert("좋아요 취소 실패");
				}
			},
			error: function(){
				alert("'좋아요'를 취소할 수 없습니다");
			}
		});
		event.preventDefault();
	})	
		
		
		
		
	</script>
		
		
	<%	for (int i = 0; i <reviewList.size(); i++){ // 리뷰 개수만큼 리뷰 뿌려줄 칸 만들기
			ReviewVO reviewVO = (ReviewVO)reviewList.get(i);
	%> 
		<div id="<%=reviewVO.getR_num()%>" class="eachReview">
			
				<div class="eachReview_info"> <!-- 리뷰 정보 -->
					<img src="/myakkbird/myakkbirdUpload/<%=reviewVO.getM_photo()%>" class="review_profile">
				  	<span><%=reviewVO.getM_id() %></span>
				  	<span>평점 : <%=reviewVO.getR_star() %></span>
				 	<span><%=reviewVO.getR_date()%></span> 
				 	<% if (reviewVO.getL_check() == 0){ %> <!-- 좋아요 X 상태 -->
				 	<span class="thumb_up_no"><img src="resources/image/thumb_up_no.png"></span>
				 	<% } else { %> <!-- 좋아요 O 상태 -->
				 	<span  class="thumb_up_yes"><img src="resources/image/thumb_up_yes.png"></span>
				 	<% } %> 
				 	<span class="like_cnt"> <%=reviewVO.getR_like_cnt()%> </span>
				</div>
				
				<div class="review_content">
				  	<%=reviewVO.getR_content()%> <br/> <!-- 리뷰 내용 -->
				</div>
				
	
				<% if(reviewVO.getR_up_file() != null){ // 첨부사진 있을경우 
					String[] files = reviewVO.getR_up_file().split(","); %>
					

	 				<div id="thumbnails"> <!-- 썸네일부분-->
					<% if(files.length < 8){
						for (int j=0; j < files.length; j++){ %>
							<img src="/myakkbird/myakkbirdUpload/<%=files[j]%>" class="pic" id="<%=files[j]%>" onclick="getReviewDetail(this)" >
						<% } 
					} %> 	
					</div>		
					<div class="detail" ></div> <!-- 크게 보기 -->
				<% } %> 
				
				<% if (id.equals(reviewVO.getM_id())){ %>
				<button type="button" onclick="modifyReview(this)"> 수정 </button>
				<button type="button" onclick='location.href="deleteReview.ak?r_num=<%=reviewVO.getR_num()%>"'> 삭제 </button>
				<% } %>
			
		</div>	
			 
	<% } 
	} else{%>
		리뷰가 없습니다.
	<% } %>
	<br/>
	</section>	<!-- review_container -->
	
	<!-- (Modal)리뷰작성 -->
	
	<% 
	/* String matchedPpl = (String)request.getAttribute("matchedPpl");
	int hasWritten = ((Integer)request.getAttribute("hasWritten")).intValue(); */
	
	/* if(id.equals(matchedPpl)){
		if(hasWritten == 0){ */%>
		<button id="myBtn">리뷰 작성</button>
		 
		<div id="myModal" class="modal">
			
			<div class="modal-content">
			
				<span class="close">&times;</span> 
				                                              
				<form id="reviewform" name="reviewform" action="./writeReview3.ak" method="post" enctype="multipart/form-data">
					<input type="hidden" name="r_id" value="<%=memberVO.getM_id()%>">
					<input type="hidden" name="m_id" value="<%=id%>">
					
					<h3><%=memberVO.getM_id()%>님에게 후기 작성하기</h4> 
					<div>평점 : <input type="number" name="r_star" min="0.5" max="5" step="0.5" required> </div>
					<textarea name="r_content" cols="50" rows="20" style="resize:none;" required></textarea>
					
					<input type="file" id="review_img" name="file1" multiple>
					
				 	<input type="submit" value="확인" id="btn_submit_review" >
				 	 <a href="javascript:reviewform.submit()">확인</a>
					
				</form> 
				
					<div id="review_img_preview"></div>
			</div>
		</div>
	<%-- <%}
	} %> --%>
<!-- 
</section> main
</section> body
 -->
<!-- /*리뷰 좋아요*/
create table liketo(
    l_num number,
    r_num number,
    m_id varchar2(50),
    l_check number default 0 null,
    constraint like_l_num_pk primary key(l_num),
    constraint like_r_num_fk foreign key(r_num) references review(r_num), 
    constraint like_m_id_fk foreign key(m_id) references member(m_id)
);
select * from liketo;
drop table liketo;
-- 리뷰 좋아요기능 시퀀스, 트리거
create sequence sequence_liketo_l_num start with 1 increment by 1;
create or replace trigger trigger_liketo_l_num
    before insert on liketo
    for each row
begin
    select sequence_liketo_l_num.nextval into :new.l_num from dual;
end;
/ -->

</body>
</html>