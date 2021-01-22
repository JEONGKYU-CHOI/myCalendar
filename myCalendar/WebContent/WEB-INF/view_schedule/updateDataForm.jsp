<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyCalendar</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
			
			$('#end').focus();
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
			rs.innerHTML="<h3 style='color: red'>시작 시간이 종료 시간을 앞설 수 없습니다.</h3>";
			
			$('#start').focus();
			return false;
		}		
	});
});
</script>
</head>
<body>
	<h2>아래의 일정을 변경합니다.</h2>
	<form id="updateForm" action="${pageContext.request.contextPath}/schedule/updateResult" method="post">
		<input type="hidden" name="userId" id="num" value="${schedule.userId }"><br>
		일정 번호: <input type="number" name="scheduleId" id="id" value="${schedule.scheduleId }" readonly><br>
		일정 이름: <input type="text" id="title" name="scheduleTitle" value="${schedule.scheduleTitle }"><br>
		시작 시간: <input type="datetime-local" id="start" name="start" value="${schedule.start }" ><br>
		종료 시간: <input type="datetime-local" id="end" name="end" value="${schedule.end }"><br>
		배경 색깔: <select name="color" id="color" name="color">
			<option value="red">red</option>
			<option value="orange">orange</option>
			<option value="yellow">yellow</option>
			<option value="green">green</option>
			<option value="blue">blue</option>
			<option value="purple">purple</option>
			<option value="pink">pink</option>
		</select><br>
		<p id="rs"></p>
		<input type="submit" class="button" value="수정하기">
	</form>
	<form id="deleteForm" action="${pageContext.request.contextPath}/schedule/deleteData?id=${schedule.scheduleId }" method="post">
		<input type="hidden" name="userId" id="num" value="${schedule.userId }"><br>
		<input type="submit" class="button" value="삭제하기">
	</form>
</body>
</html>