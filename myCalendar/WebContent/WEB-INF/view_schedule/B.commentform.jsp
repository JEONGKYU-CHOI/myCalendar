<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div style="width: 80%; margin: auto;">
	<h2>조회된 게시글 내용</h2>
		<table border="1">
			<thead>
				<tr>
				 	<th>NO</th>
				
				 	<th>Title</th>
				
				 	<th>content</th>
				
				 	<th>ID</th>
				
				 	<th>작성일시</th>
				
				 	<th>수정일시</th>
				</tr>
			</thead>
			
			<tbody>
			
			<tr>
				<td>${comment.id}</td>
				 
				<td>${comment.commentTitle}</td>
					
				<td>${comment.commentContent}</td>
				
				<td>${comment.commentName}</td>
				
				<td>${comment.wdate}</td>
				
				<td>${comment.udate}</td>	
			</tr>	
			
			
			</tbody>

		</table>	
				<a href="update1?id=${comment.id }">수정</a>
				<a href="delete?id=${comment.id }">삭제</a>
				<a href="/board/listPage">리스트 가기</a>
		</div>
</body>
</html>