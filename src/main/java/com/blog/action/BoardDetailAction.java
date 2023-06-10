package com.blog.action;

import java.io.IOException;

import com.blog.dao.BoardDAO;
import com.blog.vo.BoardVO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// 게시물 상세보기 기능 수행 클래스
public class BoardDetailAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNum = Integer.parseInt(request.getParameter("boardNum"));
		
		BoardDAO.getInstance().updateReadCount(boardNum);					// 조회수 증가
		BoardVO bVo = BoardDAO.getInstance().selectBoardDetail(boardNum);	// 게시물 상세보기
		
		request.setAttribute("bVo", bVo);
		
		String url = "board/boardDetail.jsp";
		request.getRequestDispatcher(url).forward(request, response);
	}
}