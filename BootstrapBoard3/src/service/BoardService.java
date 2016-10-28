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
		final int PAGE_PER_COUNT = 10; // �� �������� ������ ���� ����
		BoardDAO dao = BoardDAO.getInstance();
		
		int startRow = (currentPage-1)*PAGE_PER_COUNT;
		int endRow = startRow + PAGE_PER_COUNT;
		
		// ���� �������� ������ ���� DB���� ��ȸ
		List<ArticleVO> articleList = dao.selectArticleList(startRow, endRow);
		
		// �� �Խñ� ���� ��ȸ
		int articleTotalCount = dao.selectArticleCount();
		
		// �� �������� ���
		int totalPage = articleTotalCount/PAGE_PER_COUNT;
		if(articleTotalCount%PAGE_PER_COUNT != 0) {
			totalPage++;
		}
		
		// ������ �ϴ��� ���������� ���
		int startPage = (currentPage-1)/10*10+1;
		
		// ������ �ϴ��� �������� ���
		int endPage = startPage + 9;
		if(endPage > totalPage)
			endPage = totalPage;
		
		return new ArticlePageVO(articleList, startPage, endPage, currentPage, totalPage);
	}
}
