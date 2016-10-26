<%@page import="vo.BookVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>Insert title here</title>
	</head>
	
	<body>
		<%
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			// 1. 드라이버 로딩
			Class.forName("org.mariadb.jdbc.Driver");
			System.out.println("Driver Loading Complete!");
			
			String DB_URL = "jdbc:mariadb://localhost:3306/jsp";
			String DB_ID = "root";
			String DB_PW = "sds902";
			
			// 2. 커넥션 생성
			con = DriverManager.getConnection(DB_URL, DB_ID, DB_PW);
			System.out.println("DB Connection Complete!");
			
			// 3. SQL 명령어 작성
			String sql = "SELECT book_id, title, publisher, year, price " +
						 "FROM books";
			
			// 4. Statement 객체 생성
			pstmt = con.prepareStatement(sql);
			
			// 5. SQL 명령어 실행
			rs = pstmt.executeQuery();
			
			// 6. 결과값 처리
			List<BookVO> booklist = new ArrayList();
			while(rs.next()) {
				BookVO book = new BookVO();
				book.setBookID(rs.getInt(1));
				book.setTitle(rs.getString(2));
				book.setPublisher(rs.getString(3));
				book.setYear(rs.getString(4));
				book.setPrice(rs.getInt(5));
				
				booklist.add(book);
			}
			
			// 7. 사용한 자원 반납 - close
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (con != null) {
				con.close();
			}
		%>
		
		<table border="1">
			<tr>
				<th>책번호</th>
				<th>제목</th>
				<th>출판사</th>
				<th>출판년도</th>
				<th>가격</th>
			</tr>
			<%
				for(BookVO b : booklist) {
					out.println("<tr>");
					out.println("<td>"+b.getBookID()+"</td>");
					out.println("<td>"+b.getTitle()+"</td>");
					out.println("<td>"+b.getPublisher()+"</td>");
					out.println("<td>"+b.getYear()+"</td>");
					out.println("<td>"+b.getPrice()+"</td>");
					out.println("</tr>");
				}
			%>			
		</table>
		<br>
		<a href="test04_index.jsp">
			<button>메인 화면으로</button>
		</a>
	</body>
</html>