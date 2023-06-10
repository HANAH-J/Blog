<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블로그 : 아이디 중복 체크</title>
<script type="text/javascript" src="script/jquery-3.7.0.js"></script>
</head>
<body>
	<h2>아이디 중복 체크</h2>
	<form action="bs" method="GET" name="memberIdCheckForm">
	<input type="hidden" name="command" value="member_join_idCheck">
		<input type="text" name="id" value="${id}">
		<button type="submit">중복체크</button><br>
		
		<c:if test="${result == 1}"> <!-- 중복된 아이디 有 -->
			
			${id}는 이미 사용 중인 아이디 입니다.
		</c:if>
		<c:if test="${result == -1}"> <!-- 중복된 아이디 無 -->
			${id}는 사용 가능한 아이디 입니다.
			<button type="button" onclick="useId()">사용</button>
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