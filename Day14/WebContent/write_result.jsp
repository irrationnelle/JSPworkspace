<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>write_result.jsp</title>
</head>
<body>
<%
	String writeResult = (String) request.getAttribute("writeResult");
%>
<h2>�۾��� ���� ��� ������</h2>
�۾��� ���� ��� : <%=writeResult%><br>
<a href="board.do?action=main"><button>�Խ��� ��������</button></a>
</body>
</html>