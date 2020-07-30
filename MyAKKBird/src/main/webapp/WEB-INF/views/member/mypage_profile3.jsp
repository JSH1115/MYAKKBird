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
   }else if (memberVO.getM_type().equals("M")){
      m_type = "관리자";
   }else{ 
      m_type = " ";
   }   
   
%>    

<!DOCTYPE html>
<html>
<head>
<script src="resources/js/sweetAlert.js"></script>  <!-- 모달창 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="fonts/font.css">
  
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
body{
   font-family: "NotoSansKR-Regular";
   padding: 0px;
   margin: 0px;
}
.wrap {
   position:relative;
   min-height:100%; 
}
#content_container{
   min-height:1000px 
}
/* ------------------------------------------------ */
#body{
   display:flex;
   flex-direction: column;
   align-items:center;
}
.eachMenu{
   text-align:center;
   width:600px;
   height:30px;
   margin:20px;
   padding:10px;
   line-height:30px;
   box-shadow: -5px -5px 10px -5px #d3d3d3, 5px 5px 10px -5px #a9a8a8;
   cursor: pointer;
   -webkit-transition-duration: 0.2s; 
   transition-duration: 0.2s
}

.eachMenu:hover{
   background-color: #f5f5f5;
}
/* ------------------------------------------------ */
#profile_container, #review_container{
   text-align:center;
}
#profile_container{   
   width: 620px;
    margin: 40px 0 15px 0;
    box-shadow: -15px -15px 20px -15px #d3d3d3, 15px 15px 20px -15px #a9a8a8;
}
#Profile{
   margin:20px;
}
#Profile table{
   font-size: 16px;
}
#m_photo{
   width:350px;
}
#m_photo img{
    width: 250px;
    height: 250px;
    border-radius: 50px;
    border: 1px solid #d3d3d3;
}
#modifyForm{
border-radius: 6px;
    background-color: #37b04b;
    color: white;
    width: 100%;
    padding: 5px;
    cursor: pointer;
}
#profile_cover{
    position: relative;
    right: 10px;
    bottom: 10px;
    width: 260px;
    height: 200px;
    border-radius: 20px;
    background-color: #575757;
    color: #c2c2c2;
    opacity: 0.5;
}
/* ------------------------------------------------ */
#review_container{
   width:600px;
   margin:14px;
   border:14px solid #E6E6E6;
   background-color:#E6E6E6;
   box-shadow: -9px -9px 9px -9px #d3d3d3, 9px 9px 9px -9px #a9a8a8;
}
.highlight{
   color:#37b04b;
   font-size: larger;
   font-weight: bold;
}
#text_onlyPhotos{
    position: relative;
    left: 10px;
    text-align: initial;
    
}
#onlyPhotos{
   display:flex;
   flex-direction:row;
   overflow: auto;
   margin: 0 10px 10px 10px;
    padding: 0 10px 0 10px;
   width:560px;
   height:100px;
    background-color: white;
    box-shadow: -3px -3px 7px -3px #d3d3d3, 3px 3px 7px -3px #d3d3d3;
}
#onlyPhotos::-webkit-scrollbar, #thumbnails::-webkit-scrollbar, .review_content::-webkit-scrollbar {
       width:10px;
       height:10px; 
   }
#onlyPhotos::-webkit-scrollbar-track , #thumbnails::-webkit-scrollbar-track, .review_content::-webkit-scrollbar-track{
      background-color:#c1c1c1;
      border-radius: 10px;
   }
#onlyPhotos::-webkit-scrollbar-thumb , #thumbnails::-webkit-scrollbar-thumb, .review_content::-webkit-scrollbar-thumb{
      background-color:#929292;
      border-radius: 10px;
   }
#onlyPhotos::-webkit-scrollbar-thumb:hover, #thumbnails::-webkit-scrollbar-thumb:hover, .review_content::-webkit-scrollbar-thumb:hover {
    background: #3a3a3a; 
    }
#onlyPhotos::-webkit-scrollbar-thumb:active, #thumbnails::-webkit-scrollbar-thumb:active, .review_content::-webkit-scrollbar-thumb:active {
    background: #3a3a3a; 
    }
