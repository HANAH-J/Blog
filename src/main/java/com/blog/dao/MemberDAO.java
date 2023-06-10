package com.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.blog.db.DBManager;
import com.blog.vo.MemberVO;

public class MemberDAO {
	private MemberDAO() {}
	private static MemberDAO dao = new MemberDAO();
	public static MemberDAO getInstance() {
		return dao;
	}
	
	// 로그인 메서드
	public int selectLogin(String id, String password) {
		String sql = "SELECT * FROM blogMemberTbl WHERE id = ? AND password = ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, id);
			psmt.setString(2, password);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				return 1;		// 입력된 아이디와 비밀번호 존재
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				DBManager.close(conn, psmt, rs);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return 0;				// 입력된 아이디와 비밀번호 부재
	}
	
	// 로그인 성공 시 해당 회원정보 조회 메서드
	public MemberVO selectMember(String id) {
		MemberVO mVo = null;
		
		String sql = "SELECT * FROM blogMemberTbl WHERE id = ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				mVo = new MemberVO();
				
				mVo.setId(rs.getString("id"));
				mVo.setPassword(rs.getString("password"));
				mVo.setName(rs.getString("name"));
				mVo.setBirthday(rs.getInt("birthday"));
				mVo.setEmail(rs.getString("email"));
				mVo.setPhone(rs.getInt("phone"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				DBManager.close(conn, psmt, rs);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return mVo;
	}

	// 아이디 중복체크 메서드
	public int selectIdCheck(String id) {
		int result = -1;
		
		String sql = "SELECT id FROM blogMemberTbl WHERE id = ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				result = 1;		// 아이디가 존재 => 사용자가 사용하려던 아이디 이미 존재
								// => 사용불가
			}else {
				result = -1;	// 아이디가 부재 => 사용자가 사용하려던 아이디 부재
								// => 사용가능
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				DBManager.close(conn, psmt, rs);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	// 회원가입 메서드
	public void insertMember(MemberVO mVo) {
		String sql = "INSERT INTO blogMemberTbl VALUES(?, ?, ?, ?, ?, ?)";
			
		Connection conn = null;
		PreparedStatement psmt = null;
			
		try {
			conn = DBManager.getConnection();
			psmt = conn.prepareStatement(sql);
				
			psmt.setString(1, mVo.getId());
			psmt.setString(2, mVo.getPassword());
			psmt.setString(3, mVo.getName());
			psmt.setInt(4, mVo.getBirthday());
			psmt.setString(5, mVo.getEmail());
			psmt.setInt(6, mVo.getPhone());
				
			psmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, psmt);
		}
	}
}