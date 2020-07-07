<%@page import="com.bit.myakkbird.member.MemberVO"%>
<%@page import="com.bit.myakkbird.mypage.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardVO boardVO = (BoardVO)request.getAttribute("boardVO");
%>
<!DOCTYPE html>
<html> 
<head>
	<meta charset="UTF-8">
	<title>마이 악어새</title>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<!-- 유효성 검사 jquery API -->
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.0/jquery.validate.min.js" ></script>
	<!-- 유효성 검사 jquery API -->
	<script type="text/javascript">
		$(document).ready(function () {
			$('#submit_btn').click(function (event) {
				var vaildator = $('#board_form_id').validate({
					rules: {
						b_category: { 
							required: true 
						},
						b_address_road: { 
							required: true 
						},
						b_address_detail: { 
							required: true 
						},
						b_money: { 
							required: true,
							digits: true
						},
						b_start: { 
							required: true
						},
						b_end: { 
							required: true 
						},
						b_d_detail: { 
							required: true
						},
						b_subject: { 
							required: true,
							minlength: 5,
							maxlength: 25
						},
						b_content: { 
							required: true,
							minlength: 15
						}
			        },
			        messages: {
			        	b_category: { 
			        		required: "청소종류를 선택하세요!" 
			        	},
			        	b_address_road : { 
			        		required: "지번 주소를 선택하세요!" 
			        	},
			        	b_address_detail : { 
			        		required: "상세 주소를 입력해주세요!" 
			        	},
			        	b_money: { 
			        		required: "시급을 자세히 입력해주세요!",
			        		digits: "숫자만 입력해주세요!"
			        	},
			        	b_start: { 
			        		required: "청소 시작일을 선택하세요!" 
			        	},
			        	b_end: { 
			        		required: "청소 종료일을 선택하세요!" 
			        	},
			        	b_d_detail: { 
			        		required: "상세 근무시간을 자세히 입력해주세요!"
			        	},
			        	b_subject: { 
			        		required: "게시글 제목을 입력해주세요!",
			        		minlength: "최소 5글자 이상은 입력해주세요!",
			        		maxlength: "최대 25글자만 입력가능합니다!"
			        	},
						b_content: { 
							required: "상세설명을 입력해주세요!",
							minlength: "최소 15글자 이상은 입력해주세요!"
						}
			        }
				});
			});
		});
		
		$(document).ready(function(){ 
			
			$(window).scroll(function() {
				if($( this).scrollTop() > 200 ) {
					$('.top').fadeIn();
				} else {
					$('.top').fadeOut();
				}
			});

			$('.top').click(function() {
				$('html, body').animate({ scrollTop : 0 }, 400);
				return false;
			});
			
		});
		
		$(document).ready(function(){ 
			var fileTarget = $('#img_input'); 
			
			fileTarget.on('change', function(){ 
				if(window.FileReader){ 
					var filename = $(this)[0].files[0].name; 
				} else { 
					var filename = $(this).val().split('/').pop().split('\\').pop(); 
				}
				$(this).siblings('.upload_name').val(filename); 
			}); 
		});

		$(document).ready(function() {
			
			$('.btn_default_addr').click(function() {
				$('.address_div_left').hide();
				$('#addr').hide();
				$('#d_addr').hide();
				$('#sample6_address').attr('disabled', true);
				$('#sample6_detailAddress').attr('disabled', true);
				
				$('.address_div_default_left').show();
				$('#customer_addr_road').attr('disabled', false);
				$('#customer_addr_detail').attr('disabled', false);
			})
			
			$('.btn_new_addr').click(function() {
				$('.address_div_default_left').hide();
				$('#customer_addr_road').attr('disabled', true);
				$('#customer_addr_detail').attr('disabled', true);
				
				$('.address_div_left').show();
				$('#addr').show();
				$('#d_addr').show();
				$('#sample6_address').attr('disabled', false);
				$('#sample6_detailAddress').attr('disabled', false);
			})
		})
	</script>
	<style>
	
		table {
			margin-top: 10px;
			margin-left: auto;
			margin-right: auto;
			width: 800px;
			border-collapse: collapse;
			border-radius: 30px;
			background-color: white;
			color: #444444;
		}
		
		table thead th {
			padding: 15px;
			text-align: center;
			font-size: 20px;
		}
		
		table th {
			width: 150px;
			padding: 5px;
			font-size: 16px;
		}
		
		table td {
			width: 650px;
			padding: 5px;
		}
		
		input:focus, textarea:focus {
			outline-color: #268F38;
		}
	
		.all {
			width: 900px;
			margin-left: auto;
			margin-right: auto;
			background-color: #F0F0F0;
		}
		
		.head_text {
			color: #444444;
			margin-left: 80px;
			font-size: 18px;
		}
	
		.board_out {
			margin-top: 40px;
		}
		
		.post_text {
			width:155px; 
			height:40px;
			margin-left: -2px;
		}
		
		.post_button {
			background-color: #37B04B;
			border: 0;
			color: white;
			border-radius: 5px;
			margin-left: 3px;
			height:40px;
		}
		
		.post_button:hover {
   		 	background-color: #268F38;
			font-weight: bold;
			cursor: pointer;
   		 	border: 0;
		}
		
		.info {
			padding: 10px;
			text-align: center;
		}
		
		.error {
			color: red;
			font-size: 14px;
			font-weight: bold;
		}
		
		.category_div {
			width: 600px;
			height: 130px;
		}
		
		.category_img_div {
			margin-left: -40px;
			margin-top: 30px;
		}
		
		.category_img {
			width: 50px;
			height: 50px;
			padding-left: 7px;
			cursor: pointer;
		}
		
		input[type=radio] {  
			visibility:hidden; 
		}
		
		input[type=radio]:checked + label .category_img { 
			border: 1px solid #268F38;
			width: 50px;
			height: 50px;
		}
		
		.category_text_div {
			margin-left: -46px;
		}
		
		.category_text_div span {
			cursor: pointer; 
			border: 1px solid #d3d3d3;
			padding: 5px;
			border-radius: 15px;
			font-size: 14px;
			background-color: white;
			color: #424242;
		}
		
		.category_text_div span:hover {
			background-color: #f1f3f5;
		}
		
		ul li {
			list-style-type: none;
			display: inline;
			padding-left: 15px;
		}
		
		.address_div {
			margin-top: 30px;
			margin-bottom: 30px;
			width: 600px;
			height: 330px;
		}
		
		.address_div_left {
			float: left;
			width: 300px;
			margin-left: -15px;
		}
		
		.address_input {
			width:260px; 
			height:40px;
		}
		
		.address_div_right {
			float: right;
			width: 300px;
		}
		
		.address_div_right .kakao_map {
			width:300px; 
			height:300px; 
			border-radius:5px; 
		}
		
		.error_address_div {
			width: 600px;
			height: 10px;
		}
		
		.money_div {
			width: 600px;
			height: 100px;
		}
		
		.money_div input {
			width:330px; 
		    height:40px;
			margin-top: 27px;
			margin-left: -240px;
			font-size: 16px;
		}
		
		.data_tr {
			height: 90px;
		}
		
		.data_tr input {
			width: 330px; 
			height: 40px;
			font-size: 14px;
		}
		
		.start_div {
			width: 600px;
			height: 45px;
		}
		
		.end_div {
			width: 600px;
			height: 45px;
		}
		
		.start_div input, .end_div input {
			margin-left:-262px;
		}
		
		.detail_div {
			width: 600px;
			height: 45px;
		}
		
		.detail_div input {
			margin-left:-260px;
		}
		
		.subject_div {
			width: 600px;
			height: 80px;
		}
		
		.subject_div input {
			width: 500px; 
			height: 40px;
			margin-left: -87px;
			font-size: 15px;
			margin-top: 16px;
		}
		
		.content_div {
			width: 500px; 
			height: 345px;
		}
		
		.content_div textarea {
			margin-top: 35px;
			margin-left: -86px;
			width:500px;
			height: 280px;
			background-image: url("./resources/image/back_cro1.png");
			background-repeat: no-repeat;
			background-position: 380px 120px;
			background-size: 120px 130px;
			font-size: 12.5px;
		}
		
		.advr {
			margin-left: 50px;
			width: 800px;
			height: 150px;
			border: 1px solid #37B04B;
			border-radius: 10px;
			background-image: url("./resources/image/adver_long.png");
			background-repeat: no-repeat;
			background-size: 800px 150px;
			cursor: pointer;
		}
		
		.Top_div {
			clear: both;
		}
		
		.top {
  			position: fixed;
  			bottom: 70px;
  			display: none;
  			border-radius: 50px;
  			width: 50px;
  			height: 50px;
  			color: white;
  			background-color: #37B04B;
  			border: 0;
  			text-decoration: none;
  			margin-left: 1790px;
  			font-size: 15px;
		}
		
		.top:hover {
			background-color: #268F38;
			font-weight: bold;
			cursor: pointer;
		}
		
		.top:focus {
			border: 0;
			outline: none;
		}
		
		.img_div {
			width: 600px;
			height: 350px;
		}
		
		.img_see {
			width: 400px;
			height: 300px;	
			margin-top: 30px;
			margin-left: -60px;
		}
		
		.file_div {
			width: 600px;
			height: 70px;
		}
		
		.file_div input {
			margin-top: 12px;
			margin-left: -75px;
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
		
		.file_div label { 
			display: inline-block; 
			padding: 10px; 
			color: white; 
			font-size: 13px;
			background-color: #37B04B;
			border-radius: 5px; 
			cursor: pointer; 
		} 
		
		.file_div label:hover { 
			background-color: #268F38;
			font-weight: bold;
			cursor: pointer;
		} 
		
		.file_div .upload_name { 
			display: inline-block; 
			padding: 10px; 
			font-size: 13px;
			background-color: white; 
			border-radius: 5px;  
			border: 1px solid #ebebeb; 
		}
		
		.btn_div {
			width: 800px;
			height: 80px;
		}
		
		.down_btn_div {
			margin-left: 350px;
		}
		
		.down_btn {
			background-color: #37B04B;
			border: 0;
			color: white;
			border-radius: 5px;
			width: 80px;
			height:40px;
			margin-left: 15px;
		}
		
		.down_btn:hover {
			background-color: #268F38;
			font-weight: bold;
			cursor: pointer;
			border: 0;
		}
		
		.address_div_default_left {
			display: none;
			margin-top: 52px; 
			float: left;
			width: 300px;
			margin-left: -15px;
		}
		
		.address_div_default_left b {
			font-size: 15px;
			margin-left: -210px;
		}
		
		.address_div_default_left input {
			width:260px; 
			height:40px;
			margin-top: 5px;
			margin-bottom: 20px;
		}
		
		.btn_addr_div {
			width: 200px;
			height: 30px;
			float: left;
			clear: both;
			margin-top: -5px;
			margin-left: 40px;
		}
		
		.btn_default_addr, .btn_new_addr {
			background-color: #37B04B;
			border: 0;
			color: white;
			font-size: 13px;
			padding: 8px;
			border-radius: 5px;
			height:40px;
		}
		
		.btn_default_addr:hover, .btn_new_addr:hover {
			background-color: #268F38;
			font-weight: bold;
			cursor: pointer;
			border: 0;
			outline: 0;
		}
		
		.btn_default_addr:focus, .btn_new_addr:focus {
			outline: none;
		}
		
	</style>
</head>
<body>
	<div class="all">
	<form name="board_form" id="board_form_id" action="board_updateProcess.ak" 
	      method="post" enctype="multipart/form-data">
	    <!-- 아이디 hidden -->
	    <input type="hidden" name="m_id" value="">
	    <input type="hidden" name="m_heart" value="">
		<!-- 아이디 hidden -->
		<h1 style="text-align: center; color: #212121;"><b style="color: #37B04B;">악어</b>새 구하기</h1>
		<div class="board_out">
			<b class="head_text">청소 종류</b>
			<table>
				<tr>
					<th>종류 선택*</th>
					<td align="center">
						<div class="category_div">
							<div class="category_img_div">
								<input type="radio" name="b_category" id="b_category1" 
									   value="A">
								<label for="b_category1">
									<img class="category_img" src="./resources/image/vacuum.png"
									     style="margin-left: 5px;">
								</label>
								<input type="radio" name="b_category" id="b_category2" 
								       value="B">
								<label for="b_category2">
									<img class="category_img" src="./resources/image/cleaning-tools.png"
										 style="margin-left: 12px;">
								</label>
								<input type="radio" name="b_category" id="b_category3" 
								       value="C">
								<label for="b_category3">
									<img class="category_img" src="./resources/image/kitchen.png"
									     style="margin-left: 15px;">
								</label>
								<input type="radio" name="b_category" id="b_category4" 
								       value="D">
								<label for="b_category4">
									<img class="category_img" src="./resources/image/maid.png"
										 style="margin-left: 7px;">
								</label>       
								<input type="radio" name="b_category" id="b_category5" 
								       value="E">
								<label for="b_category5">
									<img class="category_img" src="./resources/image/apartment.png"
										  style="margin-left: 5px;">
								</label>
								<input type="radio" name="b_category" id="b_category6" 
								       value="F">
								<label for="b_category6">
									<img class="category_img" src="./resources/image/coronavirus.png"
									     style="margin-left: -10px;">
								</label>
								
							</div>
							<div class="category_text_div">
								<ul>
									<li>
										<label for="b_category1" style="margin-left: -20px;">
											<span>정기청소</span>
										</label>
									</li>
									<li>
										<label for="b_category2" style="margin-left: -5px;">
											<span>특수조건청소</span>
										</label>
									</li>
									<li>
										<label for="b_category3" style="margin-left: 5px;">
											<span>입주청소</span>
										</label>
									</li>
									<li>
										<label for="b_category4" style="margin-left: 5px;">
											<span>상주청소</span>
										</label>
									</li>
									<li>
										<label for="b_category5" style="margin-left: 7px;">
											<span>빌딩청소</span>
										</label>
									</li>
									<li>
										<label for="b_category6" style="margin-left: 8px;">
											<span>방역</span>
										</label>
									</li>
								</ul>
								<label class="error" for="b_category"></label>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div class="board_out">
			<b class="head_text">위치 정보</b>
			<table>
				<tr>
					<th>주소*</th>
					<td align="center">
						<div class="address_div">
							<div class="address_div_left" >
								<!-- 다음 주소 API 시작 -->
								<input type="text" class="post_text" id="sample6_postcode" placeholder=" 우편번호">
								<input type="button" class="post_button" onclick="sample6_execDaumPostcode()" 
								       value="우편번호 찾기"><br>
								<input type="text" name="b_address_road" id="sample6_address" class="address_input"  
								       placeholder=" 지번주소로 꼭 선택해주세요!" value="<%=boardVO.getB_address_road() %>" style="margin-top:22px;"><br>
								<label class="error" id="addr" for="sample6_address" style="margin-left: -110px;"></label><br>
								<input type="text" name="b_address_detail" id="sample6_detailAddress"  
								       class="address_input" value="<%=boardVO.getB_address_detail() %>" placeholder=" 상세주소"><br>
								<label class="error" id="d_addr" for="sample6_detailAddress" style="margin-left: -100px;"></label><br>
								<input type="text" id="sample6_extraAddress" class="address_input"
									   placeholder=" 참고항목">
								<!-- 다음 주소 API 끝 -->
							</div>
							<div class="address_div_default_left">
								<b>지번주소</b><br>
								<input type="text" name="b_address_road" id="customer_addr_road"
								       value="" readonly="readonly" disabled="disabled"><br>
								<b>상세주소</b><br>
								<input type="text" name="b_address_detail" id="customer_addr_detail"
								       value="" readonly="readonly" disabled="disabled">
							</div>
							<div class="address_div_right">
								<div class="kakao_map" id="map"></div>
							</div>
							<div class="btn_addr_div">
								<a class="btn_default_addr">기존주소</a>
								<a class="btn_new_addr">새로입력</a>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div class="board_out">
			<b class="head_text">희망 시급</b>
			<table>
				<tr>
					<th>
						<b>시급 입력*</b>
					</th>
					<td align="center">
						<div class="money_div">
							<input type="number" name="b_money" id="b_money_id" placeholder=" 예) 10000, 숫자만 입력"/>
							<b style="font-size: 20px;">원</b><br>
							<label class="error" for="b_money_id" style="margin-left: -420px;"></label>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div class="board_out">
			<b class="head_text">희망 근무일</b>
			<table>
				<tr class="data_tr">
					<th>청소 시작일*</th>
					<td align="center">
						<div class="start_div">
							<input type="date" name="b_start" id="b_start_id"/><br>
							<label class="error" for="b_start_id" style="margin-left: -428px;"></label>
						</div>
					</td>
				</tr>
				<tr class="data_tr">
					<th>청소 종료일*</th>
					<td align="center">
						<div class="end_div">
							<input type="date" name="b_end" id="b_end_id"/><br>
							<label class="error" for="b_end_id" style="margin-left: -428px;"></label>
						</div>
					</td>
				</tr>
				<tr class="data_tr">
					<th>상세 근무시간*</th>
					<td align="center">
						<div class="detail_div">
							<input type="text" name="b_d_detail" id="b_d_detail_id" 
							       placeholder=" 예) 13시 ~ 15시, 정확한 시간은 매칭 후 협의"/><br>
							<label class="error" for="b_d_detail_id" style="margin-left: -345px;"></label>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div class="board_out">
			<b class="head_text">상세 설명</b>
			<table>
				<tr>
					<th>제목*</th>
					<td align="center">
						<div class="subject_div">
							<input type="text" name="b_subject" id="b_subject_id" 
							       placeholder=" 예) 다음주 이사로 인해 입주청소가 필요합니다!"/><br>
							<label class="error" for="b_subject_id" style="margin-left: -100px;"></label>
						</div>
					</td>
				</tr>
				<tr>
					<th>상세설명*</th>
					<td align="center">
						<div class="content_div">
							<textarea name="b_content" id="textarea_id"  
							          placeholder=" 
							                                                   예) 상세설명 작성 주의사항
							                          - 청소와 관련 없는 홍보성 정보는 입력하지 마세요.
							                            (홈페이지 주소,블로그,SNS,전화번호,이메일 등)
							                          - 욕설이나 음란성 언어를 절대로 적지 마세요!
							                             
							                          * 위반시 게시글 삭제나 이용 제한이 있을 수 있습니다."></textarea><br>
							<label class="error" for="textarea_id" style="margin-left: -100px;"></label>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div class="board_out">
			<b class="head_text">사진 등록</b>
			<table>
				<tr>
					<th>일반 사진</th>
					<td align="center">
						<div class="img_div" id="image_container">
							<img class="img_see" id="image_section" 
							     src="./resources/image/img_default.png">
							<div id="comment"></div>
						</div>
					</td>
				</tr>
				<tr>
					<th>파일 업로드</th>
					<td align="center">
						<div class="file_div">
							<input class="upload_name" value="파일선택" disabled="disabled">
							<label for="img_input">업로드</label> 
							<input type="file" name="file" id="img_input" accept="image/*">
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div class="board_out">
			<!-- 아직 미완성 -->
			<div class="advr" onclick="location.href='move.ak'">
			</div>
		</div>
		<div class="board_out">
			<div class="btn_div">
				<div class="down_btn_div">
					<input class="down_btn" id="submit_btn" type="submit" value="등록">
					<input class="down_btn" type="reset">
				</div>
			</div>
		</div>
	</form>
