package repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import vo.UserInfoVO;

public class UserInfoDAO {
	private final String DB_DRIVER = "org.mariadb.jdbc.Driver";
	private final String DB_URL = "jdbc:mariadb://localhost:3306/petboard";
	private final String DB_ID = "root";
	private final String DB_PW = "sds902";
	
	private Connection con = null;
	private Statement stmt = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public UserInfoDAO() {
		try {
			Class.forName(DB_DRIVER);
			System.out.println("Driver Loading Complete!");
		} catch (ClassNotFoundException e) {
			System.out.println("Driver Loading Fail!");
			e.printStackTrace();
		}
	}
	
	public void createConnection() {
		try {
			con = DriverManager.getConnection(DB_URL, DB_ID, DB_PW);
			System.out.println("Connection Construction Complete!");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Connection Construction Fail!");
		}
	}
	
	public void closeConnection() {
		if(con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void closeStatement() {
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void closePreparedStatement() {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void closeResultSet() {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public int insert(UserInfoVO userinfo) {
		createConnection();
		String sql = "INSERT INTO userinfo (name, user_id, password) " + 
					 "VALUES(?, ?, ?)";
		int result = 0;

		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, userinfo.getName());
			pstmt.setString(2, userinfo.getUserID());
			pstmt.setString(3, userinfo.getPassword());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("insert Error");
			e.printStackTrace();
		} finally {
			closePreparedStatement();
			closeConnection();
		}
		return result;
	}
	
	public int updatePW(UserInfoVO userinfo) {
		createConnection();
		String sql = "UPDATE userinfo SET password=? WHERE user_id=?";
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userinfo.getPassword());
			pstmt.setString(2, userinfo.getUserID());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("updatePW Error");
			e.printStackTrace();
		} finally {
			closePreparedStatement();
			closeConnection();
		}
		
		return result;
	}
	
	public int delete(UserInfoVO userinfo) {
		createConnection();
		String sql = "DELETE FROM userinfo WHERE user_id=?";
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userinfo.getUserID());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("delete Error");
			e.printStackTrace();
		} finally {
			closeConnection();
			closePreparedStatement();
		}
		return result;
	}
	
	public UserInfoVO selectName(String userID) {
		createConnection();
		String sql = "SELECT name FROM userinfo WHERE user_id=?";
		UserInfoVO userinfo = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				userinfo = new UserInfoVO();
				userinfo.setName(rs.getString(1));
			}
		} catch (SQLException e) {
			System.out.println("selectName Error");
			e.printStackTrace();
		} finally {
			closeResultSet();
			closePreparedStatement();
			closeConnection();
		}
		return userinfo;
	}
	
	public UserInfoVO selectPW(String userID) {
		createConnection();
		String sql = "SELECT password FROM userinfo WHERE user_id=?";
		UserInfoVO userinfo = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				userinfo = new UserInfoVO();
				userinfo.setPassword(rs.getString(1));
			}
		} catch (SQLException e) {
			System.out.println("selectPW Error");
			e.printStackTrace();
		} finally {
			closeResultSet();
			closePreparedStatement();
			closeConnection();
		}
		return userinfo;
	}
	
	public List<UserInfoVO> selectTotalList() {
		createConnection();
		String sql = "SELECT name, user_id FROM userinfo";
		List<UserInfoVO> userList = null;

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			userList = new ArrayList<>();
			while(rs.next()) {
				UserInfoVO userinfo = new UserInfoVO();
				userinfo.setName(rs.getString(1));
				userinfo.setUserID(rs.getString(2));
				userList.add(userinfo);
			}
		} catch (SQLException e) {
			System.out.println("selectTotalList Error");
			e.printStackTrace();
		} finally {
			closeResultSet();
			closeStatement();
			closeConnection();
		}
		
		return userList;
	}
	
}
