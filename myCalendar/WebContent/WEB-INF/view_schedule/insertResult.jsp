<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
    request.setCharacterEncoding("utf-8");
    String userId=request.getParameter("userId");
%>
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
	$(document).ready(function(){
		var result=${result};
		console.log(result);
		
		if(result==1){
			var rs=$('#rs')[0];
			console.dir(result);
			rs.innerHTML="<h3>추가에 성공하였습니다.</h3>";
		}else{
			alert('추가에 실패하였습니다.');
			window.history.go(-1);
		}
		
	});
</script>
<style>
	body {
	    margin: 0;
	    padding: 0;
	    font-family: Noto Sans KR, Fraunces, Arial, Helvetica Neue, Helvetica, sans-serif;
	}
	
	div {
		padding-top: 30px;
		display: block;
		margin: 0 auto;
		width: 800px;
		text-align: center;
	}
	
	.button {
     	font-family: Noto Sans KR, Fraunces, Arial, Helvetica Neue, Helvetica, sans-serif;
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
	
	#deletebutton{
		margin-top: -50px;
	}
</style>
</head>
<body>
  <div>
  <p id="rs"></p>
    <form action="${pageContext.request.contextPath}/schedule/afterLogin?num=<%=userId %>" method="post">
		<input type="submit" class="button" value="메인으로 돌아가기">
	</form>
  </div>
</body>
</html>