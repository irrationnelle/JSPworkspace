<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>test01_set.jsp</title>
</head>
<body>
	<%
		// application ��ü�� Tomcat�� ���۵Ǽ� ����� ������ �����Ǳ� ������
		// application ��ü�� ���� ���� ���� ���������� �׷��� �����ȴ�.
		application.setAttribute("attr1", new Date());
		application.setAttribute("attr2", "rase");
	%>
	���� ������ ��û�� �޾��� ��<br>
	application �⺻ ��ü�� attr1, attr2 �� ���� �Ӽ���<br>
	����Ͽ����ϴ�.<br>
</body>
</html>