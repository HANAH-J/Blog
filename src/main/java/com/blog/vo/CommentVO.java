package com.blog.vo;

public class CommentVO {
	private int commentNum;
	private int boardNum;
	private String commentWriter;
	private String commentContent;
	private String CommentDate;
	
	public int getCommentNum() {
		return commentNum;
	}
	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getCommentWriter() {
		return commentWriter;
	}
	public void setCommentWriter(String commentWriter) {
		this.commentWriter = commentWriter;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public String getCommentDate() {
		return CommentDate;
	}
	public void setCommentDate(String commentDate) {
		CommentDate = commentDate;
	}
}