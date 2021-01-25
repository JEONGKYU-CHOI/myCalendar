<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteView</title>
</head>
<body>
<h2>회원 탈퇴</h2>
<form action="${pageContext.request.contextPath}/user/delete" method="post" id="delForm">
<div>
	회원에서 정상적으로 탈퇴되었습니다.
	<br>
	<br>
	<a href="${pageContext.request.contextPath}/index.jsp">홈으로이동</a>
	<!-- 컨텍스트패스 추가함.-->
</div>

</form>

</body>
</html>