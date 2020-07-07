<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.bit.myakkbird.member.*" %>
<%@ page import="com.bit.myakkbird.review.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	String id = (String)session.getAttribute("id");
	MemberVO memberVO = (MemberVO)request.getAttribute("memberVO");	
	
	System.out.println("회원타입:"+memberVO.getM_type());
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

<style>
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
    border: 1px solid #888;
    width: 50%; /* Could be more or less, depending on screen size */                          
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
				pic += '<td rowspan="13" style="vertical-align: middle; width:300px;">';
				/* pic += '<img id="img_preview" src="resources/image/crocodile_profile.png" style="width:300px; height:300px;">'; */			
				pic += '<img src="/myakkbird/myakkbirdUpload/'+ memberVO.m_photo +'" style="width:300px; height:300px;"></td>'; 
				$('#m_photo').html(pic)
				
				var addr ='';
				addr += '<td>'+ memberVO.m_address_road +'<br/>';
				addr += memberVO.m_address_detail +'<hr></td>';
				$('#m_addr').html(addr);
				
				var email='';
				email += '<td>'+ memberVO.m_email+'<hr></td>';
				$('#m_email').html(email);
				
				var phone='';
				phone += '<td>'+ memberVO.m_phone+'</td>';
				$('#m_phone').html(phone);
				
				var btn='';
				btn += '<input type="button" value="돌아가기"/> '
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
				pic += '<input type="file" name="file" id="input_img">';
				if (exPhoto == 'null'){ /* 지정된 프로필 사진 없는 경우 */
					pic += '<div><img id="img_preview" src="img/crocodile_profile.png" style="width:300px; height:300px;"><div>';
				}else{ /* 따로 프로필사진 지정한 경우 */
					pic += '<div><img id="img_preview" src="/myakkbird/myakkbirdUpload/'+ exPhoto +'" style="width:300px; height:300px;" >'; /* 원래 프로필사진 출력 */
					pic += '<input type="hidden" name="m_photo" value="'+ exPhoto +'"><div>'; /* 프로필사진 변경 안할 경우 원래 프로필사진을 던져줌  */
				}
				$('#m_photo').html(pic); 
				 
				var addr ='';
				addr += '<div><input type="hidden" name="m_id" value="'+ memberVO.m_id +'">';
				addr += '<td><input type="text" size="30" name="m_address_road" value="'+ memberVO.m_address_road +'"><br/>';
				addr += '<td><input type="text" size="30" name="m_address_detail" value="'+ memberVO.m_address_detail +'"><hr></td>';
				$('#m_addr').html(addr);
				
				var email ='';
				email += '<td><input type="text" size="30" name="m_email" value="'+ memberVO.m_email +'"></td><hr>'
				$('#m_email').html(email);
				
				var phone='';
				phone +='<td><input type="text" size="30" name="m_phone" value="'+ memberVO.m_phone +'"></td>'
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
	function getReviewDetail(e){
		var pic = $(e).attr('id');
		var x = $(e).parents('.eachReview').attr('id');
		
		$('#'+ x +'').children('.detail').css({
			'height':'500px',
			'display':'block'
		})
		
		var a ='';
		a += '<img src="/myakkbird/myakkbirdUpload/'+ pic +'" style="width:350px; height:350px;">';
		$('#'+ x +'').children('.detail').html(a);
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
		console.log(r_num);
		
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
	
<section>
	<form id ="Profile" action="./modifyProcess.ak" method="post" enctype="multipart/form-data">
	<span id="m_id">
		<h1> <%=memberVO.getM_id() %>님의 프로필  </h1>
	</span>
		<table>
			<tr>
				<td id="m_photo" rowspan="13" style="vertical-align:top; width:300px; text-align: center; border: 1px solid gray;">
				<% if ( memberVO.getM_photo() == null){ %>
				<img src="resources/image/crocodile_profile.png" style="width:300px; height:300px;"/>
				<% } else{  %>
				<img src="/myakkbird/myakkbirdUpload/<%=memberVO.getM_photo()%>" style="width:300px; height:300px;"/> 
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
			<tr>
				<td id="hidden"></td>
			</tr>
		</table>
	</form>
	<div class="button">
		<input type="button" id="modifyForm"  value="정보수정" onclick="modifyProfile()" />
		<input type="button" id="getBack" value="돌아가기"/>
	</div>
</section>

<section>
<% 
List<ReviewVO> reviewList = (List<ReviewVO>)request.getAttribute("reviewList");

if(reviewList.size() > 0){ // 리뷰 있으면 
	String avgStar = (String)request.getAttribute("avgStar").toString();
%>
	<h3>리뷰 평점 : <%=avgStar %> / 5 </h3> 
	
	
<%	for (int i = 0; i <reviewList.size(); i++){ // 리뷰 개수만큼 리뷰 뿌려줄 칸 만들기
		ReviewVO reviewVO = (ReviewVO)reviewList.get(i);
%> 
	<div id="<%=reviewVO.getR_num()%>" class="eachReview" style="width:500px;">
		
			<div style="display:flex; justify-content:space-around;"> <!-- 리뷰 정보 -->
			  	<span><%=reviewVO.getM_id() %></span>
			  	<span>평점 : <%=reviewVO.getR_star() %></span>
			 	<span><%=reviewVO.getR_date()%></span> 
			</div>
			
			<div>
			  	<%=reviewVO.getR_content()%> <br/> <!-- 리뷰 내용 -->
			</div>
			

			<% if(reviewVO.getR_up_file() != null){ // 첨부사진 있을경우 
				String[] files = reviewVO.getR_up_file().split(","); %>
				
			<div style="display:flex; flex-direction: column; height:120px;"> <!-- 사진뿌려줄 공간만들기 -->
			
 				<div id="thumbnails" style="width:450px; display:flex; flex-direction:row; overflow-x:scroll;"> <!-- 썸네일부분-->
				<% if(files.length < 8){
					for (int j=0; j < files.length; j++){ %>
						<img src="/myakkbird/myakkbirdUpload/<%=files[j]%>" class="pic" id="<%=files[j]%>" onclick="getReviewDetail(this)"  style="width:100px; height:100px">
					<% } 
				} %> 	
				</div>		
			</div>
			<div class="detail" style="width:400px; height:10px;"></div> <!-- 크게보기 -->
			<% } %> 
			
			<% if (id.equals(reviewVO.getM_id())){ %>
			<button type="button" onclick="modifyReview(this)"> 수정 </button>
			<button type="button" onclick='location.href="deleteReview.ak?r_num=<%=reviewVO.getR_num()%>"'> 삭제 </button>
			<% } %>
		<hr/>
	</div>	
		 
<% } 
} else{%>
	리뷰가 없습니다
<% } %>
<hr/><br/>

<script>

/* $(document).on('change','#review_img',function(){
	function readPic(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#review_img_preview').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	readPic(this);
}) */

var sel_files =[];
$(document).ready(function(){
	$("#review_img").on("change", handleImgsFilesSelect);
});

function handleImgsFilesSelect(e){
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f){
		sel_files.push(f);
		
		var reader = new FileReader();
		reader.onload = function(e){	
			<%-- <img src="/fileupload/upload/<%=files[j]%>" --%>
			console.log(e.target.result);
			/* var img_html = '<img src="/fileupload/upload/'+ e.target.result +'">'; */
			var img_html = '<img src=\"' + e.target.result + '\" />';
			$(".review_img_preview").append(img_html);
		}
		reader.readAsDataURL(f);
	});
}


