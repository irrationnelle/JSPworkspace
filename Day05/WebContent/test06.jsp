<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- errorPage�� ������ �߻����� �� �����ִ� �������� �����ϴ� page ��Ƽ���̴�. -->
<%@ page errorPage="test06_error.jsp" %>
<html>
<head>
<title>test06.jsp</title>
</head>
<body>
	<%
		String name = request.getParameter("name").toUpperCase();
	%>
	
	<%=name%>�� �ݰ����ϴ�.<br>
	�� �������� name parameter�� ���� ��� ������ �߻��ϴ� �������Դϴ�.
</body>
</html>