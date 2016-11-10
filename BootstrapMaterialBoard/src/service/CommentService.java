package service;

import java.util.List;

import dao.CommentDAO;
import vo.CommentPageVO;
import vo.CommentVO;

public class CommentService {
	private static CommentService instance = new CommentService();
	public static CommentService getInstance() { return instance; }
	private CommentDAO dao = CommentDAO.getInstance();
	
	private CommentService(){	}
	
	public CommentPageVO makeCommentPage(int articleId, int currentPage) {
		final int COUNT_PER_PAGE = 10;
		final int UNIT_PAGE = 10;
		
		int startRow = (currentPage-1)*COUNT_PER_PAGE;
		int endRow = startRow+COUNT_PER_PAGE;
		
		
		int totalPage = (dao.selectCommentCount(articleId))/COUNT_PER_PAGE;
		if((dao.selectCommentCount(articleId))%COUNT_PER_PAGE != 0) {
			totalPage++;
		}

		int startPage = currentPage/UNIT_PAGE*UNIT_PAGE+1;
		int endPage = startPage+UNIT_PAGE-1;

		if(endPage > totalPage) {
			endPage = totalPage;
		}
		
		List<CommentVO> commentList = dao.selectCommentList(articleId, startRow, endRow);
		
		CommentPageVO commentPage = new CommentPageVO(commentList, startPage, endPage, currentPage, totalPage);
		return commentPage;
	}

	public int write(CommentVO comment) {
		int result = dao.insert(comment);
		return result;
	}

	public int showCommentCount(int articleId) {
		int commentCount = dao.selectCommentCount(articleId);
		return commentCount;
	}
}
