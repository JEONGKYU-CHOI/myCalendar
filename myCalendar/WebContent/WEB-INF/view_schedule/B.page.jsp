<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery -->

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

<!-- Bootstrap CSS -->

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<script src="https://kit.fontawesome.com/f95cd7a2ae.js" crossorigin="anonymous"></script>

<link href="https://fonts.googleapis.com/css2?family=Fraunces&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<title>Insert title here</title>
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
<body style="text-align: center; ">


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
	
	<h2>Q&A</h2>
	<article style="color: black;">
	<div class="container">
		<div class="table-responsive">
	<div>
	<c:if test="${sessionScope.loginId == null }">
	   	<form style="float: right; margin-bottom:5px;" action="${pageContext.request.contextPath}/index.jsp">
      <button type="submit" class="button" style="text-align: center; border: 0px;">비 로그인</button>
   		</form>
   	</c:if>
     	<c:if test="${sessionScope.loginId != null }">
   		<form style="float: right; text-align: center; margin-bottom:5px;" action="${pageContext.request.contextPath}/schedule/afterLogin?num=${sessionScope.loginNumber}" method="post">
      <button type="submit" value="로그인 " class="button" style="text-align: center; border: 0px;">로그인</button>
   		</form>  
   	</c:if>
	</div>
			
		<table class="table table-striped table-sm">
			<colgroup>

			<col style="width:5%;" />

			<col style="width:auto;" />

			<col style="width:15%;" />

			<col style="width:20%;" />

			<col style="width:10%;" />

			</colgroup>
	
			<thead style="text-align: center;">
				<tr>
				 	<th>NO</th>
				
				 	<th>글 제목</th>
				 					
				 	<th>작성자</th>
				
				 	<th>작성일</th>
				
				 	<th>조회수</th>
				</tr>
			</thead>
			
			<tbody style="text-align: center;">
				<c:choose>
					<c:when test="${empty bList}">
						<tr><td colspan="5" align="center">게시글이 없습니다.</td></tr>
					</c:when>
					<c:when test="${!empty bList}">
			<c:forEach var="board" items="${bList}">
			<tr>
				<td><a id="a1" href="one?id=${board.id }">${board.id}</a></td>
				 
				<td><a id="a1" href="one?id=${board.id }">${board.boardTitle}</a></td>
				
				<td><a id="a1"href="one?id=${board.id }">${board.boardName}</a></td>
				
				<td>
				<fmt:formatDate value="${board.wdate}" pattern="yyyy-MM-dd HH:mm" />
				</td>
				
				<td>${board.boardView }</td>	
			</tr>	
				
		</c:forEach>
		</c:when>
		</c:choose>
			</tbody>
			</table>
			</div>
		</div>
	</article>
		

			
			
		<div style="margin-bottom: 200px;">	      
		<div>
			 <c:if test="${page.prev}">
 				<span>[ <a id="a1" href="${pageContext.request.contextPath}/board/listPage?num=${page.startPageNum - 1}">이전</a> ]</span>
			</c:if>

			<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
  				<span>
  					<c:if test="${select != num}">
   						<a id="a1" href="${pageContext.request.contextPath}/board/listPage?num=${num}">${num}</a>
   					</c:if>	 
   					<c:if test="${select == num}">
   						<b>${num }</b>
   					</c:if>
 				</span>
			</c:forEach>

			<c:if test="${page.next}">
 				<span>[ <a id="a1" href="${pageContext.request.contextPath}/board/listPage?num=${page.endPageNum + 1}">다음</a> ]</span>
			</c:if>
		</div>
			<c:if test="${sessionScope.loginId != null }">
 			<a id="a1" href="${pageContext.request.contextPath}/board/insertform">게시글 쓰러가기</a>
			</c:if>
		 <div>
 	<form action="${pageContext.request.contextPath}/board/title" method="get">
 	
		<input type="text" name="boardTitle" placeholder="제목을 입력하세요">
		
		<input type="submit" value="검색" class="button">
	</form>
	</div>	   
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