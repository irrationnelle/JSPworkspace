<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>test06_get_attr.jsp</title>
</head>
<body>
<%
	Date settingTime = (Date)session.getAttribute("settingTime");
%>
����� ���ǿ� ����� settingTime�� ������ �����ϴ�<br>
<b><%= settingTime %></b><br>

sessionId : <%= session.getId()%><br>

</body>
</html>