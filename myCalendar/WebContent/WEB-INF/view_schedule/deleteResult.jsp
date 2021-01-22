<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
    request.setCharacterEncoding("utf-8");
    String userId=request.getParameter("userId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyCalendar</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var result=${result};
		console.log(result);
		
		if(result==1){
			var rs=$('#rs')[0];
			rs.innerHTML="<h3>삭제에 성공하였습니다.</h3>";
		}else{
			alert('삭제에 실패하였습니다.');
			window.history.go(-1);
		}
	});
</script>
</head>
<body>
  <p id=rs></p>
  <form action="${pageContext.request.contextPath}/schedule/afterLogin?num=<%=userId %>" method="post">
  	<input type="submit" value="메인으로 돌아가기">
  </form>
</body>
</html>