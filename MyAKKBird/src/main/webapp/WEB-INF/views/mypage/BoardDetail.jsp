<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.bit.myakkbird.mypage.*" %>

<%
	BoardVO board = (BoardVO)request.getAttribute("board");						//게시글정보
	String apply_cnt = (String)session.getAttribute("apply_cnt").toString();	//지원자 수
	
	String m_img = (String)session.getAttribute("m_img").toString();			//게시글작성한 회원프로필이미지
	String b_num= request.getParameter("b_num");								//게시글번호
	String e_id = (String)session.getAttribute("m_id");							//현재로그인한 아이디(요청하는사람.근로자)
	String c_id = board.getM_id();												//게시글 작성한 아이디(요청받는사람.회원)
	String apply_chk = (String)request.getAttribute("apply_chk");				//현재 게시글에 근로자가 신청한 이력이 있는지 체크 카운팅한 변수	
	String m_type = (String)request.getAttribute("m_type");						//현재로그인한 아이디의 회원 타입
	
	int heart = 0;
	if(e_id != null){
		heart = Integer.parseInt(request.getAttribute("heart").toString());	//현재로그인한 아이디의 하트개수
	}
	
	//A:정기청소 B:특수청소 C:입주청소(이사청소) D:상주청소 E:빌딩청소 F:방역청소
	//카테고리 이미지도 같이 처리해주기
	String str = board.getB_category();
	String b_category = "", b_category_img="";
	
	switch(str){
		case "A" : b_category = "정기청소";
				   b_category_img = "vacuum.png";
				  break;
		case "B" : b_category = "특수청소";
				   b_category_img = "cleaning-tools.png";
		  		  break;
		case "C" : b_category = "입주청소";
				   b_category_img = "kitchen.png";
		 		  break;
		case "D" : b_category = "상주청소";
				   b_category_img = "maid.png";
		 		  break;
		case "E" : b_category = "빌딩청소";
				   b_category_img = "apartment.png";
				  break;
		case "F" : b_category = "방역";
				   b_category_img = "coronavirus.png";  		  
				  break;
		default  : b_category = "기타";
				   b_category_img = "img_default.png";
	}
	
