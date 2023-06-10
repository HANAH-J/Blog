<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="com.blog.vo.MemberVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>MY BLOG : READ</title>

<!-- favicon -->
<link rel="icon" href="image/favicon.ico" />
<!-- css -->
<link href="css/boardDetail.css" rel="stylesheet" />
<!-- font awesome -->
<script src="https://kit.fontawesome.com/b3196b3d02.js" crossorigin="anonymous"></script>
<!-- jQuery -->
<script type="text/javascript" src="script/jquery-3.7.0.js"></script>

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
	
	
	
		<!-- nav -->
		<nav>
			<ul>
			<%
				MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
							
				if(loginMember == null) {
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
	
	
	
		<!-- section - board -->
		<section class="board">
			<article>
				<h1>${bVo.boardTitle}</h1>
				<p>${bVo.boardDate}</p>
				<p>조회수 ${bVo.readCount}</p>
				<div class="boardContent">
					<p>${bVo.boardContent}</p>
				</div>
			</article>
		</section>
	
	
	
		<!-- section - comment -->
		<section class="comment">
			<form>
			<%		
				if(loginMember == null) {
			%>
				
			<%
				}else {
			%>
				<textarea name="commentContent" id="commentContent" placeholder="댓글을 입력하세요"></textarea>
				<button type="button" onclick="commentWrite()">완료</button>
			<%
				}
			%>
			</form>
			<article id="commentList">
				<c:forEach var="comment" items="${commentList}"></c:forEach>
			</article>
		</section>
	
	
	
		<!-- footer -->
		<footer>
			<%			
				if(loginMember != null) {
			%>
				<a href="bs?command=board_update_form&boardNum=${bVo.boardNum}" class="btn">수정</a>
				<a href="bs?command=board_delete&boardNum=${bVo.boardNum}" class="btn">삭제</a>
				<a href="bs?command=board_list" class="btn">목록</a>
				<input type="hidden" name="boardNum" id="boardNum" value="${bVo.boardNum}">
			<%
				}
			%>
			
		</footer>
	</main>
	
	
	
<script type="text/javascript">
	// 페이지 로드 시 댓글 목록보기
	$(document).ready(function() {
		commentList();
	});
	
	// 댓글 목록보기[ajax]
	function commentList() {
		$.ajax({
			url: "bs?command=comment_list",
			type: "GET",
			data: {
				boardNum: ${bVo.boardNum}
			},
			dataType: "JSON",
			success: function(commentList) {
				// 댓글 목록보기 새로고침
				$('#commentList').empty(); // #commentList 내부 비우기
				for(let i in commentList){
					let name = "<%=loginMember.getName()%>";
					
					// 로그인 상태 시 본인 댓글 수정-삭제 버튼 생성
					if(name === commentList[i].commentWriter) {
						// 댓글 목록보기[HTML]
						let liNum = $('<li></li>').attr('commentNum', commentList[i].commentNum);
						let spanWriter = $('<span></span>').html(commentList[i].commentWriter);
						let spanDate = $('<span></span>').html(commentList[i].commentDate);
						let btnUpdate = $('<button></button>').attr('type', 'button')
															  .attr('onclick', 'commentUpdate(this)')
															  .attr('class', 'btn')
															  .html('수정')
															  ;
						let btnDelete = $('<button></button>').attr('type', 'button')
															  .attr('onclick', 'commentDelete(this)')
															  .attr('class', 'btn')
															  .html('삭제');
						let textareaContent = $('<textarea></textarea>').html(commentList[i].commentContent);
						
						// 댓글 목록보기[HTML] 출력
						liNum.append(spanWriter);
						liNum.append(spanDate);
						spanDate.append(btnUpdate);
						spanDate.append(btnDelete);
							
						liNum.append('<br>');
						liNum.append(textareaContent);
							
						$('#commentList').append(liNum);
						
					// 로그아웃 상태 시 댓글 수정-삭제 불가
					}else if(name !== commentList[i].commentWriter){
						// 댓글 목록보기[HTML]
						let liNum = $('<li></li>').attr('commentNum', commentList[i].commentNum);
						let spanWriter = $('<span></span>').html(commentList[i].commentWriter);
						let spanDate = $('<span></span>').html(commentList[i].commentDate);
						let textareaContent = $('<textarea></textarea>').attr('readonly', 'readonly')
														  				.html(commentList[i].commentContent);
						
						// 댓글 목록보기[HTML] 출력
						liNum.append(spanWriter);
						liNum.append(spanDate);
							
						liNum.append('<br>');
						liNum.append(textareaContent);
						
						$('#commentList').append(liNum);
					}
				}
			}
		});
	}
	
	// 댓글 작성하기[ajax]
	function commentWrite() {
		$.ajax({
			url: "bs?command=comment_write",
			type: "POST",
			data: {
				boardNum : ${bVo.boardNum},
				commentContent : $('#commentContent').val()
			},
			success: function() {
				// console.log("성공");
				location.reload();
			}
		});
	}
	
	// 댓글 수정완료(DB 저장)[ajax]
	function commentUpdate(obj) {
		let commentNum = $(obj).parent().parent().attr('commentNum');
		let contentContent = $(obj).parent().parent().children(':last').val();
		//				버튼	 span	  li	   마지막 자식요소:textarea
		
		$.ajax({
			type: "POST",
			url: "bs?command=comment_update",
			data: {
				"commentNum": commentNum,
				"commentContent": contentContent
			},
			success: function() {
				alert('댓글 수정 완료');
				commentList(); // 댓글 목록보기 새로고침
			}
		});
	}
	
	// 댓글 삭제완료(DB 저장)[ajax]
	function commentDelete(obj) {
		let commentNum = $(obj).parent().parent().attr('commentNum');
		
		$.ajax({
			type: "POST",
			url: "bs?command=comment_delete",
			data: {
				commentNum: commentNum
			},
			success: function() {
				alert('댓글 삭제 완료');
				commentList(); // 댓글 목록보기 새로고침
			}
		});
	}
</script>
</body>
</html>