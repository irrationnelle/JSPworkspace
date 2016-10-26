package vo;

public class BookVO {
	private int bookID;
	private String title;
	private String publisher;
	private String year;
	private int price;
	
	public BookVO() {	}

	public BookVO(int bookID, String title, String publisher, String year, int price) {
		this.bookID = bookID;
		this.title = title;
		this.publisher = publisher;
		this.year = year;
		this.price = price;
	}

	public int getBookID() {
		return bookID;
	}
	public void setBookID(int bookID) {
		this.bookID = bookID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
}
