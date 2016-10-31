package dao;

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
		return 0;
	}
	
	public List<ArticleVO> selectArticleList(int startRow, int endRow) {
		List<ArticleVO> articleList = new ArrayList<>();
		
		return articleList;
	}
}
