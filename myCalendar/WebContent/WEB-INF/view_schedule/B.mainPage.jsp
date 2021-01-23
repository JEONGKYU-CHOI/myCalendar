<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<ul>
	<li>
		<c:if test="${member != null}">
			<p>${member.id}님 안녕하세요.</p>
		</c:if>
	</li>

	<li>
		<c:if test="${member == null}"><a href="/board/login">로그인</a></c:if>
		<c:if test="${member != null}"><a href="/board/logout">로그아웃</a></c:if>
	</li>
</ul>

 
 	<hr>


 	<ul>
 		<li><a href="/board/listPage">게시글 보러가기</a></li>
 	</ul>
 	<hr>


</body>
</html>