#onlyPhotos > .pic{
   width:90px;
   height:90px;
}
#orderby_container{
   display:flex;
   flex-direction: row;
   justify-content: center;
}
#orderbyLatest{
   background-color: gray;
}
.orderby{
    display: block;
    width: 100px;
    padding: 2px 10px;
    width: 173px;
    height: 25px;
    background-color: white;
    box-shadow: -3px -3px 7px -3px #d3d3d3, 3px 3px 7px -3px #d3d3d3;
    cursor:pointer;
}
.eachReview{
   margin:10px;
   padding:10px;
   background-color:white;
   box-shadow: -3px -3px 7px -3px #d3d3d3, 3px 3px 7px -3px #d3d3d3;
   
}
.eachReview_info{
   display: flex;
    justify-content: space-around;
    height: 45px;
}

.eachReview_info span{
   position:relative;
   top:4px;
}
.review_profile{
   position:relative;
   left:5px;
    width: 40px;
    height: 40px;
    border-radius: 60px;
}
.eachReview_info_id{
    position: relative;
    right: 20px;
}
.review_star{
   width: 140px;
    height: 30px;
}
.thumb_up_no img{
   width:25px;
   height:25px;
   cursor:pointer;
}
.thumb_up_yes img{
   width:25px;
   height:25px;
   cursor:pointer;
}
#like_yes{
   color:red;
}
.like_cnt{
   position: relative;
    bottom: 4px;
    left: 3px;
}
.review_content{
    padding: 5px;
    margin:5px;
    overflow: auto;
    background-color: #e6f7e4;
    height: 85px;
    width: 430px;
}
.review_content_wrapper{
   display:flex;
}
#thumbnails{
    position: relative;
    top: 5px;
    display: flex;
    flex-direction: column;
    overflow: auto;
    padding-left: 5px;
    width: 111px;
    height: 100px;
}
#thumbnails img{
    width: 100px;
    height: 100px;
    cursor: pointer;
}
.big_photo{
   display:inline-block;
   width:550px;
   height:550px;
   margin:5px;
   cursor:pointer;
}

.btn_modify{
   position:relative;
   top:4px;
    background-color: #37b04b;
    border-radius: 10px;
    padding: 1px 7px 3px 10px;
    margin: 5px;
    color: white;
    cursor: pointer;
}

.btn_delete{
   position:relative;
   top:5px;
    border: 1px solid #37b04b;
    border-radius: 10px;
    padding: 1px 10px;
    margin: 5px;
    color: #37b04b;
    cursor:pointer;
}
/* The Modal 스타일 시작 --------------------------------> */
/* The Modal (background) */
#myBtn{
   margin:5px 5px 5px 5px;
   padding:5px;
   width:100px;
   height:40px;
   border-radius: 10px;
   background-color: #89df8f;
   line-height:30px;
   cursor:pointer;
}
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
#review_img_preview img{
   width: 180px;
   height:180px;
}
#counter {
  background:rgba(255,0,0,0.5);
  border-radius: 0.5em;
  padding: 0 .5em 0 .5em;
  font-size: 0.75em;
  margin-left: 500px;
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
            addr += memberVO.m_address_detail ;
            $('#m_addr').html(addr);
            
            var email='';
            email += memberVO.m_email;
            $('#m_email').html(email);
            
            var phone='';
            phone += memberVO.m_phone;
            $('#m_phone').html(phone);
            
            $('.button').css('display','none');

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
               pic += '<div><img id="img_preview" src="resources/image/crocodile_profile.png"><div>';
            }else{ /* 따로 프로필사진 지정한 경우 */
               pic += '<div><img id="img_preview" src="/myakkbird/myakkbirdUpload/'+ exPhoto +'">'; /* 원래 프로필사진 출력 */
               pic += '<input type="hidden" name="m_photo" value="'+ exPhoto +'"><div>'; /* 프로필사진 변경 안할 경우 원래 프로필사진을 던져줌  */
            }
            pic += '<input type="file" name="file" id="input_img">';
            $('#m_photo').html(pic); 
             
            var addr ='';
            addr += '<div><input type="hidden" name="m_id" value="'+ memberVO.m_id +'">';
            addr += '<input type="text" size="30" name="m_address_road" value="'+ memberVO.m_address_road +'"><br/>';
            addr += '<input type="text" size="30" name="m_address_detail" value="'+ memberVO.m_address_detail +'">';
            $('#m_addr').html(addr);
            
            var email ='';
            email += '<input type="text" size="30" name="m_email" value="'+ memberVO.m_email +'">'
            $('#m_email').html(email);
            
            var phone='';
            phone +='<input type="text" size="30" name="m_phone" value="'+ memberVO.m_phone +'">'
            $('#m_phone').html(phone);
   
            var btn='';
            btn +='<div id="btn_modifyProcess">확인</div>'
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
            
            // 프로필 수정 작업
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
</script>



