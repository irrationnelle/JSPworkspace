<%@page import="vo.BookVO"%>
<%@page import="repository.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>test04_delete</title>
	</head>
	
	<body>
		<%
			String bookIDstr = request.getParameter("bookID");
			int bookID = Integer.parseInt(bookIDstr);
			
			BookDAO dao = new BookDAO();
			int result = dao.delete(bookID);
			out.println("�ش� å�� �����Ǿ����ϴ�.");
			out.println("result: "+result);
		%>
		<br>
		<a href="test04_index.jsp"><button>����ȭ������</button></a>
	</body>
</html>