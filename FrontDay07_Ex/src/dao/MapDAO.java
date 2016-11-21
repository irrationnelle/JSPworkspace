package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import vo.MapVO;

public class MapDAO {
	// 객체를 하나만 만들어서 재사용하는 싱글턴(singleton) 패턴적용
	private static MapDAO instance = new MapDAO();
	public static MapDAO getInstance(){
		return instance;
	}
	private MapDAO(){
		try {
			Class.forName("org.mariadb.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("Driver Loading Error!");
			e.printStackTrace();
		}
	}

//	public int insert(MapVO Map){
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		int result = 0;
//				
//		try {
//			con = DBHelper.makeConnection();
//			String sql = "INSERT INTO ARTICLE_BOARD "
//			+"(TITLE,CONTENT,WRITER,READ_COUNT,WRITE_DATE,PASSWORD)"
//			+"VALUES(?,?,?,?,now(),?)";
//
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, article.getTitle());
//			pstmt.setString(2, article.getContent());
//			pstmt.setString(3, article.getWriter());
//			pstmt.setInt(4, article.getReadCount());
//			pstmt.setString(5, article.getPassword());
//			
//			result = pstmt.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			DBHelper.close(pstmt);
//			DBHelper.close(con);
//		}
//		return result;
//	}

	public MapVO selectMap(String title){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MapVO map = null;
		
		try {
			con = DBHelper.makeConnection();
			String sql = 
				"SELECT * FROM google_map WHERE title=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, title);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				map = new MapVO();
				map.setTitle(rs.getString(1));
				map.setLat(rs.getDouble(2));
				map.setLng(rs.getDouble(3));
			}
		} catch (SQLException e) {
			System.out.println("selectMap error");
			e.printStackTrace();
		} finally{
			DBHelper.close(rs);
			DBHelper.close(pstmt);
			DBHelper.close(con);
		}
		return map;
	}
	
//	public int updateReadCount(int articleId){
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		int result = 0;
//		
//		try {
//			con = DBHelper.makeConnection();
//			String sql = 
//				"UPDATE ARTICLE_BOARD SET READ_COUNT=READ_COUNT+1 "
//					+ " WHERE ARTICLE_ID=?";
//			
//			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, articleId);
//			result = pstmt.executeUpdate();			
//		} catch (SQLException e) {
//			System.out.println("updateReadCount 에러");
//			e.printStackTrace();
//		} finally{
//			DBHelper.close(pstmt);
//			DBHelper.close(con);
//		}
//		return result;
//	}
//
//	public int update(ArticleVO article){
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		int result = 0;
//		
//		try {
//			con = DBHelper.makeConnection();
//			String sql = 
//					  "UPDATE ARTICLE_BOARD "
//					+ "SET TITLE=?, CONTENT=? "
//					+ "WHERE ARTICLE_ID=?";
//			
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, article.getTitle());
//			pstmt.setString(2, article.getContent());
//			pstmt.setInt(3, article.getArticleId());
//			
//			result = pstmt.executeUpdate();
//		} catch (SQLException e) {
//			System.out.println("update 에러");
//			e.printStackTrace();
//		} finally{
//			DBHelper.close(pstmt);
//			DBHelper.close(con);
//		}
//		return result;
//	}
//
//	public int delete(ArticleVO article) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		int result = 0;
//		
//		try {
//			con = DBHelper.makeConnection();
//			String sql = 
//					  "DELETE FROM article_board "
//					+ "WHERE ARTICLE_ID=?";
//			
//			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, article.getArticleId());
//			
//			result = pstmt.executeUpdate();
//		} catch (SQLException e) {
//			System.out.println("delete 에러");
//			e.printStackTrace();
//		} finally{
//			DBHelper.close(pstmt);
//			DBHelper.close(con);
//		}
//		return result;
//	}
}