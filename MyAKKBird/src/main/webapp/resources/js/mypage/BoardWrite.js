//전역 변수
var sel_files = [];                      // 업로드한 파일을 저장할 배열
var mapContainer;                        // 맵 생성 변수
var map;                                 // 맵 생성 변수
//전역 변수

// 뒤로가기 버튼
$('#back_btn').click(function() {
	location.href="./profile.ak?id="+se_id+"";
});
// 트리거 이벤트
function fileUploadAction() {
	$('#img_input').trigger('click');
}
// 청소 안내 modal
$('#detail_btn').click(function() {
	Swal.fire({
		title: '<strong id="m_title">※마이악어새가 알려주는 청소 종류</strong>',
		html: 
	        '<div class="m_div1">' +
	        '    <b>정기청소</b><span>&nbsp;&nbsp;집 청소, 음식점 청소 등</span>' +
	        '</div>' +
	        '<div class="m_div2">' +
	        '    <b>특수청소</b><span>&nbsp;&nbsp; 범죄 현장 청소, 폐기물 처리 등</span>' +
	        '</div>' +
	        '<div class="m_div2">' +
	        '    <b>입주청소</b><span>&nbsp;&nbsp; 이사, 리모델링 청소 등</span>' +
	        '</div>' +
	        '<div class="m_div2">' +
	        '    <b>상주청소</b><span>&nbsp;&nbsp; 어르신 집 청소, 회사 청소 등</span>' +
	        '</div>' +
	        '<div class="m_div2">' +
	        '    <b>빌딩청소</b><span>&nbsp;&nbsp; 아파트 외벽, 빌딩 옥상 등</span>' +
	        '</div>' +
	        '<div class="m_div2">' +
	        '    <b>방역청소</b><span>&nbsp;&nbsp; 코로나로 인한 방역</span>' +
	        '</div>',
		confirmButtonColor: '#37B04B',
		confirmButtonText:
		    '<div class="go_btn">확인</div>'
	})
});
// form 초기화
function reset_form() {
	var img_ul = '';
	
	$('#board_form_id').each( function () {
        this.reset();
    });
	
	img_ul += '<img class="default_img" src="./resources/image/img_default.png">'
	img_ul += '<ul id="img_ul"></ul>'
	
	$("#img_ul").empty();
	$(".img_div").html(img_ul);
}
// 텍스트 박스 글자수 체크
$(function() {
    $('#textarea_id').keyup(function (e){
        var content = $(this).val();
        
        $('#counter').html(content.length + '/300');
    });
    $('#textarea_id').keyup();
});
$(document).ready(function () {
	
	$('#img_input').on("change", handleImgFileSelect);
	
	function handleImgFileSelect(e) {
		
		sel_files = [];
		$('.default_img').remove();
		$("#img_ul").empty();
		
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		if(filesArr.length > 3) {
			
			Swal.fire({
				  html:
				    '<b>파일은 최대 3개까지 업로드 가능합니다!</b><br>',
				  confirmButtonColor : '#37B04B',
				  confirmButtonText: '<div class="go_btn">확인</div>',
			});
			$("#img_input").val("");
			return;
			
		} else {
			var index = 0;
			
			filesArr.forEach(function (f) {
				
				if(!f.type.match("image.*")) {
					Swal.fire({
					  	html:
					    	'<b>이미지 파일만 업로드 가능합니다!</b><br>',
					  	confirmButtonColor : '#37B04B',
					  	confirmButtonText: '<div class="go_btn">확인</div>',
					});
					return;
				}
				
				sel_files.push(f);
				
				var reader = new FileReader();
				
				reader.onload = function(e) {
					var img = '';
					index++;
					
					if(sel_files.length == 1) {
						img += "<li>"
						img += "    <img id=\"img_preview"+index+"\" class='preview_1img' src=\""+e.target.result+"\" data-file='"+f.name+"'><br>"
						img += "    <b id='preview_1img_txt'>'"+f.name+"'</b>"
						img += "</li>" 
					} else if(sel_files.length == 2) {
						img += "<li>"
						img += "    <img id=\"img_preview"+index+"\" class='preview_2img' src=\""+e.target.result+"\" data-file='"+f.name+"'><br>"
						img += "    <b id='preview_2img_txt'>'"+f.name+"'</b>"
						img += "</li>"
					} else {
						img += "<li>"
						img += "    <img id=\"img_preview"+index+"\" class='preview' src=\""+e.target.result+"\" data-file='"+f.name+"'><br>"
						img += "    <b id='preview_txt'>'"+f.name+"'</b>"
						img += "</li>"
					}
					
					$("#img_ul").append(img);
					
					
				}
				
				reader.readAsDataURL(f);
				
			});
		}
		
	}
	
	newMap();
	addr_choice();
	
	
	$('#submit_btn').click(function (event) {
		
		if(heart == 0) {
			 
			Swal.fire({
				  title: '하트가 부족해요..ㅠㅠ',
				  html:
				    '<span>하트♡를 충전해야만 게시글을 쓸 수 있어요!</span><br>',
				  confirmButtonColor : '#37B04B',
				  confirmButtonText: '<div class="go_btn">하트충전</div>',
			}).then((result) => {
				if (result.value) {
					location.href="./pay.ak";
				}
			})
			
			return false;
		} 
		
		// 유효성 검사
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
					required: true,
					maxlength: 15
				},
				b_subject: { 
					required: true,
					minlength: 5,
					maxlength: 25
				},
				b_content: { 
					required: true,
					minlength: 15,
					maxlength: 300
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
	        		required: "상세 근무시간을 자세히 입력해주세요!",
	        		maxlength: "최대 15글자만 입력가능합니다!"
	        	},
	        	b_subject: { 
	        		required: "게시글 제목을 입력해주세요!",
	        		minlength: "최소 5글자 이상은 입력해주세요!",
	        		maxlength: "최대 25글자만 입력가능합니다!"
	        	},
				b_content: { 
					required: "상세설명을 입력해주세요!",
					minlength: "최소 15글자 이상은 입력해주세요!",
					maxlength: "최대 300글자만 입력가능합니다!",
				}
	        },
	        submitHandler: function (frm){
	        	if(heart > 0) {
	        		Swal.fire({
        			  title: '게시글 등록!',
        			  text: "게시글 등록시 1 하트가 차감 됩니다.",
        			  icon: 'info',
        			  showCancelButton: true,
        			  confirmButtonColor: '#37B04B',
        			  cancelButtonColor: '#E6E6E6',
        			  confirmButtonText: '<div class="go_btn">게시글 등록</div>',
        		      cancelButtonText: '<div class="go_btn">다음에 할게요</div>'
        		    	  
        			}).then((result) => {
        			    if (result.value) {
        				    frm.submit();
        			    }
        			})
	        	}
                   
            }
		});
	});
});
//맵 생성
function newMap() {
	mapContainer = document.getElementById('map'), 
    mapOption = {
        center: new kakao.maps.LatLng(37.505287, 127.023993), 
        level: 3 
    };  
	
	map = new kakao.maps.Map(mapContainer, mapOption); 
}
// 주소 선택
function addr_choice() {
		
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
            
            // 맵 생성
            newMap();
	    	
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