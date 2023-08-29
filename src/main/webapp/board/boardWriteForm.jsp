<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>MY DUCK : WRITE</title>

<!-- summernote - jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- summernote - bootstrap -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- summernote - css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<!-- favicon -->
<link rel="icon" href="image/favicon.ico" />
<!-- css -->
<link href="css/boardWriteForm.css" rel="stylesheet" />

</head>
<body>
	<div>
		<section>
			<a href="bs?command=board_list"><img src="image/logo.png"></a>
			<a href="bs?command=board_list">MY DUCK</a>
		</section>
	</div>
	<form action="bs" method="POST">
	<input type="hidden" name="command" value="board_write">
		<table>
			<tr>
				<td>
					<input type="text" name="boardTitle" placeholder="제목을 입력하세요" autocomplete="off" spellcheck="false">
				</td>
			</tr>
			<tr>
				<td>
					<textarea id="summernote" name="boardContent"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" onclick="goBack()" class="btn">취소</button>
					<button type="submit" class="btn">완료</button>
				</td>
			</tr>
		</table>
	</form>
	
	
	
<script type="text/javascript">
	// 뒤로가기
	function goBack() {
		window.history.back();
	}
	
	// summernote 연동
	$(document).ready(function() {
        $('#summernote').summernote({
        	height: 480,
        	lang: 'ko-KR',
        	toolbar: [
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['picture','link']],
			    ['view', ['fullscreen', 'help']]
			  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
			callbacks: {
				onImageUpload: function(files) {
					const [imageFile] = files;
		            const fileReader = new FileReader();
		            fileReader.onload = () => {
		                 let imgData = $("<img>").attr('src', fileReader.result);
		                 imgData.attr('width', '100%');
		                $('#summernote').summernote("insertNode", imgData[0]);
		            };
		           fileReader.readAsDataURL(imageFile);
		        }
		    },
			disableResizeEditor: true
        });
        $('#summernote').summernote('fontName', '맑은 고딕');
        $('#summernote').summernote('fontSize', 11);
        $('#summernote').summernote('fontSizeUnit', 'pt');
        $('.note-statusbar').hide();
    });
	
	// DB 저장
	function sendFile(files, editor) {
		var data = new FormData();
		data.append("uploadFile", files);
		
		$.ajax({
			data: data,
			type: "POST",
			url: "bs?command=file_upload",
			cache : false,
			contentType : false,
			processData : false,
			success : function(data) {
				$(editor).summernote('editor.insertImage', data.url);
			}
		});
	}
</script>
</body>
</html>