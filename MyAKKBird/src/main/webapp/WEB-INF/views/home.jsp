<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="com.bit.myakkbird.*" %>
<%@ page import="com.bit.myakkbird.review.*" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이악어새</title>
<!-- favicon 적용 -->
<link type="image/x-icon" rel="icon" href="./resources/image/akk_favicon.png">
<!-- favicon 적용 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script src="https://kit.fontawesome.com/535c824fa5.js" crossorigin="anonymous"></script>     
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

   <!-- 메인 카운트 jQuery ui 시작-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <!-- 메인 카운트 jQuery ui 끝-->
  
   <!-- alert창 API 시작 -->
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
   <!-- alert창 API 끝 -->

  <script>
  $( function() {
      var availableTags = ["서울 강남구 신사동", "서울 강남구 압구정동", "서울 강남구 논현동",
            "서울 강남구 삼성동", "서울 강남구 청담동", "서울 강남구 역삼동",
            "서울 강남구 대치동", "서울 강남구 도곡동", "서울 강남구 개포동",
            "서울 강남구 일원동", "서울 강남구 수서동", "서울 강남구 세곡동"];
    $( "#autoText" ).autocomplete({
      source: availableTags
    });
  } );
  </script>

     
<!-- <link rel="stylesheet" type="text/css" href="fonts/font.css"> -->
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
   /* ------------------------------------------------ */
   
   body, html{
      margin:0px;
      padding:0px;
   }
   
   .wrap {
      position: relative;
      min-height:100%;
   }
   
   #content_container{
   }
   /* ------------------------------------------------ */    
   #header_container, #ad_container, #search_container, #review_container, #FAQ_container{
      text-align:center;
   }
   /* ------------------------------------------------ */
   #ad_container{
      height:460px;
         
   }
   /* ------------------------------------------------ */   
   #total_count{
      display:flex;
      justify-content:center;
      align-items:center;
      height:70px;
      background-color: #89df8f;
      color:white;
      font-size: 18px;
       letter-spacing: 1px;
           -webkit-box-shadow: 0 9px 10px 0 rgba(0,0,0,.12);
       box-shadow: 0 9px 10px 0 rgba(0,0,0,.12);
   }
   
   #total_count div{
      padding: 0 0 0 30px;
   }
   
   #boardCount{
       border-right: solid 2px #37b04b50;
   }
   
   #total_count span{
      color: #37b04b;
       font-size: x-large;
       font-weight: bold;
       padding: 0 40px 0 10px;
   }
   
   /* ------------------------------------------------ */
   
   #search_container{
      
      height: 400px;
   }
   
   .mySlides.fade img{
      cursor: pointer;
      width:1024px;
      height:400px;
   }
   /* ------------------------------------------------ */   
   #search_area{
       display: flex;
       flex-direction: row;
       justify-content: center;
       padding: 55px 0 15px;
   }
   
   #search_area span{
       position: relative;
       top: 5px;
      color: #37b04b;
      font-size: 50px;
      cursor:pointer;
   }
   
   #search_area span:hover{
      color:#1e6129;
   }
   
   #search_area input{
      text-align: center;
      height:50px;
      width:500px;
      border: solid 3px #37b04b;
      border-radius: 4px; 
      line-height: 70px;
   }
   
   #search_category{
      display:flex;
      flex-direction: row;
      justify-content:center;
   }
   
   .btn_category{
      width: 60px;
       height: 80px;
       margin: 0 20px 10px 20px;
       padding: 5px 5px 5px 5px;
       border-radius: 20px;
       cursor: pointer;
   }
   
   .btn_category img{
      width:50px;
      height:50px;
   }
   
   #search_category >div > span{
      color: #37b04b;
      size:20px;
   }
         /* 자동완성 style 시작 */
      .ui-autocomplete {
         width: 100px;
          max-height: 200px;
          overflow-y: 100px;
          overflow-x: hidden;
          font-size: 14px;
          font-family: "NotoSansKR-Regular";
       }
       
         * html .ui-autocomplete {
            height: 200px;
         }
         
         .ui-autocomplete::-webkit-scrollbar {
          width: 12px;
        }
        
        .ui-autocomplete::-webkit-scrollbar-thumb {
          background-color: #E6E6E6;
          border-radius: 10px;
          background-clip: padding-box;
          border: 2px solid transparent;
        }
        
         /* 자동완성 style 끝 */
   
   /* ------------------------------------------------ */
   
   #review_container{
      background-color: #89df8f;
      display:flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
       -webkit-box-shadow: 0 9px 10px 0 rgba(0,0,0,.12);
    box-shadow: 0 9px 10px 0 rgba(0,0,0,.12);
   }
   
   #review_container > img{
       width: 350px;
       height: 120px;
   }
   
   #btn_container_review{
      width: 300px;
       border: 1px solid green;
       margin-bottom: 10px;
    }
   
   .chooseReview{
      padding: 0px 45px;
   }
   
   .reviews{
      border-spacing:5px;
   }
   
   #more img{
      margin-top:10px;
      width:400px;
      height:50px;
      cursor:pointer;
   }
   
   #org_reviews{
      display:flex;
      flex-direction:column;
      justify-content: center;
      padding:20px 0;
   }
   
   .each_review{
      width:265px;
      padding:5px;
      background-color:white;
      border: solid #89df8f 5px;
      cursor:pointer;
   }
   
   .each_review table{
      position: relative;
      bottom:20px;
      left: 25px;
         border-spacing: 5px;
   }
   
   .each_review_img img {
      width:70px;
      height:70px;
      border-radius:70px;
   }
   
   .each_review_new{
      position:relative;
      bottom:2px;
      left:108px;
      width:40px;
      height:40px;
   }
   
   .review_star{
      width: 80%;
   }
   
   .each_review div{
      width:100%;
      height:150px;
      padding: 5px 0;
      margin:0;
      background-color: #e6f7e4;
      display:block;
        overflow: hidden; 
       text-overflow: ellipsis;
   }
   
   .each_review .content{
      position:relative;
      width:252px;
      overflow:auto;
   }
   
   .each_review .content::-webkit-scrollbar{
      width:5px;
   }
   
   .each_review .content::-webkit-scrollbar-track{
      background-color:#c1c1c1;
      border-radius: 30px;
   }
   
   .each_review .content::-webkit-scrollbar-thumb{
      background-color:#929292;
      border-radius: 10px;
   }
   .each_review .content::-webkit-scrollbar-thumb:hover{
      background: #3a3a3a;    
   }
   
   .each_review .content::-webkit-scrollbar-thumb::-webkit-scrollbar-thumb:active{
      background: #3a3a3a; 
   }
   
   #thumbnails{
      position:absolute;
      left:5px;
      bottom:0px;
      display:flex;
      flex-direction: row;
      width:50px;
      height:50px;
   }
   
   #thumbnails img{
      width:50px;
      height:50px;
   }
   
   .each_pic{
      position:absolute;
      /* right:10px; */
   }
   
   #more_reviews{
      position:relative;
      background-color:#37b04b;
      width:100%;
      height:20px;
   }
   
   .reviews{
      width:800px;
   }
   
   #more{
       border-radius: 50px;
       padding: 7px 20px;
        margin: 15px 10px 5px 10px;
       background-color: #37b04b;
        box-shadow: 9px 9px 9px -9px #37b04b;
       color: white;
       cursor:pointer;
        font-size: larger;
   }
   
   #more:hover{
      background-color: green;
   }
   
   #fold_reviews{
      position:absolute;
      bottom:0;
      background-color:#37b04b;
      width:100%;
      height:20px;
   }
   
   /* ------------------------------------------------ */
   
   #FAQ_container{
      display: flex;
       flex-direction: column;
       align-items: center;
   }
   
   #FAQ_container h2{
      position: relative;
      top:20px;
   }
   
   #FAQ_category{
      display:flex;
      flex-direction: row;
      justify-content: center;
      height:250px;
   }
   
   #btn_goto{
       border-radius: 30px;
       background-color: #37b04b;
       color: white;
        font-size: larger;
       padding: 7px 20px;
       margin-bottom: 40px;
       cursor: pointer;
        box-shadow: 9px 9px 9px -9px #7f7b7c;
   }
   
   #btn_goto:hover{
      background-color: green;
   }
   
   .each_FAQ{
      display:flex;
      flex-direction:column;
      align-items:center;
      width:120px;
      margin:20px 40px 40px 40px;
      padding:20px;
      cursor: pointer;
   }
   
   .each_FAQ span{
      font-family: NotoSansKR-Medium;
   }
      
   .each_FAQ img{
      width:100px;
      height:100px;
   }
   
   
   /* ------------------------------------------------ */
   
   
   /* background-image{
      background-repeat: no-repeat;
      background-size: 1080px 400px;
      background-position: center;
      background-color: #FDFDFD;
   } */

   
   /* The dots */
   .dot {height: 20px; width: 20px; margin: 0px 0px 20px 5px;
     background-color: #89df8f; border-radius: 50%; display: inline-block;
     transition: background-color 0.6s ease; cursor: pointer;}/*  ease말고도 많음(linear..) */
   .active {  background-color: #37b04b;}
   
   /* Fading animation 해당브라우저 타입 (엔진 종류)명시해주는게 앞2개, 뒤2개는 표준 */
   .fade { -webkit-animation-name: fade;  -webkit-animation-duration: 2s;
           animation-name: fade;  animation-duration: 2s;}
           
   /*  CSS animation -> w3schools.com/ 에서 확인 */
   @-webkit-keyframes fade { from {opacity: .4} to {opacity: 1}} /* 투명도를 .4에서 1로 조절 */
   @keyframes fade { from {opacity: .4} to {opacity: 1}}
   /* 모바일 화면 글자 크기 조정 */
   @media only screen and (max-width: 200px) { .text {font-size: 11px}}
   
   .closer_webchat_button {
   background-color: green;
   }
   
   /* ------------------------------------------------ */
   
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
    </style>
      <style>
      /* 광고, 찜 관련 style 시작 */
   .modal_join {
      font-size: 15px;
      text-align: center;
   }
   
   .mj_div1 {
      width: 400px;
      height: 60px;
      margin: 0 auto;
   }
   
   .mj_icon1 {
      margin-left: 50px;
         float: left;
   }
   
   .mj_txt1 {
      margin-left: 10px;
       float: left;
       font-size: 18px;
       margin-top: 20px;
   }
   
   .mj_div2 {
      width: 400px;
      height: 60px;
      margin: 0 auto;
   }
   
   .mj_icon2 {
      margin-left: 50px;
         float: left;
   }
   
   .mj_txt2 {
      margin-left: 10px;
       float: left;
       font-size: 18px;
       margin-top: 20px;
   }
   
   .mj_div3 {
      width: 400px;
      height: 60px;
      margin: 0 auto;
   }
   
   .mj_icon3 {
      margin-left: 50px;
         float: left;
   }
   
   .mj_txt3 {
      margin-left: 10px;
       float: left;
       font-size: 18px;
       margin-top: 20px;
   }
   
   .mw_img {
      width: 60px;
       height: 60px;
       float: left;
       margin-left: 30px;
   }
   
   .mw_txt {
       font-size: 20px;
       margin-left: 10px;
       float: left;
       margin-top: 18px;
   }
   
   .heart_icon {
      margin-left: 70px;
         float: left;
   }
   
   .no_heart_icon {
      margin-left: 20px;
         float: left;
   }
   
   #no_like:hover {
      background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='%2337B04B' width='30px' height='30px'%3E%3Cpath d='M0 0h24v24H0z' fill='none'/%3E%3Cpath d='M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z'/%3E%3C/svg%3E");
   }
   /* 광고, 찜 관련 style 끝*/
   </style>

