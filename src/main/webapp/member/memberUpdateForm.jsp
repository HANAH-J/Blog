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
		<h2>ȸ�� ���� ���� ������</h2>
		<form action="memberUpdate" method="POST" name="frm">
			<table>
				<tr>
					<td>�̸�</td>
					<td><input type="text" name="name" value="${loginUser.name}" readonly></td>
				</tr>
				<tr>
					<td>���̵�</td>
					<td><input type="text" name="userid" value="${loginUser.userid}" readonly></td>
				</tr>
				<tr>
					<td>��й�ȣ</td>
					<td><input type="password" name="userpwd"></td>
				</tr>
				<tr>
					<td>��й�ȣ Ȯ��</td>
					<td><input type="password" name="pwd_check"></td>
				</tr>
				<tr>
					<td>�̸���</td>
					<td><input type="email" name="email" value="${loginUser.email}"></td>
				</tr>
				<tr>
					<td>��ȭ��ȣ</td>
					<td><input type="tel" name="phone" value="${loginUser.phone}"></td>
				</tr>
				<tr>
					<td>���</td>
					<td>
						<c:if test="${loginUser.admin == 0}">
							<input type="radio" name="admin" value="0" checked>�����
							<input type="radio" name="admin" value="1">������
						</c:if>
						<c:if test="${loginUser.admin == 1}">
							<input type="radio" name="admin" value="0">�����
							<input type="radio" name="admin" value="1" checked>������
						</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="submit" onclick="return updateCheck()">���� ����</button>
													   <!-- return : �Լ��� ����� true�� ��쿡�� ���� -->
						<button type="reset">�Է� ���</button>
					</td>
				</tr>
			</table>
		</form>
	</main>
</body>
</html>