</script>


<% 
String matchedPpl = (String)request.getAttribute("matchedPpl");
int hasWritten = ((Integer)request.getAttribute("hasWritten")).intValue();

if(id.equals(matchedPpl)){
	if(hasWritten == 0){%>
	<button id="myBtn">리뷰 작성</button>
	 
	<div id="myModal" class="modal">
		
		<div class="modal-content">
		
			<span class="close">&times;</span> 
			                                              
			<form id="reviewform" name="reviewform" action="./writeReview3.ak" method="post" enctype="multipart/form-data">
				<input type="hidden" name="r_id" value="<%=memberVO.getM_id()%>">
				<input type="hidden" name="m_id" value="<%=id%>">
				
				<h4><%=memberVO.getM_id()%> 님에게 후기 작성하기</h4> 작성자 : <%=id%>
				<div>평점 : <input type="number" name="r_star" min="0.5" max="5" step="0.5" required> </div>
				<textarea name="r_content" cols="50" rows="20" style="resize:none;" required></textarea>
				
				<input type="file" id="review_img" name="file1" multiple>
				
			 	<input type="submit" value="확인" >
			 	<a href="javascript:reviewform.submit()">확인</a>
				
			</form> 
			
				<div id="review_img_preview"></div>
		</div>
	</div>
<%}
} %>
</section>


</body>
</html>