<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Question</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Fraunces&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script type="text/javascript">

$(document).ready(function(){
	
	function getParameterByName(name) {
	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	        results = regex.exec(location.search);
	    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}
	
	var eventId=getParameterByName('id');	
	
	$('#updateButton').on('click', function(){
		opener.document.location.href="${pageContext.request.contextPath}/schedule/updateData?id="+eventId;
		self.close();
	});
	
	$('#textButton').on('click', function(){
		location.href="${pageContext.request.contextPath}/schedule/showText?id="+eventId;
	})
	
	$('#sendButton').on('click', function(){
		opener.document.location.href="${pageContext.request.contextPath}/schedule/send?id="+eventId;
		self.close();
	});
	
});
</script>
<style>
	div {
		padding-top: 20px;
		display: block;
		margin: 0 auto;
		width: 490px;
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
		margin-bottom: 10px;
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
	<button type="button" class="button" id="updateButton">일정 변경하기</button><br>
	<button type="button" class="button" id="textButton">텍스트로 확인하기</button><br>
	<button type="button" class="button" id="sendButton">나에게 보내기</button> 
	</div>
</body>
</html>