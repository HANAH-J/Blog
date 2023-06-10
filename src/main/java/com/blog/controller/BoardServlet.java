package com.blog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.blog.action.Action;

public class BoardServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doService(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doService(request, response);
	}
	
	private void doService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션 가져오기
		HttpSession session = request.getSession();
		
		// 페이지 요청 : localhost:8085/web12Board/bs?command='xxxxxxx';
		String command = request.getParameter("command");
		
		// ActionFactory = command 값을 가지고 해당 기능을 가진 클래스를 찾아주는 역할
		ActionFactory af = ActionFactory.getInstance();
		
		// 인터페이스 타입 action = af.getAction(command);
		Action action = af.getAction(command);
		
		// action.기능수행();
		if(action != null) {
			action.execute(request, response);
		}
	}
}