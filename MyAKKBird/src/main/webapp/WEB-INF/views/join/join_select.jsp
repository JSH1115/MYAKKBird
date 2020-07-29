<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마이악어새 회원가입</title>
	<!-- join_select.css style 파일 -->
	<link rel="stylesheet" type="text/css" href="./resources/css/join/join_select.css">
	<!-- join_select.css style 파일 -->
</head>
<body>
<!-- header zone -->
<jsp:include page="../header_container.jsp">
	<jsp:param value="m_id" name="m_id"/>
</jsp:include> 
<!-- header zone -->
<div class="join_select_zone">
	<div class="customer_zone" onclick="location.href='joinformcscate.ak'">
		<svg class="c_img" height="133px" viewBox="-44 1 511 511.99995" width="133px" xmlns="http://www.w3.org/2000/svg"><path d="m177.050781 317.792969h70.621094v61.792969h-70.621094zm0 0" fill="#fdc9a6"/><path d="m177.050781 344.277344 8.828125 8.824218h52.964844l8.828125-8.824218v-17.65625h-70.621094zm0 0" fill="#f6bb92"/><path d="m371.257812 158.898438c0 87.753906-71.140624 158.894531-158.894531 158.894531-87.757812 0-158.898437-71.140625-158.898437-158.894531 0-87.757813 71.140625-158.898438 158.898437-158.898438 87.753907 0 158.894531 71.140625 158.894531 158.898438zm0 0" fill="#533222"/><path d="m309.464844 238.34375h-26.480469v-44.136719h26.480469c9.75 0 17.65625 7.902344 17.65625 17.65625v8.828125c0 9.75-7.90625 17.652344-17.65625 17.652344zm0 0" fill="#f6bb92"/><path d="m115.257812 238.34375h35.3125v-44.136719h-35.3125c-9.75 0-17.65625 7.902344-17.65625 17.65625v8.828125c0 9.75 7.90625 17.652344 17.65625 17.652344zm0 0" fill="#f6bb92"/><path d="m291.808594 194.207031v70.621094l-26.480469 44.136719-26.484375 26.484375h-52.964844l-26.480468-26.484375-26.484376-44.136719v-70.621094l26.484376-35.308593h105.929687z" fill="#fdc9a6"/><path d="m178.527344 211.863281c-4.875 0-8.828125-3.953125-8.828125-8.828125v-8.828125c0-4.875 3.953125-8.828125 8.828125-8.828125s8.828125 3.953125 8.828125 8.828125v8.828125c-.003907 4.875-3.953125 8.828125-8.828125 8.828125zm0 0" fill="#744630"/><path d="m249.144531 211.863281c-4.875 0-8.824219-3.953125-8.824219-8.828125v-8.828125c0-4.875 3.949219-8.828125 8.824219-8.828125 4.878907 0 8.828125 3.953125 8.828125 8.828125v8.828125c0 4.875-3.949218 8.828125-8.828125 8.828125zm0 0" fill="#744630"/><path d="m212.363281 256c-1.367187 0-2.714843-.316406-3.9375-.925781l-17.65625-8.828125c-4.363281-2.179688-6.132812-7.480469-3.953125-11.84375.164063-.328125.347656-.648438.554688-.957032l17.65625-26.484374c2.703125-4.054688 8.1875-5.148438 12.242187-2.445313 4.058594 2.707031 5.152344 8.1875 2.445313 12.246094l-12.121094 18.15625 8.714844 4.351562c4.363281 2.175781 6.136718 7.476563 3.960937 11.839844-1.492187 3-4.558593 4.894531-7.90625 4.890625zm0 0" fill="#744630"/><path d="m256.5 370.757812h119.726562c26.507813 0 47.996094 21.488282 47.996094 47.996094v93.246094h-423.722656v-93.246094c0-26.507812 21.488281-47.996094 47.996094-47.996094zm0 0" fill="#99d8aa"/><path d="m344.777344 432.550781c-4.875 0-8.828125 3.953125-8.828125 8.828125v70.621094h17.652343v-70.621094c0-4.875-3.949218-8.828125-8.824218-8.828125zm0 0" fill="#85bc94"/><path d="m79.949219 432.550781c-4.875 0-8.828125 3.953125-8.828125 8.828125v70.621094h17.65625v-70.621094c0-4.875-3.953125-8.828125-8.828125-8.828125zm0 0" fill="#85bc94"/><path d="m212.363281 287.117188c-6.851562.011718-13.609375-1.574219-19.738281-4.632813l-1.863281-.882813c-4.363281-2.179687-6.132813-7.484374-3.957031-11.847656 2.179687-4.363281 7.484374-6.136718 11.847656-3.957031l1.863281.9375c7.460937 3.707031 16.230469 3.707031 23.691406 0l1.863281-.9375c4.363282-2.179687 9.667969-.40625 11.847657 3.957031 2.179687 4.363282.410156 9.667969-3.953125 11.847656l-1.863282.882813c-6.132812 3.054687-12.890624 4.640625-19.738281 4.632813zm0 0" fill="#744630"/><path d="m.695312 414.898438h423.335938c-.488281-6.152344-2.167969-12.148438-4.945312-17.65625h-413.449219c-2.773438 5.507812-4.453125 11.503906-4.941407 17.65625zm0 0" fill="#62666a"/><path d="m.5 432.550781h423.722656v17.65625h-423.722656zm0 0" fill="#62666a"/><path d="m.5 467.863281h423.722656v17.652344h-423.722656zm0 0" fill="#62666a"/><g fill="#744630"><path d="m150.570312 247.171875h-17.65625c-4.875 0-8.828124-3.953125-8.828124-8.828125s3.953124-8.828125 8.828124-8.828125h17.65625c4.875 0 8.828126 3.953125 8.828126 8.828125s-3.953126 8.828125-8.828126 8.828125zm0 0"/><path d="m150.570312 273.65625h-17.65625c-4.875 0-8.828124-3.953125-8.828124-8.828125s3.953124-8.828125 8.828124-8.828125h17.65625c4.875 0 8.828126 3.953125 8.828126 8.828125s-3.953126 8.828125-8.828126 8.828125zm0 0"/><path d="m291.808594 247.171875h-17.652344c-4.875 0-8.828125-3.953125-8.828125-8.828125s3.953125-8.828125 8.828125-8.828125h17.652344c4.878906 0 8.828125 3.953125 8.828125 8.828125s-3.949219 8.828125-8.828125 8.828125zm0 0"/><path d="m291.808594 273.65625h-17.652344c-4.875 0-8.828125-3.953125-8.828125-8.828125s3.953125-8.828125 8.828125-8.828125h17.652344c4.878906 0 8.828125 3.953125 8.828125 8.828125s-3.949219 8.828125-8.828125 8.828125zm0 0"/><path d="m238.84375 335.449219-26.480469-26.484375-26.484375 26.484375zm0 0"/></g></svg>
		<div class="c_z_right">
			<h3>"청소를 해줄 근로자가 필요해요."</h3>
			<span id="txt_go1">고객회원 가입 &gt;</span>
		</div>
	</div>
	<div class="worker_zone" onclick="location.href='joinformwkcate.ak'">
		<svg class="w_img" height="133px" viewBox="-44 1 511 511.99996" width="133px" xmlns="http://www.w3.org/2000/svg"><path d="m257.972656 335.449219h86.804688c43.875 0 79.445312 35.570312 79.445312 79.449219v97.101562h-423.722656v-97.101562c0-43.878907 35.570312-79.449219 79.449219-79.449219zm0 0" fill="#1a6c85"/><path d="m170.058594 344.277344h-1.835938v-70.621094h88.277344v70.621094l-44.136719 17.652344z" fill="#fdc9a6"/><path d="m168.222656 298.285156c27.703125 14.242188 60.574219 14.242188 88.277344 0v-24.628906h-88.277344zm0 0" fill="#f6bb92"/><path d="m.5 476.691406h88.277344v35.308594h-88.277344zm0 0" fill="#fdc9a6"/><path d="m344.777344 476.691406h79.445312v35.308594h-79.445312zm0 0" fill="#fdc9a6"/><path d="m168.222656 335.449219 44.140625 26.480469-44.140625 26.484374zm0 0" fill="#6cbae5"/><path d="m256.5 379.585938v-44.136719l-44.136719 26.480469 44.136719 26.484374z" fill="#6cbae5"/><path d="m88.777344 335.449219h35.308594v97.101562h-35.308594zm0 0" fill="#cdcdcd"/><path d="m309.464844 335.449219h35.3125v97.101562h-35.3125zm0 0" fill="#cdcdcd"/><path d="m327.121094 211.863281h-26.484375v-44.140625h26.484375c9.75 0 17.65625 7.90625 17.65625 17.65625v8.828125c0 9.75-7.90625 17.65625-17.65625 17.65625zm0 0" fill="#f6bb92"/><path d="m97.601562 211.863281h26.484376v-44.140625h-26.484376c-9.75 0-17.652343 7.90625-17.652343 17.65625v8.828125c0 9.75 7.902343 17.65625 17.652343 17.65625zm0 0" fill="#f6bb92"/><path d="m168.222656 35.308594c0 19.503906-15.808594 35.3125-35.308594 35.3125s-35.3125-15.808594-35.3125-35.3125c0-19.5 15.8125-35.308594 35.3125-35.308594s35.308594 15.808594 35.308594 35.308594zm0 0" fill="#834b10"/><path d="m115.257812 105.929688v88.277343c0 53.628907 43.476563 97.105469 97.105469 97.105469 53.628907 0 97.101563-43.476562 97.101563-97.105469v-88.277343l-17.65625-8.828126h-167.722656zm0 0" fill="#fdc9a6"/><g fill="#985713"><path d="m168.222656 195c-4.875 0-8.828125-3.949219-8.828125-8.828125v-9.621094c0-4.875 3.953125-8.828125 8.828125-8.828125s8.828125 3.953125 8.828125 8.828125v9.621094c0 4.878906-3.953125 8.828125-8.828125 8.828125zm0 0"/><path d="m256.5 195c-4.875 0-8.828125-3.949219-8.828125-8.828125v-9.621094c0-4.875 3.953125-8.828125 8.828125-8.828125s8.828125 3.953125 8.828125 8.828125v9.621094c0 4.878906-3.953125 8.828125-8.828125 8.828125zm0 0"/><path d="m221.191406 220.691406c-2.199218 0-4.316406-.820312-5.941406-2.296875l-8.828125-8.03125c-1.839844-1.675781-2.886719-4.046875-2.886719-6.535156v-18.449219c0-4.875 3.953125-8.828125 8.828125-8.828125s8.828125 3.953125 8.828125 8.828125v14.546875l5.941406 5.402344c3.605469 3.28125 3.871094 8.863281.59375 12.472656-1.675781 1.839844-4.046874 2.890625-6.535156 2.890625zm0 0"/><path d="m309.464844 123.585938-16.628906 7.132812c-28.648438 12.265625-61.242188 11.296875-89.109376-2.648438l-44.332031-22.140624-44.136719 44.140624v-44.140624c0-48.75 39.523438-88.273438 88.277344-88.273438h8.828125c53.628907 0 97.101563 43.472656 97.101563 97.101562zm0 0"/><path d="m212.363281 254.710938c-9.085937.035156-17.78125-3.679688-24.039062-10.265626-3.367188-3.527343-3.242188-9.113281.28125-12.484374 3.527343-3.367188 9.113281-3.242188 12.484375.285156 6.230468 6.214844 16.316406 6.214844 22.546875 0 3.367187-3.527344 8.957031-3.652344 12.480469-.285156 3.523437 3.371093 3.652343 8.957031.28125 12.484374-6.257813 6.585938-14.953126 10.300782-24.035157 10.265626zm0 0"/></g><path d="m88.777344 512-1.863282-3.726562c-9.941406-19.878907-9.941406-43.28125 0-63.160157l1.863282-3.734375v-17.65625h256.464844l-.464844 17.65625 1.761718 3.734375c9.417969 20 9.417969 43.160157 0 63.160157l-1.761718 3.726562" fill="#d9d9d9"/><path d="m168.222656 459.035156h88.277344v52.964844h-88.277344zm0 0" fill="#cdcdcd"/></svg>
		<div class="w_z_right">
			<h3>"성실한 근로자로 활동하고 싶어요."</h3>
			<span id="txt_go2">근로자회원 가입 &gt;</span>
		</div>
	</div>
	<div class="login_zone">
		<span id="txt1">이미 마이악어새 회원이신가요?</span><br>
		<a href="./loginform.ak" id="login_txt">로그인</a>
	</div>
</div>
</body>
</html>