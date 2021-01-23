<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
/*	$(function(){
	
	변수 생성
	- rowPerPage : 페이지당 보여줄 개수 (10)
	- row : 가로행의 tr
	- rowsCount : 가로행의 tr
	- pageCount : 페이지네이션 개수 = 100/10
	- numbers (tables)
	
	var rowsPerPage = 10,
		rows = $("#board tbody tr"),
		rowsCount = rows.length,
		pageCount = Math.ceil(rowsCount/rowsPerPage),
		numbers = $("#numbers");
		
		console.log(pageCount);
		
		
		페이지네이션 li를 생선 반복문
		
		for(var i; i <= pageCount; i++){
			numbers.append('<li><a href="">' + i + '</a></li>')
		}
	});
*/	
</script>

</head>
	<div>
	<form action="/board/title" method="get">
		<input type="text" name="boardTitle" placeholder="제목을 입력하세요">
		<input type="submit" value="검색">
	</form>
	</div>
<body>


	
		<c:forEach var="board" items="${bList}">
			<table id="board" border="1">
			<thead>
				<tr>
				 	<th>게시글 번호</th>
				
				 	<th>게시글 제목</th>
				
				 	<th>게시글 내용</th>
				
				 	<th>게시글 작성자</th>
				
				 	<th>게시글 작성일시</th>
				
				 	<th>게시글 수정일시</th>
				</tr>
			</thead>
			
			<tbody>
			<tr>
				<td><a href="one?id=${board.id }">${board.id}</a></td>
				 
				<td><a href="one?id=${board.id }">${board.boardTitle}</a></td>
					
				<td><a href="one?id=${board.id }">${board.boardContent}</a></td>
				
				<td><a href="one?id=${board.id }">${board.boardName}</a></td>
				
				<td>${board.wdate}</td>
				
				<td>${board.udate}</td>	
			</tr>	
				
			</tbody>
			</table>
		</c:forEach>
		<a href="/board/listPage">리스트로 가기</a>

</body>
</html>