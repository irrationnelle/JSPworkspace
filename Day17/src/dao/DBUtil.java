package dao;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBUtil {
	private static String DRIVER_NAME = "org.mariadb.jdbc.Driver";
	private static String DB_URL = "jdbc:mariadb://localhost:3306/jsp";
	private static String DB_ID = "root";
	private static String DB_PW = "sds902";
	
	public static Connection makeConnection() {
		Connection con = null;
		try {
			Class.forName(DRIVER_NAME);
			System.out.println("Driver Loading Complete!");
			con = DriverManager.getConnection(DB_URL, DB_ID, DB_PW);
			System.out.println("Connection Creation Complete!");
		} catch (ClassNotFoundException e) {
			System.out.println("Driver Loading Error!");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("Connection Creation Error!");
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
