package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import vo.ArticleVO;

public class BoardDAO {
	private static BoardDAO instance;
	public static BoardDAO getInstance() {
		if(instance == null)
			instance = new BoardDAO();
		return instance;
	}
	
	private BoardDAO() {
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			System.out.println("Driver Loading Complete!");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("Driver Loading Fail!");
		}
	}
	
	public int selectArticleCount() {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		int articleCount = -1;
		
		try {
			con = DBHelper.createConnection();
			String sql = "SELECT COUNT(*) FROM article_board";
			stmt = con.createStatement();
			
			rs = stmt.executeQuery(sql);
			rs.next();
			
			articleCount = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println("selectArticleCount Fail!");
			e.printStackTrace();
		} finally {
			DBHelper.close(rs);
			DBHelper.close(stmt);
			DBHelper.close(con);
		}
		
		return articleCount;
	}
	
	public List<ArticleVO> selectArticleList(int startRow, int endRow) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ArticleVO> articleList = new ArrayList<>();
		
		try {
			con = DBHelper.createConnection();
			String sql = "SELECT article_id, writer, title, password, content, write_date, read_count FROM article_board ORDER BY article_id DESC LIMIT ?, ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, (endRow-startRow));
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int articleId = rs.getInt(1);
				String writer = rs.getString(2);
				String title = rs.getString(3);
				String password = rs.getString(4);
				String content = rs.getString(5);
				Timestamp writeDate = rs.getTimestamp(6);
				int readCount = rs.getInt(7);
				
				ArticleVO article = new ArticleVO(articleId, writer, title, password, content, writeDate, readCount);
				articleList.add(article);
			}
		} catch (SQLException e) {
			System.out.println("selectArticleList Fail!");
			e.printStackTrace();
		} finally {
			DBHelper.close(rs);
			DBHelper.close(pstmt);
			DBHelper.close(con);
		}
		return articleList;
	}
}
