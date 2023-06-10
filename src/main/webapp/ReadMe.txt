<블로그>

----------------------------------------------------------------------------------------------------

1. 준비 작업
  1) 라이브러리 복사										----- 완
     - jstl.jar : HTML 코드 내 스크립트릿 사용
     - ojdbj8.jar : 오라클 데이터베이스 연결
     - gson.jar : Json 파싱 및 생성
     
  2) 데이터베이스 구축										----- 완
     - 테이블(blogBoardTbl / blogMemberTbl / blogCommentTbl) 생성
     - 시퀀스(blogBoardTbl_seq / blogCommentTbl_seq) 생성
     
  3) DBCP(커넥션 풀) 세팅									----- 완
     - server.xml : <Context>[작성]</Context>
     
  4) WEB-INF/web.xml 파일 내 코드 추가						----- 완
     <servlet-mapping>
     	<servlet-name>default</servlet-name>
     	<!-- js 및 css 확장자 추가 -->
  		<url-pattern>*.js</url-pattern>
	    <url-pattern>*.css</url-pattern>
	    <url-pattern>*.jpg</url-pattern>
	    <url-pattern>*.ico</url-pattern>
	    <url-pattern>*.gif</url-pattern>
	    <url-pattern>*.png</url-pattern>
	    <url-pattern>*.html</url-pattern>
	 </servlet-mapping>
     
----------------------------------------------------------------------------------------------------
        
2. 클래스 생성
  1) DBManager : DB 연결 및 해제를 담당						----- 완
  2) VO : DB 컬럼과 일치									----- 완
  3) DAO : 싱글톤 패턴										----- 완
  4) Controller : 대표 서블릿 및 클래스						----- 완
     - ActionFactory.java(요청 - 로직 연결 클래스)
     - BoardServlet.java(요청 전담 서블릿) [매핑 - bs]
  5) Action : 로직 처리용 인터페이스							----- 완
  
----------------------------------------------------------------------------------------------------

3-1. 기능 제작 : 게시물
  1) 게시물 목록보기										----- 완
     - index.html 링크
     - 기능 수행 명령어(command = 'board_list')
     - 기능 수행 클래스 (BoardListAction.java)
     - DAO 게시물 목록보기 메서드 (selectBoardList())
     - 게시물 목록보기 뷰 페이지 (board/boardList.jsp)
     
  2) 게시물 상세보기										----- 완
     - 게시물 목록보기 뷰 페이지 (board/boardList.jsp) -> '더보기' 클릭
     - 기능 수행 명령어 (command = 'board_detail')
     - 기능 수행 클래스 (BoardDetailAction.java)
     - DAO 조회수 증가 메서드(updateReadCount(num))
     - DAO 게시물 상세보기 메서드(selectBoardDetail(num))
     - 게시물 상세보기 뷰 페이지 (board/boardDetail.jsp)
     
  3) 게시글 작성하기(글쓰기) 기능							----- 완
     - 게시물 목록보기 뷰 페이지 (board/boardList.jsp) -> '글쓰기' 클릭
     - 기능 수행 명령어 (command = 'board_write_form')
     - 기능 수행 클래스 (BoardWriteFormAction.java)
     - 게시글 작성하기 뷰 페이지 (board/boardWriteForm.jsp)	
     
     - 게시글 작성하기 뷰 페이지 (board/boardWriteForm.jsp) -> '완료' 클릭
     - 기능 수행 명령어 (command = 'board_write')
     - 기능 수행 클래스 (BoardWriteAction.java)
     - DAO 게시물 목록 조회 메서드 (insertBoard(bVo))
     - 게시물 목록보기 뷰 페이지 (board/boardList.jsp)
     
     - CKEditor4 연동 (https://ckeditor.com/cke4/builder)
     - 설정 : Full Preset / Default Plugins / Moono-Lisa Skin / English, Korean
     - CKEditor4.10.1.zip 파일 압축 해제 및 webapp 하위 영역으로 복사
     - 게시글 작성하기 뷰 페이지 (board/boardWriteForm.jsp) <head> 태그 내 코드 추가
       <script type="text/javascript" src="script/jquery-3.7.0.js"></script>
	   <script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
	 - <body> 태그 내 <textarea name="content"> 태그 및 코드 추가
	   $(function () {
			CKEDITOR.replace('content', {
				filebrowserUploadUrl : '${pageContext.request.contextPath}/adm/fileupload.do'
			});
		});
		
	 - CKEditor4 이미지 업로드 연동
	 - Servers/tomcat/server.xml 파일 내 코드 추가
	   <Context docBase="C:\Upload\ckeditor" path="/upload/" reloadable="true"/>
     
  4) 게시글 수정하기 기능									----- 완
     - 게시물 상세보기 뷰 페이지 (board/boardDetail.jsp) -> '수정' 클릭
     - 기능 수행 명령어 (command = 'board_update_form')
     - 기능 수행 클래스 (BoardUpdateFormAction.java)
     - DAO 게시글 수정하기 메서드(selectBoardDetail(num))
     - 게시물 수정하기 뷰 페이지 (board/boardUpdateForm.jsp)
 
     - 게시물 수정하기 뷰 페이지 (board/boardUpdateForm.jsp) -> '완료' 클릭
     - 기능 수행 명령어 (command = 'board_update')
     - 기능 수행 클래스 (BoardUpdateeAction.java)
     - DAO 게시글 삭제 메서드(updateBoard(bVo))
     - 게시물 목록보기 뷰 페이지 (board/boardList.jsp)
    
  5) 게시글 삭제하기 기능									----- 완
     - 게시물 상세보기 뷰 페이지 (board/boardDetail.jsp) -> '삭제' 클릭
     - 기능 수행 명령어 (command = 'board_delete')
     - 기능 수행 클래스 (BoardDeleteAction.java)
     - DAO 게시글 삭제 메서드(deleteBoard(num))
     - 게시물 목록보기 뷰 페이지 (board/boardList.jsp)
     
  6) 페이징											----- 완
     - 페이지(한 화면에 보여질 게시물 목록) : 페이지 당 4개의 게시물
       └ (페이지번호 -1) *4 +1 ~ (페이지번호) *4
     
     - 섹션(여러 페이지의 그룹)		  : 섹션 당 20개의 게시물
	   └ (섹션번호 -1) *20 +1 ~ (섹션번호) *20
	
	- DAO 전체 게시물 수 조회 메서드 (selectAllNum(id))
	- DAO 특정 페이지 게시물 조회 메서드 (selectTargetBoards(id, section, pageNum))
	- 게시물 목록보기 클래스 수정 - 페이지번호 및 섹션번호 전달 (BoardListAction.java)
	- 게시물 목록보기 뷰 페이지 수정 (board/boardList.jsp)
     