%>
<!DOCTYPE html>
<html>
<head>
	<!-- favicon 적용 -->
	<link type="image/x-icon" rel="icon" href="./resources/image/akk_favicon.png">
	<!-- favicon 적용 -->
	<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mypage/detailStyle.css"> --%>
	<!-- <link rel="stylesheet" type="text/css" href="css/mypage/detailStyle.css"> --> <!-- 디테일페이지 css -->
	<!-- <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>  --> <!-- 모달창 -->
	<script src="resources/js/sweetAlert.js"></script>  <!-- 모달창 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css"/>
	
	<style type="text/css">
	@charset "UTF-8";
	@font-face{font-family: "NotoSansKR-Bold";src:url('fonts/NotoSansKR-Bold.otf');}
	@font-face{font-family: "NotoSansKR-Thin";src:url('fonts/NotoSansKR-Thin.otf');}
	@font-face{font-family: "NotoSansKR-Black";src:url('fonts/NotoSansKR-Black.otf');}
	@font-face{font-family: "NotoSansKR-Light";src:url('fonts/NotoSansKR-Light.otf');}
	@font-face{font-family: "NotoSansKR-Medium";src:url('fonts/NotoSansKR-Medium.otf');}
	@font-face{font-family: "NotoSansKR-Regular";src:url('fonts/NotoSansKR-Regular.otf');}
	html {color: #222;font-weight: 100;font-size: 1em;line-height: 1.375}
	body {margin: 0; font-family: "NotoSansKR-Thin",serif;}
	.vDnl_ {
		max-width: 650px;
		margin: 0 auto;
		background-color: #fff;
		margin-top: 60px;
		margin-bottom: 75px;
		
	}
	.danger_icon:link { color: white; text-decoration: none;}
 	.danger_icon:visited { color: white; text-decoration: none;}
 	.danger_icon:hover { color: white; text-decoration: none;}
	._33cd2{position:relative;width:100%;z-index:10}
	._1t1Y8{margin-left:20px}
	._1t1Y8,._2kHD3{display:inline-block;position:absolute;top:15px;width:71px;height:32px;vertical-align:middle;line-height:32px;cursor:pointer}
	._2kHD3{right:15px;border-radius:100px;background-color:rgba(0,0,0,.8);font-size:13px;text-align:center;color:#fff}
	
	.NHtEz{position:relative;background-color:#fff;text-align:center;padding-top:30px}
	._3s0Sp{margin-bottom:10px}
	._3s0Sp img{border-radius:100px;margin-bottom:5px}
	._2cNHy{display:-ms-flexbox;display:flex;-ms-flex-direction:row;flex-direction:row;-ms-flex-align:center;align-items:center;-ms-flex-pack:center;justify-content:center;font-size:.85em;font-weight:400;color:#5a5a5a;margin-bottom:5px}
	._1EHsp{font-size:1em;font-weight:700;color:#000;margin-bottom:10px}
	._3HCWG{font-size:13px;font-weight:400;line-height:1.69;text-align:left;color:#484848;margin:17px}
	._16igQ{display:-ms-flexbox;display:flex;-ms-flex-direction:row;flex-direction:row;-ms-flex-pack:center;justify-content:center;margin-bottom:25px}
	._1qgZp{font-size:1em;color:#0e6f6f;-ms-flex-align:baseline;align-items:baseline}
	._1qgZp,._3LAfL,._2y3iE{font-weight:400}
	._2eHf6{width:1px;height:7px;background-color:#ccc;margin:0 10px}
	
	._C2zw1T{-ms-flex-pack:distribute;justify-content:space-around;border-top:1px solid #e6e6e6}
	.CXIc6g,._C2zw1T{display:-ms-flexbox;display:flex;-ms-flex-direction:row;flex-direction:row;-ms-flex-align:center;align-items:center}
	.CXIc6g{padding:20px 30px}
	._C1gHH2{width:1px;height:40px;background-color:#e6e6e6}
	._C1Y9r0{text-align:left;margin-left:15px}
	._C3TIsb{font-weight:400}
	._C1GMZ1,._C3TIsb{font-size:15.2px;font-size:.95rem;color:#3b3b3b}
	._C1GMZ1{font-weight:700}
	._C1mdUo{color:#37B04B}
	
	._D2zw1T{-ms-flex-pack:distribute;justify-content:space-around;border-top:1px solid #e6e6e6}
	.DXIc6g,._D2zw1T{display:-ms-flexbox;display:flex;-ms-flex-direction:row;flex-direction:row;-ms-flex-align:center;align-items:center}
	.DXIc6g{padding:20px 3px; margin-right: 7px}
	._D1gHH2{width:1px;height:40px;background-color:#e6e6e6; position: absolute}
	._D1Y9r0{text-align:left;margin-left:15px}
	._D3TIsb{font-weight:400; text-align: center;}
	._D1GMZ1,._D3TIsb{font-size:15.2px;font-size:.95rem;color:#3b3b3b}
	._D1GMZ1{font-weight:700}
	._D1mdUo{color:#37B04B; width: 300px}
	._DconBox{height: 300px; background-color: #f1f1f1}
	
	._E2zw1T{-ms-flex-pack:distribute;justify-content:space-around;border-top:1px solid #e6e6e6}
	.EXIc6g,._E2zw1T{display:-ms-flexbox;display:flex;-ms-flex-direction:row;flex-direction:row;-ms-flex-align:center;align-items:center}
	.EXIc6g{padding:20px 30px}
	._E1gHH2{width:1px;height:40px;background-color:#e6e6e6}
	._E1Y9r0{text-align:left;margin-left:15px}
	._E3TIsb{font-weight:400}
	._E1GMZ1,._E3TIsb{font-size:15.2px;font-size:.95rem;color:#3b3b3b}
	._E1GMZ1{font-weight:700}
	._E1mdUo{color:#37B04B}
	
	.EXIc6g_ard,._E2zw1T{display:-ms-flexbox;display:flex;-ms-flex-direction:row;flex-direction:row;-ms-flex-align:center;align-items:center}
	.EXIc6g_ard{padding:20px 30px}
	._E1Y9r0_ard{text-align:left;margin-left:15px}
	._E3TIsb_ard{font-weight:400}
	
	
	._2zw1T{-ms-flex-pack:distribute;justify-content:space-around;border-top:1px solid #e6e6e6}
	.XIc6g,._2zw1T{display:-ms-flexbox;display:flex;-ms-flex-direction:row;flex-direction:row;-ms-flex-align:center;align-items:center}
	.XIc6g{padding:20px 30px}
	._1gHH2{width:1px;height:40px;background-color:#e6e6e6}
	._1Y9r0{text-align:left;margin-left:15px}
	._3TIsb{font-weight:400}
	._1GMZ1,._3TIsb{font-size:15.2px;font-size:.95rem;color:#3b3b3b}
	._1GMZ1{font-weight:700}
	._1mdUo{color:#007e62}
	
	.comm_input_srd{width: 650px;}
	.comm_inputbox{width: 90%; height: 30px; border: 5px solid #e6e6e6; border-radius: 5px;}
	.comm_inputbox:focus{outline: 3px solid #37B04B;}
	.comm_inputbtn{width: 7%; height: 40px; background-color: #e6e6e6; border: none; line-height: 1px; border-radius: 5px;}
	.comm_inputbtn:focus{background-color: #37B04B; border: none; outline: none;}
	
	.comm_input_srd_sub{width: 640px;}
	.comm_inputbox_sub{width: 89%; height: 30px; border: 5px solid #e6e6e6; border-radius: 5px;}
	.comm_inputbox_sub:focus{outline: 3px solid #37B04B;}
	.comm_inputbtn_sub{width: 7%; height: 40px; background-color: #e6e6e6; border: none; line-height: 1px; margin-left: 5px; border-radius: 5px;}
	.comm_inputbtn_sub:focus{background-color: #37B04B; border: none; outline: none;}
	
	.comm_more_vert{float: right;margin-right: 1px;}
	
	.commentsList{background-color: #f1f1f1;}
	[class*='maincomm']{background-color: white;position: relative;padding: 5px;border-radius: 5px;margin: 5px;word-break: break-all;}
	
	
	.post_top_img {width:45px; height:45px;float: right;margin-top: -3px;margin-right: 0px;}
	
	
	.dialog {
	    width: 183px;
	    height: 60px;
	    border: 1px solid #d3d3d3;
	    border-radius: 3px;
	    position: absolute;
	    margin-top: 5px;
	    margin-left: 474px;
	    z-index: 1;
	    box-shadow: -3px -3px 7px -3px #d3d3d3, 3px 3px 7px -3px #d3d3d3;
	    background-color: #bddeab69;
	}
	.dialog:after,
	.dialog:before {
	    content: '';
	    display: block;
	    position: absolute;
	    left: 100%;
	    width: 0;
	    height: 0;
	    border-style: solid;
	}
		
	.dialog:after {
	    margin-top: -43.6px;
	    margin-left: -30px;
	    border-color: transparent transparent #bddeab69 transparent ;
	    border-width: 9px;
	}
	
	.dialog:before {
	    margin-top: -19.6px;
	    margin-left: -31px;
	    border-color: transparent transparent #bddeab69 transparent;
	    border-width: 10px;
	}
	
	.cancel_div {
		margin-top: 3px;
		margin-left: 163px;
		cursor: pointer;
	}
	
	.delete_icon {
		float: right;
		margin-top: -9px;
		cursor: pointer;
	}
	
	.delete_txt {
		font-size: 12px; 
		font-weight: bold; 
		margin-top: -1px; 
		margin-right: 27px;
		float:right; 
		cursor: pointer;
	}
	.update_icon {
		float: right;
		margin-top: -9px;
		cursor: pointer;
	}
	
	.update_txt {
		font-size: 12px; 
		font-weight: bold; 
		margin-top: -1px; 
		margin-right: 27px;
		float:right; 
		cursor: pointer;
	}
	.danger_icon {
		float: right;
		margin-top: -1px;
		cursor: pointer;
	}
	
	.danger_txt {
		font-size: 12px; 
		font-weight: bold; 
		margin-top: 8px; 
		float:right; 
		cursor: pointer;
	}
	.reply_txt{
		font-size: 12px; 
		font-weight: bold; 
		margin-top: 8px; 
		float:right; 
		cursor: pointer;
	}
	[class*='commentsInfo']{
		height: 26px;
	}	
	.comments_id_svg{
		position: absolute;
		width: 30px;
		height: 25px;
		margin-left: 4px;
		margin-top: 2px;
	}
	.comments_mid{
		position: absolute;
	    margin-left: 35px;
	    margin-top: 9px;
	    font-size: 12px;
	    font-weight: bold;
	}
	.comments_date{
    	position: absolute;
	    margin-top: 9px;
	    margin-left: 480px;
	    font-size: 12px;
	    font-weight: bold;
	}
	.comments_reply{
		position: absolute;
    	margin-top: 1px;
    	margin-left: 567px;
	}		
	.comments_danger{
		position: absolute;
    	margin-top: 3px;
    	margin-left: 604px;
	}
	.comments_date_sub{
		position: absolute;
	    margin-top: 9px;
	    margin-left: 480px;
	    font-size: 12px;
	    font-weight: bold;
	}	
	</style>
<meta charset="UTF-8">
<title>마이악어새 자세히 보기</title>
</head>
<jsp:include page="../header_container.jsp"></jsp:include>
<body>
	<!-- 요청하기 -->
	<input type="hidden" name="b_num" value="<%=b_num %>" />
	<input type="hidden" name="e_id" value="<%=e_id %>" />
	<input type="hidden" name="c_id" value="<%=c_id %>" />
	

	<div class="vDnl_">
	<div>
		<div class="_33cd2">
			<div class="_1t1Y8" role="button">
				<a href="javascript:history.back();">
				<img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/icon/icon-back%402x.png" 
					 width="28" height="46" alt="뒤로가기"></a>
			</div>
			<a class="danger_icon" href="./insertBoardDanger.ak?b_num=<%=board.getB_num()%>"><div class="_2kHD3" role="button">
				<img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/icon/icon-report%402x.png"
					 width="13" height="15" alt="신고하기">신고
			</div></a>
		</div>
		<div class="NHtEz">
			<div class="_3s0Sp" role="button">	<!-- 프로필이미지 -->
				<%if(m_img.equals("no_img")){ %>
					<img src="./resources/image/crocodile_profile.png" width="50" height="50" onclick="profileLink('<%=board.getM_id()%>')">
				<%}else{ %>
					<img src="/myakkbird/myakkbirdUpload/<%=m_img%>" style="width:70px; height:70px;" onclick="profileLink('<%=board.getM_id()%>')">
				<%} %>
			</div>
			<div class="_1EHsp"><%=board.getB_subject()%></div>
			<div class="_2cNHy">
				<div class="_2y3iE"><%=board.getM_name1() %>○<%=board.getM_name2() %></div>
				<div class="_2eHf6"></div>	<!-- 구분선| -->
				<span class="_3LAfL"> <%=board.getB_date() %> </span>
				<div class="_2eHf6"></div>	<!-- 구분선| -->
				<span class="_3LAfL">조회:<%=board.getB_readcount() %></span>
			</div>
		</div>
		<div class="_C2zw1T">
			<div class="CXIc6g">
				<div class="_C1Y9r0">
					<div class="_C3TIsb">근무시작일</div>
					<div class="_C1GMZ1 _C1mdUo"><%=board.getB_start() %></div>
				</div>
			</div>
			<div class="_C1gHH2"></div>	<!-- 구분선 -->
			<div class="CXIc6g">
				<div class="_C1Y9r0">
					<div class="_C3TIsb">근무종료일</div>
					<div class="_C1GMZ1 _C1mdUo"><%=board.getB_end() %></div>
				</div>	
			</div>
			<div class="_C1gHH2"></div>	<!-- 구분선 -->
			<div class="CXIc6g">
				<div class="_C1Y9r0">
					<div class="_C3TIsb">상세근무시간</div>
					<div class="_C1GMZ1 _C1mdUo"><%=board.getB_d_detail() %></div>
				</div>	
			</div>
		</div>
		<div>
			<div class="_2zw1T">
				<div class="XIc6g">	<!--지원자수  -->
					<svg xmlns="http://www.w3.org/2000/svg" width="43" height="43" viewBox="0 0 43 43">	<!-- 지원자 아이콘 -->
						<g fill="none" fill-rule="evenodd">
							<circle cx="21.5" cy="21.5" r="21.5" fill="#F2F3F5"></circle>
							<g fill="#82878A" fill-rule="nonzero">
								<path d="M28 17.025v2.597c0 .49.188.944.509 1.289v.882a.67.67 0 0 0 .663.682.67.67 0 0 0 .663-.682v-1.2a.69.69 0 0 0-.294-.564.486.486 0 0 1-.215-.407v-2.597c0-.91.724-1.654 1.608-1.654h.542c.884 0 1.608.744 1.608 1.654v2.597c0 .166-.08.317-.215.407a.672.672 0 0 0-.294.565v2.501c0 .303.174.586.435.717.315.158 1.95 1.006 3.463 2.28.127.11.2.269.2.448v1.096h-4.648a.67.67 0 0 0-.663.682.67.67 0 0 0 .663.682h5.312a.67.67 0 0 0 .663-.682V26.54c0-.585-.248-1.13-.69-1.502-1.333-1.123-2.76-1.943-3.41-2.294v-1.84c.322-.345.51-.8.51-1.288v-2.598c0-1.668-1.32-3.018-2.934-3.018h-.542C29.319 14.007 28 15.357 28 17.025zM5.663 29h5.392a.67.67 0 0 0 .663-.682.67.67 0 0 0-.663-.683H6.326V26.54c0-.172.074-.338.201-.448a18.641 18.641 0 0 1 3.463-2.282.796.796 0 0 0 .435-.717V20.59a.69.69 0 0 0-.294-.565.487.487 0 0 1-.215-.407V17.02c0-.91.724-1.654 1.608-1.654h.542c.884 0 1.608.744 1.608 1.654v2.6c0 .165-.08.316-.215.406a.673.673 0 0 0-.294.565v1.255c0 .379.294.682.663.682a.67.67 0 0 0 .663-.682v-.938c.321-.344.509-.8.509-1.289V17.02C15 15.351 13.68 14 12.066 14h-.542c-1.621 0-2.934 1.358-2.934 3.02v2.598c0 .49.188.945.51 1.29v1.84c-.657.351-2.077 1.165-3.41 2.295A1.97 1.97 0 0 0 5 26.546v1.772c0 .379.295.682.663.682z"></path>
								<path d="M25.412 17.061v-3.355c0-2.046-1.595-3.706-3.561-3.706h-.695c-1.966 0-3.562 1.66-3.562 3.706v3.355c0 .607.239 1.171.649 1.585v2.583c-.775.413-2.668 1.488-4.435 3.004A2.33 2.33 0 0 0 13 26.017v2.301c0 .379.291.682.655.682h15.69a.666.666 0 0 0 .655-.682v-2.301a2.33 2.33 0 0 0-.808-1.784c-1.767-1.509-3.66-2.59-4.435-3.004v-2.583c.417-.407.655-.978.655-1.585zm2.953 8.226c.212.179.33.448.33.73v1.619H14.318v-1.619c0-.282.12-.551.331-.73 1.947-1.667 4.058-2.776 4.462-2.983a.845.845 0 0 0 .45-.744v-3.238a.692.692 0 0 0-.29-.565.839.839 0 0 1-.358-.689v-3.355c0-1.295 1.012-2.342 2.25-2.342h.695c1.245 0 2.251 1.054 2.251 2.342v3.355a.83.83 0 0 1-.357.69.675.675 0 0 0-.291.564v3.238c0 .317.178.606.45.744.397.207 2.509 1.323 4.455 2.983z"></path>
							</g>
						</g>
					</svg>
					<div class="_1Y9r0">
						<div class="_3TIsb">지원자 수</div>
						<div class="_1GMZ1 _1mdUo">현재<%=apply_cnt %>명 </div>
					</div>
				</div>
				<div class="_1gHH2"></div>	<!-- 구분선 -->
				<div class="XIc6g">	<!-- 시급아이콘 -->
					<svg xmlns="http://www.w3.org/2000/svg" width="43" height="43" viewBox="0 0 43 43">
						<g fill="none" fill-rule="evenodd">
							<circle cx="21.5" cy="21.5" r="21.5" fill="#F2F3F5"></circle>
							<path fill="#767B7E" fill-rule="nonzero" d="M20.781 30.125h1.438v-1.438H20.78v1.438zm.719-17.25a.719.719 0 0 0-.719.719v7.205h-5.75a.719.719 0 0 0 0 1.437H21.5a.719.719 0 0 0 .719-.719v-7.923a.719.719 0 0 0-.719-.719zM14.84 26.41l.994.997.995-.997-.995-.996-.995.996zm2.127-10.428l-1.017-1.016-1.017 1.016 1.017 1.016 1.017-1.016zm8.9-.036l.995.997.995-.997-.995-.997-.995.997zm-.21 10.426l1.016 1.016 1.016-1.016-1.016-1.017-1.016 1.017zm3.03-5.59v1.437h1.438V20.78h-1.438zM21.5 10C15.148 10 10 15.15 10 21.5 10 27.852 15.148 33 21.5 33S33 27.85 33 21.5 27.852 10 21.5 10zm0 21.563c-5.557 0-10.063-4.506-10.063-10.063S15.944 11.437 21.5 11.437 31.563 15.944 31.563 21.5 27.056 31.563 21.5 31.563z"></path>
						</g>
					</svg>
					<div class="_1Y9r0">	<!-- 시급 -->
						<div class="_3TIsb">시급</div>
						<div class="_1GMZ1"><%=board.getB_money() %></div>
					</div>
				</div>
			</div>
		</div>
		
		<div>
			<div class="_D2zw1T">
				<div class="DXIc6g">
					<div class="_D1Y9r0">
						<div class="_D3TIsb">요청사항</div>
						<div class="_DconBox">
							<div class="_D1GMZ1 _D1mdUo"><%=board.getB_content() %></div>
						</div>
					</div>
				</div>
				<div class="_D1gHH2"></div>	<!-- 구분선 -->
				<div class="DXIc6g">
					<div class="_D1Y9r0">
						<div class="_D3TIsb">지도</div>
						<div class="_DconBox"> <!-- 지도 이미지 -->
							<div class="_D1GMZ1 _D1mdUo"><div id="map" style="width:100%;height:300px;"></div></div>
						</div>
					</div>	
				</div>
			</div>
		</div>
		
		<div>
			<div class="_E2zw1T">
				<div class="EXIc6g">
					<svg xmlns="http://www.w3.org/2000/svg" width="43" height="43" viewBox="0 0 43 43">	<!-- 카테고리 아이콘 -->
						<img class="post_top_img" src="./resources/image/<%=b_category_img%>">
					</svg>
					<div class="_E1Y9r0">
						<div class="_E3TIsb"><%=b_category %></div>
					</div>
				</div>
				<div class="_E1gHH2"></div>	<!-- 구분선 -->
				<div class="EXIc6g">
					<%if(board.getB_up_file() == null){ %>
						<svg id="no-cam" enable-background="new 0 0 300 300" height="58px" viewBox="0 0 300 300" width="58px" xmlns="http://www.w3.org/2000/svg"><g><circle cx="111.695" cy="117.432" fill="#d2ddff" r="86"/><g><path d="m223.752 211.432h-140.113c-5.492 0-9.943-4.452-9.943-9.943v-96.113c0-5.492 4.452-9.943 9.943-9.943h140.113c5.492 0 9.943 4.452 9.943 9.943v96.113c0 5.491-4.452 9.943-9.943 9.943z" fill="#6b4f5b"/><path d="m223.75 215.432h-140.109c-7.691 0-13.945-6.256-13.945-13.943v-96.113c0-7.688 6.254-13.943 13.945-13.943h140.109c7.691 0 13.945 6.256 13.945 13.943v96.113c0 7.687-6.254 13.943-13.945 13.943zm-140.109-116c-3.277 0-5.945 2.666-5.945 5.943v96.113c0 3.277 2.668 5.943 5.945 5.943h140.109c3.277 0 5.945-2.666 5.945-5.943v-96.113c0-3.277-2.668-5.943-5.945-5.943z" fill="#4c241d"/></g><path d="m233.695 143.432h-160c-2.211 0-4-1.791-4-4s1.789-4 4-4h160c2.211 0 4 1.791 4 4s-1.789 4-4 4z" fill="#4c241d"/><g><path d="m89.695 83.432h24v12h-24z" fill="#f53e28"/><path d="m113.695 99.432h-24c-2.211 0-4-1.791-4-4v-12c0-2.209 1.789-4 4-4h24c2.211 0 4 1.791 4 4v12c0 2.209-1.789 4-4 4zm-20-8h16v-4h-16z" fill="#4c241d"/></g><g><path d="m124.287 95.581 11.402-17.131c2.918-4.385 7.836-7.019 13.103-7.019h15.843c4.789 0 9.318 2.181 12.305 5.925l14.538 18.225z" fill="#b5a19c"/><path d="m191.477 99.582h-67.191c-1.477 0-2.828-.811-3.527-2.111-.695-1.301-.621-2.877.199-4.105l11.402-17.131c3.668-5.512 9.812-8.803 16.434-8.803h15.844c6.039 0 11.664 2.707 15.43 7.428l14.539 18.229c.957 1.201 1.141 2.846.477 4.23-.67 1.382-2.072 2.263-3.607 2.263zm-59.723-8h51.418l-9.359-11.732c-2.238-2.807-5.586-4.418-9.176-4.418h-15.844c-3.938 0-7.594 1.957-9.777 5.236z" fill="#4c241d"/></g><g><circle cx="151.737" cy="150" fill="#b5a19c" r="38.679"/><path d="m151.738 192.68c-23.535 0-42.68-19.146-42.68-42.68s19.145-42.68 42.68-42.68c23.531 0 42.676 19.146 42.676 42.68s-19.144 42.68-42.676 42.68zm0-77.36c-19.121 0-34.68 15.557-34.68 34.68s15.559 34.68 34.68 34.68 34.676-15.557 34.676-34.68-15.555-34.68-34.676-34.68z" fill="#4c241d"/></g><path d="m151.738 272.568c-67.586 0-122.57-54.984-122.57-122.568s54.984-122.568 122.57-122.568c67.582 0 122.566 54.984 122.566 122.568s-54.984 122.568-122.566 122.568zm0-237.136c-63.176 0-114.57 51.395-114.57 114.568s51.395 114.568 114.57 114.568c63.172 0 114.566-51.395 114.566-114.568s-51.394-114.568-114.566-114.568z" fill="#e66353"/><g><circle cx="151.737" cy="150" fill="#26deeb" r="23.338"/><path d="m151.738 177.338c-15.074 0-27.34-12.264-27.34-27.338s12.266-27.338 27.34-27.338 27.336 12.264 27.336 27.338-12.262 27.338-27.336 27.338zm0-46.676c-10.664 0-19.34 8.676-19.34 19.338s8.676 19.338 19.34 19.338c10.66 0 19.336-8.676 19.336-19.338s-8.676-19.338-19.336-19.338z" fill="#4c241d"/></g><g><circle cx="208.618" cy="137.523" fill="#e5efef" r="9.101"/><path d="m208.617 150.623c-7.223 0-13.102-5.877-13.102-13.1 0-7.225 5.879-13.102 13.102-13.102s13.102 5.877 13.102 13.102c0 7.223-5.879 13.1-13.102 13.1zm0-18.201c-2.812 0-5.102 2.289-5.102 5.102s2.289 5.1 5.102 5.1 5.102-2.287 5.102-5.1-2.289-5.102-5.102-5.102z" fill="#4c241d"/></g><path d="m65.695 235.432c-1.023 0-2.047-.391-2.828-1.172-1.562-1.562-1.562-4.094 0-5.656l166.457-166.458c1.562-1.562 4.094-1.562 5.656 0s1.562 4.094 0 5.656l-166.457 166.458c-.781.781-1.804 1.172-2.828 1.172z" fill="#e66353"/></g></svg>
					<%}else { %>
						<img src="/myakkbird/myakkbirdUpload/<%=board.getB_up_file() %>" width="50" height="50" onclick="big_img('http://localhost:8080/myakkbird/myakkbirdUpload/<%=board.getB_up_file() %>')">
					<%} %>
					<div class="_E1Y9r0">
						<div class="_E3TIsb">첨부사진</div>
					</div>	
				</div>
				<div class="_E1gHH2"></div>	<!-- 구분선 -->
				
			 	<%if(apply_chk.equals("0")) {%> 
				<div class="EXIc6g">
					<svg id="Capa_1" enable-background="new 0 0 512 512" height="48px" viewBox="0 0 512 512" width="48px" xmlns="http://www.w3.org/2000/svg"><g><g><g><g><path d="m478.214 399.076h-444.428c-14.517 0-26.286-11.768-26.286-26.286v-338.311c0-14.517 11.768-26.286 26.286-26.286h444.429c14.517 0 26.286 11.768 26.286 26.286v338.312c-.001 14.517-11.769 26.285-26.287 26.285z" fill="#f4fbff"/><path d="m478.214 8.194h-63.734c14.517 0 26.286 11.768 26.286 26.286v338.312c0 14.517-11.768 26.285-26.286 26.285h63.734c14.517 0 26.286-11.768 26.286-26.285v-338.313c0-14.517-11.768-26.285-26.286-26.285z" fill="#e4f6ff"/><path d="m414.273 314.55h-316.546c-14.632 0-26.494-11.862-26.494-26.494v-109.812c0-14.632 11.862-26.494 26.494-26.494h316.545c14.632 0 26.494 11.862 26.494 26.494v109.812c0 14.632-11.861 26.494-26.493 26.494z" fill="#ffe07d"/><path d="m478.214 8.194h-444.428c-14.518 0-26.286 11.768-26.286 26.285v45.45h497v-45.45c0-14.517-11.768-26.285-26.286-26.285z" fill="#cbe2ff"/><path d="m440.766 34.479v45.45h63.734v-45.45c0-14.517-11.768-26.286-26.286-26.286h-63.734c14.518.001 26.286 11.769 26.286 26.286z" fill="#bed8fb"/></g></g><g><g><g><g><g><path d="m246.089 318.091c-4.913-.285-9.438 1.351-12.904 4.221v-112.305c0-10.039-7.807-18.59-17.84-18.947-10.533-.374-19.19 8.053-19.19 18.503v89.714c0-10.45-8.657-18.877-19.19-18.503-10.033.357-17.84 8.907-17.84 18.946v17.842c0-10.45-8.657-18.877-19.19-18.503-10.033.357-17.84 8.907-17.84 18.947v10.256c0-10.449-8.657-18.877-19.19-18.502-10.033.357-17.839 8.907-17.839 18.947v60.017c0 10.057 2.044 20.01 6.008 29.253l15.761 37.256c3.101 7.33 4.699 15.207 4.699 23.166v16.457h114.249c.964-14.272 6.024-36.798 14.645-48.301l8.245-11.002c9.625-12.843 14.827-28.459 14.827-44.508v-53.999c0-9.882-7.547-18.383-17.411-18.955z" fill="#ffddce"/><path d="m177.152 280.768c-3.18.082-6.143.989-8.712 2.505 5.502 3.209 9.201 9.174 9.201 16.004v17.074c0 10.225 8.289 18.515 18.515 18.515v-35.589c0-10.388-8.555-18.778-19.004-18.509z" fill="#ffcbbe"/><path d="m233.185 322.312v-112.305c0-9.335-6.734-17.538-15.985-18.788-3.718-.503-7.237.135-10.313 1.564 4.794 2.627 8.283 8.486 8.283 16.78v94.734c0 9.949 8.066 18.015 18.015 18.015z" fill="#ffcbbe"/><g><path d="m159.126 317.562c0-10.388-8.555-18.778-19.003-18.509-3.18.082-6.143.989-8.712 2.505 5.503 3.209 9.201 9.175 9.201 16.004v6.765c0 10.225 8.289 18.515 18.515 18.515z" fill="#ffcbbe"/></g><g><path d="m103.093 309.753c-3.18.082-6.143.989-8.712 2.505 5.503 3.209 9.201 9.174 9.201 16.003v4.043c0 10.225 8.289 18.515 18.515 18.515v-22.558c-.001-10.387-8.555-18.777-19.004-18.508z" fill="#ffcbbe"/></g></g><path d="m109.075 503.806h120.886c6.395 0 11.58-5.185 11.58-11.58v-20.932c0-6.395-5.185-11.58-11.58-11.58h-120.886c-6.395 0-11.58 5.185-11.58 11.58v20.932c0 6.396 5.184 11.58 11.58 11.58z" fill="#e28086"/><path d="m229.961 459.714h-63.646c6.396 0 11.58 5.185 11.58 11.58v20.932c0 6.396-5.185 11.58-11.58 11.58h63.646c6.395 0 11.58-5.185 11.58-11.58v-20.932c0-6.396-5.185-11.58-11.58-11.58z" fill="#dd636e"/></g></g></g></g></g><g><path d="m148.116 191.295v66.904c0 7.913-8.768 13.173-16.708 5.532-2.924-2.9-7.644-2.901-10.567.007-2.938 2.919-2.952 7.668-.032 10.606 16.733 16.872 42.308 5.496 42.308-16.146v-66.904c0-4.143-3.357-7.5-7.5-7.5s-7.501 3.358-7.501 7.501z"/><path d="m359.093 183.795h-24.315c-4.143 0-7.5 3.357-7.5 7.5v83.71c0 4.128 3.346 7.5 7.5 7.5h.033s22.364-.1 28.529-.1c16.56 0 30.032-13.473 30.032-30.032 0-10.437-5.355-19.644-13.459-25.029 3.712-4.595 5.941-10.435 5.941-16.788 0-14.756-12.004-26.761-26.761-26.761zm0 15c6.485 0 11.762 5.276 11.762 11.762s-5.276 11.762-11.762 11.762c-1.326 0 4.633-.01-16.815.022v-23.546zm4.247 68.61c-3.841 0-13.957.038-21.062.067v-30.101c14.767-.06 7.536-.016 21.062-.031 8.289 0 15.032 6.743 15.032 15.032s-6.743 15.033-15.032 15.033z"/><circle cx="370.137" cy="42.69" r="7.5"/><circle cx="401.137" cy="42.69" r="7.5"/><circle cx="432.137" cy="42.69" r="7.5"/><path d="m478.215.693h-444.43c-18.629 0-33.785 15.157-33.785 33.786v338.312c0 18.629 15.156 33.785 33.785 33.785h16.213c4.143 0 7.5-3.357 7.5-7.5s-3.357-7.5-7.5-7.5h-16.213c-10.358 0-18.785-8.427-18.785-18.785v-285.361h482v285.361c0 10.358-8.427 18.785-18.785 18.785h-179.653c-4.143 0-7.5 3.357-7.5 7.5s3.357 7.5 7.5 7.5h179.652c18.629 0 33.785-15.156 33.785-33.785v-338.312c.001-18.629-15.155-33.786-33.784-33.786zm-463.215 71.737v-37.95c0-10.358 8.427-18.786 18.785-18.786h444.43c10.358 0 18.785 8.428 18.785 18.786v37.95z"/><path d="m414.272 322.05c18.744 0 33.994-15.25 33.994-33.994v-37.389c0-4.143-3.357-7.5-7.5-7.5s-7.5 3.357-7.5 7.5v37.389c0 10.474-8.521 18.994-18.994 18.994h-173.586v-25.329c2.829.51 5.74.784 8.714.784 27.215 0 49.355-22.141 49.355-49.355s-22.141-49.354-49.355-49.354c-7.156 0-13.957 1.536-20.1 4.288-3.913-2.695-8.598-4.338-13.687-4.519-14.654-.566-26.957 11.194-26.957 25.998v66.128c-14.947-6.998-33.017 1.604-36.479 18.551-12.575-6.257-28.356-1.396-34.862 11.913-8.235-5.145-18.574-5.13-26.651-.459-7.193-2.865-11.93-9.775-11.93-17.639v-109.813c0-10.474 8.521-18.994 18.994-18.994h316.545c10.474 0 18.994 8.521 18.994 18.994v37.374c0 4.143 3.357 7.5 7.5 7.5s7.5-3.357 7.5-7.5v-37.374c0-18.744-15.25-33.994-33.994-33.994h-316.545c-18.744 0-33.994 15.25-33.994 33.994v109.812c0 12.177 6.349 23.077 16.404 29.115-1.647 3.484-2.571 7.394-2.571 11.534v60.018c0 25.002 10.109 37.628 21.152 66.57-5.242 3.405-8.723 9.299-8.723 16.001v20.933c0 10.521 8.56 19.08 19.08 19.08h120.886c10.521 0 19.08-8.56 19.08-19.08v-20.933c0-5.585-2.427-10.602-6.265-14.094 6.273-12.84 28.224-29.587 28.224-66.156v-53.999c0-5.551-1.688-10.72-4.572-14.994h147.843zm-130.517-88.901c0 18.943-15.412 34.355-34.355 34.355-3.011 0-5.93-.396-8.714-1.128v-56.37c0-3.376-.618-6.598-1.737-9.563 3.298-1.059 6.805-1.649 10.451-1.649 18.943.001 34.355 15.412 34.355 34.355zm-49.714 259.078c0 2.25-1.83 4.08-4.08 4.08h-120.886c-2.25 0-4.08-1.83-4.08-4.08v-20.933c0-2.249 1.828-4.077 4.076-4.08h.006 120.884c2.25 0 4.08 1.83 4.08 4.08zm21.959-101.184c0 32.352-18.626 41.971-27.453 61.171h-114.844c-12.426-31.981-21.136-42.388-21.136-63.491v-60.018c0-9.944 11.566-15.221 18.663-8.37 2.172 2.096 3.367 4.91 3.367 7.927 0 4.143 3.357 7.5 7.5 7.5s7.5-3.357 7.5-7.5v-10.256c0-9.969 11.577-15.208 18.662-8.371 2.171 2.095 3.367 4.911 3.367 7.928 0 4.143 3.357 7.5 7.5 7.5s7.5-3.357 7.5-7.5v-17.842c0-9.966 11.579-15.209 18.662-8.371 2.171 2.095 3.367 4.91 3.367 7.927 0 4.143 3.357 7.5 7.5 7.5s7.5-3.357 7.5-7.5v-89.714c0-6.222 5.158-11.249 11.424-11.008 5.849.208 10.606 5.346 10.606 11.452v112.305c0 6.352 7.417 9.81 12.284 5.775 2.15-1.779 4.888-2.67 7.685-2.509 5.802.337 10.346 5.373 10.346 11.466z"/></g></g></svg>				
					<div class="_E1Y9r0">
						<div class="_E3TIsb">신청하기</div>
					</div>
				</div>
				<%}else{ %>
				<div class="EXIc6g_ard">
					<svg id="Capa_1" enable-background="new 0 0 512 512" height="48px" viewBox="0 0 512 512" width="48px" xmlns="http://www.w3.org/2000/svg"><g><g><g><g><path d="m478.214 399.076h-444.428c-14.517 0-26.286-11.768-26.286-26.286v-338.311c0-14.517 11.768-26.286 26.286-26.286h444.429c14.517 0 26.286 11.768 26.286 26.286v338.312c-.001 14.517-11.769 26.285-26.287 26.285z" fill="#f4fbff"/><path d="m478.214 8.194h-63.734c14.517 0 26.286 11.768 26.286 26.286v338.312c0 14.517-11.768 26.285-26.286 26.285h63.734c14.517 0 26.286-11.768 26.286-26.285v-338.313c0-14.517-11.768-26.285-26.286-26.285z" fill="#e4f6ff"/><path d="m414.273 314.55h-316.546c-14.632 0-26.494-11.862-26.494-26.494v-109.812c0-14.632 11.862-26.494 26.494-26.494h316.545c14.632 0 26.494 11.862 26.494 26.494v109.812c0 14.632-11.861 26.494-26.493 26.494z" fill="#ffe07d"/><path d="m478.214 8.194h-444.428c-14.518 0-26.286 11.768-26.286 26.285v45.45h497v-45.45c0-14.517-11.768-26.285-26.286-26.285z" fill="#cbe2ff"/><path d="m440.766 34.479v45.45h63.734v-45.45c0-14.517-11.768-26.286-26.286-26.286h-63.734c14.518.001 26.286 11.769 26.286 26.286z" fill="#bed8fb"/></g></g><g><g><g><g><g><path d="m246.089 318.091c-4.913-.285-9.438 1.351-12.904 4.221v-112.305c0-10.039-7.807-18.59-17.84-18.947-10.533-.374-19.19 8.053-19.19 18.503v89.714c0-10.45-8.657-18.877-19.19-18.503-10.033.357-17.84 8.907-17.84 18.946v17.842c0-10.45-8.657-18.877-19.19-18.503-10.033.357-17.84 8.907-17.84 18.947v10.256c0-10.449-8.657-18.877-19.19-18.502-10.033.357-17.839 8.907-17.839 18.947v60.017c0 10.057 2.044 20.01 6.008 29.253l15.761 37.256c3.101 7.33 4.699 15.207 4.699 23.166v16.457h114.249c.964-14.272 6.024-36.798 14.645-48.301l8.245-11.002c9.625-12.843 14.827-28.459 14.827-44.508v-53.999c0-9.882-7.547-18.383-17.411-18.955z" fill="#ffddce"/><path d="m177.152 280.768c-3.18.082-6.143.989-8.712 2.505 5.502 3.209 9.201 9.174 9.201 16.004v17.074c0 10.225 8.289 18.515 18.515 18.515v-35.589c0-10.388-8.555-18.778-19.004-18.509z" fill="#ffcbbe"/><path d="m233.185 322.312v-112.305c0-9.335-6.734-17.538-15.985-18.788-3.718-.503-7.237.135-10.313 1.564 4.794 2.627 8.283 8.486 8.283 16.78v94.734c0 9.949 8.066 18.015 18.015 18.015z" fill="#ffcbbe"/><g><path d="m159.126 317.562c0-10.388-8.555-18.778-19.003-18.509-3.18.082-6.143.989-8.712 2.505 5.503 3.209 9.201 9.175 9.201 16.004v6.765c0 10.225 8.289 18.515 18.515 18.515z" fill="#ffcbbe"/></g><g><path d="m103.093 309.753c-3.18.082-6.143.989-8.712 2.505 5.503 3.209 9.201 9.174 9.201 16.003v4.043c0 10.225 8.289 18.515 18.515 18.515v-22.558c-.001-10.387-8.555-18.777-19.004-18.508z" fill="#ffcbbe"/></g></g><path d="m109.075 503.806h120.886c6.395 0 11.58-5.185 11.58-11.58v-20.932c0-6.395-5.185-11.58-11.58-11.58h-120.886c-6.395 0-11.58 5.185-11.58 11.58v20.932c0 6.396 5.184 11.58 11.58 11.58z" fill="#e28086"/><path d="m229.961 459.714h-63.646c6.396 0 11.58 5.185 11.58 11.58v20.932c0 6.396-5.185 11.58-11.58 11.58h63.646c6.395 0 11.58-5.185 11.58-11.58v-20.932c0-6.396-5.185-11.58-11.58-11.58z" fill="#dd636e"/></g></g></g></g></g><g><path d="m148.116 191.295v66.904c0 7.913-8.768 13.173-16.708 5.532-2.924-2.9-7.644-2.901-10.567.007-2.938 2.919-2.952 7.668-.032 10.606 16.733 16.872 42.308 5.496 42.308-16.146v-66.904c0-4.143-3.357-7.5-7.5-7.5s-7.501 3.358-7.501 7.501z"/><path d="m359.093 183.795h-24.315c-4.143 0-7.5 3.357-7.5 7.5v83.71c0 4.128 3.346 7.5 7.5 7.5h.033s22.364-.1 28.529-.1c16.56 0 30.032-13.473 30.032-30.032 0-10.437-5.355-19.644-13.459-25.029 3.712-4.595 5.941-10.435 5.941-16.788 0-14.756-12.004-26.761-26.761-26.761zm0 15c6.485 0 11.762 5.276 11.762 11.762s-5.276 11.762-11.762 11.762c-1.326 0 4.633-.01-16.815.022v-23.546zm4.247 68.61c-3.841 0-13.957.038-21.062.067v-30.101c14.767-.06 7.536-.016 21.062-.031 8.289 0 15.032 6.743 15.032 15.032s-6.743 15.033-15.032 15.033z"/><circle cx="370.137" cy="42.69" r="7.5"/><circle cx="401.137" cy="42.69" r="7.5"/><circle cx="432.137" cy="42.69" r="7.5"/><path d="m478.215.693h-444.43c-18.629 0-33.785 15.157-33.785 33.786v338.312c0 18.629 15.156 33.785 33.785 33.785h16.213c4.143 0 7.5-3.357 7.5-7.5s-3.357-7.5-7.5-7.5h-16.213c-10.358 0-18.785-8.427-18.785-18.785v-285.361h482v285.361c0 10.358-8.427 18.785-18.785 18.785h-179.653c-4.143 0-7.5 3.357-7.5 7.5s3.357 7.5 7.5 7.5h179.652c18.629 0 33.785-15.156 33.785-33.785v-338.312c.001-18.629-15.155-33.786-33.784-33.786zm-463.215 71.737v-37.95c0-10.358 8.427-18.786 18.785-18.786h444.43c10.358 0 18.785 8.428 18.785 18.786v37.95z"/><path d="m414.272 322.05c18.744 0 33.994-15.25 33.994-33.994v-37.389c0-4.143-3.357-7.5-7.5-7.5s-7.5 3.357-7.5 7.5v37.389c0 10.474-8.521 18.994-18.994 18.994h-173.586v-25.329c2.829.51 5.74.784 8.714.784 27.215 0 49.355-22.141 49.355-49.355s-22.141-49.354-49.355-49.354c-7.156 0-13.957 1.536-20.1 4.288-3.913-2.695-8.598-4.338-13.687-4.519-14.654-.566-26.957 11.194-26.957 25.998v66.128c-14.947-6.998-33.017 1.604-36.479 18.551-12.575-6.257-28.356-1.396-34.862 11.913-8.235-5.145-18.574-5.13-26.651-.459-7.193-2.865-11.93-9.775-11.93-17.639v-109.813c0-10.474 8.521-18.994 18.994-18.994h316.545c10.474 0 18.994 8.521 18.994 18.994v37.374c0 4.143 3.357 7.5 7.5 7.5s7.5-3.357 7.5-7.5v-37.374c0-18.744-15.25-33.994-33.994-33.994h-316.545c-18.744 0-33.994 15.25-33.994 33.994v109.812c0 12.177 6.349 23.077 16.404 29.115-1.647 3.484-2.571 7.394-2.571 11.534v60.018c0 25.002 10.109 37.628 21.152 66.57-5.242 3.405-8.723 9.299-8.723 16.001v20.933c0 10.521 8.56 19.08 19.08 19.08h120.886c10.521 0 19.08-8.56 19.08-19.08v-20.933c0-5.585-2.427-10.602-6.265-14.094 6.273-12.84 28.224-29.587 28.224-66.156v-53.999c0-5.551-1.688-10.72-4.572-14.994h147.843zm-130.517-88.901c0 18.943-15.412 34.355-34.355 34.355-3.011 0-5.93-.396-8.714-1.128v-56.37c0-3.376-.618-6.598-1.737-9.563 3.298-1.059 6.805-1.649 10.451-1.649 18.943.001 34.355 15.412 34.355 34.355zm-49.714 259.078c0 2.25-1.83 4.08-4.08 4.08h-120.886c-2.25 0-4.08-1.83-4.08-4.08v-20.933c0-2.249 1.828-4.077 4.076-4.08h.006 120.884c2.25 0 4.08 1.83 4.08 4.08zm21.959-101.184c0 32.352-18.626 41.971-27.453 61.171h-114.844c-12.426-31.981-21.136-42.388-21.136-63.491v-60.018c0-9.944 11.566-15.221 18.663-8.37 2.172 2.096 3.367 4.91 3.367 7.927 0 4.143 3.357 7.5 7.5 7.5s7.5-3.357 7.5-7.5v-10.256c0-9.969 11.577-15.208 18.662-8.371 2.171 2.095 3.367 4.911 3.367 7.928 0 4.143 3.357 7.5 7.5 7.5s7.5-3.357 7.5-7.5v-17.842c0-9.966 11.579-15.209 18.662-8.371 2.171 2.095 3.367 4.91 3.367 7.927 0 4.143 3.357 7.5 7.5 7.5s7.5-3.357 7.5-7.5v-89.714c0-6.222 5.158-11.249 11.424-11.008 5.849.208 10.606 5.346 10.606 11.452v112.305c0 6.352 7.417 9.81 12.284 5.775 2.15-1.779 4.888-2.67 7.685-2.509 5.802.337 10.346 5.373 10.346 11.466z"/></g></g></svg>				
					<div class="_E1Y9r0_ard">
						<div class="_E3TIsb_ard">신청하기</div>
					</div>
				</div>
				<%} %>
			
			</div>
		</div>
		
		<!-- 댓글리스트 -->
		<jsp:include page="./comments.jsp">
			<jsp:param name="b_num" value="<%=board.getB_num() %>" />
		</jsp:include>
		
	</div>
	</div>
	
	<jsp:include page="../footer_container.jsp"></jsp:include>
	<script>
	$(document).ready(function() {
		var login_id = '<%=e_id%>';
		if(login_id == 'null'){	
			let timerInterval
			Swal.fire({
			  title: '로그인이 필요한 서비스 입니다.',
			  html: '회원가입 및 로그인을 이용해 주세요.',
			  timer: 2000, 
			  confirmButtonColor: "#37b04b",
			  timerProgressBar: true,
			  onBeforeOpen: () => {
			    Swal.showLoading()
			    timerInterval = setInterval(() => {
			      const content = Swal.getContent()
			    }, 100)
			  },
			  onClose: () => {
			    clearInterval(timerInterval)
			    location.href="loginform.ak";
			  }
			}).then((result) => {
			  if (result.dismiss === Swal.DismissReason.timer) {
			    console.log('I was closed by the timer')
			  }
			})
		}
	}); 
	//이미지 띄우는 모달창
	function big_img(up_img) {
		Swal.fire({
			  title: 'Sweet!',
			  text: '악어님이 업로드한 사진이에요.',
			  imageUrl: up_img,
			  imageWidth: 550,
			  imageHeight: 350,
			  confirmButtonColor:'#37B04B',
			  confirmButtonText:'OK'
		})  
	}
	//신청하기 모달창(신청전)
	$('.EXIc6g:nth-last-child(1)').click(function (event) {
		
		var member_type = '<%=m_type%>';
	 	if( member_type == "E"){	 		
	 		if(<%=heart%> == 0){
				Swal.fire({
				  title: '하트가 부족해요 <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="40" height="40"><path fill="none" d="M0 0h24v24H0z"/><path d="M12 2c5.523 0 10 4.477 10 10 0 .727-.077 1.435-.225 2.118l-1.782-1.783a8 8 0 1 0-4.375 6.801 3.997 3.997 0 0 0 1.555 1.423A9.956 9.956 0 0 1 12 22C6.477 22 2 17.523 2 12S6.477 2 12 2zm7 12.172l1.414 1.414a2 2 0 1 1-2.93.11l.102-.11L19 14.172zM12 15c1.466 0 2.785.631 3.7 1.637l-.945.86C13.965 17.182 13.018 17 12 17c-1.018 0-1.965.183-2.755.496l-.945-.86A4.987 4.987 0 0 1 12 15zm-3.5-5a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3zm7 0a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3z" fill="rgba(55,176,75,1)"/></svg>',
				  text: "지금, 하트 충전하러 가기!",
				  icon: 'info',
				  iconColor: '#37B04B',
				  showCancelButton: true,
				  confirmButtonColor: '#37B04B',
				  cancelButtonColor: '#E6E6E6',
				  confirmButtonText: '<div onclick="location.href=\'pay.ak\'">Add Heart</div>',
				  cancelButtonText:'Close',
				})
	 		}else{
				Swal.fire({
				  title: '매칭을 원해요!',
				  text: "매칭 신청시 1 하트가 차감됩니다",
				  icon: 'info',
				  iconColor: '#37B04B',
				  showCancelButton: true,
				  confirmButtonColor: '#37B04B',
				  cancelButtonColor: '#E6E6E6',
				  confirmButtonText: '<div onclick="apply_match()">신청 할래요</div>',
				  cancelButtonText:'다음에 할게요',
				})	 			
	 		}
		}else{
			Swal.fire({
			  title: 'Are you a Crocodile?',
			  text: "악어새 회원님만 매칭을 신청할 수 있어요!",
			  icon: 'info',
			  iconColor: '#37B04B',
			  showCancelButton: true,
			  confirmButtonColor: '#37B04B',
			  cancelButtonColor: '#E6E6E6',
			  confirmButtonText: '<div onclick="location.href=\'allowListC.ak\'">매칭내역보러가기</div>',
			  cancelButtonText:'Close',
			})
		} 
		
	});	
	//신청하기 모달창(이미신청한경우)
	$('.EXIc6g_ard').click(function (event) {
		Swal.fire({
		  title: 'Aleady applied?',
		  text: "이미 매칭 신청을 완료한 게시물 입니다!",
		  icon: 'info',
		  iconColor: '#37B04B',
		  showCancelButton: true,
		  confirmButtonColor: '#37B04B',
		  cancelButtonColor: '#E6E6E6',
		  confirmButtonText: '<div onclick="location.href=\'allowListE.ak\'">신청내역보기</div>',
		  cancelButtonText:'Close',
		})
	});	
	
	var b_num = $('[name=b_num]').val();
	var c_id = $('[name=c_id]').val();
	var e_id = $('[name=e_id]').val();
	
	//매칭 신청하기 통신
	function apply_match() {
  		$.ajax({
			url : '/myakkbird/apply_match.ak',
			type : 'POST',
			data : {'b_num':b_num,'c_id':c_id,'e_id':e_id },
			dataType : 'json',
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			success : function(data) {
				var a = '';
				if(data == 1){
				    let timerInterval
					Swal.fire({
					  title: '신청 완료!',
					  html: '매칭수락 시, 곧 악어님을 만날 수 있어요!',
					  timer: 2000,
					  confirmButtonColor: "#37b04b",
					  timerProgressBar: true,
					  onBeforeOpen: () => {
					    Swal.showLoading()
					    timerInterval = setInterval(() => {
					      const content = Swal.getContent()
					    }, 100)
					  },
					  onClose: () => {
					    clearInterval(timerInterval)
					    location.reload();
					  }
					}).then((result) => {
					  if (result.dismiss === Swal.DismissReason.timer) {
					    console.log('I was closed by the timer')
					  }
					})
				}
			},
			error:function() {
				alert("ajax 통신 실패(매칭 신청하기 통신)!!!");
			}
		}); 
	}
	</script>
	
	<!-- 다음지도api -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3cbd93568d5ed61c52a1851035124ae3&libraries=services"></script>
	<script>
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('<%=board.getB_address_road()%>', function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});
	
	//이미지 누르면 개인프로필창으로 이동
	function profileLink(m_id) {
		location.href="profile.ak?id="+m_id;
	}
	</script>
</body>
</html>