<script>
   function more(){
       if(story.style.display =='none'){
          story.style.display ='';
          document.getElementById('more').innerHTML ='- 접기 '
       }else{
          story.style.display='none';
          document.getElementById('more').innerHTML='+ 더 보기 '
       }
   }
   
   // 슬라이드이미지 
   $(document).ready(function(){
      var slideIndex = 0;
      showSlides();
      
      function showSlides() {
        var i;
        var slides = document.getElementsByClassName("mySlides");
        var dots = document.getElementsByClassName("dot");
        for (i = 0; i < slides.length; i++) {
          slides[i].style.display = "none";
        }
        slideIndex++;
        if (slideIndex > slides.length) {
           slideIndex = 1;
        }
        for (i = 0; i < dots.length; i++) {
          dots[i].className = dots[i].className.replace(" active", "");
        }
        
        // 화면에 보여줄 대상 선택
        slides[slideIndex - 1].style.display = "block";
        dots[slideIndex - 1].className += " active";
        setTimeout(showSlides, 4000); // setInterval 사용해도 가능
      }
      
   })
   
var slideIndex = 1;

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}
   
</script>
</head>
<body>
<div class="wrap">
<jsp:include page="./header_container.jsp">
   <jsp:param value="m_id" name="m_id"/>
</jsp:include> 
<!-- <a href="ddd.ak"> test </a> -->
   