----------------------------------------------------------------------------------------------------

3-2. 기능 제작 : 댓글
  1) 댓글 목록보기[ajax]									----- 완
     - 기능 수행 명령어(command = 'comment_list')
     - 기능 수행 클래스 (CommentListAction.java)
     - DAO 댓글 목록보기 메서드 (selectCommentList())
     - 댓글 목록보기 뷰 페이지 (board/boardDetail.jsp)
     
  2) 댓글 작성하기 기능[ajax]								----- 완
     - 기능 수행 명령어(command = 'comment_write')
     - 기능 수행 클래스 (CommentWriteAction.java)
     - DAO 댓글 작성하기 메서드 (commentWrite(cVo))
     - 댓글 작성하기 뷰 페이지 (board/boardDetail.jsp)
     
  3) 댓글 수정하기 기능[ajax]								----- 완
     - 기능 수행 명령어(command = 'comment_update')
     - 기능 수행 클래스 (CommentUpdateAction.java)
     - DAO 댓글 수정하기 메서드 (commentUpdate(commentNum, commentContent))
     - 댓글 작성하기 뷰 페이지 (board/boardDetail.jsp)
  
  4) 댓글 삭제하기 기능[ajax]								----- 완
     - 기능 수행 명령어(command = 'comment_delete')
     - 기능 수행 클래스 (CommentDeleteAction.java)
     - DAO 댓글 수정하기 메서드 (commentDelete(commentNum))
     - 댓글 작성하기 뷰 페이지 (board/boardDetail.jsp)
     
----------------------------------------------------------------------------------------------------

3-3. 기능 제작 : 회원
  1) 회원가입											----- 완
     - 게시물 목록보기 뷰 페이지 (board/boardList.jsp) -> '회원가입' 클릭
     - 기능 수행 명령어 (command = 'member_join_form')
     - 기능 수행 클래스 (MemberJoinFormAction.java)
     - DAO 아이디 중복체크 메서드(selectIdCheck())
     
     - 회원가입 뷰 페이지 (member/memberJoinForm.jsp) -> '회원가입' 클릭
     - 기능 수행 명령어 (command = 'member_join')
     - 기능 수행 클래스 (MemberJoinAction.java)
     - DAO 회원가입 메서드(insertMember(mVo))
     - 게시물 목록보기 뷰 페이지 (board/boardList.jsp)
 
  2) 회원수정
     - 게시물 목록보기 뷰 페이지 (board/boardList.jsp) -> '이름' 클릭
     - 기능 수행 명령어 (command = 'member_update_form')
     - 기능 수행 클래스 (MemberUpdateFormAction.java)
     
     - 회원수정 뷰 페이지 (member/memberUpdateForm.jsp)							----- 수정
     - 기능 수행 명령어 (command = 'member_update')
     - 기능 수행 클래스 (MemberUpdate.java)
     - DAO 회원가입 메서드(updateMember(mVo))
     - 게시물 목록보기 뷰 페이지 (board/boardList.jsp)
     
  3) 로그인											----- 완
     - 게시물 목록보기 뷰 페이지 (board/boardList.jsp) -> '로그인' 클릭
     - 기능 수행 명령어 (command = 'member_login_form')
     - 기능 수행 클래스 (MemberLoginFormAction.java)
     - DAO 로그인 메서드(selectLogin(id, password))
     - 게시물 목록보기 뷰 페이지 (board/boardList.jsp)
     
   4) 로그아웃											----- 완
     - 게시물 목록보기 뷰 페이지 (board/boardList.jsp) -> '로그아웃' 클릭
     - 기능 수행 명령어 (command = 'member_logout')
     - 기능 수행 클래스 (MemberLogoutAction.java)
     - 게시물 목록보기 뷰 페이지 (board/boardList.jsp)
     
   5) 로그인 및 로그아웃 상태 점검							----- 완
      - 로그인 : 회원가입, 로그인 주소 접근 불가
      - 로그아웃 :	게시물 목록보기, 작성하기, 수정하기, 삭제하기 접근 불가
      			댓글 목록보기, 작성하기, 수정하기, 삭제하기 접근 불가