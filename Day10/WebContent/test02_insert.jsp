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
			
			// 1. ����̹� �ε�
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
			
			// 2. Ŀ�ؼ� ����
			con = DriverManager.getConnection(DB_URL, DB_ID, DB_PW);
			System.out.println("DB Connection Complete!");
			
			// 3. SQL ��ɾ� �ۼ�
			String sql = "INSERT INTO books(title, publisher, year, price)" +
						 "VALUES(?, ?, ?, ?)";
			
			// 4. Statement ��ü ����
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, publisher);
			pstmt.setString(3, year);
			pstmt.setInt(4, price);
			
			// 5. SQL ��ɾ� ����
			result = pstmt.executeUpdate();
			
			// 6. ����� ó��
			if(result > 0) {
				out.println("<h2>å insert�� �Ϸ�Ǿ����ϴ�.</h2>");
			} else {
				out.println("<h2>å insert�� �Ϸ�Ǿ����ϴ�.</h2>");
			}
			
			// 7. ����� �ڿ� �ݳ� - close
			if (pstmt != null) {
				pstmt.close();
			}
			if (con != null) {
				con.close();
			}
		%>
		<a href="test02_form.jsp"><button>å �߰� �԰�</button></a>
	</body>
</html>