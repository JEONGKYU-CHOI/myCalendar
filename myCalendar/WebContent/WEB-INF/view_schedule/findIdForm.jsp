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
	<h3>회원 가입 시 사용한 이메일 주소를 입력해 주세요.</h3>
	<form action="${pageContext.request.contextPath}/user/findResult" method="post">
		<input id="email" type="text" name="email" placeholder="이메일 주소 입력"><br>
		<br>
		<input type="submit" class="button" value="입력">
	</form>
</body>
</html>