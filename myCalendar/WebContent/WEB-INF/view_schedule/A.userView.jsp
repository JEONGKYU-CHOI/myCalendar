<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 상세 페이지</title>
</head>
<body>
<%--  <%@ include file="../include/user_menu.jsp" %> --%>

<h2>회원 정보 상세 내용</h2>

<form action="${pageContext.request.contextPath}/user/viewUser" name="form1" method="post">
<%-- 
	회원번호:${user.number} <br>
	이름: ${user.name} <br>
	회원 아이디 :${user.id} <br>
	전화번호 :${user.phone} <br>
	이메일:${user.email} <br> --%>
	
	<table border=1 width="400px">
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
		<td colspan="2" align="center">
			<input type="button" value="회원 정보 수정" id="btnUpdate">
	<%-- <a href="delete?number=${user.number}"><input type="button" value="회원 탈퇴" id="btnDelete"></a> --%>
	<%-- 	<input type="button" value="${user.number}" id="btnDelete" > --%>
			<input type="button" value="회원탈퇴" id="btnDelete" >
	
	<%-- 	<a href="delete?number=${user.number}"><input type="button" value="회원탈퇴" id="btnDelete" ></a> --%>
	<%-- <button><a href="delete?number=${user.getNumber()}">${user.getNumber()} 회원번호 회원탈퇴</a></button> --%>
	<%-- <div style="color:red">${message}</div> --%>
		</td>
	</tr>
	
	
	</table>
<br>
<p><a href="${pageContext.request.contextPath}/user/test">마이페이지로</a></p>
</form>
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