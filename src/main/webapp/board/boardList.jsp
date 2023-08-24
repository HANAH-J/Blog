<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="com.blog.vo.MemberVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>MY DUCK</title>

<!-- favicon -->
<link rel="icon" href="image/favicon.ico" />
<!-- css -->
<link href="css/boardList.css" rel="stylesheet" />

</head>
<body>
	<main>
		<!-- header -->
		<header>
			<section>
				<a href="bs?command=board_list"><img src="image/logo.png" alt="MY DUCK logo"></a>
				<a href="bs?command=board_list">MY DUCK</a>
			</section>
			<address>2023 HANAH-J<br>ALL RIGHTS RESERVED.</address>
		</header>
		
		
		
		<!-- nav -->
		<nav>
			<ul>
			<%
				MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
							
				if(loginMember == null || loginMember.getName() == null) {
			%>
				<li><a href="bs?command=member_login_form">로그인</a></li>
				<li><a href="bs?command=member_join_form">회원가입</a></li>
			<%
				}else {
			%>
				<li><a><%=loginMember.getName() %>님</a></li>
				<li><a href="bs?command=member_logout">로그아웃</a></li>
				<li><a href="bs?command=board_write_form">글쓰기</a></li>
			<%
				}
			%>
			</ul>
		</nav>
		
		
		
		<!-- section -->
		<section>
			<%	
				if(loginMember == null) {
			%>
				<p>※ 로그인하여 블로그를 이용하세요.</p>
			<%
				}else {
			%>
				<c:forEach var="board" items="${boardList}">
					<article>
						<div class="inner" onclick="location.href='bs?command=board_detail&boardNum=${board.boardNum}'">
							<div class="txt">
								<h2>${board.boardTitle}</h2>
								<p>${board.boardDate}</p>
								<p>${board.boardContent}</p>
								<figure></figure>
							</div>
						</div>
					</article>
				</c:forEach>
			<%
				}
			%>
		</section>
		
		
		
		<!-- aside - search -->
		<aside class="search">
			<form action="searchWordAction.me" method="GET">
				<div>검색</div>
				<div>
					<select name="option">
		                <option value="1" selected="selected">제목</option>
		                <option value="2">내용</option>
		            </select>
					<input type="text" placeholder="검색어를 입력하세요."/>
					<button type="submit">검색</button>
				</div>
			</form>
		</aside>
			
			
		
		<!-- pagination -->
		<footer>
			<ul>
				<c:if test="${totalCnt != null}">
					<c:choose>
						<c:when test="${totalCnt > 20}"> <!-- 최대 게시글 개수가 20개 이상인 경우 -->
							<c:if test="${(section *20) < totalCnt}"> <!-- 다음 섹션이 존재하는 경우 -->
								<c:forEach var="page" begin="1" end="5" step="1">
									<!-- 이전 섹션 가기 버튼 -->
									<c:if test="${section > 1 && page == 1}">
										<li><a href="bs?command=board_list&section=${section-1}&pageNum=10"> 이전 </a></li>
									</c:if>
									<li><a href="bs?command=board_list&section=${section}&pageNum=${page}">${(section-1)*4+page}</a></li>
									<!-- 다음 섹션 가기 버튼 -->
									<c:if test="${page == 5}">
										<li><a href="bs?command=board_list&section=${section+1}&pageNum=1"> 다음 </a></li>
									</c:if>
	                        	</c:forEach>
	                        </c:if>
	                        <c:if test="${(section *20) >= totalCnt}"> <!-- 다음 섹션이 존재하지 않는 경우 -->
								<c:forEach var="page" begin="1" end="${((totalCnt+3)-(section-1)*20)/4}" step="1">
									<!-- 이전 섹션 가기 버튼 -->
									<c:if test="${section > 1 && page == 1}">
										<li><a class="page-link" href="bs?command=board_list&section=${section-1}&pageNum=5"> 이전 </a></li>
									</c:if>
									<li><a href="bs?command=board_list&section=${section}&pageNum=${page}">${(section-1)*4+page}</a></li>
									<!-- 다음 섹션 가기 버튼 X -->
								</c:forEach>
							</c:if>
	                     </c:when>
	                     <c:when test="${totalCnt == 20}"> <!-- 최대 게시글이 20개인 경우 : 섹션 1개, 페이지번호 1 ~ 5까지 -->
	                     	<c:forEach var="page" begin="1" end="5" step="1">
	                     		<li><a href="bs?command=board_list&section=${section}&pageNum=${page}">${(section-1)*4+page}</a></li>
							</c:forEach>
						 </c:when>
						 <c:when test="${totalCnt < 20}"> <!-- 최대 게시글이 20개 미만인 경우 : 섹션 1개, 페이지번호 5보다 적은 수까지 -->
							<c:forEach var="page" begin="1" end="${(totalCnt +3)/4}" step="1">
								<li><a href="bs?command=board_list&section=${section}&pageNum=${page}">${page}</a></li>
							</c:forEach>
						 </c:when>
					</c:choose>
				</c:if>
			</ul>
		</footer>
	</main>
</body>
</html>