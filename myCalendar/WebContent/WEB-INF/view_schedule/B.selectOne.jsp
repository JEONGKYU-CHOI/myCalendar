<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<title>Insert title here</title>
<!-- Bootstrap CSS -->

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<script src="https://kit.fontawesome.com/f95cd7a2ae.js" crossorigin="anonymous"></script>

<link href="https://fonts.googleapis.com/css2?family=Fraunces&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script type="text/javascript">
window.addEventListener("DOMContentLoaded",function(){
	var deleteList = document.querySelectorAll("a[href^=delete]");
	deleteList.forEach(function(element){
		element.onclick = function(){
			if(!confirm("정말 삭제 하실겁니까?")){
				return false;
			}
		}
	});
	})
</script>
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
	<div>
	
	<h2>조회된 게시글 내용</h2>
	
	</div>  
	<section class="rounded-top" style="background-color: lightgray; width: auto; height: auto; padding: 20px;">
	<div style="width: auto%; height: auto; padding-bottom: 50px;" >
		<div style="text-align: center;">${board.boardTitle}</div>
		  
		<div>      
		<div style="float: left;">${board.boardName}</div>
		
		<div style="float: right;"><fmt:formatDate value="${board.wdate}" pattern="yyyy-MM-dd HH:mm"/> / ${board.boardView }</div>
		</div>
		<hr style="background-color: white; height: 5px; margin: 0px;">
	</div>
	
	<div style="width: auto%; height: auto;">
		${board.boardContent}    
	</div>
		<hr style="background-color: white; height: 5px; margin: 5px;">	
		<div style="height: 40px; font-size: medium; float: left; margin-bottom: 5px;">
		<c:if test="${sessionScope.loginId != null }" >
			<div style="float: left;" id="bt">
			<a id="a1" href="${pageContext.request.contextPath}/board/check?id=${board.id }">수정</a>
			</div>
			
			<div style="float: left; margin-left: 20px;" id="bt">
			<a id="a1" href="${pageContext.request.contextPath}/board/delete?id=${board.id }">삭제</a>
			</div> 

		</c:if>    
		</div>    
		   
	</section>          
			<hr>
			
			<h2>댓글 리스트</h2>
				<section class="rounded-0" style="background-color: lightgray; width: auto; height: auto; padding: 20px;">
				<c:forEach var="comment" items="${cList}">
					<div style="height: auto; text-align: center;">
					${comment.commentContent}
					</div>
					<div style="height: 20px;">
						<div style="position: static; text-align:right; font-size: small; float: right">ID : ${comment.commentName} / DATE : 
						<fmt:formatDate value="${comment.wdate}" pattern="yyyy-MM-dd HH:mm" />
						</div>
						
				<span style="height: 10px; font-size: small; float: left">
				<c:if test="${sessionScope.loginId != null }">
					<a id="a1" href="${pageContext.request.contextPath}/board/check1?id=${comment.id }">수정</a>
					<a> / </a>
					<a id="a1" href="${pageContext.request.contextPath}/board/delete1?id=${comment.id }">삭제</a>
				</c:if>
				</span>
					</div>
				<hr style="background-color: white; height: 5px; margin: 0px;">
				</c:forEach>
				</section>
		<hr>

		<h2 style="text-align: center;">댓글 작성</h2><br>
		<section class="rounded-bottom" style="background-color: lightgray; width: auto; height: auto; padding: 20px; margin-bottom: 200px;">
	    <form action="${pageContext.request.contextPath}/board/insertcomment" method="post">
		<div style="width: auto; margin: 10px;">
  	<div style="width: 25%; float: reft; text-align: reft;">
  	<input type="hidden" name="boardId" value="${board.id}">
  	NAME : <input id="name" type="text" name="commentName"> <br> <br>
  	 	
 	PWord : <input type="password" name="commentPassword"> <br> <br>
 	</div>
 		<span style="height: 10px; font-size: small; float: left"></span>
 		<div>
  <textarea style="width: 100%; height: auto; float: reft; text-align: reft;"  id="content" rows="5" cols="50" name="commentContent" placeholder="게시글 또는 댓글로 문의 부탁드립니다. 감사합니다.♥"></textarea>
				</div>
		<div style="float: right;">
  	<input class="button" type="submit" style="float: right;" value="작성">
  	</div>
			</div>
		</form>
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