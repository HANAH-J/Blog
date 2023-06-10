package com.blog.action;

import java.io.IOException;
import java.util.List;

import com.blog.dao.BoardDAO;
import com.blog.vo.BoardVO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

// 게시물 목록보기 기능 수행 클래스
public class BoardListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// session 활용하여 서버 생성
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		// 게시물 페이징
		String _section = request.getParameter("section");
		String _pageNum = request.getParameter("pageNum");
		
		int section = Integer.parseInt((_section == null)? "1" : _section);
		int pageNum = Integer.parseInt((_section == null)? "1" : _pageNum);
		
		int totalCnt = BoardDAO.getInstance().selectAllNum(id);
		List<BoardVO> boardList = BoardDAO.getInstance().selectTargetBoards(id, section, pageNum);
		
		request.setAttribute("totalCnt", totalCnt);
		request.setAttribute("section", section);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("boardList", boardList);
		
		String url = "board/boardList.jsp";
		request.getRequestDispatcher(url).forward(request, response);
	}
}