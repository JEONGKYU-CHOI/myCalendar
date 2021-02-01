<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
<script src="http://cdnjs.cloud flare.com/ajax/libs/summernote/0.8.9/lang/summernote-ko-KR.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" 
href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" 
integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" 
crossorigin="anonymous">

<script src="https://kit.fontawesome.com/f95cd7a2ae.js" crossorigin="anonymous"></script>

<link href="https://fonts.googleapis.com/css2?family=Fraunces&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">


<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<meta charset="UTF-8">
<title>게시판</title>
<script>
	var result = '${result}';
	if(result === 'registerOK'){
		alert('등록이 완료되었습니다.');
	}
</script>
<style>
body {
    margin: 0;
    padding: 0;
    font-family: Fraunces, Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
 
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
  	font-size: medium;
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

<script>
$(document).ready(function() {
	  $('#summernote').summernote({
 	    	placeholder: 'content',
	        minHeight: 370,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR'
	  });
	});
</script>



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
  
  <div style=" margin-left: 20%; margin-right: 20%;">
	  <div>
	<h2 style="text-align: center;">게시글 작성</h2><br><br><br>
	</div>	
	
	<section class="rounded" style="background-color: lightgray; width: auto; height: auto; padding: 20px; margin-bottom: 100px;">
 	<div style="width: auto; height: auto; padding-bottom: 50px;">

  <form action="${pageContext.request.contextPath}/board/insert" method="post">
  
  <div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-default" style="background-color: lightgray; font-style: normal; font-size: small;">게시글 제목</span>
  </div>
  <input type="text" name="boardTitle" class="form-control" aria-label="Sizing example input" aria-describedby="제목">
</div>
  
<div style="width: 100%;">
  <div style="width: 100%;" class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-default" style="background-color: lightgray; font-style: normal; font-size: small;">NAME</span>
  </div>
  <input type="text" name="boardName" class="form-control" aria-label="Sizing example input" aria-describedby="작성자"> 
    <span class="input-group-text" id="inputGroup-sizing-default" style="background-color: lightgray; font-style: normal; font-size: small;">PW</span>
  <input type="password" name="boardPassword" class="form-control" aria-label="Sizing example input" aria-describedby="비밀번호">
</div>

</div>
  <textarea id="summernote" name="boardContent" style="font-size: medium;"></textarea>
  	<input class="button" type="submit" style="float: right;" value="작성">
  
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