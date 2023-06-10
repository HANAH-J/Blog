<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY BLOG : EDIT</title>

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
	<main>
		<div>
			<h1>
				<i class="fa-sharp fa-solid fa-blog"></i>
				<span><a href="bs?command=board_list">MY BLOG</a></span>
			</h1>
		</div>
		<form action="bs" method="POST">
		<input type="hidden" name="command" value="board_update">
			<table>
				<tr>
					<td colspan="3"><input type="text" name="boardTitle" value="${bVo.boardTitle}"></td>
				</tr>
				<tr>
					<td colspan="3">
						<textarea rows="10" cols="80" name="boardContent">${bVo.boardContent}</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<input type="hidden" name="boardNum" value="${bVo.boardNum}">
						<button type="button" onclick="goBack()">취소</button>
						<button type="submit">수정</button>
					</td>
				</tr>
			</table>
		</form>
	</main>
	
	
	
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