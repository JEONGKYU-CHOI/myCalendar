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
	var title="${schedule.scheduleTitle}";
	var start="${schedule.start}";
	var end="${schedule.end}";
	
	var startDate=start.replace("T", "-");
	var startDateRs=startDate.replace(":", "-");
	var endDate=end.replace("T", "-");	
	var endDateRs=endDate.replace(":", "-");
	var startDateArr=startDateRs.split('-');
	var endDateArr=endDateRs.split('-');
	var startDateCompare=new Date(startDateArr[0], (startDateArr[1])-1, startDateArr[2], startDateArr[3], startDateArr[4], 0, 0, 0);
	var endDateCompare=new Date(endDateArr[0], (endDateArr[1])-1, endDateArr[2], endDateArr[3], endDateArr[4], 0, 0, 0);
	
	var startDateFinal=startDateCompare.getFullYear()+"년 "+(startDateCompare.getMonth()+1)+"월 "+startDateCompare.getDate()+"일 "+startDateCompare.getHours()+"시 "+startDateCompare.getMinutes()+"분";
	var endDateFinal=endDateCompare.getFullYear()+"년 "+(endDateCompare.getMonth()+1)+"월 "+endDateCompare.getDate()+"일 "+endDateCompare.getHours()+"시 "+endDateCompare.getMinutes()+"분";
	
	document.write('일정 이름: '+title+'<br>'+'시작 시간: '+startDateFinal+'<br>'+'종료 시간: '+endDateFinal+'<br>');
</script>
<style>
	body {
	    margin: 20;
	    padding: 0;
	    font-family: Noto Sans KR, Fraunces, Arial, Helvetica Neue, Helvetica, sans-serif;
	}
</style>
</head>
<body>
	
</body>
</html>