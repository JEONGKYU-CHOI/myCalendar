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
		
		function getParameterByName(name) {
		    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
		    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
		        results = regex.exec(location.search);
		    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
		}
		
		var userId=getParameterByName('userId');
		console.log(userId);
		var defaultDate=getParameterByName('defaultDate');
		console.dir(defaultDate);
		
		
		var inputUserId=$('#num')[0];
		inputUserId.value=userId;
		
		var inputStart=$('#start')[0];
		var endStart=$('#end')[0];
		
		var defaultDateArr=defaultDate.split('-');

		var newDefaultDate=new Date(defaultDateArr[0], (defaultDateArr[1])-1, defaultDateArr[2], 0, 0, 0, 0, 0);
		
		var timezoneOffset = new Date().getTimezoneOffset() * 60000;
		//toISOString()은 UTC 타임존의 zero offse 사용->9시간을 더해 줘야 함
		var timezoneDate = new Date(newDefaultDate - timezoneOffset);
		
		var setDefaultDate=timezoneDate.toISOString().slice(0, 16);

		inputStart.value=setDefaultDate;
		endStart.value=setDefaultDate;
		
		$('form').submit(function(){
			
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
	<h2>아래의 일정을 추가합니다.</h2>
	<form action="${pageContext.request.contextPath}/schedule/insertResult" method="post">
		<input type="hidden" name="userId" id="num" readonly><br>
		일정 이름: <input type="text" id="title" name="scheduleTitle"><br>
		시작 시간: <input type="datetime-local" id="start" name="start"><br>
		종료 시간: <input type="datetime-local" id="end" name="end"><br>
		배경 색깔: <select name="color" id="color" name="color">
			<option value="red">red</option>
			<option value="orange">orange</option>
			<option value="#c8b900">yellow</option>
			<option value="green">green</option>
			<option value="blue">blue</option>
			<option value="purple">purple</option>
			<option value="pink">pink</option>
		</select><br>
		<p id="rs"></p>
		<br>
		<input type="submit" class="button" value="추가하기">
	</form>
</body>
</html>