<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이악어새</title>
<!-- favicon 적용 -->
<link type="image/x-icon" rel="icon" href="./resources/image/akk_favicon.png">
<!-- favicon 적용 -->
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script> 
<style type="text/css">
	@media only screen and (min-width:860px) {
		._1POqd, ._1IykZ {background-color: #fff;min-height: 100vh}
		._1POqd {max-width: 600px;margin: 50px auto 0}
	}
	.fMmkw {overflow: hidden}
	._191Jn {position: relative;display: -ms-flexbox;display: flex;-ms-flex-pack: center;justify-content: center;-ms-flex-wrap: nowrap;flex-wrap: nowrap}
	._3kQHk {width: calc(50% - 28px) !important;height: 50px !important}
</style>

<!-- 
<style>
* { box-sizing: border-box; margin: 0; padding: 0; } html, body { min-height: 100%; height: 100%; font-family: helvetica neue, helvetica, arial, sans-serif; } .content { min-height: 100%; height: 100%; background: #fff; position: relative; z-index: 0; } .content h1 { padding: 75px 0 30px 0; text-align: center; font-size: 30px; line-height: 30px; } .content .buttons { max-width: 800px; margin: 0 auto; text-align: center; } .content .buttons .button { display: inline-block; text-align: center; text-decoration: none; background: #efefef; padding: 10px 15px; margin: 10px; border-radius: 3px; box-shadow: 0 1px 2px rgba(0, 0, 0, .3); color: #333; font-weight: bold; } .content .buttons .button:hover { color: #fff; background: #009bd5; } /* modal style */ html.modal-active, body.modal-active { overflow: hidden; } #modal-container { position: fixed; left: 0; top: 0; display: table; height: 100%; width: 100%; z-index: 1; /* hidden 처리 */ transform: scale(0); } #modal-container .modal-background { display: table-cell; background: rgba(0, 0, 0, .8); text-align: center; vertical-align: middle; } #modal-container .modal-background .modal { background: #fff; padding: 50px; display: inline-block; border-radius: 3px; position: relative; } #modal-container .modal-background .modal h2 { font-size: 25px; line-height: 25px; margin-bottom: 15px; } #modal-container .modal-background .modal p { font-size: 18px; line-height: 22px; } /* * ------------------------------ * Unfolding Animation * ------------------------------ */ #modal-container.one { /*transform: scaleX(0) scaleY(1);*/ animation: unfoldIn 1s cubic-bezier(0.165, 0.84, 0.44, 1) forwards; } #modal-container.one .modal-background .modal { /* 초기 display: none 처럼 크기를 0 으로 하여 보여주지 않음*/ transform: scale(0); /* 0.5 초 동안 애니메이션을 실행, 단 0.8초 지연시켜 0.8초 후에 애니메이션을 실행 */ animation: zoomIn .5s .8s cubic-bezier(0.165, 0.84, 0.44, 1) forwards; } #modal-container.one.out { transform: scale(1); animation: unfoldOut 1s .3s cubic-bezier(0.165, 0.84, 0.44, 1) forwards; } #modal-container.one.out .modal-background .modal { animation: zoomOut 0.5s cubic-bezier(0.165, 0.84, 0.44, 1) forwards; } /* Dimmed showing */ @keyframes unfoldIn { 0% { transform: scaleX(0) scaleY(0.005); } 50% { /* 0.5 초간 세로 크기는 작은상태로 가로 너비만 확대 */ transform: scaleX(1) scaleY(0.005); } 100% { /* 0.5 초간 세로 크기를 확대 */ transform: scaleY(1) scaleX(1); } } /* Show modal content */ @keyframes zoomIn { from { transform: scale(0); } to { transform: scale(1); } } /* Hide modal content */ @keyframes zoomOut { from { transform: scale(1); } to { transform: scale(0); } } /* Dimmed hiding */ @keyframes unfoldOut { 0% { transform: scale(1) } 50% { transform: scaleX(1) scaleY(0.005); } 100% { transform: scaleX(0) scaleY(0.005); } } /* * ------------------------------ * Revealing Animation * ------------------------------ */ #modal-container.two { transform: scale(1); } #modal-container.two .modal-background { background: transparent; animation: fadeIn .5s cubic-bezier(0.165, 0.84, 0.44, 1) forwards; } #modal-container.two .modal-background .modal { /* 콘텐츠를 초기에 보여주지 않음 */ opacity: 0; animation: scaleUp 0.5s cubic-bezier(0.165, 0.84, 0.44, 1) forwards; } .content.two { /* 콘텐츠 크기를 줄임 */ animation: scaleBack 0.5s cubic-bezier(0.165, 0.84, 0.44, 1) forwards; } #modal-container.two.out { /* 전체 모달 컨테이너를 숨김 처리(다른 애니메이션이 모두 끝난 0.5초 후에 처리하기 위해 0.5초 지연시킴 */ animation: quickScaleDown 0s .5s linear forwards; } #modal-container.two.out .modal-background { animation: fadeOut 0.5s cubic-bezier(0.165, 0.84, 0.44, 1) forwards; } #modal-container.two.out .modal-background .modal { animation: scaleDown 0.5s cubic-bezier(0.165, 0.84, 0.44, 1) forwards; } .content.two.out { animation: scaleForward 0.5s cubic-bezier(0.165, 0.84, 0.44, 1) forwards; } /* Dimmed showing */ @keyframes fadeIn { 0% { background: transparent; } 100% { background: rgba(0, 0, 0, .7); } } /* Show modal content from bottom to top */ @keyframes scaleUp { 0% { /* 모달 콘텐츠를 하단에 위치시킴 */ transform: scale(.8) translateY(1000px); opacity: 0; } 100% { /* 모달 콘텐츠를 본래 위치로 돌려놓음 */ transform: scale(1) translateY(0); opacity: 1; } } /* Shrink content */ @keyframes scaleBack { 0% { transform: scale(1); } 100% { transform: scale(.8); } } /* Hide modal container*/ @keyframes quickScaleDown { 0% { transform: scale(1); } 99.9% { transform: scale(1); } 100% { transform: scale(0); } } /* Dimmed hiding */ @keyframes fadeOut { 0% { background: rgba(0, 0, 0, .7); } 100% { background: transparent; } } /* modal content from top to bottom */ @keyframes scaleDown { 0% { transform: scale(1) translateY(0); opacity: 1; } 100% { transform: scale(.8) translateY(1000px); opacity: 0; } } @keyframes scaleBack { 0% { transform: scale(1); } 100% { transform: scale(.85); } } @keyframes scaleForward { 0% { transform: scale(0.85); } 100% { transform: scale(1); } } /* * ------------------------------ * Uncovering Animation * ------------------------------ */ #modal-container.three { z-index: 0; transform: scale(1); } #modal-container.three .modal-background { background: rgba(0, 0, 0, .9); } #modal-container.three .modal-background .modal { animation: moveUp 0.5s cubic-bezier(0.165, 0.84, 0.44, 1) forwards; } .content.three { z-index: 1; animation: slideUpLarge 0.5s cubic-bezier(0.165, 0.84, 0.44, 1) forwards; } #modal-container.three.out .modal-background .modal { animation: moveDown 0.5s cubic-bezier(0.165, 0.84, 0.44, 1) forwards; } .content.three.out { animation: slideDownLarge 0.5s cubic-bezier(0.165, 0.84, 0.44, 1) forwards; } /* Show Modal content*/ @keyframes moveUp { /* 하단에서 */ 0% { transform: translateY(200px); } /* 중앙으로 위치 */ 100% { transform: translateY(0); } } /* Slide up Content */ @keyframes slideUpLarge { 0% { transform: translateY(0); } 100% { transform: translateY(-100%); } } /* Hide Modal content */ @keyframes moveDown { /* 중앙에 있는 모달 콘텐츠를 */ 0% { transform: translateY(0); } /* 하단으로 위치 */ 100% { transform: translateY(200px); } } /* Slide down content */ @keyframes slideDownLarge { 0% { transform: translateY(-100%); } 100% { transform: translateY(0); } } /* * ------------------------------ * Blow Up Animation * ------------------------------ */ #modal-container.four { z-index: 0; transform: scale(1); } #modal-container.four .modal-background { background: rgba(0, 0, 0, 0.9); } #modal-container.four .modal-background .modal { animation: blowUpModal 0.5s cubic-bezier(0.165, 0.84, 0.44, 1) forwards; } .content.four { z-index: 1; animation: blowUpContent 0.5s cubic-bezier(0.165, 0.84, 0.44, 1) forwards; } #modal-container.four.out .modal-background .modal { animation: blowUpModalTwo 0.5s cubic-bezier(0.165, 0.84, 0.44, 1) forwards; } .content.four.out { animation: blowUpContentTwo 0.5s cubic-bezier(0.165, 0.84, 0.44, 1) forwards; } /* Show modal content */ @keyframes blowUpModal { 0% { transform: scale(0); } 100% { transform: scale(1); } } /* Hide content */ @keyframes blowUpContent { 0% { transform: scale(1); opacity: 1; } /* 원본 크기에서 2배로 커지면서 투명도를 서서히 낮춤 */ 99.9% { transform: scale(2); opacity: 0; } /* 마지막에 숨김 처리 */ 100% { transform: scale(0); } } /* Hide modal content */ @keyframes blowUpModalTwo { 0% { transform: scale(1); opacity: 1; } 100% { transform: scale(0); opacity: 0; } } /* Show content */ @keyframes blowUpContentTwo { 0% { transform: scale(2); opacity: 0; } 100% { transform: scale(1); opacity: 1; } } /* * ------------------------------ * Meep Meep Animation * ------------------------------ */ #modal-container.five { transform: scale(1); } #modal-container.five .modal-background { background: transparent; animation: fadeIn 0.5s cubic-bezier(0.165, 0.84, 0.44, 1) forwards; } #modal-container.five .modal-background .modal { transform: translateX(-1500px); animation: roadRunnerIn 0.3s cubic-bezier(0.165, 0.84, 0.44, 1) forwards; } #modal-container.five.out { animation: quickScaleDown 0s .5s linear forwards; } #modal-container.five.out .modal-background { animation: fadeOut 0.5s cubic-bezier(0.165, 0.84, 0.44, 1) forwards; } #modal-container.five.out .modal-background .modal { animation: roadRunnerOut 0.5s cubic-bezier(0.165, 0.84, 0.44, 1) forwards; } /* 모달 콘텐츠 반동 효과로 나타나기 */ @keyframes roadRunnerIn { 0% { transform: translateX(-1500px) skewX(30deg) scaleX(1.3); } 70% { transform: translateX(50px) skewX(0deg) scaleX(0.9); } 100% { transform: translateX(0px) skewX(0deg) scaleX(1); } } /* 모달 콘텐츠 반동 효과로 숨기기 */ @keyframes roadRunnerOut { 0% { transform: translateX(0px) skewX(0deg) scaleX(1); } 30% { transform: translateX(-100px) skewX(-5deg) scaleX(0.9); } 100% { transform: translateX(1500px) skewX(30deg) scaleX(1.3); } } /* * ------------------------------ * James Bond Animation * ------------------------------ */ #modal-container.six { transform: scale(1); } #modal-container.six .modal-background { background: transparent; animation: fadeIn 0.5s cubic-bezier(0.165, 0.84, 0.44, 1) forwards; } #modal-container.six .modal-background .modal { /* 초기 모달 콘텐츠 크기 및 라운드 정의 */ width: 200px; height: 200px; border-radius: 100%; overflow: hidden; animation: JamesBond 1.5s cubic-bezier(0.165, 0.84, 0.44, 1) forwards; } #modal-container.six .modal-background .modal h2, #modal-container.six .modal-background .modal p { /* 콘텐츠 내용 숨김 */ opacity: 0; position: relative; /* 원형 모달이 본래 모양을 완성된 후 1.4 지연후에 보여줌 */ animation: modalContentFadeIn .5s 1.4s linear forwards; } #modal-container.six.out { animation: slowFade .5s 1.5s linear forwards; } #modal-container.six.out .modal-background { background-color: rgba(0, 0, 0, 0.7); animation: fadeToRed 2s cubic-bezier(0.165, 0.84, 0.44, 1) forwards; } #modal-container.six.out .modal-background .modal { border-radius: 3px; height: 162px; width: 227px; animation: killShot 1s cubic-bezier(0.165, 0.84, 0.44, 1) forwards; } #modal-container.six.out .modal-background .modal h2, #modal-container.six.out .modal-background .modal p { animation: modalContentFadeOut 0.5s 0.5 cubic-bezier(0.165, 0.84, 0.44, 1) forwards; } /* Show modal content : round shape */ @keyframes JamesBond { 0% { transform: translateX(1000px); } 80% { transform: translateX(0px); width: 150px; height: 150px; border-radius: 100%; } 90% { border-radius: 3px; width: 340px; height: 240px; } 100% { border-radius: 3px; width: 300px; height: 200px; } } /* 모달 콘텐츠 내의 요소 효과 처리 */ @keyframes modalContentFadeIn { 0% { opacity: 0; top: -20px; } 100% { opacity: 1; top: 0; } } /* 전체 모달 컨테이너 숨김처리 */ @keyframes slowFade { 0% { opacity: 1; } 99.9% { opacity: 0; transform: scale(1); } 100% { transform: scale(0); } } /* 박스 그림자를 이용한 효과 */ @keyframes fadeToRed { 0% { box-shadow: inset 0 0 0 rgba(201, 24, 24, 0.8); } 100% { /* y 축 박스 그림자를 위에서부터 아래로 내리는 효과 */ box-shadow: inset 0 2000px 0 rgba(201, 24, 24, 0.8); } } /* 모달 콘텐츠 비스듬히 하단으로 떨어뜨림 */ @keyframes killShot { 0% { transform: translateY(0) rotate(0deg); opacity: 1; } 100% { /* 하단으로 회전시켜 떨어뜨림 */ transform: translateY(400px) rotate(45deg); opacity: 0; } } /* 모달 콘텐츠가 떨어질 때 효과처리 */ @keyframes modalContentFadeOut { 0% { opacity: 1; top: 0; } 100% { opacity: 0; top: -20px; } }
</style>
<script>
var $button         = $('.button'),
$modalContainer = $('#modal-container'),
$body           = $('body'),
$content        = $('.content'),
btnId;
$button.on('click', function () {
btnId = $(this).attr('id');
$modalContainer
        .removeAttr('class')
        .addClass(btnId);
$content
        .removeAttr('class')
        .addClass('content');
$body.addClass('modal-active');
if (btnId == 'two' || btnId == 'three'|| btnId == 'four') {
    $content.addClass(btnId);
}
});
$modalContainer.on('click', function () {
$(this).addClass('out');
$body.removeClass('modal-active');
if ($(this).hasClass(btnId)) {
    
    $content.addClass('out');
    
}
});
</script>
 -->

<script type="text/javascript">
	$(document).ready(function () {
		/* 왼쪽액션바 하얗게 (선택) */
		$('#_3kQHk_left').css({"border-width": "2px", "border-style": "solid", "border-color": "rgb(238, 238, 238) rgb(238, 238, 238) white", "border-image": "initial", "box-sizing": "border-box", display: "inline-block", "font-family": "&quot;Noto Sans KR&quot", "-webkit-tap-highlight-color": "rgba(0, 0, 0, 0)", cursor: "pointer", "text-decoration": "none", margin: "0px 10px -2px", padding: "0px", outline: "none", "font-size": "inherit", "font-weight": "inherit", position: "relative", "z-index": "1", height: "36px", "line-height": "36px", "min-width": "88px", color: "rgba(0, 0, 0, 0.87)", transition: "all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms", "border-radius": "18px 18px 0px 0px", "user-select": "none", overflow: "hidden", "background-color": "white", "text-align": "center", width: "50%"});
		/* 선택글자:진하게 비선택:연하게 */
		$('._3kQHk_right_span').css({color: "#9E9E9E", "font-weight":"none"});
		$('._3kQHk_left_span').css({color: "#353535", "font-weight":"600"});
	});
	function tabBtn_left() {
		/* 왼쪽액션바 하얗게 (선택) */
		$('#_3kQHk_left').css({"border-width": "2px", "border-style": "solid", "border-color": "rgb(238, 238, 238) rgb(238, 238, 238) white", "border-image": "initial", "box-sizing": "border-box", display: "inline-block", "font-family": "&quot;Noto Sans KR&quot", "-webkit-tap-highlight-color": "rgba(0, 0, 0, 0)", cursor: "pointer", "text-decoration": "none", margin: "0px 10px -2px", padding: "0px", outline: "none", "font-size": "inherit", "font-weight": "inherit", position: "relative", "z-index": "1", height: "36px", "line-height": "36px", "min-width": "88px", color: "rgba(0, 0, 0, 0.87)", transition: "all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms", "border-radius": "18px 18px 0px 0px", "user-select": "none", overflow: "hidden", "background-color": "white", "text-align": "center", width: "50%"});
		/* 오른쪽액션바 어둡게 */
		$('#_3kQHk_right').css({"border-top": "2px solid rgb(238, 238, 238)","border-right": "2px solid rgb(238, 238, 238)","border-bottom": "none","border-left": "2px solid rgb(238, 238, 238)","border-image": "initial","box-sizing": "border-box",display: "inline-block","font-family": "Noto Sans KR","-webkit-tap-highlight-color": "rgba(0, 0, 0, 0)",cursor: "pointer","text-decoration": "none",margin: "0px 10px -2px",padding: "0px",outline: "none","font-size": "inherit","font-weight": "inherit",position: "relative","z-index": "1",height: "36px","line-height": "36px","min-width": "88px",color: "rgba(0, 0, 0, 0.87)",transition: "all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms","border-radius": "18px 18px 0px 0px","user-select": "none",overflow: "hidden","background-color": "rgb(238, 238, 238)","text-align": "center",width: "50%"});
		/* 선택글자:진하게 비선택:연하게 */
		$('._3kQHk_right_span').css({color: "#9E9E9E", "font-weight":"none"});
		$('._3kQHk_left_span').css({color: "#353535", "font-weight":"600"});
	}
	
	function tabBtn_right() {
		/* 오른쪽액션바 하얗게 (선택) */
		$('#_3kQHk_right').css({"border-width": "2px","border-style": "solid","border-color": "rgb(238, 238, 238) rgb(238, 238, 238) white","border-image": "initial","box-sizing": "border-box",display: "inline-block","font-family": "Noto Sans KR","-webkit-tap-highlight-color": "rgba(0, 0, 0, 0)",cursor: "pointer","text-decoration": "none",margin: "0px 10px -2px",padding: "0px",outline: "none","font-size": "inherit","font-weight": "inherit",position: "relative","z-index": "1",height: "36px","line-height": "36px","min-width": "88px",color: "rgba(0, 0, 0, 0.87)",transition: "all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms","border-radius": "18px 18px 0px 0px","user-select": "none",overflow: "hidden","background-color": "white","text-align": "center",width: "50%" });
		/* 왼쪽액션바 어둡게 */
		$('#_3kQHk_left').css({"border-top": "2px solid rgb(238, 238, 238)","border-right": "2px solid rgb(238, 238, 238)","border-bottom": "none","border-left": "2px solid rgb(238, 238, 238)","border-image": "initial","box-sizing": "border-box",display: "inline-block","font-family": "Noto Sans KR","-webkit-tap-highlight-color": "rgba(0, 0, 0, 0)",cursor: "pointer","text-decoration": "none",margin: "0px 10px -2px",padding: "0px",outline: "none","font-size": "inherit","font-weight": "inherit",position: "relative","z-index": "1",height: "36px","line-height": "36px","min-width": "88px",color: "rgba(0, 0, 0, 0.87)",transition: "all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms","border-radius": "18px 18px 0px 0px","user-select": "none",overflow: "hidden","background-color": "rgb(238, 238, 238)","text-align": "center",width: "50%"});
		/* 선택글자:진하게 비선택:연하게 */
		$('._3kQHk_left_span').css({color: "#9E9E9E", "font-weight":"none"});
		$('._3kQHk_right_span').css({color: "#353535", "font-weight":"600"});
	}
</script>

</head>

<body>
	<div id="app">
		<div class="_1IykZ">
			<div class="_1POqd">
			<div>
				<!-- 내 구직현황 -->
				<div style="color: rgba(0, 0, 0, 0.87); background-color: white; transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; box-sizing: border-box; font-family: &quot;Noto Sans KR&quot;, sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); box-shadow: none; border-radius: 0px; position: relative; z-index: 1100; width: 100%; display: flex; padding-left: 24px; padding-right: 24px; margin-bottom: 20px;">
					<div style="margin-top: 8px; margin-right: 8px; margin-left: -16px;">
						<button tabindex="0" type="button" style="border: 10px; box-sizing: border-box; display: inline-block; font-family: &quot;Noto Sans KR&quot;, sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); cursor: pointer; text-decoration: none; margin: 0px; padding: 12px; outline: none; font-size: 0px; font-weight: inherit; position: relative; z-index: 1; overflow: visible; transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; width: 48px; height: 48px; background: none;">
							<div>
								<svg viewBox="0 0 24 24" style="display: inline-block; color: rgba(0, 0, 0, 0.87); fill: black; height: 24px; width: 24px; user-select: none; transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms;">
									<path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path>
								</svg>
							</div>
						</button>
					</div>
					<div style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; margin: 0px; padding-top: 0px; letter-spacing: 0px; font-size: 24px; font-weight: 400; color: rgb(255, 255, 255); height: 64px; line-height: 64px; flex: 1 1 0%;">
						<div style="color: rgb(67, 67, 67); font-size: 25px; font-weight: 500; vertical-align: top; text-align: center; display: block; position: absolute; width: 200px; 
						left: calc(50% - 100px);"> 악어새님의 구직 현황 </div>
					</div>
				</div>
				<!-- 내가 지원한 / 내게 신청한 -->
				<div class="fMmkw">
					<div class="_191Jn">
						<button id="_3kQHk_left" class="_3kQHk" onclick="tabBtn_left()" type="button" style="border-width: 2px; border-style: solid; border-color: rgb(238, 238, 238) rgb(238, 238, 238) white; border-image: initial; box-sizing: border-box; display: inline-block; font-family: &quot;Noto Sans KR&quot;, sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); cursor: pointer; text-decoration: none; margin: 0px 10px -2px; padding: 0px; outline: none; font-size: inherit; font-weight: inherit; position: relative; z-index: 1; height: 36px; line-height: 36px; min-width: 88px; color: rgba(0, 0, 0, 0.87); transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; border-radius: 18px 18px 0px 0px; user-select: none; overflow: hidden; background-color: white; text-align: center; width: 50%;">
							<div>
								<span style="height: 100%; width: 100%; position: absolute; top: 0px; left: 0px; overflow: hidden; pointer-events: none;"></span>
								<span style="position: relative; padding-left: 16px; padding-right: 16px; vertical-align: top; letter-spacing: 0px; text-transform: uppercase; font-weight: 400; font-size: 17px;">
									<span class="_3kQHk_left_span">매칭 완료내역</span>
								</span>
							</div>
						</button>
						<button id="_3kQHk_right" class="_3kQHk" onclick="tabBtn_right()" tabindex="0" type="button" style="border-top: 2px solid rgb(238, 238, 238); border-right: 2px solid rgb(238, 238, 238); border-bottom: none; border-left: 2px solid rgb(238, 238, 238); border-image: initial; box-sizing: border-box; display: inline-block; font-family: &quot;Noto Sans KR&quot;, sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); cursor: pointer; text-decoration: none; margin: 0px 10px -2px; padding: 0px; outline: none; font-size: inherit; font-weight: inherit; position: relative; z-index: 1; height: 36px; line-height: 36px; min-width: 88px; color: rgba(0, 0, 0, 0.87); transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; border-radius: 18px 18px 0px 0px; user-select: none; overflow: hidden; background-color: rgb(238, 238, 238); text-align: center; width: 50%;">
							<div>
								<span style="height: 100%; width: 100%; position: absolute; top: 0px; left: 0px; overflow: hidden; pointer-events: none;"></span>
								<span style="position: relative; padding-left: 16px; padding-right: 16px; vertical-align: top; letter-spacing: 0px; text-transform: uppercase; font-weight: 400; font-size: 17px; color: rgb(158, 158, 158);">
									<span class="_3kQHk_right_span">신청한 내역</span>
								</span>
							</div>
						</button>
					</div>
					<hr	style="border-top-color: rgb(238, 238, 238); border-right-color: rgb(238, 238, 238); border-bottom: 2px none; border-left-color: rgb(238, 238, 238); border-top-width: 2px; border-right-width: 2px; border-left-width: 2px; margin: -2px 0px 0px; position: absolute; width: 100%; z-index: -1;">
				</div>
				
				<div style="display: block;">
				<div>
				<div>
				<div style="padding: 8px 0px;">
				<div>
					<span tabindex="0" style="border: 10px; box-sizing: border-box; display: block; font-family: &quot;Noto Sans KR&quot;, sans-serif; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); cursor: pointer; text-decoration: none; margin: 0px; padding: 0px; outline: none; font-size: 16px; font-weight: inherit; position: relative; z-index: 1; color: rgba(0, 0, 0, 0.87); line-height: 16px; transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; background: none;"><div>
						<div style="margin-left: 0px; padding: 20px 16px 20px 72px; position: relative;">
								<div class="_2Vm5T">
									<span> 정○헌 </span>
									<span> 부모 </span>
									<img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/my/icon-view-detail.svg" width="15" height="15">
								</div>
								<div>
									<div class="_3jxEl"> 희망시급: 10,000원 </div>
									<div class="_3jxEl"> 지원시간: 2020.07.01 11:22 </div>
									<div class="_3jxEl"> 읽은시간: 2020.07.01 11:22 </div>
									<div class="_2gCWR">
										<div>
											<p class="_3YpQ-">부모님의 답변을 기다리는 중입니다.</p>
										</div>
									</div>
								</div>
								<img size="40" src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/joinNew/n-baby.png" style="color: rgb(255, 255, 255); background-color: rgb(188, 188, 188); user-select: none; display: inline-flex; align-items: center; justify-content: center; font-size: 20px; border-radius: 50%; height: 40px; width: 40px; position: absolute; top: 8px; left: 16px; margin-top: 15px; -webkit-box-align: center; -webkit-box-pack: center;">
							</div>
						</div>
					</span>
				</div>
				</div>
				</div>
				</div>
				</div>
				<div style="display: none;">
					<div>
						<div>
							<div style="padding: 8px 0px;"></div>
						</div>
					</div>
					<div class="gSUeQ">아직 신청받은 내역이 없습니다.</div>
				</div>
			</div>
			</div>
		</div>
	</div>
	
	<!-- 모달 -->
	<div class="content">
    <h1>Modal Animations</h1>
    <div class="buttons">
        <a href="#none" id="one" class="button">Unfolding</a>
        <a href="#none" id="two" class="button">Revealing</a>
        <a href="#none" id="three" class="button">Uncovering</a>
        <a href="#none" id="four" class="button">Blow Up</a>
        <br>
        <a href="#none" id="five" class="button">Meep Meep</a>
        <a href="#none" id="six" class="button">Bond</a>
    </div>
	</div>

	<div id="modal-container">
	    <div class="modal-background">
	        <div class="modal">
	            <h2>I'm a Modal</h2>
	            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perferendis, similique!</p>
	        </div>
	    </div>
	</div>
	<!-- 모달 -->
	
</body>
</html>