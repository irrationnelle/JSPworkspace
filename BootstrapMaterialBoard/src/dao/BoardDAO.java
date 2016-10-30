package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import vo.ArticleVO;

public class BoardDAO {
	// ��ü�� �ϳ��� ���� �����ϴ� �̱���(Singleton) ���� ����
	private static BoardDAO instance;
	public static BoardDAO getInstance() {
		if(instance == null)
			instance = new BoardDAO();
		return instance;
	}
	
	private final String DB_DRIVER = "org.mariadb.jdbc.Driver";
	
	private BoardDAO() {
		try {
			Class.forName(DB_DRIVER);
			System.out.println("Driver Loading Complete!");
		} catch (ClassNotFoundException e) {
			System.out.println("Driver Loading Error!");
			e.printStackTrace();
		}
	}
	
	public List<ArticleVO> selectArticleList(int startRow, int endRow) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ArticleVO> articleList = new ArrayList<>();

		try {
			con = DBHelper.makeConnection();
			String sql = "SELECT * FROM article_board ORDER BY article_id DESC LIMIT ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, (endRow-startRow));
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ArticleVO article = new ArticleVO();
				article.setArticleId(rs.getInt(1));
				article.setTitle(rs.getString(2));
				article.setContent(rs.getString(3));
				article.setWriter(rs.getString(4));
				article.setReadCount(rs.getInt(5));
				article.setWriteDate(rs.getTimestamp(6));
				article.setPassword(rs.getString(7));
				
				articleList.add(article);
			}
		} catch (SQLException e) {
			System.out.println("DAO insert Error!");
			e.printStackTrace();
		} finally {
			DBHelper.close(rs);
			DBHelper.close(pstmt);
			DBHelper.close(con);
		}
		return articleList;
	}

	public int selectArticleCount() {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		int articleCount = 0;
		
		try {
			con = DBHelper.makeConnection();
			String sql = "SELECT COUNT(*) FROM article_board";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			rs.next();
			articleCount = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return articleCount;
	}

	public int insert(ArticleVO article) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			con = DBHelper.makeConnection();
			String sql = "INSERT INTO article_board " +
						 "(title, content, writer, read_count, write_date, password) " +
						 "VALUES(?, ?, ?, ?, now(), ?)"; 
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, article.getTitle());
			pstmt.setString(2, article.getContent());
			pstmt.setString(3, article.getWriter());
			pstmt.setInt(4, article.getReadCount());
			pstmt.setString(5, article.getPassword());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBHelper.close(pstmt);
			DBHelper.close(con);
		}
		
		return result;
	}

	public ArticleVO selectArticle(int articleID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArticleVO article = null;
		
		try {
			con = DBHelper.makeConnection();
			String sql = "SELECT * FROM article_board WHERE article_id=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, articleID);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				article = new ArticleVO();
				article.setArticleId(rs.getInt(1));
				article.setTitle(rs.getString(2));
				article.setContent(rs.getString(3));
				article.setWriter(rs.getString(4));
				article.setReadCount(rs.getInt(5));
				article.setWriteDate(rs.getTimestamp(6));
				article.setPassword(rs.getString(7));
			}
		} catch (SQLException e) {
			System.out.println("selectArticle Error!");
			e.printStackTrace();
		} finally {
			DBHelper.close(rs);
			DBHelper.close(pstmt);
			DBHelper.close(con);
		}
		
		return article;
	}

	public int updateReadCount(int articleID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			con = DBHelper.makeConnection();
			String sql = "UPDATE article_board SET read_count=read_count+1 " +
					"WHERE article_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, articleID);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("updateReadCount ����");
			e.printStackTrace();
		} finally {
			DBHelper.close(pstmt);
			DBHelper.close(con);
		}
		return result;
	}
}
