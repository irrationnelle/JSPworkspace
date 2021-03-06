package service;

import java.util.List;

import dao.BoardDAO;
import vo.ArticlePageVO;
import vo.ArticleVO;

public class BoardService {
	private static BoardService instance;
	public static BoardService getInstance() {
		if(instance == null)
			instance = new BoardService();
		return instance;
	}
	
	private BoardService() {	}
	
	BoardDAO dao = BoardDAO.getInstance();
	
	public ArticlePageVO createArticlePage(int currentPage) {
		final int PAGE_PER_COUNT = 10;
		
		int startRow = (currentPage-1)*PAGE_PER_COUNT;
		int endRow = startRow+PAGE_PER_COUNT;
		List<ArticleVO> articleList = dao.selectArticleList(startRow, endRow);
		
		int totalPage = dao.selectArticleCount()/PAGE_PER_COUNT;
		if(dao.selectArticleCount()%PAGE_PER_COUNT != 0)
			totalPage++;

		int startPage = (currentPage-1)/10*10+1;
		int endPage = startPage+9;
		if( endPage > totalPage) {
			endPage = totalPage;
		}
		
		ArticlePageVO articlePage = new ArticlePageVO(articleList, currentPage, startPage, endPage, totalPage);
		return articlePage;
	}
	
	public ArticleVO read(int articleId) {
		ArticleVO article = null;
		
		if(dao.updateReadCount(articleId) > 0) {
			article = dao.selectArticle(articleId);
		}
		return article;
	}
	
	public ArticleVO readWithoutReadCount(int articleId) {
		ArticleVO article = dao.selectArticle(articleId);
		return article;
	}
	
	public int write(String title, String writer, String password, String content) {
		ArticleVO article = new ArticleVO();
		article.setTitle(title);
		article.setWriter(writer);
		article.setPassword(password);
		article.setContent(content);
		article.setReadCount(0);
		
		int result = dao.insert(article);
		return result;
	}
	
	public int modify(int articleId, String title, String writer, String password, String content) {
		int result = 0;
		
		System.out.println(articleId);
		ArticleVO original = dao.selectArticle(articleId);
		ArticleVO article = new ArticleVO();
		
		article.setArticleId(articleId);
		article.setTitle(title);
		article.setWriter(writer);
		article.setPassword(password);
		article.setContent(content);
		
		System.out.println(original.getPassword());
		System.out.println(article.getPassword());
		
		if(original.getPassword().equals(article.getPassword())) {
			result = dao.update(article);
		} else {
			System.out.println("Password is not correct");
		}
		
		return result;
	}
	
	public int delete(int articleId, String password) {
		ArticleVO original = dao.selectArticle(articleId);
		int result = 0;
		if(original.getPassword().equals(password)) {
			result = dao.delete(articleId);
		}
		return result;
	}
	
}
