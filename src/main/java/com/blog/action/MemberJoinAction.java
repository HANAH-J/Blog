package com.blog.action;

import java.io.IOException;
import java.io.PrintWriter;

import com.blog.dao.MemberDAO;
import com.blog.vo.MemberVO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// 회원가입 완료(DB 저장) 기능 수행 클래스
public class MemberJoinAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 폼으로부터 읽어온 데이터를 데이터베이스에 저장
		MemberVO mVo = new MemberVO();
		
		mVo.setId(request.getParameter("id"));
		mVo.setPassword(request.getParameter("password"));
		mVo.setName(request.getParameter("name"));
		mVo.setEmail(request.getParameter("email"));

		MemberDAO.getInstance().insertMember(mVo);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		writer.println("<script>alert('회원가입 완료!'); location.href='bs?command=board_list';</script>"); 
		writer.close();
	}
}