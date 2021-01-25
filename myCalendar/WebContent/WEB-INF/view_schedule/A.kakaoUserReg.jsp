<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>kakaoUserReg.jsp</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/user/kakaoAdd" method="post">
<!-- 컨텍스트패스 추가함.-->
<!-- 아이디 -->
	<div class="form-group">
		<label for="id">아이디</label>
		<input type="text" class="form-control" id="id" name="id" placeholder="ID" required>
		<div class="check-font" id="id_check"></div> 
	<!--미리 div통해 경고문이 들어갈 공간을 만들어둔다.  -->		
	</div>
	
	<!-- 비밀번호-->
	<div class="form-group">
		<label for="user_pwd">비밀번호</label>
		<input type="password" class="form-control" id="pwd1" name="password" placeholder="패스워드" required>
		<div class="check-font" id="pwd_check"></div>			
	</div>
	<!-- 비밀번호재확인-->
	<div class="form-group">
		<label for="user_pwd2">비밀번호 재확인</label>
		<input type="password" class="form-control" id="pwd2" name="password2" placeholder="패스워드" required>
		<div class="check-font" id="pwd2_check"></div>			
	</div>

	<!-- 이름--> 
	<div class="form-group">
		<label for="user_name">회원이름</label>
			<input type="text" class="form-control" id="name" name="name" placeholder="이름" value="${param.nickname}" required>
		<div class="check-font" id="name_check"></div>			
	</div>
	<!-- 휴대전화--> 
	<div class="form-group">
		<label for="user_phone">휴대폰번호('-'를 포함해서 입력해주세요)</label>
			<input type="tel" class="form-control" id="phone" name="phone" placeholder="휴대폰번호">
		<div class="check-font" id="phone_check"></div>			
	</div>
	<!--본인확인 이메일--> 
	<div class="form-group">
		<label for="user_email">이메일</label>
			<input type="email" class="form-control" id="email" name="email" value="${email}" readonly="readonly">
		<div class="check-font" id="email_check"></div>			
	</div>
	
	<div class="reg_button">
		<a class="btn btn-danger px-3" href="${pageContext.request.contextPath}">
			<i class="fa fa-rotate-right pr-2" aria-hidden="true"></i> 취소하기
		</a>&emsp;&emsp;
		<button class="btn btn-primary px-3" id="reg_submit">
			<i class="fa fa-heart pr-2" aria-hidden="true"></i>가입하기
		</button>
	</div>
	
</form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
    //정규식 패턴을 각각의 변수에 저장함. 
    //모든 공백체크 정규식
	var empJ=/\s/g;
    
    //비밀번호 정규식 : A-Z, a-z, 0-9로 시작하는 4~12자리 비번을 설정가능
    var pwJ = /^[A-Za-z0-9]{4,12}$/;
    
    //이름 정규식 : 가~힣 한글로 이루어진 문자만으로 2-6자리 이름을 적어야 함
    var nameJ = /^[가-힣]{2,6}$/;
    
    //이메일 검사 정규식 : 중앙에 @필수이고 @뒤에 2~3자리 더 필요. 언더바 등 특수문자 표기 가능.
    var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    
    //휴대폰번호 정규식 : - 포함하고 01()방식으로 중앙에 3~4자리, 마지막 4자리 필수
    var phoneJ = /^01([0|1|6|7|8|9]?)[-](\d{4}|\d{3})[-]\d{4}$/;
	
    //비밀번호 유효성 검사및 정규식 체크
    $('#pwd1').blur(function(){
    	if(pwJ.test($('#pwd1').val())){
    		console.log('true');
    		$('#pwd_check').text('');
    	}else{
    		console.log('false');
    		$('#pwd_check').text('숫자 또는 문자로 4~12자리 입력가능합니다!');
    		$('#pwd_check').css('color', 'red');
    	}
    });
    
    //비번 재확인 일치 여부
    $('#pwd2').blur(function(){
    	if($('#pwd1').val() != $(this).val()){
    		$('#pwd2_check').text('비밀번호가 일치 하지 않습니다!');
    		$('#pwd2_check').css('color', 'red');
    	}else{
    		$('#pwd2_check').text('');
    	}
    	
    });
    
    //이름 정규식 일치 여부 : 이름에 특수문자가 들어가지 않도록함
    $('#name').blur(function(){
    	if(nameJ.test($(this).val())){
    		console.log(nameJ.test($(this).val()));
    		$("#name_check").text('');
    	}else{
    		$('#name_check').text('이름을 확인해주세요!');
    		$('#name_check').css('color', 'red');
    	}
    })
    
    //휴대폰번호 정규식
    $('#phone').blur(function(){
    	if(phoneJ.test($(this).val())){
    		console.log(phoneJ.test($(this).val()));
    		$("#phone_check").text('');
    	}else{
    		$('#phone_check').text('휴대폰번호를 확인해 주세요 :)');
    		$('#phone_check').css('color', 'red');
    		$("#reg_submit").attr("disabled", true);
    	}
    });
	
    //Email정규식
    $('#email').blur(function(){
    	if(mailJ.test($(this).val())){
    		console.log(mailJ.test($(this).val()));
    		$("#email_check").text('');
    	}else if($('#email').val() == ""){
			$('#email_check').text('이메일을 입력하지 않으면 가입할 수 없습니다. 처음부터 다시 진행해주세요');
			$('#email_check').css('color', 'red');
			$("#reg_submit").attr("disabled", true);	
    		
    	}else{
    		$('#email_check').text('이메일을 형식에 맞게 입력해주세요!');
    		$('#email_check').css('color', 'red');
    		$("#reg_submit").attr("disabled", true);
    	
    	} 
    });
	
   

/* ajax 이용 ID유효성 검사  1=중복, 0 != 중복 */

 	//id 정규식
 	var idJ=/^[a-z0-9]{4,12}$/;

 	/*id유효성 검사  */
	$("#id").blur(function(){
		/*id="id" , name="id"*/
		var id = $("#id").val();
		$.ajax({
			url:'${pageContext.request.contextPath}/user/idCheck?id='+id,
			type: 'get',
			success: function(data){
				console.log("1=중복o /0 = 중복x : " +data);
				
				if(data == 1){
					//1 : id가 중복되는 문구
					$("#id_check").text("이미 사용중인 아이디입니다!");
					$("#id_check").css("color","red");
					$("#reg_submit").attr("disabled", true);
					
				}else{
					
					if(idJ.test(id)){
						//0 : 아이디 길이/문자열 검사
						$("#id_check").text("");
						$("#reg_submit").attr("disabled", false);
						
					}else if(id == ""){
						
						$("#id_check").text("id를 입력해주세요");
						$("#id_check").css("color","red");
						$("#reg_submit").attr("disabled", true);
						
					}else {
						
						$("#id_check").text("아이디는 소문자와 숫자포함 4~12자리만 가능합니다! :)");
						$("#id_check").css("color","red");
						$("#reg_submit").attr("disabled", true);
					}
				}
			}, error : function(){
				console.log("실패");
			}
		});
	});
	

</script>

</body>
</html>