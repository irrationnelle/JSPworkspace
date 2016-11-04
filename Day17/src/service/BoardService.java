package service;

import java.util.List;

import dao.BoardDAO;
import vo.ArticlePageVO;
import vo.ArticleVO;

public class BoardService {
	// 싱글턴(singleton)
	private static BoardService instance = new BoardService();
	public static BoardService getInstance(){
		return instance;
	}
	private BoardDAO dao = BoardDAO.getInstance();
	
	private BoardService(){}

	public ArticlePageVO makePage(int currentPage){
		final int PAGE_PER_COUNT = 10; // 한페이지에 보여질 글의갯수
		BoardDAO dao = BoardDAO.getInstance();
		
		int startRow = (currentPage-1)*PAGE_PER_COUNT;
		int endRow = startRow+PAGE_PER_COUNT;
		
		// 현재 페이지에 보여줄 글을 DB에서 조회
		List<ArticleVO> articleList = 
				dao.selectArticleList(startRow, endRow);
		
		// 총 게시글 갯수 조회
		int articleTotalCount = dao.selectArticleCount();
		
		// 총 페이지수 계산
		int totalPage = articleTotalCount/PAGE_PER_COUNT;
		if(articleTotalCount%PAGE_PER_COUNT != 0)
			totalPage++;
		
		// 페이지 하단의 시작페이지 계산
		int startPage = (currentPage-1)/10*10+1;
		
		// 페이지 하단의 끝페이지 계산
		int endPage = startPage+9;
		if(endPage>totalPage)
			endPage = totalPage;
		
		return new ArticlePageVO(articleList,startPage,endPage,
											currentPage,totalPage);
	}

	public int write(ArticleVO article){
		article.setReadCount(0); // 조회수 0 셋팅
		
		BoardDAO dao = BoardDAO.getInstance();
		return dao.insert(article);
	}

	public ArticleVO read(int articleNum){
	// 글 읽기를 수행할 때 조회수도 증가시키는 메소드
		BoardDAO dao = BoardDAO.getInstance();
		ArticleVO result = null;
		
		if(dao.updateReadCount(articleNum)>0){
			// 글번호가 유효한지 확인하는 조건문
			result = dao.selectArticle(articleNum);
			
		}
		return result;
	}
	
	// 수정 또는 삭제하기를 위해 조회수 증가없이 원본 읽어오는 메소드
	public ArticleVO readWithoutReadCount(int articleNum){
		BoardDAO dao = BoardDAO.getInstance();
		return dao.selectArticle(articleNum);
	}

	// 로그인한 작성자가 수정시 그냥 수정 가능
	public int modify(ArticleVO article){
		return dao.update(article); 
	}

	public boolean delete(ArticleVO article) {
		BoardDAO dao = BoardDAO.getInstance();
		int result = 0;
		
		ArticleVO original = dao.selectArticle(article.getArticleNum());
		if(article.getPassword().equals(original.getPassword())){
			result = dao.delete(article);
		}
		return result;
	}
}