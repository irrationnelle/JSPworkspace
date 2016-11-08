package vo;

import java.util.Date;

public class CommentVO {
	private int articleId;
	private int commentId;
	private String id;
	private String content;
	private Date writeDate;
	
	public CommentVO() {	}

	public CommentVO(int articleId, int commentId, String id, String content, Date writeDate) {
		this.articleId = articleId;
		this.commentId = commentId;
		this.id = id;
		this.content = content;
		this.writeDate = writeDate;
	}

	public int getArticleId() {
		return articleId;
	}

	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}

	public int getCommentId() {
		return commentId;
	}

	public void setCommentId(int commentId) {
		this.commentId = commentId;
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
}
