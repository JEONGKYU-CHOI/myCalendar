<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
</head>
<body>
<h1>${sessionScope.loginId}님, 방문을 환영합니다!</h1>
	<form action="${pageContext.request.contextPath}/schedule/afterLogin?num=${sessionScope.loginNumber}" method="post">
		<input type="submit" value="이용하러 가기">
	</form>

	
<%-- <%
	String kakaonickname = request.getParameter("kakaonickname");
	
	session.setAttribute("kakaoNickName", kakaonickname);
%>	"WebContent/WEB-INF/view/main.jsp"
<%= "(카카오톡)"+session.getAttribute("kakaonickname")%>님 방문을 환영합니다.
	<form action="kakao_logout" method="post">
		<button type="submit" name="submit">카카오 로그아웃</button>
	</form>	 --%>
	
</body>
</html>