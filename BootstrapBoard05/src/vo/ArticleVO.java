package vo;

import java.sql.Timestamp;

public class ArticleVO {
	private int articleId;
	private String writer;
	private String title;
	private String password;
	private String content;
	private Timestamp writeDate;
	private int readCount;
	
	public ArticleVO() {	}

	public ArticleVO(int articleId, String writer, String title, String password, String content, Timestamp writeDate,
			int readCount) {
		this.articleId = articleId;
		this.writer = writer;
		this.title = title;
		this.password = password;
		this.content = content;
		this.writeDate = writeDate;
		this.readCount = readCount;
	}

	public int getArticleId() {
		return articleId;
	}

	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
}
