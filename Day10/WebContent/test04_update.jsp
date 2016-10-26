<%@page import="vo.BookVO"%>
<%@page import="repository.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>test04_update.jsp</title>
	</head>
	
	<body>
		<%
			request.setCharacterEncoding("euc-kr");	
		
			String bookIDstr = request.getParameter("bookID");
			int bookID = Integer.parseInt(bookIDstr);
			String title = request.getParameter("title");
			String publisher = request.getParameter("pub");
			String year = request.getParameter("year");
			String priceStr = request.getParameter("price");
			int price = Integer.parseInt(priceStr);
			
			BookVO book = new BookVO(bookID, title, publisher, year, price);
			BookDAO dao = new BookDAO();
			int result = dao.update(book);
		%>
		해당 책의 정보가 수정되었습니다.<br>
		Result: <%=result%> <br>
		<a href="test04_index.jsp"><button>메인으로</button></a>
	</body>
</html>