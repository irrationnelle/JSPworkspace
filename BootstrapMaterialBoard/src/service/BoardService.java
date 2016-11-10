package service;

import java.util.List;

import dao.BoardDAO;
import vo.ArticlePageVO;
import vo.ArticleVO;

public class BoardService {
	// �̱���(singleton)
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
		final int PAGE_PER_COUNT = 10; // ���������� ������ ���ǰ���
		
		int startRow = (currentPage-1)*PAGE_PER_COUNT;
		int endRow = startRow+PAGE_PER_COUNT;
		
		// ���� �������� ������ ���� DB���� ��ȸ
		List<ArticleVO> articleList = 
				dao.selectArticleList(startRow, endRow);
		
		// �ۿ� �ڸ�Ʈ ���� ����
		CommentService cService = CommentService.getInstance();
		for(int i=0; i<articleList.size(); i++) {
			articleList.get(i).setCommentCount(cService.showCommentCount(articleList.get(i).getArticleId()));
		}
		
		// �� �Խñ� ���� ��ȸ
		int articleTotalCount = dao.selectArticleCount();
		
		// �� �������� ���
		int totalPage = articleTotalCount/PAGE_PER_COUNT;
		if(articleTotalCount%PAGE_PER_COUNT != 0)
			totalPage++;
		
		// ������ �ϴ��� ���������� ���
		int startPage = (currentPage-1)/10*10+1;
		
		// ������ �ϴ��� �������� ���
		int endPage = startPage+9;
		if(endPage>totalPage)
			endPage = totalPage;
		
		return new ArticlePageVO(articleList,startPage,endPage,
											currentPage,totalPage);
	}

	public int write(ArticleVO article){
		article.setReadCount(0); // ��ȸ�� 0 ����
		
		return dao.insert(article);
	}

	public ArticleVO read(int articleId){
	// �� �б⸦ ������ �� ��ȸ���� ������Ű�� �޼ҵ�
		ArticleVO result = null;
		
		if(dao.updateReadCount(articleId)>0){
			// �۹�ȣ�� ��ȿ���� Ȯ���ϴ� ���ǹ�
			result = dao.selectArticle(articleId);
		}
		return result;
	}
	
	// ���� �Ǵ� �����ϱ⸦ ���� ��ȸ�� �������� ���� �о���� �޼ҵ�
	public ArticleVO readWithoutReadCount(int articleId){
		return dao.selectArticle(articleId);
	}

	// password�� �˻��� �Ŀ� �����ϱ⸦ �����ϴ� �޼ҵ�
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