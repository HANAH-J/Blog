package com.blog.action;

import java.io.IOException;

import com.blog.dao.MemberDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// 회원 아이디 중복체크 기능 수행 클래스
public class MemberJoinIdCheckAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");

		int result = MemberDAO.getInstance().selectIdCheck(id);

		request.setAttribute("id", id);
		request.setAttribute("result", result);
		// 1 : 가입불가, -1 : 가입가능

		request.getRequestDispatcher("member/memberIdCheckForm.jsp").forward(request, response);
	}
}