package com.blog.controller;

import com.blog.action.Action;
import com.blog.action.BoardDeleteAction;
import com.blog.action.BoardDetailAction;
import com.blog.action.BoardListAction;
import com.blog.action.BoardUpdateAction;
import com.blog.action.BoardUpdateFormAction;
import com.blog.action.BoardWriteAction;
import com.blog.action.BoardWriteFormAction;
import com.blog.action.CommentDeleteAction;
import com.blog.action.CommentListAction;
import com.blog.action.CommentUpdateAction;
import com.blog.action.CommentWriteAction;
import com.blog.action.MemberJoinAction;
import com.blog.action.MemberJoinFormAction;
import com.blog.action.MemberJoinIdCheckAction;
import com.blog.action.MemberLoginAction;
import com.blog.action.MemberLoginFormAction;
import com.blog.action.MemberLogoutAction;

public class ActionFactory {
	private ActionFactory() {}
	private static ActionFactory af = new ActionFactory();
	public static ActionFactory getInstance() {
		return af;
	}
	
	public Action getAction(String command) {
		Action action = null;
		
		if(command.equals("board_list")) {
			action = new BoardListAction();					// 게시물 목록보기
		}else if(command.equals("board_detail")) {
			action = new BoardDetailAction();				// 게시물 상세보기
		}else if(command.equals("board_write_form")) {
			action = new BoardWriteFormAction();			// 게시물 작성하기
		}else if(command.equals("board_write")) {
			action = new BoardWriteAction();				// 게시물 작성완료(DB 저장)
		}else if(command.equals("board_update_form")) {
			action = new BoardUpdateFormAction();			// 게시물 수정하기
		}else if(command.equals("board_update")) {
			action = new BoardUpdateAction();				// 게시물 수정완료(DB 저장)
		}else if(command.equals("board_delete")) {
			action = new BoardDeleteAction();				// 게시물 삭제하기(DB 저장)
		}else if(command.equals("comment_list")) {
			action = new CommentListAction();				// 댓글 목록보기
		}else if(command.equals("comment_write")) {
			action = new CommentWriteAction();				// 댓글 작성완료(DB 저장)
		}else if(command.equals("comment_update")) {
			action = new CommentUpdateAction();				// 댓글 수정완료(DB 저장)
		}else if(command.equals("comment_delete")) {
			action = new CommentDeleteAction();				// 댓글 삭제완료(DB 저장)
		}else if(command.equals("member_join_form")) {
			action = new MemberJoinFormAction();			// 회원가입
		}else if(command.equals("member_join")) {
			action = new MemberJoinAction();				// 회원가입 완료(DB 저장)
		}else if(command.equals("member_join_idCheck")) {
			action = new MemberJoinIdCheckAction();			// 회원 아이디 중복체크
		}else if(command.equals("member_login_form")) {
			action = new MemberLoginFormAction();			// 회원 로그인
		}else if(command.equals("member_login")) {
			action = new MemberLoginAction();				// 회원 로그인 완료(Session 저장)
		}else if(command.equals("member_logout")) {
			action = new MemberLogoutAction();				// 회원 로그아웃(Session 비우기)
		}
		
		return action;
	}
}