<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
		<c:if test="${member != null }">
			<a href="/board/check?id=${board.id }">수정</a>
			<a href="/board/delete?id=${board.id }">삭제</a>
		</c:if>
			<a href="/board/listPage">게시판 가기</a>
		<hr>
			
			<h2>트렌젝션 활용 댓글리스트</h2>
				<c:forEach var="comment" items="${cList}">
			<table id="board" border="1">
			<thead>
				<tr>
					<th>댓글 번호</th>
				
				 	<th>게시글 번호</th>
				
				 	<th>댓글 제목</th>
				
				 	<th>댓글 내용</th>
				
				 	<th>댓글 작성자</th>
				
				 	<th>댓글 작성일시</th>
				
				 	<th>댓글 수정일시</th>
				</tr>
			</thead>
			
			<tbody>
			<tr>
				<td>${comment.id}</td>
			
				<td>${comment.boardId}</td>
				 
				<td>${comment.commentTitle}</td>
					
				<td>${comment.commentContent}</td>
				
				<td>${comment.commentName}</td>
				
				<td>
				<fmt:formatDate value="${comment.wdate}" pattern="yyyy-MM-dd HH:mm" />
				</td>
				
				<td>
				<fmt:formatDate value="${comment.udate}" pattern="yyyy-MM-dd HH:mm" />
				</td>	
				
			</tr>	
				
			</tbody>
		<c:if test="${member != null }">
			<a href="/board/check1?id=${comment.id }">수정</a>
			<a href="/board/delete1?id=${comment.id }">삭제</a>
		</c:if>
			</table>
		</c:forEach>
		
		</div>
		<hr>

		<h2 style="text-align: center;">댓글 작성</h2><br><br><br>	
		<div style="width: 80%; margin: auto;">
	  <form action="/board/insertcomment" method="post">
  	게시글 번호 : <input type="number" name="boardId" value="${board.id }" readonly="readonly"> <br>
  	댓글 작성자 : <input id="name" type="text" name="commentName" style="width: 30%;" placeholder="작성자"> <br>
 	댓글 제목 : <input id="title" type="text" name="commentTitle" style="width: 50%;" placeholder="제목"> <br>
 	댓글 PW : <input type="password" name="commentPassword" style="width: 50%;" placeholder="PW"> <br>  
  <textarea style="width: 1000px; height: 200px"  id="content" rows="5" cols="50" name="commentContent" placeholder="content"></textarea> <br>
  	<input type="submit" style="float: right;" value="작성">
</form>
		</div>
</body>
<hr>

	<footer>

	</footer>
</html>