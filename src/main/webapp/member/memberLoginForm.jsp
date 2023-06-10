<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY BLOG : LOGIN</title>

<!-- favicon -->
<link rel="icon" href="image/favicon.ico" />
<!-- css -->
<link href="css/memberLoginForm.css" rel="stylesheet" />
<!-- font awesome -->
<script src="https://kit.fontawesome.com/b3196b3d02.js" crossorigin="anonymous"></script>

</head>
<body>
	<div>
		<h1>
			<i class="fa-sharp fa-solid fa-blog"></i>
			<span><a href="bs?command=board_list">MY BLOG</a></span>
		</h1>
	</div>
	<form action="bs" method="POST">
	<input type="hidden" name="command" value="member_login">
		<h2>로그인</h2>
		<table>
			<tr>
				<td><input type="text" name="id" placeholder="아이디" required>
				<button type="submit">로그인</button></td>
			</tr>
			<tr>
				<td><input type="password" name="password" placeholder="비밀번호" required></td>
			</tr>
			<tr>
				<td>
					<a onclick="location.href='bs?command=member_join_form'">회원가입</a>
				</td>
			</tr>
			<tr>
				<td colspan="2">${message}</td>
			</tr>
		</table>
	</form>
</body>
</html>