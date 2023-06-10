package com.blog.action;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

// 회원 로그아웃(Session 비우기) 기능 수행 클래스
public class MemberLogoutAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		
		String url = "bs?command=board_list";
		
		request.getRequestDispatcher(url).forward(request, response);
	}
}