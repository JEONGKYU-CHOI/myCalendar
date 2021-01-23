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

	<header>

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
<!-- 	<div>
	<form action="/board/title" method="get">
		<input type="text" name="boardTitle" placeholder="제목을 입력하세요">
		<input type="submit" value="검색">
	</form>
	</div> -->
 
 	<hr>

 	
 <div>
 	<form action="/board/title" method="get">
 	
		<input type="text" name="boardTitle" placeholder="제목을 입력하세요">
		<input type="submit" value="검색">
	</form>
	
 </div>	
	
	</header>

		
	
			<table id="board" border="1">
		<c:forEach var="board" items="${bList}">
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
				
				<td>
				<fmt:formatDate value="${board.wdate}" pattern="yyyy-MM-dd HH:mm" />
				</td>
				
				<td>
				<fmt:formatDate value="${board.udate }" pattern="yyyy-MM-dd HH:mm" />
				</td>	
			</tr>	
				
			</tbody>
		</c:forEach>
			</table>
			
			

			
			
			<footer>
		<div>
			 <c:if test="${page.prev}">
 				<span>[ <a href="/board/listPage?num=${page.startPageNum - 1}">이전</a> ]</span>
			</c:if>

			<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
  				<span>
  					<c:if test="${select != num}">
   						<a href="/board/listPage?num=${num}">${num}</a>
   					</c:if>	 
   					<c:if test="${select == num}">
   						<b>${num }</b>
   					</c:if>
 				</span>
			</c:forEach>

			<c:if test="${page.next}">
 				<span>[ <a href="/board/listPage?num=${page.endPageNum + 1}">다음</a> ]</span>
			</c:if>
		
		
 		  	<!--<c:forEach begin="1" end="${pageNum}" var="num">
    			<span>
     				<a href="/board/listPage?num=${num}">${num}</a>
  				</span>
 			</c:forEach> -->
 		<c:if test="${member != null }">
 			<a href="/board/insertform">게시글 쓰러가기</a>
		</c:if>
		</div>
			</footer>

</body>
</html>