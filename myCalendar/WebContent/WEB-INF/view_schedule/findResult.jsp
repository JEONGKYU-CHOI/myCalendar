<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyCalendar</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
function remove(){
	history.replaceState({}, null, location.pathname);
}

$(document).ready(function(){
	$('#backToLoginButton').on('click', function(){
		location.href="${pageContext.request.contextPath}/user/login";
	});
});
</script>
</head>
<body onload="remove()">
회원가입 시 사용한 아이디는 <span style="font-weight: bold">${findUser.id }</span> 입니다. <br>
<br>
<button type="button" class="button" id="backToLoginButton">로그인 화면으로 돌아가기</button>
</body>
</html>