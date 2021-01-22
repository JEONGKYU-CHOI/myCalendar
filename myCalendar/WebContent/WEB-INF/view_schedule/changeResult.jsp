<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyCalendar</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<form action="${pageContext.request.contextPath}/user/changePwResult" method="post">
	<input type="hidden" name="id" value="${selectUser.id }"><br>
	<input type="hidden" name="password" value="${password }">
	아래 버튼을 누르시면 <span style='font-weight: bold'>${password }</span> 으로 비밀번호가 변경됩니다. <br>
	로그인 후 비밀번호를 다시 변경해 주세요.
	<br>
	<br>
	<input type="submit" class="button" value="비밀번호 변경하고 로그인 화면으로 돌아가기">
</form>
</body>
</html>