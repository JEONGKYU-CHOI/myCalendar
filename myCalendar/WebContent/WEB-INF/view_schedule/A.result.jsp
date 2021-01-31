<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>registration result</title>
<style type="text/css">
body {
		min-height:100%;
		background: center fixed;
		background-size:cover;
		background-image: url('${pageContext.request.contextPath}/bg_02.jpeg');
		background-color:#17a2b8;
		background-repeat: no-repeat;
	    margin: 0;
	    padding: 0;
	    font-family: Noto Sans KR, Fraunces, Arial, Helvetica Neue, Helvetica, sans-serif;
	}
	
#container{
		position:absolute;
		width:400px;
		height:400px;
		background-color:white;
		text-align :center;
		/* margin-left: 0 auto; */
		margin-left:-200px;
		margin-top: -200px;
		left: 50%;
		top:50%;
		border-radius:10px;
		padding-top:50px;
	}

button[type=button]  {
		font-family: Noto Sans KR, Fraunces, Arial, Helvetica Neue, Helvetica, sans-serif;
		width: 150px;
		height: 40px;
		background-color: #0F222D;
		color: white;
		font-size: 15px;
		border-radius: 5px;
		box-shadow: 0 4px 16px rgba(15, 34, 45, 0.3);
		margin-bottom: 10px;
	}


	
fieldset,legend{
		width:80%;
		padding: 7px 10px;
		margin:5px 0;
		display:inline-block;
		border: 1px soolid #ccc;
		box-sizing:border-box;
		border-radius:4px;
		text-align:center;
		
}	


a{
	text-decoration:none;
	color:white;
}	
a:focus {
	outline: none !important;
	}

/* 	a:hover {
		text-decoration: none;
		color: white;
	    border-color: #fc00ff;
	}
 */

h2{
	color: #0F222D;
	test-align:center;
	
}
	
</style>

</head>
<body>

<div id="container">
	<h2>회원가입을 환영합니다!</h2>
		<fieldset>
			<legend>회원 가입 상세 내용</legend>
			회원번호:${user.number} <br>
			이름: ${user.name} <br>
			회원 아이디 :${user.id} <br>
			전화번호 :${user.phone} <br>
			이메일:${user.email} <br>
	
	</fieldset>

	<button type="button"><a href="${pageContext.request.contextPath}/user/login">로그인하기</a></button>

</div>
</body>
</html>