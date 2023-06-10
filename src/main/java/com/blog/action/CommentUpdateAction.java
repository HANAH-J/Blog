package com.blog.action;

import java.io.IOException;
import java.io.PrintWriter;

import com.blog.dao.CommentDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

//댓글 수정완료(DB 저장) 기능 수행 클래스
public class CommentUpdateAction implements Action {

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
			int commentNum = Integer.parseInt(request.getParameter("commentNum"));
			String commentContent = request.getParameter("commentContent");
			
			CommentDAO.getInstance().commentUpdate(commentNum, commentContent);
		}
	}
}