<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY BLOG : JOIN</title>

<!-- favicon -->
<link rel="icon" href="image/favicon.ico" />
<!-- css -->
<link href="css/memberJoinForm.css" rel="stylesheet" />
<!-- font awesome -->
<script src="https://kit.fontawesome.com/b3196b3d02.js" crossorigin="anonymous"></script>
<!-- jQuery -->
<script type="text/javascript" src="./script/jquery-3.7.0.js"></script>

</head>
<body>
	<div>
		<h1>
			<i class="fa-sharp fa-solid fa-blog"></i>
			<span><a href="bs?command=board_list">MY BLOG</a></span>
		</h1>
	</div>
	<form action="bs" method="POST" name="memberJoinForm">
	<input type="hidden" name="command" value="member_join">
		<span>* 표시 항목은 필수입력 항목입니다.</span>
		<table>
			<tr>
				<td>
					<input type="text" name="id" placeholder="아이디 * " required>
					<input type="hidden" name="reId"> <!-- 중복체크 -->
					<button type="button" onclick="checkId()">중복체크</button>
				</td>
			</tr>
			<tr>
				<td><input type="password" name="password" placeholder="비밀번호 * " required></td>
			</tr>
			<tr>
				<td><input type="password" name="rePw" placeholder="비밀번호 확인 * " required></td>
			</tr>
			<tr>
				<td><input type="text" name="name" placeholder="이름 * " required></td>
			</tr>
			<tr>
				<td><input type="text" name="birthday" placeholder="생년월일 8자리 * " required></td>
			</tr>
			<tr>
				<td><input type="email" name="email" placeholder="이메일 * " required></td>
			</tr>
			<tr>
				<td><input type="tel" name="phone" placeholder="휴대전화번호 11자리 * " required></td>
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