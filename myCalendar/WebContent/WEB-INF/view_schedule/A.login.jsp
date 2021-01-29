<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<style>

	body {
		background-image: url('${pageContext.request.contextPath}/bg-01.jpg');
		background-color:#17a2b8;
		background-repeat: no-repeat;
	    margin: 0;
	    padding: 0;
	    font-family: Noto Sans KR, Fraunces, Arial, Helvetica Neue, Helvetica, sans-serif;
	}
	
	h2{
		font-family: Poppins-Regular;
		margin: 0px;
	}
	
	div{
		padding-top: 30px;
		display: block;
		margin: 0 auto;
		width: 800px;
		text-align: center; 
	}
	
	#container{
		position:absolute;
		width:400px;
		height:400px;
		background-color:white;
		/* text-align :center; */
		margin-left: 0 auto;
		margin-top: -150px;
		left: 50%;
		top:50%;
		border-radius:10px;
	}
	
	input{
		border-radius:4px;
		border:1px grey solid;
	}
	
	input[type=text]{
		width:80%;
		padding: 12px 20px;
		margin:8px 0;
		display:inline-block;
		border: 1px soolid #ccc;
		box-sizing:border-box;
	}
	
	input[type=password]{
		width:80%;
		padding: 12px 20px;
		margin:8px 0;
		display:inline-block;
		border: 1px soolid #ccc;
		box-sizing:border-box;
	}
	
	input[type=submit]{
		width:80%;
		height:55px;
		font-family: Noto Sans KR, Fraunces, Arial, Helvetica Neue, Helvetica, sans-serif;	
		color: white;
		background-color:rgba(15, 34, 45, 0.9); /* #fff59d;/* #0F222D; */
		border:none;
		border-radius: 4px;
		cursor: pointer;
	}
	

	.kakaoImg{
		position:relative;
		/* display:block;  */
		margin-left: -400px; 
		margin-right:auto;
		/* margin:0px auto; */
	}
	
	a:focus {
	outline: none !important;
	}

	a:hover {
		text-decoration: none;
		color: #fc00ff;
	    border-color: #fc00ff;
	}
	
	
	span{
		font-family: Poppins-Regular;
		font-size: 12px;
		line-height: 1;
		color: #666666;
		margin: 0px;
		text-align: left;
	    margin-left: 50px;
	}
	a{
	 	text-decoration:none;
	}
	
	#spancl1{
		text-align:left;
		position:left;
		margin-right:150px;
		margin-left:0px;
	}
	
	 #spancl2{
		text-align:left;
		position:left;
		margin-right:120px;
		margin-left:0px;
	}
</style>
</head>
<body>
<div id= container>
<h2>로그인</h2>
	<!-- 컨텍스트패스 추가함.-->
	<form action="${pageContext.request.contextPath}/user/loginUser" method="post">
	<font color="red">${message}</font><br>
		<span id="spancl1">아이디</span> &nbsp;&nbsp; <span><a href="${pageContext.request.contextPath}/user/findId"> 아이디 찾기</a></span>
			<input type="text" name="id"><br>
			<span id="spancl2">비밀번호</span><span><a href="${pageContext.request.contextPath}/user/changePw">비밀번호 변경하기</a></span>
			
			<input type="password" name="password"><br>
			<input type="submit" value="로그인">
		
	</form>

<!-- <div id="kakaoLogin">
	<a id="kakao-login-btn">
	<img src="https://www.gb.go.kr/Main/Images/ko/member/certi_kakao_login.png" style="height:60px;width:auto"/>
	</a>
	<a href="http://developers.kakao.com/logout"></a>
</div>	 -->
	<div id="kakaoLogin">
		<a id="kakao-login-btn">
		<img class="kakaoImg" src="https://www.gb.go.kr/Main/Images/ko/member/certi_kakao_login.png" style="height:60px;width:40%"/>
		</a>
		<a href="http://developers.kakao.com/logout"></a>
	
	</div>	
<%-- 
	<a href="${pageContext.request.contextPath}/user/findId"> /아이디 찾기</a><br>
	<a href="${pageContext.request.contextPath}/user/changePw">/비밀번호 변경하기</a><br>
 --%>
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