<div id="content_container">
<section id="ad_container">
   <div class="slideshow-container">
      <div class="mySlides fade">
         <img src="resources/image/main_slide1.png" onclick="location.href='searchProcess.ak?b_address_road='" >
      </div>
      
        <div class="mySlides fade">
         <img src="resources/image/main_slide2.png" onclick="location.href='FAQList.ak'">
      </div>
      
      <div class="mySlides fade" >
         <img src="resources/image/main_slide3.png" onclick="banner_check()">
      </div>
      
   </div> 
   <br>
   <div style="text-align:center; margin-top: -12px;">
      <span class="dot" onclick="currentSlide(1)"></span>
      <span class="dot" onclick="currentSlide(2)"></span>
      <span class="dot" onclick="currentSlide(3)"></span>
   </div>
</section>
<script>
$(document).ready(function(){
   $('.btn_category').hover(function(){
      $(this).css('border','3px solid #89df8f');
   }, function(){
      $(this).css('border','none');
   });
})
var se_id = '${login.m_id}';
//광고 로그인 여부 검사
function banner_check() {
   
   $.ajax({
      url: '/myakkbird/check_member.ak?m_id='+se_id+'',
      type: 'GET',
      dataType: "json",
      contentType: 'application/x-www-form-urlencoded; charset=utf-8',
      success: function(data) {
         if(data === 0) {
            
            Swal.fire({
                 title: '<strong>5분안에 회원가입하고</strong>',
                 html:
                    '<div class="modal_join">' +
                     '    <div class="mj_div1">' +
                     '        <svg class="mj_icon1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#37B04B" width="60px" height="60px"><path d="M0 0h24v24H0z" fill="none"/><path d="M2 20h20v-4H2v4zm2-3h2v2H4v-2zM2 4v4h20V4H2zm4 3H4V5h2v2zm-4 7h20v-4H2v4zm2-3h2v2H4v-2z"/></svg>' +
                     '        <b class="mj_txt1">고객의 다양한 게시물을 확인!</b>' +
                     '    </div>' +
                     '    <div class="mj_div2">' +
                     '        <svg class="mj_icon2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#37B04B" width="60px" height="60px"><path d="M0 0h24v24H0z" fill="none"/><path d="M20 2H4c-1.1 0-1.99.9-1.99 2L2 22l4-4h14c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2zM6 9h12v2H6V9zm8 5H6v-2h8v2zm4-6H6V6h12v2z"/></svg>' +
                     '        <b class="mj_txt2">회원이 작성한 리얼 후기 확인!</b>' +
                     '    </div>' +
                     '    <div class="mj_div3">' +
                     '        <svg class="mj_icon3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#37B04B" width="60px" height="60px"><path d="M0 0h24v24H0z" fill="none"/><path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/></svg>' +
                     '        <b class="mj_txt3">회원가입하면 하트 3개 무료!</b>' +
                     '    </div>' +
                     '</div>',
                    confirmButtonColor: '#37B04B',
                    confirmButtonText: '<div class="go_btn">회원가입</div>',
            }).then((result) => {
               if (result.value) {
                   location.href="./joinselect.ak";
               }
            })
            
         } else {
            banner_got_check(se_id);
         }
      },
      error:function(){
           alert("ajax통신 실패!!!");
       }
   });
}
// 광고 하트를 지급 받았는지 검사
function banner_got_check(se_id) {
   
   $.ajax({
      url: '/myakkbird/check_hgot.ak?m_id='+se_id+'',
      type: 'GET',
      dataType: "json",
      contentType: 'application/x-www-form-urlencoded; charset=utf-8',
      success: function(data) {
         if(data == 1) {
            Swal.fire({
                 html: 
                  '<svg class="no_heart_icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#37B04B" width="60px" height="60px"><path d="M0 0h24v24H0z" fill="none"/><path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/></svg>' +
                    '<b class="mw_txt">무료 하트를 지급 받은 회원입니다!</b>',
                  timer: 1000,
                 confirmButtonColor: '#37B04B',
                 confirmButtonText:
                    '<div class="go_btn">확인</div>'
            })
         } else {
            banner_got(se_id);
         }
      },
      error:function(){
           alert("ajax통신 실패!!!");
       }
   });
}
// 광고 하트 지급
function banner_got(se_id) {
   
   $.ajax({
      url: '/myakkbird/heart_got.ak?m_id='+se_id+'',
      type: 'GET',
      dataType: "json",
      contentType: 'application/x-www-form-urlencoded; charset=utf-8',
      success: function(data) {
         if(data == 1) {
            heart_got(se_id);
         } else {
            Swal.fire({
                 html: 
                    '<b class="mw_txt">하트 지급 실패..ㅠㅠ</b>' + 
                    '<span>운영자에게 문의주세요!</span>',
                 timer: 1000,
                 confirmButtonColor: '#37B04B',
                 confirmButtonText:
                    '<div class="go_btn">확인</div>'
            })
         }
      },
      error:function(){
           alert("ajax통신 실패!!!");
       }
   });
}
// 광고 하트 지급 완료
function heart_got(se_id) {
   
   $.ajax({
      url: '/myakkbird/heart_success.ak?m_id='+se_id+'',
      type: 'GET',
      dataType: "json",
      contentType: 'application/x-www-form-urlencoded; charset=utf-8',
      success: function(data) {
         if(data == 1) {
            Swal.fire({
                 html:
                  '<svg class="heart_icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#37B04B" width="60px" height="60px"><path d="M0 0h24v24H0z" fill="none"/><path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/></svg>' +
                    '<b class="mw_txt">하트 5개 지급 완료!</b>',
                 confirmButtonColor: '#37B04B',
                 confirmButtonText:
                    '<div class="go_btn">확인</div>'
            })
         }
      },
      error:function(){
           alert("ajax통신 실패!!!");
       }
   });
}
</script>

 
<% int totalBoardCount = ((Integer)request.getAttribute("totalBoardCount")).intValue(); 
   int countAccept = ((Integer)request.getAttribute("countAccept")).intValue();%>
