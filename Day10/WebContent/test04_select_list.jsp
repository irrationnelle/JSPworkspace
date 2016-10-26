<%@page import="vo.BookVO"%>
<%@page import="java.util.List"%>
<%@page import="repository.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>test04_select_list.jsp</title>
	</head>
	
	<body>
		<%
			BookDAO dao = new BookDAO();
			List<BookVO> bookList = dao.selectTotalList();
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
				for(BookVO b : bookList) {
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
	<a href="test04_index.jsp"><button>메인 화면으로</button></a>
	</body>
</html>