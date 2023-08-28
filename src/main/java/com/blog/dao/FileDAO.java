package com.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.blog.db.DBManager;
import com.blog.vo.FileVO;

public class FileDAO {
	private FileDAO() {}
	private static FileDAO dao = new FileDAO();
	public static FileDAO getInstance() {
		return dao;
	}
	
	// [파일] 파일 업로드
	public void insertFile(FileVO fileVO) {
		try (Connection conn = DBManager.getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(
	        		 "INSERT INTO tbl_file (filePath, fileName) VALUES (?, ?)")) {
//	            pstmt.setInt(1, fileVO.getBoardNum());
	            pstmt.setString(1, fileVO.getFilePath());
	            pstmt.setString(2, fileVO.getFileName());
	            pstmt.executeUpdate();
	        } catch (Exception e) {
	            e.printStackTrace();
	            // 업로드 실패 시 처리할 내용 작성
	        }
	}
}