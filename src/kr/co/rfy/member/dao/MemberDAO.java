package kr.co.rfy.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.rfy.commons.JDBCTemplate;
import kr.co.rfy.member.vo.Member;

public class MemberDAO {

	public Member memberIdCheck(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		String sql = "SELECT * FROM MEMBER WHERE USER_ID=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member();
				m.setUserNo(rset.getInt("user_no"));
				m.setUserId(rset.getString("user_id"));
				m.setUserPwd(rset.getString("user_pwd"));
				m.setUserName(rset.getString("user_name"));
				m.setUserEmail(rset.getString("user_email"));
				m.setUserPhone(rset.getString("user_phone"));
				m.setAgreeYN(rset.getString("user_id").charAt(0));
				m.setEnrollDate(rset.getDate("enroll_date"));
				m.setBlackYN(rset.getString("black_yn").charAt(0));
				m.setRoll(rset.getString("roll"));
				m.setEndYN(rset.getString("end_yn").charAt(0));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return m;
	}

	public int memberJoin(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "INSERT INTO MEMBER VALUES(MEMBER_SEQ.NEXTVAL,?,?,?,?,?,?,DEFAULT,'N',DEFAULT,'N')";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getUserEmail());
			pstmt.setString(5, m.getUserPhone());
			pstmt.setString(6, Character.toString(m.getAgreeYN()));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public Member memberLogin(Connection conn, String userId, String userPwd) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		String sql = "SELECT * FROM MEMBER WHERE USER_ID=? AND USER_PWD=? AND END_YN='N'";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();

			if(rset.next()) {
				m = new Member();
				m.setUserNo(rset.getInt("user_no"));
				m.setUserId(rset.getString("user_id"));
				m.setUserPwd(rset.getString("user_pwd"));
				m.setUserName(rset.getString("user_name"));
				m.setUserEmail(rset.getString("user_email"));
				m.setUserPhone(rset.getString("user_phone"));
				m.setAgreeYN(rset.getString("agree_yn").charAt(0));
				m.setEnrollDate(rset.getDate("enroll_date"));
				m.setBlackYN(rset.getString("black_yn").charAt(0));
				m.setRoll(rset.getString("roll"));
				m.setEndYN(rset.getString("end_yn").charAt(0));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return m;
	}

	public int memberWithDraw(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = "UPDATE MEMBER SET USER_NAME='-', USER_EMAIL='-', USER_PHONE='-', AGREE_YN='N', END_YN='Y' WHERE USER_ID=? AND END_YN='N'";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int memberUpdate(Connection conn, String userEmail, String userPhone, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = "UPDATE MEMBER SET USER_EMAIL=?, USER_PHONE=? WHERE USER_ID=? AND END_YN='N'";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userEmail);
			pstmt.setString(2, userPhone);
			pstmt.setString(3, userId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int memberPwdChange(Connection conn, String userId, String userPwd) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "UPDATE MEMBER SET USER_PWD=? WHERE USER_ID=? AND END_YN='N'";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userPwd);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

}
