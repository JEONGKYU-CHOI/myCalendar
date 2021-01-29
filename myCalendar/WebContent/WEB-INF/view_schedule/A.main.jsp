<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>main</title>
<style>
	
	
	body{
		background-size:cover;
		background-image: url('${pageContext.request.contextPath}/bg_02.jpeg');
		background-color:#17a2b8;
		background-repeat: no-repeat;
	    margin: 0;
	    padding: 0;
	    font-family: Noto Sans KR, Fraunces, Arial, Helvetica Neue, Helvetica, sans-serif;
	}
	h2{
		font-family: Poppins-Regular;
		
	}
	
	input[type=submit]{
		width:100px;
		height:30px;
		font-family: Noto Sans KR, Fraunces, Arial, Helvetica Neue, Helvetica, sans-serif;	
		color: white;
		background-color:rgba(15, 34, 45, 0.9); /* #fff59d;/* #0F222D; */
		border:none;
		border-radius: 5px;
		cursor: pointer;
	}
	
	#container{
		margin:auto;
		text-align:center;
	}
		
</style>
</head>

<body>
<div id=container>
<h2>${sessionScope.loginId}님, 방문을 환영합니다!</h2>
	<form action="${pageContext.request.contextPath}/schedule/afterLogin?num=${sessionScope.loginNumber}" method="post">
		<input type="submit" value="이용하러 가기">
	</form>
</div>
	

	
</body>
</html>