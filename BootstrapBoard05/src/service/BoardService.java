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
		
		int startPage = currentPage/10*10+1;
		int endPage = startPage+9;
		
		int totalPage = dao.selectArticleCount()/PAGE_PER_COUNT;
		if(dao.selectArticleCount()%PAGE_PER_COUNT != 0)
			totalPage++;
		
		ArticlePageVO articlePage = new ArticlePageVO(articleList, currentPage, startPage, endPage, totalPage);
		return articlePage;
	}
}
