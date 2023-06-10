package com.blog.action;

import java.io.IOException;
import java.io.PrintWriter;

import com.blog.dao.BoardDAO;
import com.blog.vo.BoardVO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

// 게시물 작성완료(DB 저장) 기능 수행 클래스
public class BoardWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		// 게시글 작성하기 뷰 페이지 (board/boardWriteForm.jsp) -> 작성 데이터를 DB에 저장
		BoardVO bVo = new BoardVO();

		bVo.setBoardTitle(request.getParameter("boardTitle"));
		bVo.setBoardContent(request.getParameter("boardContent"));

		BoardDAO.getInstance().insertBoard(id, bVo);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		writer.println("<script>alert('작성 완료!'); location.href='bs?command=board_list';</script>"); 
		writer.close();
	}
}