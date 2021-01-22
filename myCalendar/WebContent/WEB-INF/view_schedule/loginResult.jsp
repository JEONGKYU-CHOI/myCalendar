<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<p id="rs">안녕하세요, ${loginUser.name } 님! 로그인을 환영합니다.</p>
	<form action="${pageContext.request.contextPath}/schedule/afterLogin?num=${loginUser.number }" method="post">
		<input type="submit" value="이용하러 가기">
	</form>
</body>
</html>