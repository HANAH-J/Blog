package com.blog.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.blog.dao.CommentDAO;
import com.blog.vo.CommentVO;
import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

// 댓글 목록보기 기능 수행 클래스
public class CommentListAction implements Action {

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
			
			List<CommentVO> commentList = CommentDAO.getInstance().selectCommentList(boardNum);	// 댓글 목록보기
			
			Gson gson = new Gson();
			String data = gson.toJson(commentList);
		    
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.print(data);
		}
	}
}