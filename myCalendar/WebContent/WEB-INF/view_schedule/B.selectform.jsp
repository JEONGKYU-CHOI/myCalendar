<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
				<td>${board.id}</td>
				 
				<td>${board.boardTitle}</td>
					
				<td>${board.boardContent}</td>
				
				<td>${board.boardName}</td>
				
				<td>${board.wdate}</td>
				
				<td>${board.udate}</td>	
			</tr>	
			
			
			</tbody>

		</table>	
				<a href="update1?id=${board.id }">수정</a>
				<a href="delete1?id=${board.id }">삭제</a>
				<a href="/board/listPage">리스트 가기</a>
		</div>
</body>
</html>