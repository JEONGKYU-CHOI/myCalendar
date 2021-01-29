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
<script src="https://kit.fontawesome.com/f95cd7a2ae.js" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		function getParameterByName(name) {
		    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
		    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
		        results = regex.exec(location.search);
		    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
		}
		
		var userId=getParameterByName('userId');
		var defaultDate=getParameterByName('defaultDate');		
		
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
				rs.innerHTML="<h3 style='color: red'>종료 시간이 시작 시간을 앞설 수 없습니다.</h3>";
				
				$('#start').focus();
				return false;
			}		
		});
		
	});
</script>
<style>
	body {
	    margin: 0;
	    padding: 0;
	    font-family: Fraunces, Arial, Helvetica Neue, Helvetica, sans-serif;
	}
	
	input {
		width: 250px;
		font-family: Noto Sans KR, Fraunces, Arial, Helvetica Neue, Helvetica, sans-serif;	
		padding: 5px;
	}
	
	select {
		width: 265px;
		padding: 5px;
	}
	
	div {
	    font-family: Noto Sans KR, Fraunces, Arial, Helvetica Neue, Helvetica, sans-serif;
		padding-top: 160px;
		padding-bottom: 160px;
		display: block;
		margin: 0 auto;
		width: 800px;
		text-align: center;
	}
	
	label{
		margin-right: 10px;
	}
	
	a{
	  	text-decoration: none;
	  	color: white;
    }
    
    h2{
    	margin: 0;
    }
	
	.navbar{
	  	display: flex;
	  	justify-content: space-between;
	  	aligh-items: center;
	  	background-color: #0F222D;
	    padding: 8px 12px;
	    min-width: 900px;
	    position: sticky;
	    top: 0;
	    z-index: 2;
 	}
 	 
   .navbar_logo{
	  	list-style: none;
		color: white;
		display: flex;
		padding: 0;
	}
  
	.navbar_logo li{
	    font-size: 24px;
	    padding: 8px 12px;
	}
	  
	#QA:hover{
	    background-color: #b1bfca;
	  	border-radius: 4px;
	}
	    
	#QA{
	  	padding: 8px 40px;
	    font-size: 16px;
	}
	  
	.navbar_icons{
	  	list-style: none;
		color: white;
		display: flex;
	}
	  
	.navbar_icons li{
	    font-size: 24px;
	    padding: 8px 12px;
	}
	  
	.navbar_icons li:hover{
	  	background-color: #b1bfca;
	  	border-radius: 4px;
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
	
	footer{
		letter-spacing: -1px;
  		border-top: 1px solid #bdbdbd;
    }
  
	.footer{
	  	min-width: 900px;
	  	margin: 0px;
	  	padding: 15px 30px 15px 30px;
	  	list-style: none;
	  	display: flex;
    }
   
    footer>ul>li{
	  	margin: 5px;
	  	padding: 5px;
    }
  
    footer>ul>li>a {
  		color: black;
    }
</style>
</head>
<body>
  <nav class="navbar">
  	<ul class="navbar_logo">
		<li>
		<i class="far fa-calendar-alt" style="color: #fff59d;"></i>
		<span>&nbsp;myCalendar</span>
		</li>
		<li><a id="QA" href="${pageContext.request.contextPath}/board/listPage">Q&A</a></li>
  	</ul>
  	<ul class="navbar_icons">
  		<li><a href="${pageContext.request.contextPath}/index.jsp"><i class="fas fa-sign-out-alt"></i></a></li>
  		<li><a href="${pageContext.request.contextPath}/user/viewUser?number=${sessionScope.loginNumber}"><i class="fas fa-users-cog"></i></a></li>
  	</ul>
  </nav>
  
	<div>
	<h2>아래의 일정을 추가합니다.</h2>
	<form action="${pageContext.request.contextPath}/schedule/insertResult" method="post">
		<input type="hidden" name="userId" id="num" readonly><br>
		<label for="scheduleTitle">일정 이름</label> <input type="text" id="title" name="scheduleTitle"><br>
		<label for="start">시작 시간</label> <input type="datetime-local" id="start" name="start"><br>
		<label for="end"> 종료 시간</label> <input type="datetime-local" id="end" name="end"><br>
		<label for="color">배경 색깔</label> <select name="color" id="color" name="color">
			<option value="red">red</option>
			<option value="orange">orange</option>
			<option value="#c8b900">yellow</option>
			<option value="green">green</option>
			<option value="blue">blue</option>
			<option value="purple">purple</option>
			<option value="#ff93c1">pink</option>
			<option value="black">black</option>
		</select><br>
		<p id="rs"></p>
		<br>
		<input type="submit" class="button" value="추가하기">
	</form>
	</div>
	
  <footer>
  	<ul class="footer">
  		<li><a href="#">이용약관</a></li>
	  	<li><a href="#">개인정보처리방침</a></li>
	  	<li><a href="#" style="font-weight: bold">ⓒmyCalendar</a></li>
  	</ul>
  </footer>
</body>
</html>