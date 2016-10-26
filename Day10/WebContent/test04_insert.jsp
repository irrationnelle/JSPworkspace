<%@page import="vo.BookVO"%>
<%@page import="repository.BookDAO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>test04_insert.jsp</title>
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
			
			BookDAO dao = new BookDAO();
			int result = dao.insert(new BookVO(title, publisher, year, price));
			
		%>
		
		입력 결과: <%=result%> <br>
		
		<a href="test04_insert_form.jsp"><button>책 추가 입고</button></a>
	</body>
</html>