<section id="search_container">
   <div id="total_count"> 
   <% if (totalBoardCount != 0){ %>
      <div id="txt_boardCount">악어회원 게시물 수 </div> <span id="boardCount"> </span> &nbsp;
      <div id="txt_countAccept">악어새회원 지원 건수  </div> <span id="countAccept"> </span> &nbsp;
      
      <script>      
        var boardCountConTxt = <%=totalBoardCount%>;
        $({ val : 0 }).animate({ val : boardCountConTxt }, {
         duration: 2000,
        step: function() {
          var num = numberWithCommas(Math.floor(this.val));
          $("#boardCount").text(num);
        },
        complete: function() {
          var num = numberWithCommas(Math.floor(this.val));
          $("#boardCount").text(num);
        }
      });
      function numberWithCommas(x) {
          return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
      }
      
        var countAccept = <%=countAccept%>;
        $({ val : 0 }).animate({ val : countAccept }, {
         duration: 2000,
        step: function() {
          var num = numberWithCommas(Math.floor(this.val));
          $("#countAccept").text(num);
        },
        complete: function() {
          var num = numberWithCommas(Math.floor(this.val));
          $("#countAccept").text(num);
        }
      });
      function numberWithCommas(x) {
          return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
      }
      
      </script>
   <% } %>
   </div>
   <form name="selectForm" action="searchProcess.ak" >
      <div id="search_area">
         <input id ="autoText" class="search_input" type="text" name="b_address_road" placeholder="거주하는 동네를 입력해보세요!">
         <span class="material-icons" onclick="location.href='javascript:selectForm.submit()'">near_me</span>
      </div>
      <h2 id="hotplace">핫한 지역 바로가기</h2>
      <div id="search_category">
         <div class="btn_category" onclick="location.href='searchProcess.ak?b_address_road=역삼'">
            <img src="resources/image/clean1.png"> 역삼
         </div>
         <div class="btn_category" onclick="location.href='searchProcess.ak?b_address_road=서초'">
            <img src="resources/image/clean6.png"> 서초
         </div>
         <div class="btn_category" onclick="location.href='searchProcess.ak?b_address_road=압구정'">
            <img src="resources/image/clean3.png"> 압구정
         </div>
         <div class="btn_category" onclick="location.href='searchProcess.ak?b_address_road=논현'">
            <img src="resources/image/clean4.png"> 논현
         </div>
         <div class="btn_category" onclick="location.href='searchProcess.ak?b_address_road=삼성'">
            <img src="resources/image/clean5.png"> 삼성
         </div>
      </div>
   </form>
