package com.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.blog.db.DBManager;
import com.blog.vo.CommentVO;

public class CommentDAO {
	private CommentDAO() {}
	private static CommentDAO dao = new CommentDAO();
	public static CommentDAO getInstance() {
		return dao;
	}
	
	// [댓글] 댓글 목록보기 메서드
	public List<CommentVO> selectCommentList(int boardNum) {
		List<CommentVO> commentList = new ArrayList<>();
			
		String sql = "SELECT * FROM blogCommentTbl WHERE boardNum = ? ORDER BY commentNum ASC";
			
		Connection conn  = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
			
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, boardNum);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				CommentVO cVo = new CommentVO();
				
				cVo.setCommentNum(rs.getInt("commentNum"));
				cVo.setBoardNum(rs.getInt("boardNum"));
				cVo.setCommentWriter(rs.getString("commentWriter"));
				cVo.setCommentContent(rs.getString("commentContent"));
				cVo.setCommentDate(rs.getString("commentDate"));
					
				// 조회된 결과 list 객체에 저장
				commentList.add(cVo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, psmt, rs);
		}
		return commentList;
	}
	
	// [댓글] 댓글 등록하기 메서드
	public void commentWrite(CommentVO cVo) {
		String sql = "INSERT INTO blogCommentTbl VALUES(blogCommentTbl_seq.nextval, ?, ?, ?, TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS'))";
		
		Connection conn = null;
		PreparedStatement psmt = null;
				
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
					
			psmt.setInt(1, cVo.getBoardNum());
			psmt.setString(2, cVo.getCommentWriter());
			psmt.setString(3, cVo.getCommentContent());
					
			psmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, psmt);
		}
	}
	
	// [댓글] 댓글 수정완료(DB 저장) 메서드
		public void commentUpdate(int commentNum, String commentContent) {
			Connection conn = null;
			PreparedStatement psmt = null;
					
			try {
				String sql = "UPDATE blogCommentTbl SET commentContent = ? WHERE commentNum = ?";
						
				conn = DBManager.getConnection();
				psmt = conn.prepareStatement(sql);

				psmt.setString(1, commentContent);
				psmt.setInt(2, commentNum);
						
				psmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				DBManager.close(conn, psmt);
			}
		}
	
	// [댓글] 댓글 삭제완료(DB 저장) 메서드
	public void commentDelete(int commentNum) {
		Connection conn = null;
		PreparedStatement psmt = null;
				
		try {
			String sql = "DELETE FROM blogCommentTbl WHERE commentNum = ?";
					
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, commentNum);
					
			psmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, psmt);
		}
	}
}