package vo;

public class UserInfoVO {
	private int userNum;
	private String name;
	private String userID;
	private String password;

	public UserInfoVO() {	}
	
	public UserInfoVO(int userNum, String name, String userID, String password) {
		this.userNum = userNum;
		this.name = name;
		this.userID = userID;
		this.password = password;
	}
	
	public UserInfoVO(String name, String userID, String password) {
		this.name = name;
		this.userID = userID;
		this.password = password;
	}

	public UserInfoVO(String name) {
		this.name = name;
	}
	
	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
}
