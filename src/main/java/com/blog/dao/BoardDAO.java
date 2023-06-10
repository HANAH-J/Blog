package com.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.blog.db.DBManager;
import com.blog.vo.BoardVO;

public class BoardDAO {
	private BoardDAO() {}
	private static BoardDAO dao = new BoardDAO();
	public static BoardDAO getInstance() {
		return dao;
	}
	
	// [게시물] 게시물 목록보기 메서드
	public List<BoardVO> selectBoardList() {
		List<BoardVO> boardList = new ArrayList<>();
		
		String sql = "SELECT * FROM blogBoardTbl ORDER BY boardNum DESC";
		
		Connection conn  = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				BoardVO bVo = new BoardVO();
				
				bVo.setBoardNum(rs.getInt("boardNum"));
				bVo.setBoardTitle(rs.getString("boardTitle"));
				bVo.setReadCount(rs.getInt("readCount"));
				bVo.setBoardDate(rs.getString("boardDate"));
				
				// 게시글 내용 미리보기
				String preView = rs.getString("content");
				if(preView.length() > 30) {
					preView = preView.substring(0, 15) + "..."; // 15자 미리보기 + ...
				}
				bVo.setBoardContent(preView);
				
				// 조회된 결과 list 객체에 저장
				boardList.add(bVo);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, stmt, rs);
		}
		return boardList;
	}

	// [게시물] 조회수 증가 메서드
	public void updateReadCount(int boardNum) {
		String sql = "UPDATE blogBoardTbl SET readCount = readCount+1 WHERE boardNum = ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, boardNum);
			
			psmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, psmt);
		}
	}

	// [게시물] 게시물 상세보기 메서드
	public BoardVO selectBoardDetail(int boardNum) {
		BoardVO bVo = null;
		
		String sql = "SELECT * FROM blogBoardTbl WHERE boardNum = ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, boardNum);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				bVo = new BoardVO();
				
				bVo.setBoardNum(rs.getInt("boardNum"));
				bVo.setBoardTitle(rs.getString("boardTitle"));
				bVo.setBoardContent(rs.getString("boardContent"));
				bVo.setReadCount(rs.getInt("readCount"));
				bVo.setBoardDate(rs.getString("boardDate"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, psmt, rs);
		}
		return bVo;
	}

	// [게시물] 게시물 등록하기 메서드
	public void insertBoard(String id, BoardVO bVo) {
		String sql = "INSERT INTO blogBoardTbl VALUES(?, blogBoardTbl_seq.nextval, ?, ?, 0, TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS'))";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, id);
			psmt.setString(2, bVo.getBoardTitle());
			psmt.setString(3, bVo.getBoardContent());
			
			psmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, psmt);
		}
	}

	// [게시물] 게시물 수정하기 메서드
	public void updateBoard(BoardVO bVo) {
		String sql = "UPDATE blogBoardTbl SET boardTitle = ?, boardContent = ? WHERE boardNum = ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, bVo.getBoardTitle());
			psmt.setString(2, bVo.getBoardContent());
			psmt.setInt(3, bVo.getBoardNum());
			
			psmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, psmt);
		}
	}

	// [게시물] 게시물 삭제하기 메서드
	public void deleteBoard(int boardNum) {
		String sql = "DELETE FROM blogBoardTbl WHERE boardNum = ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, boardNum);
			
			psmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, psmt);
		}
	}
	
// ----------------------------------------------------------------------------------------------------
	
	// [페이징] 전체 게시물 수 조회 메서드
	public int selectAllNum(String id) {
		int totalCnt = 0;
			
		String sql = "SELECT count(*) FROM blogBoardTbl WHERE memberId = ?";
			
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
			
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();
				
			if(rs.next()) {
				totalCnt = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, psmt, rs);
		}
		return totalCnt;
	}
	
	// [페이징] 특정 페이지 게시물 조회 메서드
	public List<BoardVO> selectTargetBoards(String id, int section, int pageNum) {
		List<BoardVO> boardList = new ArrayList<>();
			
		String sql = " SELECT * "
				   + " FROM ( "
				   + " SELECT ROWNUM as nickNum, memberId, boardNum, boardTitle, boardContent, readCount, boardDate "
				   + " FROM (SELECT * FROM blogBoardTbl WHERE memberId = ? ORDER BY boardNum DESC)) "
				   + " WHERE nickNum BETWEEN (?-1) *20 + (?-1) *4 +1 AND (?-1) *20 + (?) *4";
			
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
			
		try{
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
				
			psmt.setString(1, id);
			psmt.setInt(2, section);
			psmt.setInt(3, pageNum);
			psmt.setInt(4, section);
			psmt.setInt(5, pageNum);
				
			rs = psmt.executeQuery();
				
			while(rs.next()) {
				BoardVO bVo = new BoardVO();
				
				bVo.setMemberId(id);
				bVo.setBoardNum(rs.getInt("boardNum"));
				bVo.setBoardTitle(rs.getString("boardTitle"));
				bVo.setBoardContent(rs.getString("boardContent"));
				bVo.setReadCount(rs.getInt("readCount"));
				bVo.setBoardDate(rs.getString("boardDate"));
				
				// 게시글 내용 미리보기
				String preView = rs.getString("boardContent");
				if(preView.length() > 10) {
					preView = preView.substring(0, 10) + "..."; // 10자 미리보기 + ...
				}
				bVo.setBoardContent(preView);
				
				// 조회된 결과 list 객체에 저장
				boardList.add(bVo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, psmt, rs);
		}
		return boardList;
	}
}