package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBHelper {
	public static final String DB_URL = "jdbc:mariadb://localhost:3306/jsp";
	public static final String DB_ID = "root";
	public static final String DB_PW = "sds902";
	
	public static Connection createConnection() {
		Connection con = null;
		try {
			con = DriverManager.getConnection(DB_URL, DB_ID, DB_PW);
			System.out.println("Driver Connection Complete!");
		} catch (SQLException e) {
			System.out.println("Driver Connection Fail!");
			e.printStackTrace();
		}
		return con;
	}
	
	public static void close(Connection con) {
		if(con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void close(Statement stmt) {
		if(stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void close(PreparedStatement pstmt) {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void close(ResultSet rs) {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
