<%@page import="vo.BookVO"%>
<%@page import="repository.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>test04_select_book.jspre</title>
	</head>
	
	<body>
		<%
			String bookIDstr = request.getParameter("bookID");
			int bookID = Integer.parseInt(bookIDstr);
			
			BookDAO dao = new BookDAO();
			BookVO b = dao.select(bookID);
		%>
		
		<table border="1">
			<tr>
				<th>å��ȣ</th>
				<th>����</th>
				<th>���ǻ�</th>
				<th>���ǳ⵵</th>
				<th>����</th>
			</tr>
			<%
				out.println("<tr>");
				out.println("<td>"+b.getBookID()+"</td>");
				out.println("<td>"+b.getTitle()+"</td>");
				out.println("<td>"+b.getPublisher()+"</td>");
				out.println("<td>"+b.getYear()+"</td>");
				out.println("<td>"+b.getPrice()+"</td>");
				out.println("</tr>");
			%>
	<br>
	<a href="test04_index.jsp"><button>���� ȭ������</button></a>		
	</body>
</html>