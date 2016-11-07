package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import dao.DBHelper;
import dao.MemberDAO;
import vo.MemberVO;

public class MemberService {
	private static MemberService instance = new MemberService();
	public static MemberService getInstance() { return instance; }
	
	MemberDAO dao = MemberDAO.getInstance();
	
	public int signup(MemberVO member){
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
			System.out.println("signup Fail!");
			e.printStackTrace();
		} finally {
			DBHelper.close(pstmt);
			DBHelper.close(con);
		}
		return result;
	}
}
