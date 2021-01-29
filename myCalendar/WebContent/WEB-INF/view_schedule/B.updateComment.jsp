<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<script src="https://kit.fontawesome.com/f95cd7a2ae.js" crossorigin="anonymous"></script>

<link href="https://fonts.googleapis.com/css2?family=Fraunces&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<title>updateComment</title>
<style>

body {


}
  .fc-day-top.fc-sun.fc-past, .fc-day-top.fc-sun.fc-future {
  	color: #FF0000;
  }
  
  .fc-day-top.fc-sat.fc-past, .fc-day-top.fc-sat.fc-future {
  	color: #0100FF;
  }

 	 footer{
    letter-spacing: -1px;
  	border-top: 1px solid #bdbdbd;
  }  
    .footer{
  	min-width: 900px;
  	margin: 0px;
  	padding: 15px 30px 10px 30px;
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
 

	.button {
		font-family: Noto Sans KR, Fraunces, Arial, Helvetica Neue, Helvetica, sans-serif;
		width: 80px;
		height: 30px;      
		background-color: #0F222D;
		color: white;
		font-size: 16px;
		border-radius: 5px;
		box-shadow: 0 4px 16px rgba(15, 34, 45, 0.3);
		text-align: center;
	}
	
	.button:focus{
		outline: 0;
	}
	
	.button:hover{
		background-color: rgba(15, 34, 45, 0.9);
		cursor: pointer;
		box-shadow: 0 2px 4px rgba(15, 34, 45, 0.3);
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
    .fc-day-top.fc-sun.fc-past, .fc-day-top.fc-sun.fc-future {
  	color: black;
  }
  
  .fc-day-top.fc-sat.fc-past, .fc-day-top.fc-sat.fc-future {
  	color: black;
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
  
  a{
  	text-decoration: none;
  	color: white;
  }
    #a1{
  color: black;
  }

</style>
</head>

<body style="text-align: center;">
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
  
	<div style=" margin-left: 20%; margin-right: 20%;">
	<h2 style="text-align: center;">댓글 수정</h2><br><br><br>
	<section class="rounded" style="background-color: lightgray; width: auto; height: auto; padding: 20px; margin-bottom: 350px;">
 	<div style="width: auto; height: auto; padding-bottom: 50px;">

  <form action="${pageContext.request.contextPath}/board/update1" method="post">
  <div style="width: 100%;">
  <div style="width: 100%;" class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-default" style="background-color: lightgray; font-style: normal; font-size: small">게시글 NO</span>
  </div>
  <input type="number" name="id" class="form-control" aria-label="Sizing example input" aria-describedby="제목" value="${comment.id}" readonly="readonly">
    <span class="input-group-text" id="inputGroup-sizing-default" style="background-color: lightgray; font-style: normal; font-size: small">NAME</span>
  <input type="text" name="commentName" class="form-control" aria-label="Sizing example input" aria-describedby="작성자" value="${comment.commentName}" readonly="readonly"> 
</div>
</div>
  <input type="hidden" name="boardId" class="form-control" aria-label="Sizing example input" value="${comment.boardId }" readonly="readonly">

    
  <textarea style="width: 100%; height: auto;"  id="content" rows="5" cols="50" name="commentContent">${comment.commentContent}</textarea>
  	<input class="button" type="submit" style="float: right;" value="수정">
     
  </form> 
        
	</div>      
	</section> 
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