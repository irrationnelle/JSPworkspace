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
	// 객체를 하나만 만들어서 재사용하는 싱글턴(singleton) 패턴적용
	private static BoardDAO instance= new BoardDAO();

	public static BoardDAO getInstance() {
		return instance;
	}
	private BoardDAO(){
		try {
			Class.forName("org.mariadb.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("Driver Loading Complete!");
			e.printStackTrace();
		}
	}
////////////////////////////////////////////////////////////	
	public List<ArticleVO> selectArticleList(int startRow,int endRow){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ArticleVO> articleList = new ArrayList<>();
		
		try {
			con = DBHelper.makeConnection();
			String sql = "SELECT * FROM BOARD "
					+ "ORDER BY article_num DESC "
					+ "LIMIT ?,?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow-startRow); // limit의 두번째는 개수
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				ArticleVO article = new ArticleVO();
				article.setArticleId(rs.getInt(1));
				article.setTitle(rs.getString(2));
				article.setId(rs.getString(3));
				article.setContent(rs.getString(4));
				article.setWriteDate(rs.getTimestamp(5));
				article.setReadCount(rs.getInt(6));
				
				articleList.add(article);
			}
		} catch (SQLException e) {
			System.out.println("DAO insert 에러");
			e.printStackTrace();
		} finally{
			DBHelper.close(rs);
			DBHelper.close(pstmt);
			DBHelper.close(con);
		}
		return articleList;
	}

	public int selectArticleCount(){
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		int articleCount = 0;
		
		try {
			con = DBHelper.makeConnection();
			String sql = "SELECT COUNT(*) from BOARD";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			rs.next();
			articleCount = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBHelper.close(rs);
			DBHelper.close(stmt);
			DBHelper.close(con);
		}
		return articleCount;
	}

	public int insert(ArticleVO article){
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
				
		try {
			con = DBHelper.makeConnection();
			String sql = "INSERT INTO BOARD "
			+"(TITLE,ID,CONTENT,WRITE_DATE,READ_COUNT)"
			+"VALUES(?,?,?,now(),?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getTitle());
			pstmt.setString(2, article.getId());
			pstmt.setString(3, article.getContent());
			pstmt.setInt(4, article.getReadCount());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBHelper.close(pstmt);
			DBHelper.close(con);
		}
		return result;
	}

	public ArticleVO selectArticle(int articleId){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArticleVO article = null;
		
		try {
			con = DBHelper.makeConnection();
			String sql = 
				"SELECT * FROM BOARD WHERE article_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, articleId);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				article = new ArticleVO();
				article.setArticleId(rs.getInt(1));
				article.setTitle(rs.getString(2));
				article.setId(rs.getString(3));
				article.setContent(rs.getString(4));
				article.setWriteDate(rs.getTimestamp(5));
				article.setReadCount(rs.getInt(6));
			}
		} catch (SQLException e) {
			System.out.println("selectArticle 에러");
			e.printStackTrace();
		} finally{
			DBHelper.close(rs);
			DBHelper.close(pstmt);
			DBHelper.close(con);
		}
		return article;
	}
	
	public int updateReadCount(int articleId){
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			con = DBHelper.makeConnection();
			String sql = 
				"UPDATE BOARD SET READ_COUNT=READ_COUNT+1 "
					+ " WHERE article_num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, articleId);
			result = pstmt.executeUpdate();			
		} catch (SQLException e) {
			System.out.println("updateReadCount 에러");
			e.printStackTrace();
		} finally{
			DBHelper.close(pstmt);
			DBHelper.close(con);
		}
		return result;
	}

	public int update(ArticleVO article){
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			con = DBHelper.makeConnection();
			String sql = 
					  "UPDATE BOARD "
					+ "SET TITLE=?, CONTENT=? "
					+ "WHERE article_num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getTitle());
			pstmt.setString(2, article.getContent());
			pstmt.setInt(3, article.getArticleId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("update 에러");
			e.printStackTrace();
		} finally{
			DBHelper.close(pstmt);
			DBHelper.close(con);
		}
		return result;
	}

	public int delete(ArticleVO article){
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			con = DBHelper.makeConnection();
			String sql = 
					  "DELETE FROM BOARD "
					+ "WHERE article_num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, article.getArticleId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("update 에러");
			e.printStackTrace();
		} finally{
			DBHelper.close(pstmt);
			DBHelper.close(con);
		}
		return result;
	}
}
