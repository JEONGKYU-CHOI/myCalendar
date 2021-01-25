<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>registration result</title>
</head>
<body>
회원가입을 환영합니다!
<fieldset>
	<legend>회원 가입 상세 내용</legend>
	회원번호:${user.number} <br>
	이름: ${user.name} <br>
	회원 아이디 :${user.id} <br>
	전화번호 :${user.phone} <br>
	이메일:${user.email} <br>
	
</fieldset>

<hr>
<!-- 우선 마이페이지 기능을 넣자 -->
<!-- 	<p><a href="/user/update">회원수정</a></p>
	<p><a href="/user/viewUser">회원상세보기</a></p>
	<p><a href="/user/delete">회원탈퇴</a></p> -->
	<p><a href="${pageContext.request.contextPath}/user/login">로그인하기</a></p>


</body>
</html>