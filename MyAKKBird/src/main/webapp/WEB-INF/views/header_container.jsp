<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<script>
	
</script>
<section id="header_container">
	<img src="resources/image/fullLogo.png" id="main_logo" onclick="location.href='home.ak'">
	
	<c:if test="${login.m_id == null}">
		<div>

			<img src="resources/image/btn_login.png" class="btn_header" onclick="location.href='loginform.ak'">
			<img src="resources/image/btn_join.png" class="btn_header" onclick="location.href='joinselect.ak'">
		</div>
	</c:if>
	<c:if test="${login.m_id != null}">
		<div>
			${login.m_id}
			<img src="resources/image/btn_mypage.png" class="btn_header" onclick="location.href='profile.ak?id=${login.m_id }'">
			<img src="resources/image/btn_logout.png" class="btn_header" onclick="location.href='logOut.ak'">
			
		</div>
	</c:if>
</section>