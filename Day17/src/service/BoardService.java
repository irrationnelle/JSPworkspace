package service;

import java.util.List;

import dao.BoardDAO;
import vo.ArticlePageVO;
import vo.ArticleVO;

public class BoardService {
	// �̱���(singleton)
	private static BoardService instance = new BoardService();
	public static BoardService getInstance(){
		return instance;
	}
	private BoardDAO dao = BoardDAO.getInstance();
	
	private BoardService(){}

	public ArticlePageVO makePage(int currentPage){
		final int PAGE_PER_COUNT = 10; // ���������� ������ ���ǰ���
		BoardDAO dao = BoardDAO.getInstance();
		
		int startRow = (currentPage-1)*PAGE_PER_COUNT;
		int endRow = startRow+PAGE_PER_COUNT;
		
		// ���� �������� ������ ���� DB���� ��ȸ
		List<ArticleVO> articleList = 
				dao.selectArticleList(startRow, endRow);
		
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
		
		BoardDAO dao = BoardDAO.getInstance();
		return dao.insert(article);
	}

	public ArticleVO read(int articleNum){
	// �� �б⸦ ������ �� ��ȸ���� ������Ű�� �޼ҵ�
		BoardDAO dao = BoardDAO.getInstance();
		ArticleVO result = null;
		
		if(dao.updateReadCount(articleNum)>0){
			// �۹�ȣ�� ��ȿ���� Ȯ���ϴ� ���ǹ�
			result = dao.selectArticle(articleNum);
			
		}
		return result;
	}
	
	// ���� �Ǵ� �����ϱ⸦ ���� ��ȸ�� �������� ���� �о���� �޼ҵ�
	public ArticleVO readWithoutReadCount(int articleNum){
		BoardDAO dao = BoardDAO.getInstance();
		return dao.selectArticle(articleNum);
	}

	// �α����� �ۼ��ڰ� ������ �׳� ���� ����
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