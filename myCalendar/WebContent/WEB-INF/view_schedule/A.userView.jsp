<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 상세 페이지</title>

<style type="text/css">
body {
		background-size:cover;
		background-image: url('${pageContext.request.contextPath}/bg_02.jpeg'); 
		background-color: #FCF1DC;/*#59444C;/*#0F222D;/*#231826;/* #2A192F; */
		background-repeat: no-repeat;
	    margin: 0;
	    padding: 0;
	    font-family: Noto Sans KR, Fraunces, Arial, Helvetica Neue, Helvetica, sans-serif;
	
	}
	
/* #container{
		position:absolute;
		width:400px;
		height:400px; 
		background-color:white;
		text-align :center;
		margin-left: 0 auto;
		margin-top: -150px;
		left: 30%;
		top:50%; 
		border-radius:10px;
} */

	#container{
		position:absolute;
		width:400px;
		height:400px;
		background-color:white;
		text-align:center; 
		/* margin-left: 0 auto; */
		margin-left:-200px;
		margin-top: -200px;
		left: 50%;
		top:50%;
		border-radius:10px;
	}

#usertable{
		width:100%;
		table-layout:fixed;
		border-collapse:collapse;
		/* border:1px solid #168; */
		text-align:left;
	
}
input[type=button] {
		font-family: Noto Sans KR, Fraunces, Arial, Helvetica Neue, Helvetica, sans-serif;
		width: 150px;
		height: 40px;
		background-color: #0F222D;
		color: white;
		font-size: 16px;
		border-radius: 5px;
		box-shadow: 0 4px 16px rgba(15, 34, 45, 0.3);
		margin-bottom: 10px;
	}

h2{
	color: #0F222D;
	text-align:center;
	
}

</style>	
</head>

<body>
<%--  <%@ include file="../include/user_menu.jsp" %> --%>

<div id="container">
<h2>회원 정보 상세 내용</h2>
<!-- 컨텍스트패스 추가함.--> 
<form action="${pageContext.request.contextPath}/user/viewUser" name="form1" method="post">

	
	<table id="usertable" border=1 width="400px">
	<tr>
		<td>회원번호</td>
		<!-- 수정 불가능하도록 readonly 속성추가함 -->
		<td><input id="number" name="number" value="${user.number}" readonly="readonly"></td>
	</tr>
	<tr>
		<td>아이디</td>
		<!-- 수정 불가능하도록 readonly 속성추가함 -->
		<td><input name="id" value="${user.id}" readonly="readonly"></td>
		
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="password" value="${user.password}" placeholder="비밀번호"></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input name="name" value="${user.name}"></td>
	</tr>
	<tr>
		<td>이메일주소</td>
		<td><input name="email" value="${user.email}"></td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td><input name="phone" value="${user.phone}"></td>
	</tr>
	<tr>
		<td colspan="2" align="center" valign="middle">
			<input type="button" value="회원 정보 수정" id="btnUpdate">
			<input type="button" value="회원탈퇴" id="btnDelete" >
	    </td>
	</tr>
</table>
<br>
 <p><a href="${pageContext.request.contextPath}/user/test">처음으로</a></p>

<%-- <p><a href="${pageContext.request.contextPath}/schedule/afterLogin?num=${sessionScope.loginNumber}">내 달력으로</a></p>
<form action="${pageContext.request.contextPath}/schedule/afterLogin?num=${sessionScope.loginNumber}" method="post">
		<input type="submit" value="MyCalendar로 가기">
	</form> --%>

</form>
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
var number = $("#number").val();
console.log("number");
	$(document).ready(function(){
		
		$("#btnUpdate").click(function(){
			//확인 대화상자
			if(confirm("수정하시겠습니까?")){
				
				document.form1.action = '${pageContext.request.contextPath}/user/update?number='+number;
				document.form1.submit(); 
				alert("수정되었습니다!");
				
			}else{
				alert("수정이 취소되었습니다");
				location.href="${pageContext.request.contextPath}/user/viewUser?number="+number;
			}
		});
	});
	var number = $("#number").val();
	console.log("number");
	$(document).ready(function(){
		
		
		$("#btnDelete").click(function(){
			if(confirm("정말 탈퇴하시겠습니까?")){
				document.form1.action = "${pageContext.request.contextPath}/user/delete?number="+number;     /* ?number="+number; */
				document.form1.submit(); 
			}else{
				alert("회원탈퇴가 취소되었습니다");
				location.href="${pageContext.request.contextPath}/user/viewUser?number="+number;
				
			}
		});
	});
</script> 


</body>
</html>