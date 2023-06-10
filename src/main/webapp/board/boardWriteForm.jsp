<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY BLOG : WRITE</title>

<!-- favicon -->
<link rel="icon" href="image/favicon.ico" />
<!-- css -->
<link href="css/boardWriteForm.css" rel="stylesheet" />
<!-- font awesome -->
<script src="https://kit.fontawesome.com/b3196b3d02.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="script/jquery-3.7.0.js"></script>
<!-- CKEditor -->
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>

</head>
<body>
	<div>
		<h1>
			<i class="fa-sharp fa-solid fa-blog"></i>
			<span><a href="bs?command=board_list">MY BLOG</a></span>
		</h1>
	</div>
	<form action="bs" method="POST">
	<input type="hidden" name="command" value="board_write">
		<table>
			<tr>
				<td>
					<input type="text" name="boardTitle" placeholder="제목을 입력하세요">
				</td>
			</tr>
			<tr>
				<td>
					<textarea name="boardContent"></textarea>
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
	
	// CKEditor 연동
	$(function () {
		CKEDITOR.replace('boardContent', {
			// filebrowserUploadUrl : '${pageContext.request.contextPath}/ckEditorFileUpload',
			// filebrowserUploadMethod: 'form',
			width: '1100px',
			height: '500px'
		});
	});
</script>
</body>
</html>