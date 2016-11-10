package vo;

import java.util.Date;

public class ArticleVO {
	private int articleId;
	private String title;
	private String id;
	private String content;
	private Date writeDate;
	private int readCount;
	
	// Comment 갯수 표시
	private int commentCount;
	
	// 답글 level과 index
	private int replyLevel;
	private int replyIndex;
	
//////////////////////////////////////////////////////////
	public ArticleVO(){ }
	
	public ArticleVO(String title, String id, String content, Date writeDate, int readCount) {
		this.title = title;
		this.id = id;
		this.content = content;
		this.writeDate = writeDate;
		this.readCount = readCount;
	}
	public ArticleVO(int articleId, String title, String id, String content, Date writeDate, int readCount) {
		this.articleId = articleId;
		this.title = title;
		this.id = id;
		this.content = content;
		this.writeDate = writeDate;
		this.readCount = readCount;
	}
///////////////////////////////////////////////////////////
	public int getArticleId() {
		return articleId;
	}
	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	
	public int getCommentCount() {
		return commentCount;
	}
	
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	
	public int getReplyLevel() {
		return replyLevel;
	}

	public void setReplyLevel(int replyLevel) {
		this.replyLevel = replyLevel;
	}

	public int getReplyIndex() {
		return replyIndex;
	}

	public void setReplyIndex(int replyIndex) {
		this.replyIndex = replyIndex;
	}

	//////////////////////////////////////////////////////////////
	@Override
	public String toString() {
		return "ArticleVO [articleId=" + articleId + ", title=" + title + ", id=" + id + ", content=" + content
				+ ", writeDate=" + writeDate + ", readCount=" + readCount + "]";
	}
}