</section>
<section id="review_container">
   <img src="resources/image/main_review_title.gif">
<!--    <div id="btn_container_review">
      <span id="recentReviews" class="chooseReview">최신순</span>
      <span id="likeReviews" class="chooseReview">좋아요순</span>
   </div> -->
<% List<ReviewVO> reviewList = (List<ReviewVO>)request.getAttribute("reviewList"); %>
<% if (reviewList != null || reviewList.size() > 0){ %>
   <!-- 리뷰가 3개 이하 -->
   <% if (reviewList.size() <=3){ %>    
   <table class="reviews">
      <tr>
         <%for (int i=0; i <reviewList.size(); i++){
            ReviewVO vo = (ReviewVO)reviewList.get(i); %>
            <td class="each_review" id="<%=vo.getR_num()%>" onclick="location.href='profile.ak?id=<%=vo.getR_id()%>'"> 
               <table>
                  <tr>
                     <td rowspan="3" class="each_review_img"><img src="/myakkbird/myakkbirdUpload/<%=vo.getM_photo()%>"></td>
                     <td><%=vo.getR_id() %></td>
                  </tr>
                  <tr><td><%=vo.getR_star() %></td></tr> 
                  <tr><td><%=vo.getR_date().substring(0,10) %></td></tr>
               </table>
               <div><%=vo.getR_content() %> </div>
            </td>
         <% } %>
      </tr>
   </table>
   
   <!-- 리뷰가 3개 이상 9개 이하 -->
   <% } else if(reviewList.size() <=9){    %>
   <div>
      <table class="reviews">
         <tr>
            <% for (int i=0; i<3; i++){
               ReviewVO vo = (ReviewVO)reviewList.get(i); %>
               <td class="each_review" id="<%=vo.getR_num()%>" onclick="location.href='profile.ak?id=<%=vo.getR_id()%>'"> 
                  <img src="resources/image/new2.png" class="each_review_new">
                  <table>
                     <tr>
                        <td rowspan="3" class="each_review_img" ><img src="/myakkbird/myakkbirdUpload/<%=vo.getM_photo()%>"></td>
                        <td><%=vo.getR_id() %></td>
                     </tr>
                     <tr><td>      
                     <% if (vo.getR_star() == 0.5){ %> 
                     <img src="resources/image/star_0.5.png" class="review_star">
                     <% } else if (vo.getR_star() == 1.0){%>
                     <img src="resources/image/star_1.0.png" class="review_star">
                     <% } else if (vo.getR_star() == 1.5){%>
                     <img src="resources/image/star_1.5.png" class="review_star">
                     <% } else if (vo.getR_star() == 2.0){%>
                     <img src="resources/image/star_2.0.png" class="review_star">
                     <% } else if (vo.getR_star() == 2.5){%>
                     <img src="resources/image/star_2.5.png" class="review_star">
                     <% } else if (vo.getR_star() == 3.0){%>
                     <img src="resources/image/star_3.0.png" class="review_star">
                     <% } else if (vo.getR_star() == 3.5){%>
                     <img src="resources/image/star_3.5.png" class="review_star">
                     <% } else if (vo.getR_star() == 4.0){%>
                     <img src="resources/image/star_4.0.png" class="review_star">
                     <% } else if (vo.getR_star() == 4.5){%>
                     <img src="resources/image/star_4.5.png" class="review_star">
                     <% } else {%>
                     <img src="resources/image/star_5.0.png" class="review_star">
                     <% } %>
                     </td></tr>
                     <tr><td><%=vo.getR_date().substring(0,10) %></td></tr>
                  </table>
                  <div class="content"><%=vo.getR_content() %> 
                  <% if (vo.getR_up_file() != null){
                     String[] files = vo.getR_up_file().split(","); %>
                     <%-- <div id =thumbnails>
                        <% for (String a : files){ %>
                           <img src="/myakkbird/myakkbirdUpload/<%=a%>" class="each_pic">
                        <% } %>
                     </div> --%>
                  <% } %>
                  </div>
               </td>
            <% } %>
         </tr>
      </table>
       <table  class="reviews" id="story" style="display: none" >
         <tr>
            <% for (int i=3; i<6; i++){
               ReviewVO vo = (ReviewVO)reviewList.get(i); %>
               <td class="each_review" id="<%=vo.getR_num()%>" onclick="location.href='profile.ak?id=<%=vo.getR_id()%>'"> 
                  <img src="resources/image/new2.png" class="each_review_new">
                  <table>
                     <tr>
                        <td rowspan="3" class="each_review_img" ><img src="/myakkbird/myakkbirdUpload/<%=vo.getM_photo()%>"></td>
                        <td><%=vo.getR_id() %></td>
                     </tr>
                     <tr><td>
                     <% if (vo.getR_star() == 0.5){ %> 
                     <img src="resources/image/star_0.5.png" class="review_star">
                     <% } else if (vo.getR_star() == 1.0){%>
                     <img src="resources/image/star_1.0.png" class="review_star">
                     <% } else if (vo.getR_star() == 1.5){%>
                     <img src="resources/image/star_1.5.png" class="review_star">
                     <% } else if (vo.getR_star() == 2.0){%>
                     <img src="resources/image/star_2.0.png" class="review_star">
                     <% } else if (vo.getR_star() == 2.5){%>
                     <img src="resources/image/star_2.5.png" class="review_star">
                     <% } else if (vo.getR_star() == 3.0){%>
                     <img src="resources/image/star_3.0.png" class="review_star">
                     <% } else if (vo.getR_star() == 3.5){%>
                     <img src="resources/image/star_3.5.png" class="review_star">
                     <% } else if (vo.getR_star() == 4.0){%>
                     <img src="resources/image/star_4.0.png" class="review_star">
                     <% } else if (vo.getR_star() == 4.5){%>
                     <img src="resources/image/star_4.5.png" class="review_star">
                     <% } else {%>
                     <img src="resources/image/star_5.0.png" class="review_star">
                     <% } %>
                     </td></tr>
                     <tr><td><%=vo.getR_date().substring(0,10) %></td></tr>
                  </table>
                  <div class="content"><%=vo.getR_content() %> 
                  <% if (vo.getR_up_file() != null){
                     String[] files = vo.getR_up_file().split(","); %>
                     <%-- <div id =thumbnails>
                        <% for (String a : files){ %>
                           <img src="/myakkbird/myakkbirdUpload/<%=a%>" class="each_pic">
                        <% } %>
                     </div> --%>
                  <% } %>
                  </div>
               </td>
            <% } %>
         </tr>
         <tr>
            <% for(int i =6; i<reviewList.size(); i++){
               ReviewVO vo = (ReviewVO)reviewList.get(i);%>
               <td class="each_review" id="<%=vo.getR_num()%>" onclick="location.href='profile.ak?id=<%=vo.getR_id()%>'"> 
                  <img src="resources/image/new2.png" class="each_review_new">
                  <table>
                     <tr>
                        <td rowspan="3" class="each_review_img" ><img src="/myakkbird/myakkbirdUpload/<%=vo.getM_photo()%>"></td>
                        <td><%=vo.getR_id() %></td>
                     </tr>
                     <tr><td>
                     <% if (vo.getR_star() == 0.5){ %> 
                     <img src="resources/image/star_0.5.png" class="review_star">
                     <% } else if (vo.getR_star() == 1.0){%>
                     <img src="resources/image/star_1.0.png" class="review_star">
                     <% } else if (vo.getR_star() == 1.5){%>
                     <img src="resources/image/star_1.5.png" class="review_star">
                     <% } else if (vo.getR_star() == 2.0){%>
                     <img src="resources/image/star_2.0.png" class="review_star">
                     <% } else if (vo.getR_star() == 2.5){%>
                     <img src="resources/image/star_2.5.png" class="review_star">
                     <% } else if (vo.getR_star() == 3.0){%>
                     <img src="resources/image/star_3.0.png" class="review_star">
                     <% } else if (vo.getR_star() == 3.5){%>
                     <img src="resources/image/star_3.5.png" class="review_star">
                     <% } else if (vo.getR_star() == 4.0){%>
                     <img src="resources/image/star_4.0.png" class="review_star">
                     <% } else if (vo.getR_star() == 4.5){%>
                     <img src="resources/image/star_4.5.png" class="review_star">
                     <% } else {%>
                     <img src="resources/image/star_5.0.png" class="review_star">
                     <% } %>
                     </td></tr>
                     <tr><td><%=vo.getR_date().substring(0,10) %></td></tr>
                  </table>
                  <div class="content"><%=vo.getR_content() %> 
                  <% if (vo.getR_up_file() != null){
                     String[] files = vo.getR_up_file().split(","); %>
                     <%-- <div id =thumbnails>
                        <% for (String a : files){ %>
                           <img src="/myakkbird/myakkbirdUpload/<%=a%>" class="each_pic">
                        <% } %>
                     </div> --%>
                  <% } %>
                  </div>
               </td>
            <% } %>
         </tr>
         
      </table>
   </div>
   <div id="more" onclick="more()"> + 더 보기</div>
    <% } 
   }else{ %>
   <div>리뷰가 없습니다. 리뷰를 작성해주세요!</div>
   <% } %>
   
   <div>&nbsp;</div>
