<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>test01.jsp</title>
	</head>
	
	<body>
		<%
			Connection con = null;
			Statement stmt = null;
			int result = 0;
			
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
			String sql = "INSERT INTO books(title, publisher, year, price)" +
						 "VALUES('java', 'sds', '2016', 30000)";
			
			// 4. Statement 객체 생성
			stmt = con.createStatement();
			
			// 5. SQL 명령어 실행
			result = stmt.executeUpdate(sql);
			
			// 6. 결과값 처리
			if(result > 0) {
				out.println("<h2>책 insert가 완료되었습니다.</h2>");
			} else {
				out.println("<h2>책 insert가 완료되었습니다.</h2>");
			}
			
			// 7. 사용한 자원 반납 - close
			stmt.close();
			con.close();
		%>
	</body>
</html>