<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Question</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

function resizeWindow(win)    {
	var wid = win.document.body.offsetWidth + 10;
	var hei = win.document.body.offsetHeight + 100;
	win.resizeTo(wid, hei);
}

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
</head>
<body onload='resizeWindow(this)'>
	<button type="button" class="button" id="updateButton">일정 변경하기</button><br>
	<button type="button" class="button" id="textButton">텍스트로 확인하기</button><br>
	<button type="button" class="button" id="sendButton">나에게 보내기</button> 
</body>
</html>