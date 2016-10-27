package repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import vo.ContentsVO;
import vo.UserInfoVO;

public class ContentsDAO {
	private final String DB_DRIVER = "org.mariadb.jdbc.Driver";
	private final String DB_URL = "jdbc:mariadb://localhost:3306/petboard";
	private final String DB_ID = "root";
	private final String DB_PW = "sds902";
	
	private Connection con = null;
	private Statement stmt = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public ContentsDAO() {
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
	
	public int insert(ContentsVO contents) {
		createConnection();
		String sql = "INSERT INTO contents (user_id, user_num, title, content, date, address) VALUES(?, ?, ?, ?, ?, ?)";
		int result = 0;

		try {
			pstmt = con.prepareStatement(sql);
		
			pstmt.setString(1, contents.getUserID());
			pstmt.setInt(2, contents.getUserNum());
			pstmt.setString(3, contents.getTitle());
			pstmt.setString(4, contents.getContent());
			pstmt.setDate(5, contents.getDate());
			pstmt.setString(6, contents.getAddress());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closePreparedStatement();
			closeConnection();
		}
		return result;
	}
	
	public List<ContentsVO> selectTotalList() {
		createConnection();
		String sql = "SELECT post_num, title, user_id, date FROM contents";
		List<ContentsVO> contentsList = null;
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			contentsList = new ArrayList<>();
			while(rs.next()) {
				ContentsVO contents = new ContentsVO();
				contents.setPostNum(rs.getInt(1));
				contents.setTitle(rs.getString(2));
				contents.setUserID(rs.getString(3));
				contents.setDate(rs.getDate(4));
				contentsList.add(contents);
			}
		} catch (SQLException e) {
			System.out.println("selectTotalList Error in ContentsDAO!");
			e.printStackTrace();
		} finally {
			closeResultSet();
			closeStatement();
			closeConnection();
		}
		return contentsList;
	}
}
