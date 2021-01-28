<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyCalendar</title>
<link href='css/core.css' rel='stylesheet' />
<link href='css/daygrid.css' rel='stylesheet' />
<link href='css/timegrid.css' rel='stylesheet' />
<link href='css/list.css' rel='stylesheet' />
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Fraunces&display=swap" rel="stylesheet">
<script src='js/coreMain.js'></script>
<script src='js/interaction.js'></script>
<script src='js/daygrid.js'></script>
<script src='js/timegrid.js'></script>
<script src='js/list.js'></script>
<script src='js/ko.js'></script>
<script src="https://kit.fontawesome.com/f95cd7a2ae.js" crossorigin="anonymous"></script>
<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,list'
      },
      locale: 'ko',
//    navLinks: true, // can click day/week names to navigate views
      businessHours: true, // display business hours
      editable: true,
      dateClick:function(){
    	  alert('로그인 후 서비스를 이용해 보세요!');
      }
    });
    calendar.render();
  });
</script>
<style>
  body {
    margin: 0;
    padding: 0;
    font-family: Fraunces, Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 900px;
    margin: 0 auto;
    padding-top: 80px;
  }
  
  .fc-day-top.fc-sun.fc-past, .fc-day-top.fc-sun.fc-future {
  	color: #FF0000;
  }
  
  .fc-day-top.fc-sat.fc-past, .fc-day-top.fc-sat.fc-future {
  	color: #0100FF;
  }
  
  .navbar{
  	display: flex;
  	justify-content: space-between;
  	aligh-items: center;
  	background-color: #0F222D;
    padding: 8px 12px;
    mid-width: 900px;
    position: sticky;
    top: 0;
    z-index: 2;
  }
  
  a{
  	text-decoration: none;
  	color: white;
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
  		<li><a href="${pageContext.request.contextPath}/user/login"><i class="fas fa-sign-in-alt"></i></a></li>
  		<li><a href="${pageContext.request.contextPath}/user/add"><i class="fas fa-user-plus"></i></a></li>
		<!-- 컨텍스트패스 추가함.-->
  	</ul>
  </nav>
  <div id='calendar'></div>
  <footer>
  
  </footer>