</div>
<div class="Top_div">
		<button class="top">Top</button>
</div>
<!-- 다음 주소 API 시작 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 다음 주소 API 끝 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3cbd93568d5ed61c52a1851035124ae3&libraries=services"></script>
<script>
	var default_addr = '<%=boardVO.getB_address_road() %>';
	
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
	                document.getElementById("sample6_extraAddress").value = extraAddr;
	            
	            } else {
	                document.getElementById("sample6_extraAddress").value = '';
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('sample6_postcode').value = data.zonecode;
	            document.getElementById("sample6_address").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("sample6_detailAddress").focus();
	            
	            $('#map').empty();
	            
	            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    	    mapOption = {
	    	        center: new kakao.maps.LatLng(37.505287, 127.023993), // 지도의 중심좌표 (강남구 기준)
	    	        level: 3 // 지도의 확대 레벨
	    	    };  
	    	
		    	// 지도를 생성합니다    
		    	var map = new kakao.maps.Map(mapContainer, mapOption); 
		    	
		    	// 주소-좌표 변환 객체를 생성합니다
		    	var geocoder = new kakao.maps.services.Geocoder();
		    	
			    	// 주소로 좌표를 검색합니다
			    	geocoder.addressSearch(addr, function(result, status) {
			    	
			    	    // 정상적으로 검색이 완료됐으면 
			    	     if (status === kakao.maps.services.Status.OK) {
			    	
			    	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			    	
			    	        // 결과값으로 받은 위치를 마커로 표시합니다
			    	        var marker = new kakao.maps.Marker({
			    	            map: map,
			    	            position: coords
			    	        });
			    			
			    	        var iwContent = '';
			    	        	iwContent += '<div class="info"><b>여기가 맞나요?</b></div>' 
	   				    
	   				    	var infowindow = new kakao.maps.InfoWindow({
	   				      		map: map, 
	   				       		content : iwContent
	   				    	});
			    	        
			    	        infowindow.open(map, marker);
			    	        	
			    	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			    	        map.setCenter(coords);
			    	    } 
			    	});    
		        }
		    }).open();
		}
	
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.505287, 127.023993), // 지도의 중심좌표 (강남구 기준)
	        level: 3 // 지도의 확대 레벨
	    };  
		
		// 지도를 생성합니다    
    	var map = new kakao.maps.Map(mapContainer, mapOption); 
    	
    	// 주소-좌표 변환 객체를 생성합니다
    	var geocoder = new kakao.maps.services.Geocoder();
    	
    	// 주소로 좌표를 검색합니다
    	geocoder.addressSearch(default_addr, function(result, status) {
    	
    	    // 정상적으로 검색이 완료됐으면 
    	     if (status === kakao.maps.services.Status.OK) {
    	
    	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
    	
    	        // 결과값으로 받은 위치를 마커로 표시합니다
    	        var marker = new kakao.maps.Marker({
    	            map: map,
    	            position: coords
    	        });
    			
    	        var iwContent = '';
    	        	iwContent += '<div class="info"><b>여기가 맞나요?</b></div>' 
			    
			    	var infowindow = new kakao.maps.InfoWindow({
			      		map: map, 
			       		content : iwContent
			    	});
    	        
    	        infowindow.open(map, marker);
    	        	
    	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    	        map.setCenter(coords);
    	    } 
    	});
</script>
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
	  
	$("#img_input").change(function(){
	   var output = '';
	   	   output += '<div style="color: #444444; margin-left: -60px;">'
	       output += '    <b>사진 업로드 완료!</b>'
	       output += '</div>'
	   $('#comment').empty();
	   $('#comment').append(output);
	   readURL(this);
	});
</script>

</body>
</html>