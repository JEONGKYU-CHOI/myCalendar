<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
<h1>로그인</h1>
	<!-- 컨텍스트패스 추가함.-->
	<form action="${pageContext.request.contextPath}/user/loginUser" method="post">
	<font color="red">${message}</font><br>
		ID:<input type="text" name="id"><br>
		비밀번호:<input type="password" name="password"><br>
		<input type="submit" value="login">
	</form>

<div id="kakaoLogin">
	<a id="kakao-login-btn">
	<img src="https://www.gb.go.kr/Main/Images/ko/member/certi_kakao_login.png" style="height:60px;width:auto"/>
	</a>
	<a href="http://developers.kakao.com/logout"></a>

</div>	
	
<script src = "//developers.kakao.com/sdk/js/kakao.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type='text/javascript'>

//카카오 로그인
Kakao.init('66cabc54e7cb718c8acbb4ec545dc66d'); //카카오개발자홈페이지에서 발급받은 자바스크립트 키를 입력함
 
$("#kakao-login-btn").on("click", function(){
	//1.login시도
	Kakao.Auth.login({
		scope:'profile, account_email, gender',
		success: function(authObj){
			//2.login성공시 api를 호출
		Kakao.API.request({
			url:'/v2/user/me',
			success:function(res){
			//alert(JSON.stringify(res));
			//alert(JSON.stringify(authObj));
			
			console.log("kakao_account", res.kakao_account.email);

			const kaccount_email = res.kakao_account.email;
				$.ajax({
					url:"${pageContext.request.contextPath}/user/emailCheck?email="+kaccount_email,
					type: 'post',
					success: function(data){
						console.log("1=중복o /0 = 중복x : " +data);
						if(data == 1){
							//이미 회원가입이 되어있는 경우이므로 로그인환영페이지로 이동해야함.
			
							console.log("로그인중...")	;
							$("form").attr("method","POST").attr("action", "${pageContext.request.contextPath}/user/kakaoLogin?email="+kaccount_email).attr("target", "_parent").submit();

						}else if(data == 0){
							//가입이 안되어있으므로 카카오이메일값과 함께 kakaoUserReg.jsp로 이동
							console.log("회원가입페이지로 이동중...")	;
							 window.location.replace("http://" + window.location.hostname 
									 + ( (location.port==""||location.port==undefined)?"":":" 
											 + location.port) + "${pageContext.request.contextPath}/user/kakaoAdd?email="+kaccount_email);
						}
					}, error : function(){
						console.log("실패");
					}
				});
			
			}
		});
		}
	})
});
</script>
 
	
</body>
</html>