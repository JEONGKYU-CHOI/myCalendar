<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyCalendar</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

	$(function(){
		
		$('form').on("submit", function(){
			var userId=$('#userId').val();
			var password=$('#pw').val();
			var flag=true;

			$.ajax({
				url:"${pageContext.request.contextPath}/user/loginProcess",
				type:"post",
				data:{id:userId, password:password},
				success:function(data){
					
					for(var i=0; i<data.length; i++){
						var id=data[i].id;
						var pw=data[i].password;
						
						if(userId==id && password==pw){
							location.href="${pageContext.request.contextPath}/user/loginProcess?user="+userId;
							flag=false;
						}
					}
					if(flag){
						var rs=$('#rs')[0];
						rs.innerHTML="<h3 style='color: red'>가입되지 않은 아이디이거나 잘못된 비밀번호입니다.</h3>";
					}
				},
				error:function(e){
					console.log(e);
				}
			})
			return false;
		});
		
		$('#kakaoLogin').on('click', function(){
			location.href="${pageContext.request.contextPath}/user/kakaoLogin";
		});
		
	});

</script>
</head>
<body>
	<h1>로그인</h1>
	<form action="${pageContext.request.contextPath}/user/loginProcess/" method="post">
		아이디: <input type="text" name="id" id="userId"><br>
		비밀번호: <input type="password" name="password" id="pw"><br>
		<br>
		<input type="submit" class="button" value="로그인">
		<p id="alert"></p>
		<p id="rs"></p>
	</form>
	<a href="${pageContext.request.contextPath}/user/findId">아이디 찾기</a><br>
	<a href="${pageContext.request.contextPath}/user/changePw">비밀번호 변경하기</a><br>
</body>
</html>