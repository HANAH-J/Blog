package com.blog.action;

import java.io.IOException;

import com.blog.dao.CommentDAO;
import com.blog.vo.CommentVO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

// 댓글 작성완료(DB 저장) 기능 수행 클래스
public class CommentWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("name");
		
		CommentVO cVo = new CommentVO();
		
		cVo.setBoardNum(Integer.parseInt(request.getParameter("boardNum")));
		cVo.setCommentWriter(name);
		cVo.setCommentContent(request.getParameter("commentContent"));
		
		CommentDAO.getInstance().commentWrite(cVo);
	}
}