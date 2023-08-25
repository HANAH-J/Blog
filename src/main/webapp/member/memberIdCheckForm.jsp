<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY DUCK : ID CHECK</title>

<!-- favicon -->
<link rel="icon" href="image/favicon.ico" />
<!-- css -->
<link href="css/memberIdCheckForm.css" rel="stylesheet" />
<!-- jQuery -->
<script type="text/javascript" src="script/jquery-3.7.0.js"></script>

</head>
<body>
	<h2>아이디 중복체크</h2>
	<form action="bs" method="GET" name="memberIdCheckForm">
		<input type="hidden" name="command" value="member_join_idCheck">
		<input type="text" name="id" value="${id}" autocomplete="off">
		<button type="submit" class="check">중복체크</button><br>
			
		<c:if test="${result == 1}"> <!-- 중복된 아이디 有 -->
			<div id="result1">
				<p>이미 사용 중인 아이디 입니다.</p>
			</div>
		</c:if>
		<c:if test="${result == -1}"> <!-- 중복된 아이디 無 -->
			<div id="result-1">
				<p>사용 가능한 아이디 입니다.</p>
				<button type="button" class="use" onclick="useId()">사용</button>
			</div>
		</c:if>
	</form>
</body>
<script type="text/javascript">
	function useId() {
		// 중복 확인된 아이디를 회원가입 폼에 넣어준다.
		opener.document.memberJoinForm.id.value = document.memberIdCheckForm.id.value;
		// 새로 열린 창 닫기
		self.close();
	}
</script>
</html>