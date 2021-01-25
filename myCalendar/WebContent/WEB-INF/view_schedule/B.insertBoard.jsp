<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/lang/summernote-ko-KR.js"></script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<meta charset="UTF-8">
<title>게시판</title>





 <!--  <script>
$(document).ready(function() {
	$('#summernote').summernote({ 
		lang: 'ko-KR', // default: 'en-US' 
		height: 500, // set editor height
		minHeight: 500, // set minimum height of editor 
		maxHeight: 500, // set maximum height of editor 
		focus: true, // set focus to editable area after initializing summe 
		callbacks: { 
			onImageUpload: function(files, editor, welEditable) { 
			for (var i = files.length - 1; i >= 0; i--) { 
				sendFile(files[i], this); 
				} 
			},
				onChange: function(contents, $editable) { 
					console.log('onChange:', contents, $editable); 
					
					new_img_list=$(".note-editable .sn_insert_img"); 
					if(old_img_list!='' &&new_img_list!='') 
					{ 
						note_image_sync(old_img_list,new_img_list); 
					} 
					old_img_list= $(".note-editable .sn_insert_img"); 
					
					}, 
					onBlur: function() { 
						console.log('Editable area loses focus'); 
						}, 
						onFocus: function() { 
							console.log('Editable area is focused'); 
							} 
						} 
	});
	$("#summernote").summernote({ 
		onMediaDelete : function($target, editor, $editable) { 
			alert($target.context.dataset.filename); $target.remove(); }
	})

});

	function sendFile(file, el) { 
		var form_data = new FormData(); 
		form_data.append('file', file);
		$.ajax({ 
			data: form_data, 
			headers : { 
				'X-CSRF-TOKEN': $("#csrf_token").val() 
				}, 
				type: "POST", 
				url: '/board/insert', 
				cache: false, 
				contentType: false, 
				enctype: 'multipart/form-data',
				processData: false, 
				async: false 
				}).done(function( msg ) {
					if(msg.result=='IMAGE_OK') 
					{ 
						var url = msg.url; 
						id = msg.id; 
						$(el).summernote('editor.insertImage', url,fun_summernote_imgcallback); 
						$('#imageBoard > ul').append('<li><img src="'+url+'" class="summernoteimg_obj" id="'+id+'" width="100%" height="100%"/></li>'); 
						} else { 
							showmessage("알림","이미지 파일이 아닙니다.",2000,''); 
							} 
					}); 
		}


</script>-->

<script>
$(document).ready(function() {
	  $('#summernote').summernote({
 	    	placeholder: 'content',
	        minHeight: 370,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR'
	  });
	});
</script>



</head>
<body>

	<h2 style="text-align: center;">게시글 작성</h2><br><br><br>

 	<div style="width: 80%; margin: auto;">

  <form action="${pageContext.request.contextPath}/board/insert" method="post">
 	게시글 제목 : <input id="title" type="text" name="boardTitle" style="width: 50%;" placeholder="제목"> <br> 
  	NAME : <input id="name" type="text" name="boardName" style="width: 30%;" placeholder="작성자">
  	PW : <input type="password" name="boardPassword" style="width: 30%;" placeholder="비밀번호"> <br>
  	
  <textarea id="summernote" name="boardContent"></textarea>
  	<input type="submit" style="float: right;" value="작성">

</form>

	</div>

</body>
</html>