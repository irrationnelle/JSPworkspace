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
			
			// 1. ����̹� �ε�
			Class.forName("org.mariadb.jdbc.Driver");
			System.out.println("Driver Loading Complete!");
			
			String DB_URL = "jdbc:mariadb://localhost:3306/jsp";
			String DB_ID = "root";
			String DB_PW = "sds902";
			
			// 2. Ŀ�ؼ� ����
			con = DriverManager.getConnection(DB_URL, DB_ID, DB_PW);
			System.out.println("DB Connection Complete!");
			
			// 3. SQL ��ɾ� �ۼ�
			String sql = "INSERT INTO books(title, publisher, year, price)" +
						 "VALUES('java', 'sds', '2016', 30000)";
			
			// 4. Statement ��ü ����
			stmt = con.createStatement();
			
			// 5. SQL ��ɾ� ����
			result = stmt.executeUpdate(sql);
			
			// 6. ����� ó��
			if(result > 0) {
				out.println("<h2>å insert�� �Ϸ�Ǿ����ϴ�.</h2>");
			} else {
				out.println("<h2>å insert�� �Ϸ�Ǿ����ϴ�.</h2>");
			}
			
			// 7. ����� �ڿ� �ݳ� - close
			stmt.close();
			con.close();
		%>
	</body>
</html>