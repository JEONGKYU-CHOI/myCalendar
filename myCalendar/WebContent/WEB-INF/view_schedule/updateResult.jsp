<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
    request.setCharacterEncoding("utf-8");
    String userId = request.getParameter("userId");    
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
		
		if(result==1){
			var rs=$('#rs')[0];
			rs.innerHTML="<h3>수정에 성공하였습니다.</h3>";
		}else{
			alert('수정에 실패하였습니다.');
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
	
	#container{
		width: 100%;
		height: 100%;
		background-size: cover;
	}
	
	#container::after{
		width: 100%;
		height: 100%;
		background: url("../bg.jpg");
		content: "";
		position: absolute;
		top: 0;
		left: 0;
		z-index: -1;
		opacity: 0.5;
	}
	
	#content{
		padding: 100px;
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
  <div id="container">
  <div id="content">
  <form action="${pageContext.request.contextPath}/schedule/afterLogin?num=<%=userId %>" method="post">
		<p id="rs"></p>	
		<input type="submit" class="button" value="메인으로 돌아가기">
  </form>
  </div>
  </div>
</body>
</html>