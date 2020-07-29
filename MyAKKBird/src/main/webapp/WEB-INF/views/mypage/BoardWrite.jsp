<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.bit.myakkbird.member.MemberVO"%>
<%
	MemberVO memberVO = (MemberVO)request.getAttribute("memberVO");	
	String m_id = memberVO.getM_id();	
	System.out.println("현재 아이디 : " + m_id);
	System.out.println(m_id + "의 지번 주소 : " + memberVO.getM_address_road());
	System.out.println(m_id + "의 상세 주소 : " + memberVO.getM_address_detail());
	System.out.println(m_id + "의 하트 개수 : " + memberVO.getM_heart());
%>
<!DOCTYPE html>
<html> 
<head>
	<meta charset="UTF-8">
	<title>마이악어새 게시글 쓰기</title>
	<!-- favicon 적용 -->
	<link type="image/x-icon" rel="icon" href="./resources/image/akk_favicon.png">
	<!-- favicon 적용 -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<!-- alert창 API 시작 -->
	<script src="resources/js/sweetAlert_J.js"></script>
	<!-- alert창 API 끝 -->
	<!-- 유효성 검사 jquery API 시작 -->
	<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.0/jquery.validate.min.js" ></script>
	<!-- 유효성 검사 jquery API 끝 -->
	<!-- 다음 주소 API 시작 -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- 다음 주소 API 끝 -->
	<!-- 카카오 맵 API 시작 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3cbd93568d5ed61c52a1851035124ae3&libraries=services"></script>
	<!-- 카카오 맵 API 끝 -->
	<!-- BoardWrite.css style 파일 -->
	<link rel="stylesheet" type="text/css" href="./resources/css/mypage/BoardWrite.css">
	<!-- BoardWrite.css style 파일 -->
</head>
<body>
<!-- header zone -->
<jsp:include page="../header_container.jsp">
	<jsp:param value="m_id" name="m_id"/>
