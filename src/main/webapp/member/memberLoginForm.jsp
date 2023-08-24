<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY DUCK : LOGIN</title>

<!-- favicon -->
<link rel="icon" href="image/favicon.ico" />
<!-- css -->
<link href="css/memberLoginForm.css" rel="stylesheet" />

</head>
<body>
	<div>
		<section>
			<a href="bs?command=board_list"><img src="image/logo.png"></a>
			<a href="bs?command=board_list">MY DUCK</a>
		</section>
	</div>
	<form action="bs" method="POST">
	<input type="hidden" name="command" value="member_login">
		<table>
			<tr>
				<td><input type="text" name="id" placeholder="아이디" autocomplete="off" required></td>
			</tr>
			<tr>
				<td><input type="password" name="password" placeholder="비밀번호" required></td>
			</tr>
			<tr>
				<td><button type="submit">로그인</button></td>
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