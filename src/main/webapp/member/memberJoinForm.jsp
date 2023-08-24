<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY DUCK : JOIN</title>

<!-- favicon -->
<link rel="icon" href="image/favicon.ico" />
<!-- css -->
<link href="css/memberJoinForm.css" rel="stylesheet" />
<!-- jQuery -->
<script type="text/javascript" src="./script/jquery-3.7.0.js"></script>

</head>
<body>
	<div>
		<section>
			<a href="bs?command=board_list"><img src="image/logo.png"></a>
			<a href="bs?command=board_list">MY DUCK</a>
		</section>
	</div>
	<form action="bs" method="POST" name="memberJoinForm">
	<input type="hidden" name="command" value="member_join">
		<table>
			<tr>
				<td>
					<input type="text" name="id" placeholder="아이디" autocomplete="off" required>
					<input type="hidden" name="reId"> <!-- 중복체크 -->
					<button type="button" onclick="checkId()">중복체크</button>
				</td>
			</tr>
			<tr>
				<td><input type="password" name="password" placeholder="비밀번호" required></td>
			</tr>
			<tr>
				<td><input type="password" name="rePw" placeholder="비밀번호 확인" required></td>
			</tr>
			<tr>
				<td><input type="text" name="name" placeholder="닉네임" autocomplete="off" required></td>
			</tr>
			<tr>
				<td><input type="email" name="email" placeholder="이메일" autocomplete="off" required></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit">회원가입</button>
				</td>
			</tr>
		</table>
	</form>
</body>



<script type="text/javascript">
	// 아이디 입력 체크
	function checkId() {
		if(document.memberJoinForm.id.value.length == 0){
			alert('아이디를 입력해 주세요.');
			document.memberJoinForm.id.focus();
			return false;
		}
		
		let url = "bs?command=member_join_idCheck&id=" + document.memberJoinForm.id.value;
		
		window.open(url, "_blank1", "toolbar=no, menubar=no, scrollbars=yes, width=450, height=200");
	}
</script>
</html>