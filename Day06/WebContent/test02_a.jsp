<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
	<head>
		<title>test02_a.jsp</title>
	</head>
	<body>
		�̰��� <b>test02_a</b>�� ����� �ִ� <i>html</i> ȭ���Դϴ�.
		<%
			response.sendRedirect("test02_b.jsp");
			response.sendRedirect("https://github.com/");
		
		%>
	</body>
</html>