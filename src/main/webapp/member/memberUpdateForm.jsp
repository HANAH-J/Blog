<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>BLOG : MEMBER</title>
</head>
<body>
	<main>
		<!-- header -->
		<header>
			<h1>
				<i class="fa-sharp fa-solid fa-blog"></i>
				<br>
				<span><a href="bs?command=board_list">MY BLOG</a></span>
			</h1>
			<address>2023 HANA<br>ALL RIGHTS RESERVED.</address>
		</header>
		<h2>회원 정보 수정 페이지</h2>
		<form action="memberUpdate" method="POST" name="frm">
			<table>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="${loginUser.name}" readonly></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="userid" value="${loginUser.userid}" readonly></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="userpwd"></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" name="pwd_check"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email" value="${loginUser.email}"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="tel" name="phone" value="${loginUser.phone}"></td>
				</tr>
				<tr>
					<td>등급</td>
					<td>
						<c:if test="${loginUser.admin == 0}">
							<input type="radio" name="admin" value="0" checked>사용자
							<input type="radio" name="admin" value="1">관리자
						</c:if>
						<c:if test="${loginUser.admin == 1}">
							<input type="radio" name="admin" value="0">사용자
							<input type="radio" name="admin" value="1" checked>관리자
						</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="submit" onclick="return updateCheck()">정보 수정</button>
													   <!-- return : 함수의 결과가 true일 경우에만 동작 -->
						<button type="reset">입력 취소</button>
					</td>
				</tr>
			</table>
		</form>
	</main>
</body>
</html>