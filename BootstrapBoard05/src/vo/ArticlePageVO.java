package vo;

import java.util.List;

public class ArticlePageVO {
	private List<ArticleVO> articleList;
	private int currentPage;
	private int startPage;
	private int endPage;
	private int totalPage;
	
	public ArticlePageVO() {	}

	public ArticlePageVO(List<ArticleVO> articleList, int currentPage, int startPage, int endPage, int totalPage) {
		this.articleList = articleList;
		this.currentPage = currentPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.totalPage = totalPage;
	}

	public List<ArticleVO> getArticleList() {
		return articleList;
	}

	public void setArticleList(List<ArticleVO> articleList) {
		this.articleList = articleList;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	
}
