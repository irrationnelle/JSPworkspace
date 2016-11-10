package service;

import java.util.List;

import dao.BoardDAO;
import vo.ArticlePageVO;
import vo.ArticleVO;

public class BoardService {
	// 싱글턴(singleton)
	private static BoardService instance;
	public static BoardService getInstance(){
		if(instance == null)
			instance = new BoardService();
		return instance;
	}
	
	BoardDAO dao = null;
	
	private BoardService(){
		dao = BoardDAO.getInstance();
	}
///////////////////////////////////////////////////////////////
	public ArticlePageVO makePage(int currentPage){
		final int PAGE_PER_COUNT = 10; // 한페이지에 보여질 글의갯수
		
		int startRow = (currentPage-1)*PAGE_PER_COUNT;
		int endRow = startRow+PAGE_PER_COUNT;
		
		// 현재 페이지에 보여줄 글을 DB에서 조회
		List<ArticleVO> articleList = 
				dao.selectArticleList(startRow, endRow);
		
		// 글에 코멘트 정보 삽입
		CommentService cService = CommentService.getInstance();
		for(int i=0; i<articleList.size(); i++) {
			articleList.get(i).setCommentCount(cService.showCommentCount(articleList.get(i).getArticleId()));
		}
		
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
		
		return dao.insert(article);
	}

	public ArticleVO read(int articleId){
	// 글 읽기를 수행할 때 조회수도 증가시키는 메소드
		ArticleVO result = null;
		
		if(dao.updateReadCount(articleId)>0){
			// 글번호가 유효한지 확인하는 조건문
			result = dao.selectArticle(articleId);
		}
		return result;
	}
	
	// 수정 또는 삭제하기를 위해 조회수 증가없이 원본 읽어오는 메소드
	public ArticleVO readWithoutReadCount(int articleId){
		return dao.selectArticle(articleId);
	}

	// password를 검사한 후에 수정하기를 진행하는 메소드
	public int modify(ArticleVO article){
		ArticleVO original = dao.selectArticle(article.getArticleId());
		int result = 0;
		if(original.getId().equals(article.getId())) {
			result = dao.update(article);
		}
		return result;
	}

	public int delete(ArticleVO article) {
		ArticleVO original = dao.selectArticle(article.getArticleId());
		System.out.println(original.getArticleId());
		System.out.println(article.getArticleId());
		System.out.println(original.getId());
		System.out.println(article.getId());
		int result = 0;
		if(original.getId().equals(article.getId())) {
			result = dao.delete(article);
		}
		return result;
	}
}