</head>
<body>
<div class="wrap">
<jsp:include page="../header_container.jsp">
   <jsp:param value="m_id" name="m_id"/>
</jsp:include> 

<div id="content_container">

<!--    <a href="profile.ak?id=ljy7828"> ljy7828프로필 </a>
   <a href="profile.ak?id=rain1208"> rain1208프로필 </a> -->
   
   <script>
$(document).ready(function(){
   $('#modifyForm').hover(function(){
      $(this).css('border','solid 1px #89df8f');
/*       $(this).css('border-top','solid 1px #89df8f');
      $(this).css('border-right','solid 9px #89df8f');
      $(this).css('border-bottom','solid 1px #89df8f');
      $(this).css('border-left','solid 9px #89df8f');
      $(this).css('border-radius','0px'); */
   }, function(){
      $(this).css('border','none');
   })
})
</script>

<section id="body">
   <section id="profile_container">

<% if(memberVO.getM_id().equals(id)){%> <!-- 본인이면 프로필 다 오픈-->
      <form id ="Profile" action="./modifyProcess.ak" method="post" enctype="multipart/form-data">
         <table>
            <tr>
               <td id="m_photo" rowspan="9">
                  <% if ( memberVO.getM_photo() == null){ %>
                  <img src="resources/image/crocodile_profile.png"/>
                  <% } else{  %>
                  <img src="/myakkbird/myakkbirdUpload/<%=memberVO.getM_photo()%>"/> 
                  <% } %>
               </td>
               <td><%=memberVO.getM_name()%>&nbsp;(<%=memberVO.getM_id() %>) </td>
            </tr>
            <tr>
               <td id="m_type"> <%=m_type %> </td>
            </tr>
            <tr>
               <td id="m_heart"> 보유하트수 <%=memberVO.getM_heart() %>  </td>
            </tr>

            <tr>
               <td id="m_addr"> 
                  <%=memberVO.getM_address_road()%><br/>
                  <%=memberVO.getM_address_detail()%>
               </td>
            </tr>
            <tr>
               <td id="m_email"><%=memberVO.getM_email() %></td>
            </tr>
            <tr>
               <td id="m_phone"><%=memberVO.getM_phone() %></td>
            </tr>
            <% if(memberVO.getM_id().equals(id)){%>
            <tr>
               <td><div class="button" id="modifyForm" onclick="modifyProfile()"> 프로필 수정 </div> </td>
            </tr>
            <% } %>
         </table>
      </form>
   </section> <!-- profile_container -->
   
   
   <div id="menu_container">
      <jsp:include page="./mypage_menu2.jsp">
         <jsp:param value="m_type" name="m_type"/>
      </jsp:include>
   </div>
   
<% }else { %> <!-- 본인 아닐경우 -->
      <form id ="Profile" action="./modifyProcess.ak" method="post" enctype="multipart/form-data">
         <table>
            <tr>
               <td id="m_photo" rowspan="4">
                  <% if ( memberVO.getM_photo() == null){ %>
                  <img src="resources/image/crocodile_profile.png"/>
                  <% } else{  %>
                  <img src="/myakkbird/myakkbirdUpload/<%=memberVO.getM_photo()%>"/> 
                  <% } %>
               </td>
               <td></td>
            </tr>
            <tr>
               <td><%=m_type %>(<%=memberVO.getM_id() %>)</td>
            </tr>
            <tr>
               <td id="profile_cover">연락처는 매칭 후 <br/> 오픈됩니다</td>
            </tr>
         </table>
      </form>
   </section> <!-- profile_container -->
<% } %>

<!--    <span class="button">
      <img src="resources/image/btn_modify2.png" id="modifyForm" onclick="modifyProfile()" />
      <input type="button" id="modifyForm"  value="정보수정" onclick="modifyProfile()" />
      <input type="button" id="getBack" value="돌아가기"/>
   </span> -->

<!-- -----------------------리뷰부분----------------------- -->
      
   <script>
   
   // 사진만 모아보기 클릭하면 큰화면으로 출력
   function getOnlyPhotoDetail(e){
      var r_num = $(e).attr('id').split('_'); // r_num
      var img_src = $(e).attr('src');
      $('#onlyPhoto_detail').css({
         'height':'600px',
         'display':'block'
      })
      
      var a = '<img src="' + img_src + '" class="big_photo">';
      $('#onlyPhoto_detail').html(a);
   }
   $(document).on('click','#onlyPhoto_detail',function(){
      $('#onlyPhoto_detail').css({
         'height' : '1px',
         'display' : 'none'
      })
   })
   
   // 리뷰썸네일 클릭시 큰화면으로 출력
