<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

	$('#updateForm').submit(function(){
		
		var title=$('#title').val().trim();
		
		if(title==""){
			var result=$('#rs');
			rs.innerHTML="<h3 style='color: red'>일정 제목은 비워둘 수 없습니다.</h3>";
			
			$('#title').focus();
			return false;
		}
		
		var start=$('#start').val().trim();
		var end=$('#end').val().trim();
		
		if(start==end){
			var result=$('#rs');
			rs.innerHTML="<h3 style='color: red'>시작 시간과 종료 시간은 같을 수 없습니다.</h3>";
			
			$('#start').focus();
			return false;
		}
		
		var startDate=start.replace("T", "-");
		var startDateRs=startDate.replace(":", "-");
		var endDate=end.replace("T", "-");	
		var endDateRs=endDate.replace(":", "-");
		var startDateArr=startDateRs.split('-');
		var endDateArr=endDateRs.split('-');
		var startDateCompare=new Date(startDateArr[0], (startDateArr[1])-1, startDateArr[2], startDateArr[3], startDateArr[4], 0, 0, 0);
		//Date 객체의 Month는 0부터 시작(0=1월)
		var endDateCompare=new Date(endDateArr[0], (endDateArr[1])-1, endDateArr[2], endDateArr[3], endDateArr[4], 0, 0, 0);
		
		if(startDateCompare.getTime() > endDateCompare.getTime()){
			var result=$('#rs');
			rs.innerHTML="<h3 style='color: red'>종료 시간이 시작 시간을 앞설 수 없습니다.</h3>";
			
			$('#end').focus();
			return false;
		}		
	});
	
	$('#deletebutton').on('click', function(){
		alert('정말 삭제하시겠습니까?');
	});
});
</script>
<style>
	body {
	    margin: 0;
	    padding: 0;
	    font-family: Noto Sans KR, Fraunces, Arial, Helvetica Neue, Helvetica, sans-serif;
	}
	
	input {
		width: 250px;
		font-family: Noto Sans KR, Fraunces, Arial, Helvetica Neue, Helvetica, sans-serif;	
		margin-bottom: 5px;
		padding: 5px;
	}
	
	select {
		width: 265px;
		padding: 5px;
	}
	
	div {
		padding-top: 30px;
		display: block;
		margin: 0 auto;
		width: 800px;
		text-align: center;
	}
	
	label{
		margin-right: 10px;
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
	<h2>아래의 일정을 변경합니다.</h2>
	<form id="updateForm" action="${pageContext.request.contextPath}/schedule/updateResult" method="post">
		<input type="hidden" name="userId" id="num" value="${schedule.userId }" readonly><br>
		<label for="scheduleId">일정 번호</label> <input type="number" name="scheduleId" id="id" value="${schedule.scheduleId }" readonly><br>
		<label for="scheduleTitle">일정 이름</label> <input type="text" id="title" name="scheduleTitle" value="${schedule.scheduleTitle }"><br>
		<label for="start">시작 시간</label> <input type="datetime-local" id="start" name="start" value="${schedule.start }" ><br>
		<label for="end">종료 시간</label> <input type="datetime-local" id="end" name="end" value="${schedule.end }"><br>
		<label for="color">배경 색깔</label> <select name="color" id="color" name="color">
			<option value="red">red</option>
			<option value="orange">orange</option>
			<option value="#c8b900">yellow</option>
			<option value="green">green</option>
			<option value="blue">blue</option>
			<option value="purple">purple</option>
			<option value="#ff93c1">pink</option>
		</select><br>
		<p id="rs"></p>
		<br>
		<input type="submit" class="button" value="수정하기">
	</form>
	<form id="deleteForm" action="${pageContext.request.contextPath}/schedule/deleteData?id=${schedule.scheduleId }" method="post">
		<input type="hidden" name="userId" id="num" value="${schedule.userId }"><br>
		<input type="submit" class="button" id="deletebutton" value="삭제하기">
	</form>
	</div>
</body>
</html>