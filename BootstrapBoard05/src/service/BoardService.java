package service;

import dao.BoardDAO;
import vo.ArticlePageVO;
import vo.ArticleVO;

public class BoardService {
	public static BoardService instance;
	public static BoardService getInstance() {
		if(instance == null)
			instance = new BoardService();
		return instance;
	}
	
	
	private final int PAGE_PER_COUNT = 10;
	private int startNum;
	private int endNum;
	private int currentNum;
	private int totalNum;
	
	private BoardService() {	}
	
	public void createArticlePageNum(int startRow, int endRow) {
		
	}
}
