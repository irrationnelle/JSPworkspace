package service;

import java.util.List;

import dao.BoardDAO;
import vo.ArticlePageVO;
import vo.ArticleVO;

public class BoardService {
	// Singleton Pattern
	private static BoardService instance;
	public static BoardService getInstance() {
		if(instance == null)
			instance = new BoardService();
		return instance;
	}
	
	private BoardService() {	}
	
	public ArticlePageVO makePage(int currentPage) {
		final int PAGE_PER_COUNT = 10; // 한 페이지에 보여질 글의 갯수
		BoardDAO dao = BoardDAO.getInstance();
		
		int startRow = (currentPage-1)*PAGE_PER_COUNT;
		int endRow = startRow + PAGE_PER_COUNT;
		
		// 현재 페이지에 보여줄 글을 DB에서 조회
		List<ArticleVO> articleList = dao.selectArticleList(startRow, endRow);
		
		// 총 게시글 갯수 조회
		int articleTotalCount = dao.selectArticleCount();
		
		// 총 페이지수 계산
		int totalPage = articleTotalCount/PAGE_PER_COUNT;
		if(articleTotalCount%PAGE_PER_COUNT != 0) {
			totalPage++;
		}
		
		// 페이지 하단의 시작페이지 계산
		int startPage = (currentPage-1)/10*10+1;
		
		// 페이지 하단의 끝페이지 계산
		int endPage = startPage + 9;
		if(endPage > totalPage)
			endPage = totalPage;
		
		return new ArticlePageVO(articleList, startPage, endPage, currentPage, totalPage);
	}
}
