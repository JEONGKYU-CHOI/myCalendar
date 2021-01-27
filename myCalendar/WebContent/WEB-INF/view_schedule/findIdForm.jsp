<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyCalendar</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Fraunces&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script type="text/javascript">
</script>
<style>
	body {
	    margin: 0;
	    padding: 0;
	    font-family: Noto Sans KR, Fraunces, Arial, Helvetica Neue, Helvetica, sans-serif;
	}
	
	input {
		width: 250px;
		font-family: Noto Sans KR, Fraunces, Arial, Helvetica Neue, Helvetica, sans-serif;	
		padding: 5px;
	}
	
	div {
		padding-top: 30px;
		display: block;
		margin: 0 auto;
		width: 800px;
		text-align: center;
	}
	
	.button {
		width: 150px;
		height: 40px;
		background-color: #0F222D;
		color: white;
		font-size: 16px;
		border-radius: 5px;
		box-shadow: 0 4px 16px rgba(15, 34, 45, 0.3);
	}
	
	.button:focus{
		outline: 0;
	}
	
	.button:hover{
		background-color: rgba(15, 34, 45, 0.9);
		cursor: pointer;
		box-shadow: 0 2px 4px rgba(15, 34, 45, 0.3);
	}
</style>
</head>
<body>
	<div>
	<h3>회원 가입 시 사용한 이메일 주소를 입력해 주세요.</h3>
	<form action="${pageContext.request.contextPath}/user/findResult" method="post">
		<input id="email" type="text" name="email" placeholder="이메일 주소 입력하기"><br>
		<br>
		<input type="submit" class="button" value="입력">
	</form>
	</div>
</body>
</html>