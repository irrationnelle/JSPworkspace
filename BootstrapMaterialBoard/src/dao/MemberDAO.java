package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import vo.MemberVO;

public class MemberDAO {
	private static MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstance() { return instance; }
	private final String DB_DRIVER = "org.mariadb.jdbc.Driver";
	
	private MemberDAO() {
		try {
			Class.forName(DB_DRIVER);
		} catch (ClassNotFoundException e) {
			System.out.println("DriverLoading Fail!");
			e.printStackTrace();
		}
	}
	
	public int insert(MemberVO member) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			con = DBHelper.makeConnection();
			String sql = "INSERT INTO member VALUES(?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getEmail());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("insert Fail!");
			e.printStackTrace();
		} finally {
			DBHelper.close(pstmt);
			DBHelper.close(con);
		}
		return result;
	}
	
	public MemberVO selectMember(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO member = null;
		
		try {
			con = DBHelper.makeConnection();
			String sql = "SELECT * FROM member WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new MemberVO();
				member.setId(rs.getString(1));
				member.setPassword(rs.getString(2));
				member.setName(rs.getString(3));
				member.setEmail(rs.getString(4));
			}
		} catch (SQLException e) {
			System.out.println("selectMember Fail!");
			e.printStackTrace();
		} finally {
			DBHelper.close(rs);
			DBHelper.close(pstmt);
			DBHelper.close(con);
		}
		
		return member;
	}
}
