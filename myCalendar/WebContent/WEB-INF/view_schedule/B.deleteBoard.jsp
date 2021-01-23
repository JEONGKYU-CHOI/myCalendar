<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteBoard</title>

</head>
<body>
<div>
	<form action="/board/delete" method="post">
	<input type="text" name="id" value="${board.id }">
	<input type="text" name="boardPassword" >
	<input type="submit" value="삭제">
	</form>
</div>


<a href="/board/listPage">리스트로 가기</a>
</body>
</html>