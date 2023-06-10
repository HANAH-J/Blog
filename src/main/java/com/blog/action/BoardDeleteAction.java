package com.blog.action;

import java.io.IOException;
import java.io.PrintWriter;

import com.blog.dao.BoardDAO;
import com.blog.dao.CommentDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

// 게시글 삭제완료(DB 저장) 기능 수행 클래스
public class BoardDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		if(id == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('로그인하여 블로그를 이용하세요!'); location.href='bs?command=member_login_form';</script>"); 
			writer.close();
		}else {
			int boardNum = Integer.parseInt(request.getParameter("boardNum"));
			
			BoardDAO.getInstance().deleteBoard(boardNum);
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('삭제 완료!'); location.href='bs?command=board_list';</script>"); 
			writer.close();
		}
	}
}