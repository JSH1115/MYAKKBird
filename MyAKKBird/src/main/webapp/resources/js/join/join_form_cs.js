// 메일 인증
function mail_check(){
	var email =  $("#m_email").val();
	if($("#m_email").val()==""){
		Swal.fire({
			  html: 
		        '<b id="alert_id_txt">이메일를 입력해주세요.</b>',
			  timer: 1500,
			  confirmButtonColor: '#37B04B',
			  confirmButtonText:
				  '<div class="go_btn">확인</div>'
		})
		$("#m_emil").focus();
		return false;
	}
	
	if(email.indexOf("@") == "-1"){
    	Swal.fire({
			  html: 
		        '<b id="alert_id_txt">유효하지않은 이메일입니다.</b>',
			  timer: 1500,
			  confirmButtonColor: '#37B04B',
			  confirmButtonText:
				  '<div class="go_btn">확인</div>'
		})
    	return false;
    }
	var check = document.joinformcs;
	
	var popupX = (document.body.offsetWidth/2)-(200/2);
	//&nbsp;만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
	var popupY= (window.screen.height/2)-(300/2);
	//&nbsp;만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
	window.open('', "popView", 'status=no, height=200, width=500, left='+ popupX + ', top='+ popupY);
	
	check.action="./auth.ak";
	check.target = "popView";
	check.submit();
}

// 비밀번호 검사
$(function(){ $("#alert-success").hide(); 
$("#alert-danger").hide();
$("input").keyup(function(){ 
	var pwd1=$("#m_password").val();
	var pwd2=$("#m_password2").val();
	if(pwd1 != "" || pwd2 != ""){
		if(pwd1 == pwd2){ 
			$("#alert-success").show(); 
			$("#alert-danger").hide(); 
			$("#submit").removeAttr("disabled"); 
			}else{ 
				$("#alert-success").hide();
				$("#alert-danger").show(); 
				$("#submit").attr("disabled", "disabled"); 
			}
		} 
	});
});

//아이디 중복체크
var idck = 0;
$(function() {
  //idck 버튼을 클릭했을 때 
  $("#idcheck").click(function() {
      
      //userid 를 param.
      var userid =  $("#m_id").val(); 
      
      if($("#m_id").val()==""){
			Swal.fire({
   			  html: 
   		        '<b id="alert_id_txt">아이디를 입력해주세요.</b>',
   			  timer: 1500,
   			  confirmButtonColor: '#37B04B',
   			  confirmButtonText:
   				 '<div class="go_btn">확인</div>'
		  	})
			$("#m_id").focus();
			return false;
	  } 
      
      $.ajax({
          async: true,
          type : 'POST',
          data : userid,
          url : "./idcheck.ak",
          dataType : "json",
          contentType: "application/json; charset=UTF-8",
          success : function(data) {
              if (data.cnt > 0) {
                  
                  Swal.fire({
	       			  html: 
	       		        '<b id="alert_id_txt">아이디가 존재합니다. 다른 아이디를 입력해주세요.</b>',
	       			  timer: 1500,
	       			  confirmButtonColor: '#37B04B',
	       			  confirmButtonText:
	       				'<div class="go_btn">확인</div>'
        		  })
        		  
                  //아이디가 존재할 경우 빨강으로 , 아니면 그린으로 처리하는 디자인
                  $("#m_id").addClass("tex2")
                  $("#m_id").removeClass("tex1")
                  $("#m_id").removeClass("tex3")
                  $("#m_id").focus();
              
              } else {
            	  
                  Swal.fire({
	       			  html: 
	       		        '<b id="alert_id_txt">사용가능한 아이디입니다.</b>',
	       			  confirmButtonColor: '#37B04B',
	       			  confirmButtonText:
	       				'<div class="go_btn">확인</div>'
        		  })
                  
                  $("#m_id").addClass("tex3")
                  $("#m_id").removeClass("tex2")
                  $("#m_password").focus();
                  //아이디가 중복하지 않으면  idck = 1 
                  idck = 1;
                  
              }
          },
          error : function(error) {
              
              alert("error : " + error);
          }
      });
  });
});