</jsp:include> 
<!-- header zone -->
<div class="all">
	<div class="addClass">
		<svg id="back_btn" viewBox="0 0 24 24" style="display: inline-block; color: rgba(0, 0, 0, 0.87); fill: black; height: 24px; width: 24px; user-select: none; transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms;"><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path></svg>
	</div>
	<form name="board_form" id="board_form_id" action="board_insertProcess.ak" 
	      method="post" enctype="multipart/form-data">
	    <!-- 아이디 hidden -->
	    <input type="hidden" name="m_id" value=<%=memberVO.getM_id() %>>
		<!-- 아이디 hidden -->
		<h1 class="board_sub">악어새 구하기</h1>
		<div class="board_out">
			<b class="head_text">청소 종류</b>
			<table>
				<tr>
					<th>종류 선택<svg id="detail_btn" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 25 25"><g fill="none" fill-rule="evenodd"><g><circle cx="12.5" cy="12.5" r="12.5" fill="#BDBDBD"/><path fill="#FFF" d="M11.194 14.606c-.402-2.66 2.445-3.717 2.445-5.302 0-.826-.553-1.355-1.424-1.355-.737 0-1.323.38-1.859.925L9 7.652C9.87 6.677 11.06 6 12.517 6 14.527 6 16 7.024 16 9.139c0 2.345-2.914 3.138-2.663 5.467h-2.143zM12.266 19c-.871 0-1.524-.694-1.524-1.586 0-.892.653-1.586 1.524-1.586.887 0 1.54.694 1.54 1.586 0 .892-.653 1.586-1.54 1.586z"/></g><path d="M-176 23h375v30h-375z"/></g></svg></th>
					<td align="center">
						<div class="category_div">
							<!-- 카테고리 이미지 선택 -->
							<div class="category_img_div">
								<ul>
									<li>
										<input type="radio" name="b_category" class="b_cate" 
										       id="b_category_id1" value="A" checked="checked">
										<label for="b_category_id1">
											<div class="b_category1">
											</div>
										</label>
									</li>
									<li>
										<input type="radio" name="b_category" class="b_cate"
										       id="b_category_id2" value="B">
										<label for="b_category_id2">
											<div class="b_category2">
											</div>
										</label>
									</li>
									<li>
										<input type="radio" name="b_category" class="b_cate"
										       id="b_category_id3" value="C">
										<label for="b_category_id3">
											<div class="b_category3">
											</div>
										</label>
									</li>
									<li>
										<input type="radio" name="b_category" class="b_cate"
										       id="b_category_id4" value="D">
										<label for="b_category_id4">
											<div class="b_category4">
											</div>
										</label>       
									</li>
									<li>
										<input type="radio" name="b_category" class="b_cate"
										       id="b_category_id5" value="E">
										<label for="b_category_id5">
											<div class="b_category5">
											</div>
										</label>
									</li>
									<li>
										<input type="radio" name="b_category" class="b_cate"
										       id="b_category_id6" value="F">
										<label for="b_category_id6">
											<div class="b_category6">
											</div>
										</label>
									</li>
								</ul>
							</div>
							<!-- 카테고리 이미지 선택 -->
							<!-- 카테고리 텍스트 선택 -->
							<div class="category_text_div">
								<ul>
									<li>
										<label for="b_category_id1">
											<b>정기청소</b>
										</label>
									</li>
									<li>
										<label for="b_category_id2">
											<b>특수청소</b>
										</label>
									</li>
									<li>
										<label for="b_category_id3">
											<b>입주청소</b>
										</label>
									</li>
									<li>
										<label for="b_category_id4">
											<b>상주청소</b>
										</label>
									</li>
									<li>
										<label for="b_category_id5">
											<b>빌딩청소</b>
										</label>
									</li>
									<li>
										<label for="b_category_id6">
											<b>방역청소</b>
										</label>
									</li>
								</ul>
								<div class="category_e_zone">
									<label class="error" for="b_category" style="margin-top: -5px;"></label>
								</div>
							<!-- 카테고리 텍스트 선택 -->
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
								<input type="text" class="post_text" id="sample6_postcode" readonly placeholder=" 우편번호">
								<input type="button" class="post_button" onclick="sample6_execDaumPostcode()" 
								       value="주소찾기"><br>
								<input type="text" name="b_address_road" id="sample6_address" class="address_input"  
								       readonly placeholder=" 지번주소로 꼭 선택해주세요!"><br>
								<label class="error" id="addr" for="sample6_address" style="margin-left: -110px;"></label><br>
								<input type="text" name="b_address_detail" id="sample6_detailAddress"  
								       class="address_input" placeholder=" 상세주소"><br>
								<label class="error" id="d_addr" for="sample6_detailAddress" style="margin-left: -100px;"></label><br>
								<input type="text" id="sample6_extraAddress" class="address_input" placeholder=" 참고항목(선택)">
								<!-- 다음 주소 API 끝 -->
							</div>
							<div class="address_div_default_left">
								<!-- 기존 주소 -->
								<b>우편번호</b><br>
								<input type="text" class="post_my" value="01806" readonly="readonly"><br>
								<b>지번주소</b><br>
								<input type="text" class="post_my_addr" name="b_address_road" id="customer_addr_road"
								       value="<%=memberVO.getM_address_road() %>" readonly="readonly" disabled="disabled"><br>
								<b>상세주소</b><br>
								<input type="text" class="post_my_addr" name="b_address_detail" id="customer_addr_detail"
								       value=<%=memberVO.getM_address_detail() %> readonly="readonly" disabled="disabled"><br>
								<b>참고항목</b><br>
								<input type="text" class="post_my_addr" id="customer_addr_detail" value="단독 1층" readonly="readonly">      
								<!-- 기존 주소 -->
							</div>
							<div class="address_div_right">
								<!-- 카카오 맵 -->
								<div class="kakao_map" id="map"></div>
								<!-- 카카오 맵 -->
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
							<b>원</b><br>
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
							<input type="text" name="b_d_detail" id="b_d_detail_id" maxlength="15"
							       placeholder=" 예) 13시 ~15시, 매칭 후 협의 (최대 15자)"/><br>
							<label class="error" for="b_d_detail_id" style="margin-left: -364px;"></label>
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
							<input type="text" name="b_subject" id="b_subject_id" maxlength="25"
							       placeholder=" 예) 다음주 이사로 인해 입주청소가 필요합니다! (최대 25자)"/><br>
							<label class="error" for="b_subject_id" style="margin-left: -110px;"></label>
						</div>
					</td>
				</tr>
				<tr>
					<th>상세설명*</th>
					<td align="center">
						<div class="content_div">
						    <!-- placeholder 편집 금지 -->
							<textarea name="b_content" id="textarea_id" maxlength="300" 
							          placeholder="
 예) 상세설명 작성 주의사항 (최대 300자)
 
 - 청소와 관련 없는 홍보성 정보는 입력하지 마세요.
   (홈페이지 주소,블로그,SNS,전화번호,이메일 등)
 - 욕설이나 음란성 언어를 절대로 적지 마세요!
 
 * 위반시 게시글 삭제나 이용 제한이 있을 수 있습니다."></textarea><br>
 							<!-- placeholder 편집 금지 -->
							<label class="error" for="textarea_id" style="margin-left: -20px;"></label>
							<span id="counter">###</span>
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
							<img class="default_img" src="./resources/image/img_default.png">
							<ul id="img_ul">
							</ul>
						</div>
					</td>
				</tr>
				<tr>
					<th><div class="file_txt">파일 업로드</div></th>
					<td align="center">
						<div class="file_div">
							<a href="javascript:" onclick="fileUploadAction();" class="up_btn">파일 업로드</a>
							<input type="file" name="file" id="img_input" multiple="multiple"  accept="image/*">
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div class="board_out">
			<div class="advr" onclick="banner_check()">
			</div>
		</div>
		<div class="board_out">
			<div class="btn_div">
				<div class="down_btn_div">
					<input class="down_btn" id="submit_btn" type="submit" value="등록">
					<input class="down_btn" type="reset" onclick="reset_form()">
				</div>
			</div>
		</div>
	</form>
</div>
<!-- footer zone -->
<jsp:include page="../footer_container.jsp">
	<jsp:param value="" name=""/>
</jsp:include> 
<!-- footer zone -->
</body>
<script>
// 전역 변수
var se_id = '<%=m_id %>';                // 세션 아이디
var heart = <%=memberVO.getM_heart() %>; // 하트 체크
//전역 변수
</script>
<!-- BoardWrite.js 파일 -->
<script src="./resources/js/mypage/BoardWrite.js"></script>
<!-- BoardWrite.js 파일 -->
</html>