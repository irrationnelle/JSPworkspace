package vo;

import java.sql.Date;

public class ContentsVO {
	private int postNum;
	private String userID;
	private int userNum;
	private String title;
	private String content;
	private Date date;
	private String address;
	
	public ContentsVO() {	}
	
	public ContentsVO(int postNum, String userID, int userNum, String title, String content, Date date,
			String address) {
		this.postNum = postNum;
		this.userID = userID;
		this.userNum = userNum;
		this.title = title;
		this.content = content;
		this.date = date;
		this.address = address;
	}
	
	public ContentsVO(String userID, int userNum, String title, String content, Date date,
			String address) {
		this.userID = userID;
		this.userNum = userNum;
		this.title = title;
		this.content = content;
		this.date = date;
		this.address = address;
	}



	public int getPostNum() {
		return postNum;
	}

	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
}
