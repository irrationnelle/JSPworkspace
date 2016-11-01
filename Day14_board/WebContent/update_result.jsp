<%@page import="service.BoardService"%>
<%@page import="vo.ArticleVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>update.jsp</title>
</head>
<body>
<%
	int updateResult = (int) request.getAttribute("updateResult");
%>
<h2>글수정 결과: <%=updateResult %></h2>
<a href="board.do?action=main"><button>게시글 목록</button></a>
</body>
</html>