<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- SNS ICON 사용 -->
<script src="https://kit.fontawesome.com/535c824fa5.js" crossorigin="anonymous"></script>  	
<!-- SNS ICON 사용 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
   html,body{
      font-family: "NotoSansKR-Regular";
      padding:0px;
      margin:0px;
   }
   
   #footer_container{
      position: relative;
      height: 280px;
      width: 100%;
      bottom: 0px;
   }
   
   #footer_home_name {
   	  font-size: 20px;
   	  color: white;
   	  cursor: pointer;
   }
   
   #footer_logos{
      margin:2px; 
      padding:5px; 
   }
   
   #logo_ul {
   	  margin-left: -60px;
   }
   
   #logo_ul li {
  	  list-style: none;
  	  display: inline-block;
  	  padding-left: 15px;
   }
    
   #footer_logos i{
      font-size:30px;
      color: white;
   }
   
   #footer_txt1 span {
      font-size: 15px;
      font-family: "NotoSansKR-Regular";
      color: #D8D8D8;
   }
   
   #footer_txt2 {
      margin-top: 15px;
   }
   
   #footer_txt2 span {
   	  font-size: 15px;
      font-family: "NotoSansKR-Regular";
      color: #999999;
   }
   
   #footer_akkbird{
      width:250px;
      margin-top: -20px;
   }
   
   #footer_info{
      display: flex;
	  flex-direction: row;
	  justify-content: center;
	  background-color: #3c3c3c;
      padding: 15px 15px 50px;     
   }
   
   #footer_info > div{
      margin:10px; 
      padding:10px; 
      color:#5d5d5d;
      margin-top: 30px;
   }
   
   #footer_txt3 {
      margin-top: 25px;
      font-family: "NotoSansKR-Regular";
   }
   
   #point_txt {
       color: #D8D8D8;
       font-size: 15px;
       font-family: "NotoSansKR-Regular";
       cursor: pointer;
   }
   
   #txt {
       color: #999999;
       font-size: 15px;
       font-family: "NotoSansKR-Regular";
   }
</style>
<section id="footer_container">
	<div id="footer_info">
	   <div>
	     <b id="footer_home_name" onclick="location.href='home.ak'">마이악어새 </b><br/>
	        <div id="footer_logos">
	        	<ul id="logo_ul">
	        		<li>
	        			 <i class="fab fa-facebook-f"></i>
	        		</li>
	        		<li>
	        			 <i class="fab fa-instagram"></i>
	        		</li>
	                <li>
	               		<i class="fab fa-twitter"></i>
	        		</li>
	        	</ul>
	        </div>
	        <div id="footer_txt1">
	        	<span>이용약관 </span><span>&nbsp;&nbsp;|&nbsp;&nbsp; 개인정보취급방침</span>
	        </div>
	       	<div id="footer_txt2">
	       		<span>(주)마이악어새</span><br/>
	    		<span>서울 서초구 강남대로 459 백암빌딩 구관 (우)06611</span><br/>
	    		<span>지번 : 서초동 1303-34</span>
	    	</div>
		</div>
	    <div>
		    <div id="footer_txt3">
				<span id="point_txt" onclick="location.href='FAQList.ak'">이용문의 ></span><br/>
				<span id="txt">평일 9:30 ~ 18:10</span><br/>
				<span id="txt">(점심시간 13:00 ~ 14:00 제외, 주말/공휴일 제외)</span><br/><br/>
			</div>
			<div id="footer_txt4">
			    <span id="point_txt" onclick="location.href='FAQList.ak'">제휴관련 문의 ></span> <br/>
			    <span id="txt">Email : abcd1234@myakkbird.bit</span> <br/>
			    <span id="txt">Tel : 1588-1588</span> <br/>
			    <span id="txt">Fax : 02-1234-5678</span> <br/>
			</div> 
	    </div>
	</div>
</section>