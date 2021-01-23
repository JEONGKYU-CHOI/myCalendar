<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>check</title>
</head>
<body>
<div>
	<form action="/board/update" method="get">
	<input type="text" name="id" value="${board.id }">
	<input type="text" name="boardPassword" >
	<input type="submit" value="확인">
	</form>
</div>

<a href="/board/listPage">리스트로 가기</a>
</body>
</html>