//   function getReviewDetail(e){ /* e : this(사진) */
      //var pic = $(e).attr('id'); /* pic : r_up_file (.jpg 포함) */
      //var r_num = $(e).parents('.eachReview').attr('id'); /* x: 리뷰번호 (r_num) */ 
      
   //   $('#'+ r_num +'').children('.detail').css({
   //      'height':'600px',
   //      'display':'block'
   //   })
      
//      var a ='';
//      a += '<img src="/myakkbird/myakkbirdUpload/'+ pic +'" class="big_photo">';
//      $('#'+ r_num +'').children('.detail').html(a);
//    }   

//이미지 띄우는 모달창
   function getReviewDetail(up_img) {
      
      Swal.fire({
           title: 'Sweet!',
           text: '리뷰어님이 업로드 한 사진이에요.',
           imageUrl: 'http://localhost:8080/myakkbird/myakkbirdUpload/'+up_img,
           imageWidth: 550,
           imageHeight: 350,
           confirmButtonColor:'#37B04B',
           confirmButtonText:'OK'
      })  
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
   
   
   /* 좋아요 */
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
   
   /* 좋아요 취소  */
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
   
   
   
   
   /* 리뷰 최신순 보기 */   
    $(document).on('click','#orderbyLatest',function(){
      $(this).css('background-color','gray');
/*       $('#orderbyStar').css('background-color','#E6E6E6');
      $('#orderbyLike').css('background-color','#E6E6E6'); */
      $('#orderbyStar').css({
         'background-color':'white',
         'box-shadow':'-3px -3px 7px -3px #d3d3d3, 3px 3px 7px -3px #d3d3d3'
      })
      $('#orderbyLike').css({
         'background-color':'white',
         'box-shadow':'-3px -3px 7px -3px #d3d3d3, 3px 3px 7px -3px #d3d3d3'
      })
      var id= '<%=memberVO.getM_id() %>';   
      $.ajax({
         url:'/myakkbird/review_orderbyLatest.ak',
         type:'POST',
         data : {id : id},
         dataType:'json',
         contentType:'application/x-www-form-urlencoded; charset=utf-8',
         enctype : 'multipart/form-data',
         success : function(reviewList){
               var a ='';
            for(var i = 0; i<reviewList.length; i++){
                a += '<div id="'+ reviewList[i].r_num +'" class="eachReview">';
               a +=    '<div class="eachReview_info">';
               a +=       '<img src="/myakkbird/myakkbirdUpload/'+ reviewList[i].m_photo +'" class="review_profile">';
               a +=       '<span>'+ reviewList[i].m_id +'</span>';
               /* a +=       '<span>'+ reviewList[i].r_star+'</span>'; */
               
               if (reviewList[i].r_star == 0.5){
                  a += '<img src="resources/image/star_0.5.png" class="review_star">';
                  } else if (reviewList[i].r_star == 1.0){
                  a += '<img src="resources/image/star_1.0.png" class="review_star">';
                  } else if (reviewList[i].r_star == 1.5){
                  a += '<img src="resources/image/star_1.5.png" class="review_star">';
                  } else if (reviewList[i].r_star == 2.0){
                  a += '<img src="resources/image/star_2.0.png" class="review_star">';
                  } else if (reviewList[i].r_star == 2.5){
                  a += '<img src="resources/image/star_2.5.png" class="review_star">';
                  } else if (reviewList[i].r_star == 3.0){
                  a += '<img src="resources/image/star_3.0.png" class="review_star">';
                  } else if (reviewList[i].r_star == 3.5){
                  a += '<img src="resources/image/star_3.5.png" class="review_star">';
                  } else if (reviewList[i].r_star == 4.0){
                  a += '<img src="resources/image/star_4.0.png" class="review_star">';
                  } else if (reviewList[i].r_star == 4.5){
                  a += '<img src="resources/image/star_4.5.png" class="review_star">';
                  } else {
                  a += '<img src="resources/image/star_5.0.png" class="review_star">';
                  }
               
               a += '<span>'+ reviewList[i].r_date.substring(0,10) +'</span>';
               
               if (reviewList[i].l_check == 0){
                  a +=       '<span class="thumb_up_no"><img src="resources/image/thumb_up_no.png"></span>';
                  } else{
                  a +=       '<span class="thumb_up_yes"><img src="resources/image/thumb_up_yes.png"></span>';
                  }
                  a +=       '<span class="like_cnt">'+ reviewList[i].r_like + '</span>';
                  a +=    '</div>';   
                  a +=    '<div class="review_content_wrapper">';
                  a +=       '<div class="review_content">'+ reviewList[i].r_content+'<br/></div>';
                  if (reviewList[i].r_up_file != null){
                  a +=          '<div id="thumbnails">';
                     var files = reviewList[i].r_up_file.split(',');
                     for (var j in files){
                  a +=             '<img src="/myakkbird/myakkbirdUpload/'+ files[j] + '" class="pic" id="'+ files[j] +'" onclick="getReviewDetail('+files[j]+')">';         
                     }
                  a +=       '</div>';
                  a +=       '<div class="detail"></div>';
                  }
                  a +=   '</div>';
                  a +='</div>';
            }
            $('#a').html(a);        
      },
         error: function(){
            alert('x');
         }
      });
   }) 
      
   /* 리뷰 평점순 보기 */   
    $(document).on('click','#orderbyStar',function(){
      $(this).css('background-color','gray');
      $('#orderbyLatest').css({
         'background-color':'white',
         'box-shadow':'-3px -3px 7px -3px #d3d3d3, 3px 3px 7px -3px #d3d3d3'
      })
      $('#orderbyLike').css({
         'background-color':'white',
         'box-shadow':'-3px -3px 7px -3px #d3d3d3, 3px 3px 7px -3px #d3d3d3'
      })
      var id= '<%=memberVO.getM_id() %>';   
      $.ajax({
         url:'/myakkbird/review_orderbyStar.ak',
         type:'POST',
         data : {id : id},
         dataType:'json',
         contentType:'application/x-www-form-urlencoded; charset=utf-8',
         enctype : 'multipart/form-data',
         success : function(reviewList){
                   var a ='';
                  for(var i = 0; i<reviewList.length; i++){
                      a += '<div id="'+ reviewList[i].r_num +'" class="eachReview">';
                     a +=    '<div class="eachReview_info">';
                     a +=       '<img src="/myakkbird/myakkbirdUpload/'+ reviewList[i].m_photo +'" class="review_profile">';
                     a +=       '<span>'+ reviewList[i].m_id +'</span>';
                     /* a +=       '<span>'+ reviewList[i].r_star+'</span>'; */
                     
                     if (reviewList[i].r_star == 0.5){
                        a += '<img src="resources/image/star_0.5.png" class="review_star">';
                        } else if (reviewList[i].r_star == 1.0){
                        a += '<img src="resources/image/star_1.0.png" class="review_star">';
                        } else if (reviewList[i].r_star == 1.5){
                        a += '<img src="resources/image/star_1.5.png" class="review_star">';
                        } else if (reviewList[i].r_star == 2.0){
                        a += '<img src="resources/image/star_2.0.png" class="review_star">';
                        } else if (reviewList[i].r_star == 2.5){
                        a += '<img src="resources/image/star_2.5.png" class="review_star">';
                        } else if (reviewList[i].r_star == 3.0){
                        a += '<img src="resources/image/star_3.0.png" class="review_star">';
                        } else if (reviewList[i].r_star == 3.5){
                        a += '<img src="resources/image/star_3.5.png" class="review_star">';
                        } else if (reviewList[i].r_star == 4.0){
                        a += '<img src="resources/image/star_4.0.png" class="review_star">';
                        } else if (reviewList[i].r_star == 4.5){
                        a += '<img src="resources/image/star_4.5.png" class="review_star">';
                        } else {
                        a += '<img src="resources/image/star_5.0.png" class="review_star">';
                        }
                     
                     a +=       '<span>'+ reviewList[i].r_date.substring(0,10) +'</span>';
                     
                     if (reviewList[i].l_check == 0){
                        a +=       '<span class="thumb_up_no"><img src="resources/image/thumb_up_no.png"></span>';
                        } else{
                        a +=       '<span class="thumb_up_yes"><img src="resources/image/thumb_up_yes.png"></span>';
                        }
                        a +=       '<span class="like_cnt">'+ reviewList[i].r_like + '</span>';
                        a +=    '</div>';   
                        a +=    '<div class="review_content_wrapper">';
                        a +=       '<div class="review_content">'+ reviewList[i].r_content+'<br/></div>';
                        if (reviewList[i].r_up_file != null){
                        a +=          '<div id="thumbnails">';
                           var files = reviewList[i].r_up_file.split(',');
                           for (var j in files){
                        a +=             '<img src="/myakkbird/myakkbirdUpload/'+ files[j] + '" class="pic" id="'+ files[j] +'" onclick="getReviewDetail('+files[j]+')">';         
                           }
                        a +=       '</div>';
                        a +=       '<div class="detail"></div>';
                        }
                        a +=   '</div>';
                        a +='</div>';
                  }
                  $('#a').html(a);        
            },
         error: function(){
            alert('x');
         }
      });
   }) 
   /* 리뷰 좋아요순 보기 */   
    $(document).on('click','#orderbyLike',function(){
      $(this).css('background-color','gray');
      
      $('#orderbyLatest').css({
         'background-color':'white',
         'box-shadow':'-3px -3px 7px -3px #d3d3d3, 3px 3px 7px -3px #d3d3d3'
      })
      $('#orderbyStar').css({
         'background-color':'white',
         'box-shadow':'-3px -3px 7px -3px #d3d3d3, 3px 3px 7px -3px #d3d3d3'
      })
      var id= '<%=memberVO.getM_id() %>';   
      $.ajax({
         url:'/myakkbird/review_orderbyLike.ak',
         type:'POST',
         data : {id : id},
         dataType:'json',
         contentType:'application/x-www-form-urlencoded; charset=utf-8',
         enctype : 'multipart/form-data',
         success : function(reviewList){
                   var a ='';
                  for(var i = 0; i<reviewList.length; i++){
                      a += '<div id="'+ reviewList[i].r_num +'" class="eachReview">';
                     a +=    '<div class="eachReview_info">';
                     a +=       '<img src="/myakkbird/myakkbirdUpload/'+ reviewList[i].m_photo +'" class="review_profile">';
                     a +=       '<span>'+ reviewList[i].m_id +'</span>';
                     /* a +=       '<span>'+ reviewList[i].r_star +'</span>'; */
                     
                     if (reviewList[i].r_star == 0.5){
                        a += '<img src="resources/image/star_0.5.png" class="review_star">';
                        } else if (reviewList[i].r_star == 1.0){
                        a += '<img src="resources/image/star_1.0.png" class="review_star">';
                        } else if (reviewList[i].r_star == 1.5){
                        a += '<img src="resources/image/star_1.5.png" class="review_star">';
                        } else if (reviewList[i].r_star == 2.0){
                        a += '<img src="resources/image/star_2.0.png" class="review_star">';
                        } else if (reviewList[i].r_star == 2.5){
                        a += '<img src="resources/image/star_2.5.png" class="review_star">';
                        } else if (reviewList[i].r_star == 3.0){
                        a += '<img src="resources/image/star_3.0.png" class="review_star">';
                        } else if (reviewList[i].r_star == 3.5){
                        a += '<img src="resources/image/star_3.5.png" class="review_star">';
                        } else if (reviewList[i].r_star == 4.0){
                        a += '<img src="resources/image/star_4.0.png" class="review_star">';
                        } else if (reviewList[i].r_star == 4.5){
                        a += '<img src="resources/image/star_4.5.png" class="review_star">';
                        } else {
                        a += '<img src="resources/image/star_5.0.png" class="review_star">';
                        }
                     a +=       '<span>'+ reviewList[i].r_date.substring(0,10) +'</span>';
                     
                     if (reviewList[i].l_check == 0){
                     a +=       '<span class="thumb_up_no"><img src="resources/image/thumb_up_no.png"></span>';
                     } else{
                     a +=       '<span class="thumb_up_yes"><img src="resources/image/thumb_up_yes.png"></span>';
                     }
                     a +=       '<span class="like_cnt">'+ reviewList[i].r_like + '</span>';
                     a +=    '</div>';   
                     a +=    '<div class="review_content_wrapper">';
                     a +=       '<div class="review_content">'+ reviewList[i].r_content+'<br/></div>';
                     if (reviewList[i].r_up_file != null){
                     a +=          '<div id="thumbnails">';
                        var files = reviewList[i].r_up_file.split(',');
                        for (var j in files){
                     a +=             '<img src="/myakkbird/myakkbirdUpload/'+ files[j] + '" class="pic" id="'+ files[j] +'" onclick="getReviewDetail('+files[j]+')">';         
                        }
                     a +=       '</div>';
                     a +=       '<div class="detail"></div>';
                     }
                     a +=   '</div>';
                     a +='</div>';
                  }
                  $('#a').html(a);        
            },
         error: function(){
            alert('x');
         }
      });
   }) 
   
   
   /* 리뷰작성 모달창에서 이미지파일 미리보기 */
   var sel_files = [];
   $(document).ready(function(){
      $('#review_img').on('change',handleImgsFilesSelect);
   });
   
   function handleImgsFilesSelect(e){
      var files = e.target.files;
      var filesArr = Array.prototype.slice.call(files);
      filesArr.forEach(function(f){
         if(!f.type.match("image.*")){
            alert("이미지 파일만 가능합니다");
            return;
         }
         
         sel_files.push(f);
         
         var reader = new FileReader();
         reader.onload = function(e){
            var img_html = "<img src=\"" + e.target.result + "\" />";
            $('#review_img_preview').append(img_html);
         }
         reader.readAsDataURL(f);
      });
      
   }
   
   $(function() {
       $('#content').keyup(function (e){
           var content = $(this).val();
           
           $('#counter').html(content.length + '/150');
       });
       $('#content').keyup();
   });
   
   </script>
   <section id=review_container>
   <% 
   List<ReviewVO> reviewList = (List<ReviewVO>)request.getAttribute("reviewList");
   if(request.getAttribute("countReview") != "0" && request.getAttribute("avgStar") != "0"){ // 리뷰 있으면 
      double avgStar = ((Double)request.getAttribute("avgStar")).doubleValue();   %>
      <div>
         <span>리뷰 평점 : <span class="highlight"><%=avgStar %></span> / 5.0</span>   
          <span>(총 <span class="highlight"><%=reviewList.size()%></span>개의 리뷰가 있습니다)</span> 
      </div>    
      
      
      <div id="text_onlyPhotos">사진 모아보기 > </div>
      <div id="onlyPhotos">
         <% for(ReviewVO vo : reviewList){// 리뷰 하나씩 꺼내서
            if(vo.getR_up_file() != null){ // 첨부사진 있으면
               String[] files = vo.getR_up_file().split(","); %>
               <% for (String a : files){ %>
               <img src="/myakkbird/myakkbirdUpload/<%=a%>" class="pic" id="pic_<%=vo.getR_num()%>" onclick="getOnlyPhotoDetail(this)">
               <% } %>
            <% } %>
         <% } %>
      </div>
         <div id="onlyPhoto_detail"></div>
      <div id="orderby_container">
         <span id="orderbyLatest" class="orderby"> 최신순 </span>
         <span id="orderbyStar" class="orderby"> 평점 높은순 </span>
         <span id="orderbyLike" class="orderby"> 좋아요순</span>
      </div>   

<!--    <button type="button" id="orderbyLatest"> 최신순 </button>
      <button type="button" id="orderbyStar"> 평점 높은순</button>
      <button type="button" id="orderbyLike"> 좋아요 많은순</button> -->

   <div id="a">   
      <%   for (int i = 0; i <reviewList.size(); i++){ // 리뷰 개수만큼 리뷰 뿌려줄 칸 만들기
            ReviewVO reviewVO = (ReviewVO)reviewList.get(i);   %> 
         <div id="<%=reviewVO.getR_num()%>" class="eachReview">
               <div class="eachReview_info"> <!-- 리뷰 정보 -->
                  <img src="/myakkbird/myakkbirdUpload/<%=reviewVO.getM_photo()%>" class="review_profile">
                    <span class="eachReview_info_id"><%=reviewVO.getM_id() %></span>
                   
                   <span>
                   <% if (reviewVO.getR_star() == 0.5){ %> 
                        <img src="resources/image/star_0.5.png" class="review_star" alt="0.5">
                        <% } else if (reviewVO.getR_star() == 1.0){%>
                        <img src="resources/image/star_1.0.png" class="review_star" alt="1.0">
                        <% } else if (reviewVO.getR_star() == 1.5){%>
                        <img src="resources/image/star_1.5.png" class="review_star" alt="1.5">
                        <% } else if (reviewVO.getR_star() == 2.0){%>
                        <img src="resources/image/star_2.0.png" class="review_star" alt="2.0">
                        <% } else if (reviewVO.getR_star() == 2.5){%>
                        <img src="resources/image/star_2.5.png" class="review_star" alt="2.5">
                        <% } else if (reviewVO.getR_star() == 3.0){%>
                        <img src="resources/image/star_3.0.png" class="review_star" alt="3.0">
                        <% } else if (reviewVO.getR_star() == 3.5){%>
                        <img src="resources/image/star_3.5.png" class="review_star" alt="3.5">
                        <% } else if (reviewVO.getR_star() == 4.0){%>
                        <img src="resources/image/star_4.0.png" class="review_star" alt="4.0">
                        <% } else if (reviewVO.getR_star() == 4.5){%>
                        <img src="resources/image/star_4.5.png" class="review_star" alt="4.5">
                        <% } else {%>
                        <img src="resources/image/star_5.0.png" class="review_star" alt="5.0">
                        <% } %>
                   </span>
                   <span><%=reviewVO.getR_date().substring(0,10)%></span>
                   <span>
                      <% if (reviewVO.getL_check() == 0){ %> <!-- 좋아요 X 상태 -->
                      <span class="thumb_up_no"><img src="resources/image/thumb_up_no.png" alt="좋아요"></span>
                      <% } else { %> <!-- 좋아요 O 상태 -->
                      <span  class="thumb_up_yes"><img src="resources/image/thumb_up_yes.png" alt="좋아요 취소"></span>
                      <% } %> 
                      <span class="like_cnt"> <%=reviewVO.getR_like()%> </span>
                   </span>
               </div>
               <div class="review_content_wrapper">
                  <div class="review_content">
                       <%=reviewVO.getR_content()%> <br/> <!-- 리뷰 내용 -->
                  </div>
                  <% if(reviewVO.getR_up_file() != null){ // 첨부사진 있을경우 
                     String[] files = reviewVO.getR_up_file().split(","); %>
      
                      <div id="thumbnails"> <!-- 썸네일부분-->
                     <% if(files.length < 8){
                        for (int j=0; j < files.length; j++){ %>
                           <img src="/myakkbird/myakkbirdUpload/<%=files[j]%>" class="pic" id="<%=files[j]%>" onclick="getReviewDetail('<%=files[j]%>')" alt="클릭하면 크게볼 수 있습니다">
                        <% } 
                     } %>    
                     </div>      
                     <div class="detail" ></div> <!-- 크게 보기 -->
                  <% } %> 
               </div>
               
               <!-- 리뷰 작성자일 경우만 -->
               <% if (id.equals(reviewVO.getM_id())){ %>
               <span class="btn_modify" onclick="modifyReview(this)"> 수정 </span>
               <span class="btn_delete" onclick='location.href="deleteReview.ak?r_num=<%=reviewVO.getR_num()%>"'> 삭제 </span>
               <% } %>   
         </div>
      <% } %>
      
   
   
</div> <!-- content_container -->
      <!----------------------- (Modal)리뷰작성 --------------------------------->
<% 
    String matchedPpl = (String)request.getAttribute("matchedPpl");
   int hasWritten = ((Integer)request.getAttribute("hasWritten")).intValue(); 
   
    if(id.equals(matchedPpl)){ /* 매칭된 사람들중에 */
      if(hasWritten == 0){ %>   <!-- 리뷰쓴 적 없는 사람만 -->
      <button id="myBtn">리뷰 작성</button>
      
       
      <div id="myModal" class="modal">
         
         <div class="modal-content">
         
            <span class="close">&times;</span> 
                                                          
            <form id="reviewform" name="reviewform" action="./writeReview3.ak" method="post" enctype="multipart/form-data">
               <input type="hidden" name="r_id" value="<%=memberVO.getM_id()%>">
               <input type="hidden" name="m_id" value="<%=id%>">
               
               <h3><%=memberVO.getM_id()%>님에게 후기 작성하기</h3> 
               <div>평점 : <input type="number" name="r_star" min="0.5" max="5" step="0.5" required> </div>
               <!-- <textarea id="content" maxlength="1000" placeholder="예). 부적절한 사진이 올라가 있습니다." name="d_con"></textarea> -->
               <textarea id="content" name="r_content" maxlength="150" cols="50" rows="20" style="resize:none;" required></textarea>
                 <span id="counter">###</span>
               <div><input type="file" id="review_img" name="file1" multiple>사진파일만 최대 7개까지 업로드 가능</div>
                <input type="submit" value="확인" id="btn_submit_review" >
            </form> 
            
               <div id="review_img_preview" ></div>
         </div>
      </div>
 <%}
   } %> 
   
   </div>          
   <% } else{%>
      리뷰가 없습니다.
   <% } %>
   <br/>
   </section>   <!-- review_container -->
    



<jsp:include page="../footer_container.jsp">
   <jsp:param value="" name=""/>
</jsp:include> 

</div> <!-- div class="wrap" -->
</body>
</html>