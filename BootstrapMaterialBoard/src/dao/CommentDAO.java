package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import vo.CommentVO;

public class CommentDAO {
	private static CommentDAO instance = new CommentDAO();
	public static CommentDAO getInstance() { return instance; }
	private CommentDAO() {
		try {
			Class.forName("org.mariadb.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("Driver Loading Fail!");
			e.printStackTrace();
		}
	}
	
	public List<CommentVO> selectCommentList(int startRow, int endRow) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<CommentVO> commentList = new ArrayList<>();
		
		try {
			con = DBHelper.makeConnection();
			String sql = "SELECT * FROM comment ORDER BY comment_num DESC LIMIT ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, (endRow-startRow));
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CommentVO comment = new CommentVO();
				comment.setArticleId(rs.getInt(1));
				comment.setCommentId(rs.getInt(2));
				comment.setId(rs.getString(3));
				comment.setContent(rs.getString(4));
				comment.setWriteDate(rs.getTimestamp(5));
				
				commentList.add(comment);
			}
		} catch (SQLException e) {
			System.out.println("selectCommentList Fail!");
			e.printStackTrace();
		} finally {
			DBHelper.close(rs);
			DBHelper.close(pstmt);
			DBHelper.close(con);
		}
		
		return commentList;
	}
	
	public int selectCommentCount() {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		int commentCount = 0;
		
		try {
			con = DBHelper.makeConnection();
			String sql = "SELECT COUNT(*) FROM comment";
			stmt = con.createStatement();
			
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				commentCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("selectCommentCount Fail!");
			e.printStackTrace();
		} finally {
			DBHelper.close(rs);
			DBHelper.close(stmt);
			DBHelper.close(con);
		}
		
		return commentCount;
	}
}