</section>
<section id="FAQ_container">
   <h2>마이악어새가 <span>궁금</span>하신가요?</h2>
   <div id="FAQ_category">
      <div class="each_FAQ" onclick="location.href='FAQList.ak'">
         <img src="resources/image/dependable.png">
         <h4><span>마이악어새</span>는<br/>믿을 수 있나요?</h4>
      </div>
      <div class="each_FAQ" onclick="location.href='FAQList.ak'">
         <img src="resources/image/target.png">
         <h4><span>매칭</span>은 <br>어떻게 되나요?</h4>
      </div>
      <div class="each_FAQ" onclick="location.href='FAQList.ak'">
         <img src="resources/image/donation.png">
         <h4><span>이용권</span>이 <br> 궁금해요!</h4>
      </div>
   </div>
   <!-- <img src="resources/image/btn_goto.png" id="btn_goto" onclick="location.href='FAQList.ak'"> -->
   <div id="btn_goto" onclick="location.href='FAQList.ak'">FAQ 바로가기</div>
</section>
</div> <!-- content_container -->
<jsp:include page="./footer_container.jsp">
   <jsp:param value="" name=""/>
</jsp:include> 
</div> <!-- div id="wrap" -->
</body>
<script id="embeddedChatbot" data-botId="B1ezy3" src="https://www.closer.ai/js/webchat.min.js"></script>
</html>