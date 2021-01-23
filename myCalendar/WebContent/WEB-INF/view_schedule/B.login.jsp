<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<form name='homeForm' method="post" action="/board/login">
		<c:if test="${member == null}">
			<div>
				<label for="userId"></label>
				<input type="text" id="userId" name="id">
			</div>
			<div>
				<label for="userPass"></label>
				<input type="password" id="userPass" name="password">
			</div>
			<div>
				<button type="submit">로그인</button>
				<button type="button">회원가입</button>
			</div>
		</c:if>
		<c:if test="${member != null }">
			<div>
				<p>${member.id}님 환영 합니다.</p>
				<p>${member.name}</p>
				<p>${member.phone}</p>
				<p>${member.email}</p>
				<button id="logoutBtn" type="button" name="/member/lognout">로그아웃</button>
			</div>
		</c:if>
		<c:if test="${msg == false}">
			<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
		</c:if>
	</form>
</body>
</html>