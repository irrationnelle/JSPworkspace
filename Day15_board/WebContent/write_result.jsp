<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>�۾��� ���</title>
</head>
<body>
<%
	int writeResult = (int) request.getAttribute("writeResult");
%>
<h2>�۾��� ���: <%=writeResult %></h2>
<a href="board.do?action=main"><button>�Խñ� ���</button></a>
</body>
</html>