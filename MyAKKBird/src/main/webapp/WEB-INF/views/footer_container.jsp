<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>

   html,body{
      font-family: "NotoSansKR-Regular";
      height:100%;
      padding:0px;
      margin:0px;
   }
   
   #footer_container{
       position:absolute;
       bottom:0;
       width:100%;
      /* height:280px; */
      background-color: #575757;
   }
   
   #footer_logos{
      margin:2px; 
      padding:5px; 
   }
    
   #footer_logos i{
      font-size:40px;
   }
   
   #footer_akkbird{
      width:250px;
   }
   
   .sns{  
      width:40px;
      height:40px;
      border-radius: 40px; 
   }
   
   #footer_info{
      display:flex;
      flex-direction: row;
      justify-content: center;
      padding:50px 50px 0px 50px;
      
   }
   
   #footer_info > div{
      margin:10px; 
      padding:10px; 
      color:#c2c2c2;
   }
</style>

<section id="footer_container">
   <div id="footer_info">
      <div>
      (주)마이악어새 <br/>
         <div id="footer_logos">
            <i class="fab fa-facebook-square" class="sns"></i>
            <i class="fab fa-twitter-square"></i>
            <i class="fab fa-instagram-square"></i>
         </div>
      서울 서초구 강남대로 459 백암빌딩 구관 (우)06611 <br/>
      지번 : 서초동 1303-34 <br/>
      <img src="resources/image/fullLogo_removebg.png" id="footer_akkbird">
      </div>
      
      <div>
      이용문의 > <br/>
      평일 9:30 ~ 18:10 <br/>
      (점심시간 13:00 ~ 14:00 제외, 주말/공휴일 제외) <br/><br/>
      
      제휴관련 문의 > <br/>
      Email : abcd1234@myakkbird.bit <br/>
      Tel : 1588 -1588 <br/>
      Fax : 02 - 1234 -5678 <br/>
      </div>
   </div>
</section>