<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyCalendar</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
	<h3>회원 가입 시 사용한 아이디를 입력해 주세요.</h3>
	<form action="${pageContext.request.contextPath}/user/changeResult" method="post">
		<input id="email" type="text" name="id" placeholder="아이디 입력"><br>
		<br>
		<input type="submit" class="button" value="입력">
	</form>
</body>
</html>