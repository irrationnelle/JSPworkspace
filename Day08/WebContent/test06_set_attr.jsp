<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page session="true" %>
<html>
<head>
<title>test06_set_attr.jsp</title>
</head>
<body>

<%
	session.setAttribute("settingTime", new Date());
%>

���� �ð��� ���ǿ� ����Ͽ����ϴ�.<br>


sessionId : <%= session.getId()%>

</body>
</html>