<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>test01.jsp</title>
</head>
<body>
	<%
		// Scriptlet: �ڹ� ������ ��ġ�ϴ� �κ�(�ڹ� ���� �״�� ��� ����)
		int n = 100;
	
		Date now = new Date();
	%>
	���� ��û�� ���� �ð���
	<!-- %= % �̰� ǥ����. ǥ������ html ������ �ۼ��϶�� �̾߱� -->
	<b><%= now %></b>�Դϴ�.
	n ������ ����ִ� ��: <%=n %>
</body>
</html>