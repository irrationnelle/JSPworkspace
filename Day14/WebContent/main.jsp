<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>main.jsp</title>
</head>
<body>
<%
	String articlePage = (String)request.getAttribute("articlePage");
%>
	<h2>�̰��� ���� ȭ���Դϴ�.</h2>
	�ڹ� �������� �Ѱܹ��� ��� ������: <%=articlePage%> <br>
	
	<a href="board.do?action=writeForm"><button>�۾���</button></a>
</body>
</html>