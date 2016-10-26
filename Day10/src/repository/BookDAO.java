package repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import vo.BookVO;

public class BookDAO {
	private final String DRIVER_NAME="org.mariadb.jdbc.Driver";
	private final String DB_URL = "jdbc:mariadb://localhost:3306/jsp";
	private final String DB_ID = "root";
	private final String DB_PW = "sds902";
	
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public BookDAO() {
		try {
			Class.forName(DRIVER_NAME);
			System.out.println("Driver Loading Complete!");
		} catch (ClassNotFoundException e) {
			System.out.println("Driver Loading Fail!");
			e.printStackTrace();
		}
	}
	
	public void createConnection() {
		try {
			con = DriverManager.getConnection(DB_URL, DB_ID, DB_PW);
			System.out.println("Connection Construction Complete!");
		} catch (SQLException e) {
			System.out.println("Connection Construction Fail!");
			e.printStackTrace();
		}
	}
	
	public void closeConnection() {
		if(con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				System.out.println("Connection Close Error!");
				e.printStackTrace();
			}
		}
	}
	
	public void closeStatement() {
		if(stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				System.out.println("Statement Close Error!");
				e.printStackTrace();
			}
		} 
	}
	
	public void closePreparedStatement() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				System.out.println("PreparedStatement Close Error!");
				e.printStackTrace();
			}
		}
	}
	
	public void closeResultSet() {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				System.out.println("ResultSet Close Error!");
				e.printStackTrace();
			}
		}
	}
	
	public int insert(BookVO book) {
		createConnection();
		int result = 0;
		
		try {
			String sql = "INSERT INTO books (title, publisher, year, price) " +
						 "VALUES(?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, book.getTitle());
			pstmt.setString(2, book.getPublisher());
			pstmt.setString(3, book.getYear());
			pstmt.setInt(4, book.getPrice());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closePreparedStatement();
			closeConnection();
		}
		return result;
	}
	
	public int update(BookVO book) {
		createConnection();
		String sql = "UPDATE books SET title=?, publisher=?, year=?, price=? WHERE book_id=?";
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, book.getTitle());
			pstmt.setString(2, book.getPublisher());
			pstmt.setString(3, book.getYear());
			pstmt.setInt(4, book.getPrice());
			pstmt.setInt(5, book.getBookID());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closePreparedStatement();
			closeConnection();
		}
		return result;
	}
	
	public int delete(int bookID) {
		createConnection();
		
		BookVO resultBook = null;
		String sql = "DELETE FROM books WHERE book_id=?";
		int result=0;
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bookID);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	public BookVO select(int bookID) {
		createConnection();
		BookVO resultBook = null;
		String sql = "SELECT book_id, title, publisher, year, price " +
					 "FROM books WHERE book_id=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bookID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				resultBook = new BookVO();
				resultBook.setBookID(rs.getInt(1));
				resultBook.setTitle(rs.getString(2));
				resultBook.setPublisher(rs.getString(3));
				resultBook.setYear(rs.getString(4));
				resultBook.setPrice(rs.getInt(5));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeResultSet();
			closePreparedStatement();
			closeConnection();
		}
		
		return resultBook;
	}
	
	public List<BookVO> selectTotalList() {
		createConnection();
		List<BookVO> bookList = new ArrayList<>();
		String sql = "SELECT book_ID, title, publisher, year, price FROM books";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				BookVO book = new BookVO();
				book.setBookID(rs.getInt(1));
				book.setTitle(rs.getString(2));
				book.setPublisher(rs.getString(3));
				book.setYear(rs.getString(4));
				book.setPrice(rs.getInt(5));
				bookList.add(book);
			}
		} catch (SQLException e) {
			System.out.println("selectTotalList ¿¡·¯");
			e.printStackTrace();
		} finally {
			closeResultSet();
			closeStatement();
			closeConnection();
		}
		return bookList;
	}
}