$(document).ready(function(){
   //빈칸
	$("#join").on("click", function(){
		if($("#m_id").val()==""){
			Swal.fire({
     			  html: 
     		        '<b id="alert_id_txt">아이디를 입력해주세요.</b>',
     			  timer: 1500,
     			  confirmButtonColor: '#37B04B',
     			  confirmButtonText:
     				 '<div class="go_btn">확인</div>'
  		  	})
			$("#m_id").focus();
			return false;
		}
		if($("#m_password").val()==""){
			Swal.fire({
   			  html: 
   		        '<b id="alert_id_txt">비밀번호를 입력해주세요.</b>',
   			  timer: 1500,
   			  confirmButtonColor: '#37B04B',
   			  confirmButtonText:
   				'<div class="go_btn">확인</div>'
		  	})
			$("#m_password").focus();
			return false;
		}
		if($("#m_name").val()==""){
			Swal.fire({
	   			  html: 
	   		        '<b id="alert_id_txt">이름을 입력해주세요.</b>',
	   			  timer: 1500,
	   			  confirmButtonColor: '#37B04B',
	   			  confirmButtonText:
	   				'<div class="go_btn">확인</div>'
			})
			$("#m_name").focus();
			return false;
		}
		if($("#m_age").val()==""){
			Swal.fire({
	   			  html: 
	   		        '<b id="alert_id_txt">나이를 입력해주세요.</b>',
	   			  timer: 1500,
	   			  confirmButtonColor: '#37B04B',
	   			  confirmButtonText:
	   				'<div class="go_btn">확인</div>'
			})
			$("#m_age").focus();
			return false;
		}
		if($("#m_email").val()==""){
			Swal.fire({
	   			  html: 
	   		        '<b id="alert_id_txt">이메일을 입력해주세요.</b>',
	   			  timer: 1500,
	   			  confirmButtonColor: '#37B04B',
	   			  confirmButtonText:
	   				'<div class="go_btn">확인</div>'
			})
			$("#m_email").focus();
			return false;
		}
		if($("#m_phone").val()==""){
			Swal.fire({
	   			  html: 
	   		        '<b id="alert_id_txt">휴대전화를 입력해주세요.</b>',
	   			  timer: 1500,
	   			  confirmButtonColor: '#37B04B',
	   			  confirmButtonText:
	   				'<div class="go_btn">확인</div>'
			})
			$("#m_phone").focus();
			return false;
		}
		if($("#m_address_road").val()==""){
			Swal.fire({
	   			  html: 
	   		        '<b id="alert_id_txt">지번주소를 선택해주세요.</b>',
	   			  timer: 1500,
	   			  confirmButtonColor: '#37B04B',
	   			  confirmButtonText:
	   				'<div class="go_btn">확인</div>'
			})
			$("#m_address_road").focus();
			return false;
		}
		if($("#mailCheck").val()!="인증완료"){
			Swal.fire({
	   			  html: 
	   		        '<b id="alert_id_txt">메일인증을 받아주세요.</b>',
	   			  timer: 1500,
	   			  confirmButtonColor: '#37B04B',
	   			  confirmButtonText:
	   				'<div class="go_btn">확인</div>'
			})
			$("#m_email").focus();
			return false;
		}
		var ccc = "1";
		if(idck != ccc){
			Swal.fire({
	   			  html: 
	   		        '<b id="alert_id_txt">아이디 중복검사를 해주세요.</b>',
	   			  timer: 1500,
	   			  confirmButtonColor: '#37B04B',
	   			  confirmButtonText:
	   				'<div class="go_btn">확인</div>'
			})
			$("#m_id").focus();
			return false;
		}
		
		document.joinformcs.target = '_self';
		document.joinformcs.action="./joininput.ak";
		document.joinformcs.submit();
	});
	
})

// 안내 modal
$('#detail_btn').click(function() {
	Swal.fire({
		title: 
			'<strong id="m_title">※마이악어새 기본 프로필 사진</strong>',
		html: 
			'<div class="info_profile">' +
			'    <span id="m_span">사진을 정하지 않으면!</span>' +
			'    <div class="left_zone">' +
			'        <img class="info_img" src="resources/image/crocodile_profile.png"><br>' +
			'        <b id="point_txt">고객</b><br> <b>기본 프로필 사진</b>' +
			'    </div>' +
			'    <div class="right_zone">' +
			'        <img class="info_img" src="resources/image/bird_profile.png"><br>' +
			'        <b id="point_txt">근로자</b><br> <b>기본 프로필 사진</b>' +
			'    </div>' +
			'</div>' +
			'<div class="txt_zone">' +
			'    <span>*고객은 악어, 근로자는 악어새 입니다.</span>' +
			'</div>',
		confirmButtonColor: '#37B04B',
		confirmButtonText:
			'<div class="go_btn">확인</div>'
	})
});

//안내 modal
$('#why').click(function() {
	Swal.fire({
		html: '<b>마이악어새는 고객과 근로자의 안전을 위해 </b><br>' +
		      '<b>이메일 인증이 필요합니다!</b>',
		confirmButtonColor: '#37B04B',
		confirmButtonText:
			'<div class="go_btn">확인</div>'
	})
});

// 안내 modal
$('#why_addr').click(function() {
	Swal.fire({
		html: '<b>마이악어새는 정확한 위치를 확인하기 위해</b><br>' +
		      '<b>지번주소가 필요합니다!</b>',
		confirmButtonColor: '#37B04B',
		confirmButtonText:
			'<div class="go_btn">확인</div>'
	})
});

var fileTarget = $('#img_input'); 
//파일 업로드 후 파일 이름 출력
fileTarget.on('change', function(){ 
	if(window.FileReader){ 
		var filename = $(this)[0].files[0].name; 
	} else { 
		var filename = $(this).val().split('/').pop().split('\\').pop(); 
	}
	$(this).siblings('.upload_name').val(filename); 
});
//파일 업로드 후 미리보기
$(function() {
    $("#img_input").on('change', function(){
        readURL(this);
    });
});
// 파일 미리보기
function readURL(input) {
    if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
            $('#image_section').attr('src', e.target.result);
        }
      reader.readAsDataURL(input.files[0]);
    } 
}

// 다음 주소 API
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
                document.getElementById("m_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("m_extraAddress").value = '';
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('m_postcode').value = data.zonecode;
            document.getElementById("m_address_road").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("m_address_detail").focus();
            
        }
    }).open();
}
    