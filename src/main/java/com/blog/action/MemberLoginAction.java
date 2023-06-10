package com.blog.action;

import java.io.IOException;

import com.blog.dao.MemberDAO;
import com.blog.vo.MemberVO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

// 회원 로그인 완료(Session 저장) 기능 수행 클래스
public class MemberLoginAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 실패 시 이동 페이지
		String url = "bs?command=member_login_form";
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		int result = MemberDAO.getInstance().selectLogin(id, password);
		
		if(result == 1) {
			// 로그인 성공 시 해당 회원정보를 세션에 저장
			MemberVO mVo = MemberDAO.getInstance().selectMember(id);
			
			// 세션 객체 생성
			HttpSession session = request.getSession();
			
			// 세션 객체에 id 저장
			session.setAttribute("loginMember", mVo);
			session.setAttribute("id", id);
			session.setAttribute("name", mVo.getName());
			
			// 로그인 성공 시 이동 페이지
			url = "bs?command=board_list";
		}else if(result == 0) {
			request.setAttribute("message", "* 로그인 실패 : 아이디 또는 비밀번호가 틀렸습니다.");
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}