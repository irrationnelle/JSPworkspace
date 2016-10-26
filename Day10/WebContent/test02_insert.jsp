<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>test02_insert.jsp</title>
	</head>
	
	<body>
		<%
			request.setCharacterEncoding("euc-kr");
		
			String title = request.getParameter("title");
			String publisher = request.getParameter("pub");
			String year = request.getParameter("year");
			String priceStr = request.getParameter("price");
			int price = 0;
			
			if(priceStr != null) {
				price = Integer.parseInt(priceStr);
			}
			
			
			Connection con = null;
			PreparedStatement pstmt = null;
			int result = 0;
			
			// 1. 드라이버 로딩
// 			Class.forName("org.mariadb.jdbc.Driver");
// 			System.out.println("Driver Loading Complete!");
			
// 			String DB_URL = "jdbc:mariadb://localhost:3306/jsp";
// 			String DB_ID = "root";
// 			String DB_PW = "sds902";
			
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver Loading Complete!");
			
			String DB_URL = "jdbc:mysql://70.12.109.123:3306/jsp";
			String DB_ID = "root";
			String DB_PW = "sds902";
			
			// 2. 커넥션 생성
			con = DriverManager.getConnection(DB_URL, DB_ID, DB_PW);
			System.out.println("DB Connection Complete!");
			
			// 3. SQL 명령어 작성
			String sql = "INSERT INTO books(title, publisher, year, price)" +
						 "VALUES(?, ?, ?, ?)";
			
			// 4. Statement 객체 생성
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, publisher);
			pstmt.setString(3, year);
			pstmt.setInt(4, price);
			
			// 5. SQL 명령어 실행
			result = pstmt.executeUpdate();
			
			// 6. 결과값 처리
			if(result > 0) {
				out.println("<h2>책 insert가 완료되었습니다.</h2>");
			} else {
				out.println("<h2>책 insert가 완료되었습니다.</h2>");
			}
			
			// 7. 사용한 자원 반납 - close
			if (pstmt != null) {
				pstmt.close();
			}
			if (con != null) {
				con.close();
			}
		%>
		<a href="test02_form.jsp"><button>책 추가 입고</button></a>
	</body>
</html>