<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>글쓰기 결과</title>
</head>
<body>
<%
	int writeResult = (int) request.getAttribute("writeResult");
%>
<h2>글쓰기 결과: <%=writeResult %></h2>
<a href="board.do?action=main"><button>게시글 목록</button></a>
</body>
</html>