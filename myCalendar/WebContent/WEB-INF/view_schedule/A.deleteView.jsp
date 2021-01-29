<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteView</title>
<style>
	body {
		background-size:cover;
		background-image: url('${pageContext.request.contextPath}/bg_02.jpeg'); 
		background-color: #FCF1DC;/*#59444C;/*#0F222D;/*#231826;/* #2A192F; */
		background-repeat: no-repeat;
	    margin: 0;
	    padding: 0;
	    font-family: Noto Sans KR, Fraunces, Arial, Helvetica Neue, Helvetica, sans-serif;
	
	}
	
	div {
		padding-top: 30px;
		display: block;
		margin: 0 auto;
		width: 800px;
		text-align: center;
	}
	h2{
	color: #0F222D;
	text-align:center;
	}

	
</style>
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